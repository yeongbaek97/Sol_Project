package com.sol.pj.tour;

public class TourDetail {

	private String parking;			// 주차시설
	private String chkpet;			// 애완동물 동반가능 정보
	private String infocenter;		// 문의 및 안내
	private String restdate;		// 쉬는날
	private String usetime;			// 이용시간
	private String expguide;		// 체험안내
	private String expagerange;		// 체험가능 연령
	private String chkbabycarriage;	// 유모차대여 정보
	//개장일, 이용시기
	public TourDetail() {
		// TODO Auto-generated constructor stub
	}
	public TourDetail(String parking, String chkpet, String infocenter, String restdate, String usetime,
			String expguide, String expagerange, String chkbabycarriage) {
		super();
		this.parking = parking;
		this.chkpet = chkpet;
		this.infocenter = infocenter;
		this.restdate = restdate;
		this.usetime = usetime;
		this.expguide = expguide;
		this.expagerange = expagerange;
		this.chkbabycarriage = chkbabycarriage;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getChkpet() {
		return chkpet;
	}
	public void setChkpet(String chkpet) {
		this.chkpet = chkpet;
	}
	public String getInfocenter() {
		return infocenter;
	}
	public void setInfocenter(String infocenter) {
		this.infocenter = infocenter;
	}
	public String getRestdate() {
		return restdate;
	}
	public void setRestdate(String restdate) {
		this.restdate = restdate;
	}
	public String getUsetime() {
		return usetime;
	}
	public void setUsetime(String usetime) {
		this.usetime = usetime;
	}
	public String getExpguide() {
		return expguide;
	}
	public void setExpguide(String expguide) {
		this.expguide = expguide;
	}
	public String getExpagerange() {
		return expagerange;
	}
	public void setExpagerange(String expagerange) {
		this.expagerange = expagerange;
	}
	public String getChkbabycarriage() {
		return chkbabycarriage;
	}
	public void setChkbabycarriage(String chkbabycarriage) {
		this.chkbabycarriage = chkbabycarriage;
	}

	
	
	
}
