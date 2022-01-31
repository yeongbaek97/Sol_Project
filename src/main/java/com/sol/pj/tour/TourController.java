package com.sol.pj.tour;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
public class TourController {

	@Autowired
	private TourDAO tdao;
	
	@RequestMapping(value = "tour.list.regional", method = RequestMethod.GET)
	public String tourlist(HttpServletRequest req) {
		
		String areaCode = req.getParameter("areaCode");
		
		tdao.getTourList(1, areaCode, req);
		req.setAttribute("contentPage", "tour/regional_View.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "tour.list.regional_change", method = RequestMethod.GET)
	public String tourlistchange(HttpServletRequest req) {
		
		int p = Integer.parseInt(req.getParameter("p"));
		String areaCode = (String) req.getSession().getAttribute("areaCode");
		
		
		tdao.getTourList(p, areaCode, req);
		req.setAttribute("contentPage", "tour/regional_View.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "tour.list.detail", method = RequestMethod.GET)
	public String tourlistdetail(HttpServletRequest req) {

		
		tdao.getTourDetail(req);
		tdao.getTourDetail2(req);
		tdao.getTourDetail3(req);
		
		
		req.setAttribute("contentPage", "tour/detail_View.jsp");
		
		return "home";
	}


}
