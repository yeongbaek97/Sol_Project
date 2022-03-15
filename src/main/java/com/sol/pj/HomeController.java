package com.sol.pj;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.pj.member.MemberDAO;
import com.sol.pj.tour.TourDAO;
import com.sol.pj.tour.TourRank;


@Controller
public class HomeController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private TourDAO tDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		mDAO.logincheck(req);
		tDAO.getTourRank(req);
		tDAO.getSearchRank(req);
		req.setAttribute("contentPage", "main_view.jsp");
		return "home";
	}
	

	@RequestMapping(value = "home.go", method = RequestMethod.GET)
	public String homeGo(HttpServletRequest req) {
		mDAO.logincheck(req);
		
		req.setAttribute("contentPage", "main_info_view.jsp");
		return "home";
	}
	

	@RequestMapping(value = "goto.Index", method = RequestMethod.GET)
	public String Clickhome(HttpServletRequest req, TourRank tr) {
		
		mDAO.logincheck(req);
		tDAO.getTourRank(req);
		tDAO.getSearchRank(req);
		req.setAttribute("contentPage", "main_view.jsp");
		return "home";
	}
	
	

	
	
}
