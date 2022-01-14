package com.sol.pj.tour;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class TourController {

	@Autowired
	private TourDAO tdao;
	
	@RequestMapping(value = "tour.list", method = RequestMethod.GET)
	public String tourlist(HttpServletRequest req) {
		
		tdao.getTourList(1, req);
		
		
		return "tour/tourview";
	}
	
	@RequestMapping(value = "tour.list.change", method = RequestMethod.GET)
	public String tourlistchange(HttpServletRequest req) {
		
		int p = Integer.parseInt(req.getParameter("p"));
		
		tdao.getTourList(p, req);
		
		
		return "tour/tourview";
	}


}
