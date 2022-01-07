package com.sol.pj.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpServletRequest req, Member m) {
		
		mDAO.login(m, req);
		mDAO.logincheck(req);
		
		return "home";
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, Member m) {
		
		mDAO.logout(req);
		mDAO.logincheck(req);
		
		return "home";
	}
	
<<<<<<< HEAD
}
=======
}
>>>>>>> 7c303490097172453487092de220841dc686f535
