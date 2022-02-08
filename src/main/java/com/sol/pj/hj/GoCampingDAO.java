package com.sol.pj.hj;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;


@Service
public class GoCampingDAO {

	public List<GoCamping> gocampingJSON(HttpServletRequest request) throws IOException, ParseException {
		String areaCode = request.getParameter("areaCode");
		String pageNo = request.getParameter("pageNo");
		
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" +"1D%2F%2BDjUy7duh9je4ux3zfFcJ%2BQL%2BA%2Fvjiu2FWcZBqV4WxON4LqvXV8SZr26WUdP1cXTiSqBP63cLT2uDHauDOA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + pageNo); /*현재 페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("doNm","UTF-8") + "=" + URLEncoder.encode(areaCode, "UTF-8"));
	        URL url = new URL(urlBuilder.toString());

	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        /* 	
	        conn.setRequestProperty("Content-type", "application/json");
	        */
	        InputStream is = conn.getInputStream();
	        InputStreamReader isr = new InputStreamReader(is, "utf-8");
	        
	        JSONParser jp = new JSONParser();
	        JSONObject jo = (JSONObject) jp.parse(isr);
	        /*
	        System.out.println(jo);
	        numOfRows가 100이라 첫 번째 페이지의 100개의 데이터 sysout
	        */
	        JSONObject response = (JSONObject) jo.get("response");
	        JSONObject body = (JSONObject) response.get("body");
	        JSONObject items = (JSONObject) body.get("items");
	        JSONArray item = (JSONArray) items.get("item");
	        
	        
	        List<GoCamping> lgc = new ArrayList<GoCamping>();
	        
	        for(int i=0; i<item.size(); i++) {
	        	GoCamping gc = new GoCamping();
	        	JSONObject tmp = (JSONObject)item.get(i);
	        	String title = (String)tmp.get("facltNm");
	        	String addr = (String)tmp.get("addr1");
	        	String dosi = (String)tmp.get("doNm");
	        	String img = (String)tmp.get("firstImgUrl");
	        	gc.setTitle(title);
	        	gc.setAddr(addr);
	        	gc.setDosi(dosi);
	        	gc.setImg(img);
	        	
		        if(gc!=null) {
		        	lgc.add(gc);
		        }
	        }
	        
			return lgc;
	}

}
