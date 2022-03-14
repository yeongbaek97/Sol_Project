package com.sol.pj.board;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sol.pj.tour.SearchRankMapper;

@Service
public class BoardDAO {

	@Autowired
	private SqlSession ss;
	
	public void getPost(HttpServletRequest req) {
		BoardMapper bm = ss.getMapper(BoardMapper.class);
		List<Board> posts = bm.getPost();
		
		req.setAttribute("posts", posts);
		
	}

	public void writePost(HttpServletRequest req, Board b) {
		String path = req.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(req, path, 1500 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			
			String b_title = mr.getParameter("b_title");
			String b_content = mr.getParameter("b_content");
			String b_image = mr.getFilesystemName("b_image");
			b_image = URLEncoder.encode(b_image, "utf-8");
			
			String b_writer = mr.getParameter("b_writer");
			System.out.println(b_title);
			System.out.println(b_content);
			System.out.println(b_image);
			System.out.println(b_writer);
			
			b.setB_title(b_title);
			b.setB_content(b_content);
			b.setB_image(b_image.replace("+", " "));
			b.setB_writer(b_writer);
			
			BoardMapper bm = ss.getMapper(BoardMapper.class);
			bm.writePost(b);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void getDetailPost(HttpServletRequest req, Board b, Comment c) {
		String path = req.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 1500 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			int b_no = Integer.parseInt(mr.getParameter("b_no"));
			
			BoardMapper bm = ss.getMapper(BoardMapper.class);
			
			b.setB_no(b_no);
			c.setC_no(b_no);
			bm.viewCount(b);
			Board post = bm.getDetailPost(b);
			List<Comment> comments = bm.getComments(c);
			
			
			req.setAttribute("post", post);
			req.setAttribute("comments", comments);
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		
		
	}

	public void writeComment(HttpServletRequest req, Comment c, Board b) {
		BoardMapper bm = ss.getMapper(BoardMapper.class);
		
		bm.writeComment(c);
		bm.commentInc(b);
		
	}

	public void deletePost(HttpServletRequest req, Board b) {
		BoardMapper bm = ss.getMapper(BoardMapper.class);
		
		bm.deletePost(b);
		
	}

	public void modifyPost(HttpServletRequest req, Board b) {
		BoardMapper bm = ss.getMapper(BoardMapper.class);
		
		bm.modifyPost(b);
	}

	public void deleteComment(HttpServletRequest req, Comment c, Board b) {
		BoardMapper bm = ss.getMapper(BoardMapper.class);
		
		bm.deleteComment(c);
		bm.commentDec(b);
		
	}

	public void modifyComment(HttpServletRequest req, Comment c) {
		BoardMapper bm = ss.getMapper(BoardMapper.class);
		System.out.println(req.getParameter("c_seq"));
		System.out.println(req.getParameter("c_comment"));
		bm.modifyComment(c);
		
	}


}
