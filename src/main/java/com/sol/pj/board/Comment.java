package com.sol.pj.board;

import java.util.Date;

public class Comment {
	private int c_seq;
	private int c_no;
	private String c_writer;
	private String c_comment;
	private Date c_date;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(int c_seq, int c_no, String c_writer, String c_comment, Date c_date) {
		super();
		this.c_seq = c_seq;
		this.c_no = c_no;
		this.c_writer = c_writer;
		this.c_comment = c_comment;
		this.c_date = c_date;
	}

	public int getC_seq() {
		return c_seq;
	}

	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}

	public String getC_writer() {
		return c_writer;
	}

	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_comment() {
		return c_comment;
	}

	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	
}
