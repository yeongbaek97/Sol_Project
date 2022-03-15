/*조영백
 *member 함수
2021-12-28*/

package com.sol.pj.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.sol.pj.tour.Bookmark;
import com.sol.pj.tour.BookmarkMapper;
import com.sol.pj.tour.SearchRankMapper;
import com.sol.pj.tour.TourRank;
import com.sol.pj.tour.TourRankMapper;

@Service
public class MemberDAO {
	
	@Autowired
	private SqlSession ss;
	
	//로그인
	public void login(Member m, HttpServletRequest req) {

		Member dbMember = ss.getMapper(MemberMapper.class).getMemberByID(m);

		if (dbMember != null) {
			if (m.getM_pw().equals(dbMember.getM_pw())) {
				req.getSession().setAttribute("loginMember", dbMember);
				req.getSession().setMaxInactiveInterval(60 * 10);
			} else {
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			req.setAttribute("result", "로그인 실패(미가입ID)");
		}

	}

	//로그인체크
	public boolean logincheck(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		if (m != null) {
			//req.setAttribute("loginPage", "member/loginSuccess.jsp");
			return true;
		} else {
			//req.setAttribute("loginPage", "member/login.jsp");
			return false;
		}
		
	}
	
	//로그아웃
	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
		
	}
	
	
	//카카오 로그인
	public String getReturnAccessToken(String authorize_code) {
		String access_token = "";
        String refresh_token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
       
       try {
           URL url = new URL(reqURL);
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();
           
            //HttpURLConnection 설정 값 셋팅
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            
            // buffer 스트림 객체 값 셋팅 후 요청
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=500a463927b5af4c4a3224e8a14e8ace");  //앱 KEY VALUE
            sb.append("&redirect_uri=http://localhost/goto.kakao.login"); // 앱 CALLBACK 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //  RETURN 값 result 변수에 저장 (요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기)
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String br_line = "";
            String result = "";

            while ((br_line = br.readLine()) != null) {
                result += br_line;
            }

            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            
            // 토큰 값 저장 및 리턴
            access_token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_token;
	}

	public HashMap<String, Object> getUserInfo (String access_Token,HttpServletRequest req) {

        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            //가져올 정보 적으면 되는듯
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();

            String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();


            //String email = kakao_account.getAsJsonObject().get("email").getAsString();

            
            
            
            userInfo.put("accessToken", access_Token);
            userInfo.put("nickname", nickname);

            userInfo.put("profile_image", profile_image);
           // userInfo.put("email", email);
            
            Member dbMember = new Member(
            		"asd",
            		access_Token,
            		nickname,
            		"asd",
            		"asd",
            		profile_image
            		);
            
            req.getSession().setAttribute("loginMember", dbMember);
			req.getSession().setMaxInactiveInterval(60 * 10);

            //userInfo.put("email", email);


        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }



	public void modifyInfo(HttpServletRequest req) {
		Member curMember = (Member)req.getSession().getAttribute("loginMember");
		String m_id = curMember.getM_id();
		String m_pw = curMember.getM_pw();
		String m_name = req.getParameter("m_name");
		String m_gender = req.getParameter("m_gender");
		String m_email = req.getParameter("m_email");
		String m_number = req.getParameter("m_number");
		
		Member m = new Member(m_id, m_pw, m_name, m_email, m_gender, m_number);
		
		MemberMapper mm = ss.getMapper(MemberMapper.class);
		mm.modifyInfo(m);
		
		Member modMember = ss.getMapper(MemberMapper.class).getMemberByID(m);
		req.getSession().setAttribute("loginMember", modMember);
	}

	
	// 회원가입
	public void regMember(Member m, HttpServletRequest req) {

		int mm = ss.getMapper(MemberMapper.class).regMember(m);
		if(mm == 1) {
			System.out.println("가입 성공");
		} else {
			System.out.println("가입 실패");
		}
		
		
	}

	public int checkIdValue(Member m) {
		int cnt = ss.getMapper(MemberMapper.class).checkIdValue(m);
		System.out.println("DAO ID cnt: " + cnt);
		return cnt;
	}
	
	public int checkEmailValue(Member m) {
		int cnt = ss.getMapper(MemberMapper.class).checkEmailValue(m);
		System.out.println("DAO Email cnt: " + cnt);
		return cnt;
	}

	public void findID(HttpServletRequest req, Member m) {
		String m_name = req.getParameter("m_name");
		String m_email = req.getParameter("m_email");
		String m_number = req.getParameter("m_number");
		System.out.println("-- DAO 입성 --");
		System.out.println(m_name);
		System.out.println(m_email);
		System.out.println(m_number);
		
		
		if(m_number == null) {
			System.out.println("Number == 0, email == 1");
			Member mm = ss.getMapper(MemberMapper.class).findIDbyEmail(m_name, m_email);
			System.out.println(mm.getM_id() + ": DAO에서 email로 알아낸 ID");
			req.setAttribute("id", mm.getM_id());
		} else if(m_email == null) {
			System.out.println("email == 0, number == 1");
			Member mm = ss.getMapper(MemberMapper.class).findIDbyPhone(m_name, m_number);
			System.out.println(mm.getM_id() + ": DAO에서 phone number로 알아낸 ID");
			req.setAttribute("id", mm.getM_id());
		}
		
		
	}

	public void findPW(HttpServletRequest req, Member m) {
		String m_id = req.getParameter("m_id");
		String m_email = req.getParameter("m_email");
		String m_number = req.getParameter("m_number");
		System.out.println("-- DAO 입성 --");
		System.out.println(m_id);
		System.out.println(m_email);
		System.out.println(m_number);
		
		
		if(m_number == null) {
			System.out.println("Number == 0, email == 1");
			Member mm = ss.getMapper(MemberMapper.class).findPWbyEmail(m_id, m_email);
			System.out.println(mm.getM_id() + ": DAO에서 email로 알아낸 PW");
			req.setAttribute("pw", mm.getM_pw());
		} else if(m_email == null) {
			System.out.println("email == 0, number == 1");
			Member mm = ss.getMapper(MemberMapper.class).findPWbyPhone(m_id, m_number);
			System.out.println(mm.getM_id() + ": DAO에서 phone number로 알아낸 PW");
			req.setAttribute("pw", mm.getM_pw());
		}
		
	}

}
