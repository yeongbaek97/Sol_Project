package com.sol.pj.tour;

public class Bookmark {
	private int b_no;
	private String b_id;
	private String b_mapx;
	private String b_mapy;
	private String b_contentid;
	private String b_title;
	
	public Bookmark() {
		// TODO Auto-generated constructor stub
	}

	public Bookmark(int b_no, String b_id, String b_mapx, String b_mapy, String b_contentid, String b_title) {
		super();
		this.b_no = b_no;
		this.b_id = b_id;
		this.b_mapx = b_mapx;
		this.b_mapy = b_mapy;
		this.b_contentid = b_contentid;
		this.b_title = b_title;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_mapx() {
		return b_mapx;
	}

	public void setB_mapx(String b_mapx) {
		this.b_mapx = b_mapx;
	}

	public String getB_mapy() {
		return b_mapy;
	}

	public void setB_mapy(String b_mapy) {
		this.b_mapy = b_mapy;
	}

	public String getB_contentid() {
		return b_contentid;
	}

	public void setB_contentid(String b_contentid) {
		this.b_contentid = b_contentid;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	
	
	
}
