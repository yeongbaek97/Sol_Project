package com.sol.pj.hj;

public class GoCamping {

	private String title;
	private String addr;
	private String dosi;
	private String img;
	
	public GoCamping() {
		// TODO Auto-generated constructor stub
	}

	public GoCamping(String title, String addr, String dosi, String img) {
		super();
		this.title = title;
		this.addr = addr;
		this.dosi = dosi;
		this.img = img;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDosi() {
		return dosi;
	}

	public void setDosi(String dosi) {
		this.dosi = dosi;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	
	
}
