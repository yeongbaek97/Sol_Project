/*조영백
 *member 함수
2021-12-28*/

package com.sol.pj.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



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
			req.setAttribute("loginPage", "member/loginSuccess.jsp");
			return true;
		} else {
			req.setAttribute("loginPage", "member/login.jsp");
			return false;
		}
		
	}
	
	//로그아웃
	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
	}
	
	

}
