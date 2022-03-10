package com.sol.pj.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sol.pj.tour.Bookmark;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO mDAO;
	
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
		return "member/regMember";

	}
	
	//마이페이지
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String myPage(HttpServletRequest req, Member m) {
		
		mDAO.logincheck(req);
		mDAO.myPage(req);
		
		req.setAttribute("contentPage", "member/myPage.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "modifyInfo", method = RequestMethod.GET)
	public String modifyId(HttpServletRequest req) {
		
		mDAO.logincheck(req);
		mDAO.modifyInfo(req);
		mDAO.myPage(req);
		
		req.setAttribute("contentPage", "member/myPage.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "deleteBookmark", method = RequestMethod.GET)
	public String deleteBookmark(HttpServletRequest req, Bookmark b) {
		
		mDAO.logincheck(req);
		mDAO.deleteBookmark(req, b);
		mDAO.myPage(req);
		
		req.setAttribute("contentPage", "member/myPage.jsp");
		
		return "home";
	}
	
}
