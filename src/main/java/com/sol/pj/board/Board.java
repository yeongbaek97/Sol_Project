package com.sol.pj.board;

import java.util.Date;

public class Board {
	private int b_no;
	private String b_title;
	private String b_content;
	private String b_image;
	private String b_writer;
	private int b_comments;
	private int b_views;
	private Date b_date;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int b_no, String b_title, String b_content, String b_image, String b_writer, int b_comments,
			int b_views, Date b_date) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_image = b_image;
		this.b_writer = b_writer;
		this.b_comments = b_comments;
		this.b_views = b_views;
		this.b_date = b_date;
	}

	public int getB_comments() {
		return b_comments;
	}

	public void setB_comments(int b_comments) {
		this.b_comments = b_comments;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_image() {
		return b_image;
	}

	public void setB_image(String b_image) {
		this.b_image = b_image;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public int getB_views() {
		return b_views;
	}

	public void setB_views(int b_views) {
		this.b_views = b_views;
	}
	
}
