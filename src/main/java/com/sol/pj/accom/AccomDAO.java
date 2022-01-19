package com.sol.pj.accom;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class AccomDAO {

	public void getAccomList(HttpServletRequest req, int pageNo, String indsMclsCd, String ctprvnCd) {
		int numOfRows = 10;
		
		String url = "http://apis.data.go.kr/B553077/api/open/sdsc2/storeListInDong";
			url +="?serviceKey=SEZbitKjp%2FIY6e7GJZF4zrzUUaLDH6JDW2hB0MM6BBiyPUL9WjwosbIwFxpDbr24eyc9cQBDSje426FMjCnxoQ%3D%3D";
			url +="&divId=ctprvnCd";
			url +="&key=" +ctprvnCd;
			url +="&indsMclsCd=" +indsMclsCd;
			url +="&type=json";
			url +="&numOfRows" +numOfRows;
			url +="&pageNo=" +pageNo;
		
		try {
			URL u = new URL(url);

			HttpURLConnection huc = (HttpURLConnection) u.openConnection();
			
			InputStream is = huc.getInputStream();
			InputStreamReader isr = new InputStreamReader(is, "utf-8");
			
			JSONParser jp = new JSONParser();
			
			JSONObject accomData = (JSONObject) jp.parse(isr);
			JSONObject body = (JSONObject) accomData.get("body");
			JSONArray items = (JSONArray) body.get("items");
			
			ArrayList<Accom> accomList = new ArrayList<Accom>();
			
			for(int i=0; i<numOfRows; i++) {
				JSONObject item = (JSONObject) items.get(i);
				
				Accom accom = new Accom();
				accom.setBizesNm(item.get("bizesNm").toString());
				accom.setindsMclsNm(item.get("indsMclsNm").toString());
				accom.setLnoAdr(item.get("lnoAdr").toString());
				accom.setRdnmAdr(item.get("rdnmAdr").toString());
				accom.setLon(Double.parseDouble(item.get("lon").toString()));
				accom.setLat(Double.parseDouble(item.get("lat").toString()));
				
				accomList.add(accom);
			}
			
			req.setAttribute("accom", accomList);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
			
	}
	
}
