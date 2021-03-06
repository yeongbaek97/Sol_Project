package com.sol.pj.hj;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.pj.member.MemberDAO;

@Controller
public class GcController {
	
	@Autowired
	private GoCampingDAO gDAO;
	
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "goto.accomIndex", method = RequestMethod.GET)
	public String accomConthome(HttpServletRequest request) {
		//mDAO.logincheck(request);
		request.setAttribute("contentPage", "Accommodation/AccomIndex.jsp");
		return "home";
	}
	
	@RequestMapping(value = "goto.gocamping", method = RequestMethod.GET)
	public String goTogocamping(HttpServletRequest request) {
		mDAO.logincheck(request);
		request.setAttribute("contentPage", "Accommodation/GoCamping.jsp");
		return "home";
	}
	
	@RequestMapping(value = "goto.accom", method = RequestMethod.GET)
	public String goToaccom(HttpServletRequest request) {
		mDAO.logincheck(request);
		request.setAttribute("contentPage", "Accommodation/Accom.jsp");
		return "home";
	}
	
	@RequestMapping(value = "gocamping.json", method = RequestMethod.GET,
			produces = "application/json; charset=utf-8")
	public String getMenuJSON(GoCamping gc, HttpServletRequest request) throws IOException, ParseException {
		mDAO.logincheck(request);
		
		List<GoCamping> mm = gDAO.gocampingJSON(request);
		request.setAttribute("gocamping", mm);
		request.setAttribute("contentPage", "Accommodation/GoCamping.jsp");
		return "home";
	}
	
}
