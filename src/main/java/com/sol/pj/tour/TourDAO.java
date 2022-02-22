package com.sol.pj.tour;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;


@Service
public class TourDAO {
	
	public void getTourList(int pageNo, String areaCode, HttpServletRequest req) {
		//투어 리스트를 가져온다
		String requrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList";
		requrl += "?serviceKey=ugrsQN5mBJx2apH2PQGGoKmAb6uyNqMQ4VAQj7RjCnYdrLjq7xeLmrsdyjmj27EjoCoNmhp5uehb2xdSZ7xADg==";
		requrl += "&areaCode=" + areaCode;
		requrl += "&contentTypeId=12";
		requrl += "&pageNo=" + pageNo;
		requrl += "&MobileOS=ETC";
		requrl += "&MobileApp=AppTest";
		requrl += "&_type=json";
		

		try {
			URL url = new URL(requrl);

			//Connection 설정
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			

			//int responseCode = conn.getResponseCode();
			
			//System.out.println("responseCode : " + responseCode);
			
			//BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			//String line = "";
           // String result = "";

           // while ((line = br.readLine()) != null) {
           //     result += line;
          //  }
           // System.out.println(conn);
           // System.out.println("response body : " + result);
            
            //파싱구간
            InputStream is = conn.getInputStream();
			InputStreamReader isr = new InputStreamReader(is, "utf-8");
			
            JSONParser parser = new JSONParser();
            
            JSONObject tourData = (JSONObject) parser.parse(isr);
            System.out.println(tourData);
            //데이터 뽑기
            JSONObject response = (JSONObject) tourData.get("response");
            JSONObject body = (JSONObject) response.get("body");
            System.out.println("1" + body);
            JSONObject items = (JSONObject) body.get("items");
            System.out.println("2" + items);
            JSONArray item = (JSONArray) items.get("item");
            System.out.println("3" + item);

            //totalCount
            int allTourListCount;
            allTourListCount =Integer.parseInt(body.get("totalCount").toString());
            System.out.println(allTourListCount);
            
            int pageCount = (int) Math.ceil(allTourListCount / 10);	//10은 url주소에서 페이지당 10개 보여주는걸로 설정되었기 때문

            
            //페이지 변수값 넘겨주기
            req.setAttribute("pageCount", pageCount);	//전체 페이지 수
            req.setAttribute("curPage", pageNo);		//현재 페이지 수
            
            
            
            
            
            ArrayList<TourList> tourList = new ArrayList<TourList>();
            
            for(int i=0 ; i < item.size(); i++) {
            	
            	JSONObject itemObject = (JSONObject) item.get(i);
            	
            	//각 객체 저장
            	TourList tl = new TourList(itemObject.get("addr1").toString(),
            			itemObject.get("contentid").toString(),
            			itemObject.get("title").toString(),
            			itemObject.get("mapx").toString(),
            			itemObject.get("mapy").toString());
            	tourList.add(tl);
            }
            req.setAttribute("tourList", tourList);
            req.getSession().setAttribute("areaCode", areaCode);
            System.out.println(tourList.get(0).getAddr1());
            
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
