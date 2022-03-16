package com.sol.pj.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sol.pj.tour.Bookmark;
import com.sol.pj.tour.TourDAO;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private TourDAO tdao;
	
	// 로그인 페이지 이동
	@RequestMapping(value = "goto.login", method = RequestMethod.GET)
	public String gotoLogin() {
		return "member/login";
	}
	
	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpServletRequest req, Member m) {
		
		mDAO.login(m, req);
		mDAO.logincheck(req);
		
		return "home";
	}
	
	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, Member m) {
		
		mDAO.logout(req);
		mDAO.logincheck(req);
		
		// myPage에서 로그아웃 버튼을 누르면 myPage 화면은 그대로 나오고, home으로 가서 추가함
		req.setAttribute("contentPage", "main_view.jsp");
		
		return "home";
	}
	
	// 카카오 로그인
	@RequestMapping(value = "goto.kakao.login", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam String code,HttpServletRequest req ) {
		 
		System.out.println(code);
		 String access_Token = mDAO.getReturnAccessToken(code);

		 HashMap<String, Object> userInfo = mDAO.getUserInfo(access_Token,req);
 
		 System.out.println("내이름" + userInfo.get("nickname"));

		return "home";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "goto.Reg", method = RequestMethod.GET)
	public String gotoReg() {
		return "member/regUser";
	}
	
	// 회원가입
	@RequestMapping(value = "goto.RegUser", method = RequestMethod.POST)
	public String regMember(HttpServletRequest req, Member m) {
			
		mDAO.regMember(m, req);
		mDAO.logincheck(req);
			
		return "home";

	}
	
	@RequestMapping(value = "checkID.value", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody int checkIdValue(Member m) {
		System.out.println("아이디 이동완료");
		int cnt = mDAO.checkIdValue(m);
		System.out.println("ID C cnt: " + cnt);
		return cnt;
	}
	
	@RequestMapping(value = "checkEmail.value", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody int checkEmailValue(Member m) {
		System.out.println("이메일 이동완료");
		int cnt = mDAO.checkEmailValue(m);
		System.out.println("Email C cnt: " + cnt);
		return cnt;
	}
	
	//마이페이지
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String myPage(HttpServletRequest req, Member m, Bookmark b) {
		
		
		mDAO.logincheck(req);
		tdao.getmark(b,req);
		
		
		req.setAttribute("contentPage", "member/myPage.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "modifyInfo", method = RequestMethod.GET)
	public String modifyId(HttpServletRequest req) {
		
		mDAO.logincheck(req);
		mDAO.modifyInfo(req);

		
		req.setAttribute("contentPage", "member/myPage.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "deleteBookmark", method = RequestMethod.GET)
	public String deleteBookmark(HttpServletRequest req, Bookmark b) {
		
		mDAO.logincheck(req);

		
		req.setAttribute("contentPage", "member/myPage.jsp");
		
		return "home";
	}
	
	// ID/PW 찾으러 가기
	@RequestMapping(value = "findInfo.login", method = RequestMethod.GET)
	public String findInfo(HttpServletRequest request) {
		mDAO.logincheck(request);
		request.setAttribute("contentPage", "member/FindInfo.jsp");
		return "home";
	}
	
	// ID 찾기
	@RequestMapping(value = "find.IDValue", method = RequestMethod.POST)
	public String findID(HttpServletRequest req, Member m) {
		mDAO.findID(req, m);
		System.out.println(req.getAttribute("id"));
		req.setAttribute("contentPage", "member/FindResultID.jsp");
		return "home";
	}
	
	// PW 찾기
	@RequestMapping(value = "find.PWValue", method = RequestMethod.POST)
	public String findPW(HttpServletRequest req, Member m) {
		mDAO.findPW(req, m);
		System.out.println(req.getAttribute("pw"));
		req.setAttribute("contentPage", "member/FindResultPW.jsp");
		return "home";
	}
}
