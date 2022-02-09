package com.sol.pj.hj;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GcController {
	
	@Autowired
	private GoCampingDAO gDAO;
	
	@RequestMapping(value = "goto.accomIndex", method = RequestMethod.GET)
	public String home() {
		
		return "Accommodation/AccomIndex";
	}
	
	@RequestMapping(value = "goto.gocamping", method = RequestMethod.GET)
	public String goTogocamping() {
		
		return "Accommodation/GoCamping";
	}
	
	@RequestMapping(value = "goto.accom", method = RequestMethod.GET)
	public String goToaccom() {
		
		return "Accommodation/Accom";
	}
	
	@RequestMapping(value = "gocamping.json", method = RequestMethod.GET,
			produces = "application/json; charset=utf-8")
	public String getMenuJSON(GoCamping gc, HttpServletRequest request) throws IOException, ParseException {
		List<GoCamping> mm = gDAO.gocampingJSON(request);
		request.setAttribute("gocamping", mm);
		return "Accommodation/GoCamping";
	}
	
}
