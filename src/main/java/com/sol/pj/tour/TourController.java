package com.sol.pj.tour;


import java.util.concurrent.SynchronousQueue;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sol.pj.member.MemberDAO;




@Controller
public class TourController {

	@Autowired
	private TourDAO tdao;
	
	@Autowired
	private MemberDAO mDAO;
	
	/*@RequestMapping(value = "tour.concept.select", method = RequestMethod.GET)
	public String tourconceptselect(HttpServletRequest req) {
		mDAO.logincheck(req);
		
		req.setAttribute("contentPage", "tour/concept_Select.jsp");
		
		return "home";
	}*/
	
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
	

/*	@RequestMapping(value = "tour.list.search", method = RequestMethod.GET)
	public String tourlistsearch(HttpServletRequest req) {
		
		mDAO.logincheck(req);
		
		tdao.getsearch(req);
		
		
		req.setAttribute("contentPage", "tour/regional_View.jsp");
		
		return "home";
	}*/
	


	@RequestMapping(value = "tour.list.detail", method = RequestMethod.POST)
	public String tourlistdetail(HttpServletRequest req, TourRank tr) {

		//공통 작업
		mDAO.logincheck(req);
		tdao.getTourDetail_common(req);	
		tdao.getdetailImage(req);
		tdao.TourRank(req, tr);
		
		String cti = req.getParameter("contentTypeId");
		System.out.println(cti);
		
		//이곳에서 contentType 구별후 디테일가져오는 작업
		if(req.getSession().getAttribute("ContentTypeId").equals("12") || cti.equals("관광지")) {
			tdao.getTourDetail_CT12(req);
			tdao.getTourDetail2(req);
			req.setAttribute("contentPage", "tour/detail_View_CT12.jsp");
		}else if(req.getSession().getAttribute("ContentTypeId").equals("14") || cti.equals("행사/공연/축제")) {
			tdao.getTourDetail_CT14(req);
			req.setAttribute("contentPage", "tour/detail_View_CT14.jsp");
		}else if(req.getSession().getAttribute("ContentTypeId").equals("15") || cti.equals("문화시설")) {
			tdao.getTourDetail_CT15(req);
			req.setAttribute("contentPage", "tour/detail_View_CT15.jsp");
		}else if(req.getSession().getAttribute("ContentTypeId").equals("28") || cti.equals("레포츠")) {
			tdao.getTourDetail_CT28(req);
			req.setAttribute("contentPage", "tour/detail_View_CT28.jsp");
		}else if(req.getSession().getAttribute("ContentTypeId").equals("39") || cti.equals("카페")) {
			tdao.getTourDetail_CT39(req);
			
			req.setAttribute("contentPage", "tour/detail_View_CT39.jsp");
		}
		
		req.setAttribute("kakaoMap", "kakaoMap.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "tour.list.search", method = RequestMethod.GET)
	public String tourListSearch(HttpServletRequest req, SearchRank sr) {
		mDAO.logincheck(req);
		tdao.searchRank(req, sr);
		tdao.getSearchRank(req);
		req.setAttribute("contentPage", "tour/search.jsp");
		
		return "home";
	}
	

	
	@RequestMapping(value = "tour.mark", method = RequestMethod.GET, produces= "application/json; charset=utf-8")
	public @ResponseBody int bookmark(Bookmark b, HttpServletRequest req) {

		return tdao.getmark(b,req);
	}
	
	@RequestMapping(value = "tour.mark.change", method = RequestMethod.GET, produces= "application/json; charset=utf-8")
	public @ResponseBody int bookmarkchange(Bookmark b, HttpServletRequest req) {

		return tdao.getmark_change(b,req);
	}
	



}
