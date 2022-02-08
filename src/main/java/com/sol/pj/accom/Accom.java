package com.sol.pj.accom;

public class Accom {
	private String bizesNm;
	private String indsMclsNm;
	private String lnoAdr;
	private String rdnmAdr;
	private double lon;
	private double lat;
	
	public Accom() {
		// TODO Auto-generated constructor stub
	}

	public Accom(String bizesNm, String indsMclsNm, String lnoAdr, String rdnmAdr, double lon, double lat) {
		super();
		this.bizesNm = bizesNm;
		this.indsMclsNm = indsMclsNm;
		this.lnoAdr = lnoAdr;
		this.rdnmAdr = rdnmAdr;
		this.lon = lon;
		this.lat = lat;
	}


	public String getBizesNm() {
		return bizesNm;
	}

	public void setBizesNm(String bizesNm) {
		this.bizesNm = bizesNm;
	}

	public String getindsMclsNm() {
		return indsMclsNm;
	}

	public void setindsMclsNm(String indsMclsNm) {
		this.indsMclsNm = indsMclsNm;
	}

	public String getLnoAdr() {
		return lnoAdr;
	}

	public void setLnoAdr(String lnoAdr) {
		this.lnoAdr = lnoAdr;
	}

	public String getRdnmAdr() {
		return rdnmAdr;
	}

	public void setRdnmAdr(String rdnmAdr) {
		this.rdnmAdr = rdnmAdr;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}
	
	
	
}
