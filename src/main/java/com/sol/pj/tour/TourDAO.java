package com.sol.pj.tour;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Service;


@Service
public class TourDAO {

	
	public void getTourList() {
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
			

			int responseCode = conn.getResponseCode();
			System.out.println(conn);
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println(conn);
            System.out.println("response body : " + result);
            
            
            
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
