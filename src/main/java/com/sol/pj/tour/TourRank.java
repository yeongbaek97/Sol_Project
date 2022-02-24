package com.sol.pj.tour;

public class TourRank {
	private String contentid;
	private String title;
	private int count;
	
	public TourRank() {
		// TODO Auto-generated constructor stub
	}

	public TourRank(String contentid, String title, int count) {
		super();
		this.contentid = contentid;
		this.title = title;
		this.count = count;
	}

	public String getContentid() {
		return contentid;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	

	
}
