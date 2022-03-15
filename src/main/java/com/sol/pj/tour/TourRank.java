package com.sol.pj.tour;

public class TourRank {
	private String contentid;
	private String title;
	private String image;
	private int count;
	private String contentTypeId;
	private String x;
	private String y;
	
	public TourRank() {
		// TODO Auto-generated constructor stub
	}
	
	public TourRank(String contentid, String title, String image, int count, String contentTypeId, String x, String y) {
		super();
		this.contentid = contentid;
		this.title = title;
		this.image = image;
		this.count = count;
		this.contentTypeId = contentTypeId;
		this.x = x;
		this.y = y;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public String getContentTypeId() {
		return contentTypeId;
	}

	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
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
