package com.sol.pj.accom;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sol.pj.member.MemberDAO;
import com.sol.pj.tour.TourDAO;


@Controller
public class AccomController {
	
	@Autowired
	private AccomDAO aDAO;
	
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "/accom.home", method = RequestMethod.GET)
	public String accomHome(HttpServletRequest req) {
		
		mDAO.logincheck(req);
		
		req.setAttribute("contentPage", "accom/accomHome.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/accom.list", method = RequestMethod.GET)
	public String accomList(HttpServletRequest req, int pageNo, String indsMclsCd, String ctprvnCd) {
		
		aDAO.getAccomList(req, pageNo, indsMclsCd, ctprvnCd);
	
		mDAO.logincheck(req);
		
		req.setAttribute("contentPage", "accom/accomList.jsp");
		return "home";
	}
	
	
}

