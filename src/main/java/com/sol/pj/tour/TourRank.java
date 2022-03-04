package com.sol.pj.tour;

public class TourRank {
	private String contentid;
	private String title;
	private String image;
	private int count;
	
	public TourRank() {
		// TODO Auto-generated constructor stub
	}


	public TourRank(String contentid, String title, String image, int count) {
		super();
		this.contentid = contentid;
		this.title = title;
		this.image = image;
		this.count = count;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
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
