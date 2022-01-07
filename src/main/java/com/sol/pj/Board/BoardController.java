package com.sol.pj.Board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDAO bDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "home";
	}

	@RequestMapping(value = "board.get.xml", method = RequestMethod.GET, produces = "application/xml; charset=utf-8")
	public @ResponseBody Board getMenuXML() {

		Board bb = bDAO.getBoardJSON();
		return bb;
	}
	
}
