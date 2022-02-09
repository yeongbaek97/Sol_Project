package com.sol.pj.hj;

import java.math.BigDecimal;

public class Accommo {

	private String title;
	private String addr;
	private String img;
	private String classifi;
	private BigDecimal mapX;
	private BigDecimal mapY;
	
	public Accommo() {
		// TODO Auto-generated constructor stub
	}

	public Accommo(String title, String addr, String img, String classifi, BigDecimal mapX, BigDecimal mapY) {
		super();
		this.title = title;
		this.addr = addr;
		this.img = img;
		this.classifi = classifi;
		this.mapX = mapX;
		this.mapY = mapY;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getClassifi() {
		return classifi;
	}

	public void setClassifi(String classifi) {
		this.classifi = classifi;
	}

	public BigDecimal getMapX() {
		return mapX;
	}

	public void setMapX(BigDecimal mapX) {
		this.mapX = mapX;
	}

	public BigDecimal getmapY() {
		return mapY;
	}

	public void setmapY(BigDecimal mapY) {
		this.mapY = mapY;
	}
	
	
}
