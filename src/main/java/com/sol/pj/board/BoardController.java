package com.sol.pj.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.pj.member.MemberDAO;
import com.sol.pj.tour.TourDAO;

@Controller
public class BoardController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private TourDAO tDAO;
	
	@Autowired
	private BoardDAO bDAO;
	
	
	@RequestMapping(value = "/goto.board", method = RequestMethod.GET)
	public String gotoBoard(HttpServletRequest req) {
		
		mDAO.logincheck(req);
		bDAO.getPost(req);
		
		req.setAttribute("contentPage", "board/board.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/goto.write", method = RequestMethod.GET)
	public String gotoWrite(HttpServletRequest req) {
		
		mDAO.logincheck(req);
		
		req.setAttribute("contentPage", "board/writePost.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/write.post", method = RequestMethod.POST)
	public String writePost(HttpServletRequest req, Board b) {
		
		mDAO.logincheck(req);
		bDAO.writePost(req, b);
		bDAO.getPost(req);
		
		req.setAttribute("contentPage", "board/board.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/detail.post", method = RequestMethod.POST)
	public String detailPost(HttpServletRequest req, Board b, Comment c) {
		
		mDAO.logincheck(req);
		bDAO.getDetailPost(req, b, c);
		
		req.setAttribute("contentPage", "board/detailPost.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/write.comment", method = RequestMethod.GET)
	public String writeComment(HttpServletRequest req, Comment c, Board b) {
		
		mDAO.logincheck(req);
		bDAO.writeComment(req, c, b);
		
		req.setAttribute("contentPage", "board/detailPost.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/modify.post", method = RequestMethod.GET)
	public String modifyPost(HttpServletRequest req, Board b) {
		
		mDAO.logincheck(req);
		bDAO.modifyPost(req, b);
		
		req.setAttribute("contentPage", "board/board.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/delete.post", method = RequestMethod.GET)
	public String deletePost(HttpServletRequest req, Board b) {
		
		mDAO.logincheck(req);
		bDAO.deletePost(req, b);
		
		req.setAttribute("contentPage", "board/board.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/delete.comment", method = RequestMethod.GET)
	public String deleteComment(HttpServletRequest req, Comment c, Board b) {
		
		mDAO.logincheck(req);
		bDAO.deleteComment(req, c, b);
		
		req.setAttribute("contentPage", "board/board.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/modify.comment", method = RequestMethod.GET)
	public String modifyComment(HttpServletRequest req, Comment c) {
		
		mDAO.logincheck(req);
		bDAO.modifyComment(req, c);
		
		req.setAttribute("contentPage", "board/board.jsp");
		return "home";
	}
	
}