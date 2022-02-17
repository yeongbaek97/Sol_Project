package com.sol.pj;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.pj.member.MemberDAO;


@Controller
public class HomeController {
	
	@Autowired
	private MemberDAO mDAO;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		mDAO.logincheck(req);
		req.setAttribute("contentPage", "main_view.jsp");
		return "home";
	}
	
	@RequestMapping(value = "home.go", method = RequestMethod.GET)
	public String homeGo(HttpServletRequest req) {
		return home(req);
	}
	
	
	
}
