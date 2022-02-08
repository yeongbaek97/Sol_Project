package com.sol.pj.tour;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.pj.member.MemberDAO;




@Controller
public class TourController {

	@Autowired
	private TourDAO tdao;
	
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "tour.concept.select", method = RequestMethod.GET)
	public String tourconceptselect(HttpServletRequest req) {
		mDAO.logincheck(req);
		
		req.setAttribute("contentPage", "tour/concept_Select.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "tour.list.regional", method = RequestMethod.GET)
	public String tourlist(HttpServletRequest req) {
		
		mDAO.logincheck(req);
		
		tdao.getTourList(1, req);
		req.setAttribute("contentPage", "tour/regional_View.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "tour.list.regional_change", method = RequestMethod.GET)
	public String tourlistchange(HttpServletRequest req) {
		
		mDAO.logincheck(req);
		
		int p = Integer.parseInt(req.getParameter("p"));
		
		tdao.getTourList(p, req);
		req.setAttribute("contentPage", "tour/regional_View.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "tour.list.detail", method = RequestMethod.GET)
	public String tourlistdetail(HttpServletRequest req) {
		//공통 작업
		mDAO.logincheck(req);
		tdao.getTourDetail_common(req);	
		
		
		//이곳에서 contentType 구별후 디테일가져오는 작업
		if(req.getSession().getAttribute("ContentTypeId").equals("12")) {
			tdao.getTourDetail_CT12(req);
			req.setAttribute("contentPage", "tour/detail_View_CT12.jsp");
		}else if(req.getSession().getAttribute("ContentTypeId").equals("14")) {
			tdao.getTourDetail_CT14(req);
			req.setAttribute("contentPage", "tour/detail_View_CT14.jsp");
		}else if(req.getSession().getAttribute("ContentTypeId").equals("15")) {
			tdao.getTourDetail_CT15(req);
			req.setAttribute("contentPage", "tour/detail_View_CT15.jsp");
		}else if(req.getSession().getAttribute("ContentTypeId").equals("28")) {
			tdao.getTourDetail_CT28(req);
			req.setAttribute("contentPage", "tour/detail_View_CT28.jsp");
		}else if(req.getSession().getAttribute("ContentTypeId").equals("39")) {
			tdao.getTourDetail_CT39(req);
			req.setAttribute("contentPage", "tour/detail_View_CT39.jsp");
		}
		
		
		tdao.getTourDetail2(req);
		
		
		
		
		
		return "home";
	}
	
	


}
