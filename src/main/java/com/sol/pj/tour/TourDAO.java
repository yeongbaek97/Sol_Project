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

	
	public void getTourList(HttpServletRequest req) {
		//투어 리스트를 가져온다
		String requrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList";
		requrl += "?serviceKey=Aw4T8pItJbg5eFtUT1DD3MgYcrXC7hWdryfz0229tJjcIiZOGGigz6ntR7M3lYTOHTuvSBHWaHqdXHP5mswwUA==";
		requrl += "&areaCode=1";
		requrl += "&contentTypeId=12";
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
            

            ArrayList<TourList> tourList = new ArrayList<TourList>();
            
            for(int i=0 ; i < item.size(); i++) {
            	
            	JSONObject itemObject = (JSONObject) item.get(i);
            	
            	/*System.out.println(i +"번째 : " + itemObject.get("addr1") +
            			itemObject.get("addr2")+
            			itemObject.get("contentid")+
            			itemObject.get("title")+
            			itemObject.get("mapx")+
            			itemObject.get("mapy")+
            			itemObject.get("firstimage2"));*/
            	
            	
            	
            	//각 객체 저장
            	TourList tl = new TourList(itemObject.get("addr1").toString(),
            			itemObject.get("contentid").toString(),
            			itemObject.get("title").toString(),
            			itemObject.get("mapx").toString(),
            			itemObject.get("mapy").toString());
            	tourList.add(tl);
            }
            req.setAttribute("tourList", tourList);
            System.out.println(tourList.get(0).getAddr1());
            
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
