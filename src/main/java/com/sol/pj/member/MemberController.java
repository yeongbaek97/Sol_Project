package com.sol.pj.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO mDAO;
	
	// 로그인 페이지 이동
	@RequestMapping(value = "goto.login", method = RequestMethod.GET)
	public String gotoLogin() {
		return "member/Login";
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
		
		return "home";
	}
	
	// 카카오 로그인
	@RequestMapping(value = "kakao.login", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam String code,HttpServletRequest req ) {
		
		System.out.println(code);
		 String access_Token = mDAO.getReturnAccessToken(code);

		 HashMap<String, Object> userInfo = mDAO.getUserInfo(access_Token,req);
 
		 System.out.println(userInfo.get("nickname"));

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
		System.out.println("이동완료");
		int cnt = mDAO.checkIdValue(m);
		System.out.println("Controller cnt: " + cnt);
		return cnt;
	}
	
	//마이페이지
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String myPage(HttpServletRequest req, Member m) {
		
		mDAO.logincheck(req);
		
		req.setAttribute("contentPage", "member/myPage.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "findInfo.login", method = RequestMethod.GET)
	public String findInfo() {
		
		return "member/FindInfo";
	}
}
