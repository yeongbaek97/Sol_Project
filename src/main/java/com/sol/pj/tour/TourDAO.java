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
		requrl += "?serviceKey=Aw4T8pItJbg5eFtUT1DD3MgYcrXC7hWdryfz0229tJjcIiZOGGigz6ntR7M3lYTOHTuvSBHWaHqdXHP5mswwUA==";
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
            String firstimage2 = null;
            
            for(int i=0 ; i < item.size(); i++) {
            	
            	JSONObject itemObject = (JSONObject) item.get(i);
            	
            	
            	if(!itemObject.containsKey("firstimage2")) {
            		firstimage2 = "resources/img/s.jpg";
                } else {
                	firstimage2 = itemObject.get("firstimage2").toString();
                }
            	
            	//각 객체 저장
            	TourList tl = new TourList(
            			itemObject.get("addr1").toString(),
            			itemObject.get("contentid").toString(),
            			itemObject.get("title").toString(),
            			itemObject.get("mapx").toString(),
            			itemObject.get("mapy").toString(),
            			firstimage2
            			);
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

	public void getTourDetail(HttpServletRequest req) {
		int contentid = Integer.parseInt(req.getParameter("contentid"));
		
		String parking = "";
        String chkpet = "";
        String infocenter = "";
        String restdate = "";
        String usetime = "";
        String expguide = "";
        String expagerange = "";
        String chkbabycarriage = "";
		
		
		System.out.println(contentid);
		String requrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro";
		requrl += "?serviceKey=Aw4T8pItJbg5eFtUT1DD3MgYcrXC7hWdryfz0229tJjcIiZOGGigz6ntR7M3lYTOHTuvSBHWaHqdXHP5mswwUA==";
		////////
		requrl += "&contentTypeId=12";
		requrl += "&contentId=" + contentid;
		requrl += "&MobileOS=ETC";
		requrl += "&MobileApp=AppTest";
		requrl += "&_type=json";

		
		try {
			
	        
			URL url = new URL(requrl);
			
			//Connection 설정
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
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
            JSONObject item = (JSONObject) items.get("item");
            System.out.println("3" + item);
            
           
            if(item.containsKey("parking")) {
            	parking = item.get("parking").toString();}
            
            if(item.containsKey("chkpet")) {
            	chkpet = item.get("chkpet").toString();}
            
            if(item.containsKey("infocenter")) {
            	infocenter = item.get("infocenter").toString();}
            
            if(item.containsKey("restdate")) {
            	restdate = item.get("restdate").toString();}
            
            if(item.containsKey("usetime")) {
            	usetime = item.get("usetime").toString();}
            
            if(item.containsKey("expguide")) {
            	expguide = item.get("expguide").toString();}
            
            if(item.containsKey("expagerange")) {
            	expagerange = item.get("expagerange").toString();}
            
            if(item.containsKey("chkbabycarriage")) {
            	chkbabycarriage = item.get("chkbabycarriage").toString();}
            

	        TourDetail tourdetail = new TourDetail(
	        		parking,
	    	        chkpet,
	    	        infocenter,
	    	        restdate,
	    	        usetime,
	    	        expguide,
	    	        expagerange,
	    	        chkbabycarriage
	        		); 
	        req.setAttribute("tourdetail", tourdetail);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void getTourDetail2(HttpServletRequest req) {
		int contentid = Integer.parseInt(req.getParameter("contentid"));
		
		String infoname = "";
        String infotext = "";

		System.out.println(contentid);
		String requrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo";
		requrl += "?serviceKey=Aw4T8pItJbg5eFtUT1DD3MgYcrXC7hWdryfz0229tJjcIiZOGGigz6ntR7M3lYTOHTuvSBHWaHqdXHP5mswwUA==";
		requrl += "&contentTypeId=12";
		requrl += "&contentId=" + contentid;
		requrl += "&MobileOS=ETC";
		requrl += "&MobileApp=AppTest";
		requrl += "&_type=json";
		

		
		try {
			URL url = new URL(requrl);
			
			//Connection 설정
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
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
            
            
            ArrayList<TourDetail2> tourdetail2 = new ArrayList<TourDetail2>();
            
            
            if(body.get("totalCount").toString().equals("1")||body.get("totalCount").toString().equals("0")) {		//1개일때
            	JSONObject item = (JSONObject) items.get("item");
            	
            	if(item.containsKey("infoname")) {
                 	infoname = item.get("infoname").toString();}
                 
                 if(item.containsKey("infotext")) {
                 	infotext = item.get("infotext").toString();}
                 
                 TourDetail2 t1 = new TourDetail2(
              			infoname,
      	        		infotext
              			);
                 tourdetail2.add(t1);

            	
            }else {													//여러개일때
            	 JSONArray item = (JSONArray) items.get("item");
                 
                 for(int i=0 ; i < item.size(); i++) {
                 	
                 	JSONObject itemObject = (JSONObject) item.get(i);
                 	
                 	if(itemObject.containsKey("infoname")) {
                     	infoname = itemObject.get("infoname").toString();}
                     
                     if(itemObject.containsKey("infotext")) {
                     	infotext = itemObject.get("infotext").toString();}

                     TourDetail2 tl = new TourDetail2(
                 			infoname,
         	        		infotext
                 			);
                 	tourdetail2.add(tl);
                 }

            }
            
            req.setAttribute("tourdetail2", tourdetail2);
	        
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void getTourDetail3(HttpServletRequest req) {
		int contentid = Integer.parseInt(req.getParameter("contentid"));
		
		String createdtime = "";
		String homepage = "";
		String modifiedtime = "";
		String tel = "";
		String telname = "";
		String title = "";
		String addr1 = "";
		String addr2 = "";
		String zipcode = "";
		String mapx = "";
		String mapy = "";
		String mlevel = "";
        String overview = "";

		System.out.println(contentid);
		String requrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon";
		requrl += "?serviceKey=Aw4T8pItJbg5eFtUT1DD3MgYcrXC7hWdryfz0229tJjcIiZOGGigz6ntR7M3lYTOHTuvSBHWaHqdXHP5mswwUA==";
		requrl += "&defaultYN=Y";
		requrl += "&addrinfoYN=Y";
		requrl += "&mapinfoYN=Y";
		requrl += "&overviewYN=Y";
		requrl += "&contentId=" + contentid;
		requrl += "&MobileOS=ETC";
		requrl += "&MobileApp=AppTest";
		requrl += "&_type=json";
		

		
		try {
			URL url = new URL(requrl);
			
			//Connection 설정
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
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
            
            JSONObject item = (JSONObject) items.get("item");
            System.out.println("3" + item);
            
           
            if(item.containsKey("createdtime")) {
            	createdtime = item.get("createdtime").toString();}
            
            if(item.containsKey("homepage")) {
            	homepage = item.get("homepage").toString();}
            
            if(item.containsKey("modifiedtime")) {
            	modifiedtime = item.get("modifiedtime").toString();}
            
            if(item.containsKey("tel")) {
            	tel = item.get("tel").toString();}
            
            if(item.containsKey("telname")) {
            	telname = item.get("telname").toString();}
            
            if(item.containsKey("title")) {
            	title = item.get("title").toString();}
            
            if(item.containsKey("addr1")) {
            	addr1 = item.get("addr1").toString();}
            
            if(item.containsKey("addr2")) {
            	addr2 = item.get("addr2").toString();}
            
            if(item.containsKey("zipcode")) {
            	zipcode = item.get("zipcode").toString();}
            
            if(item.containsKey("mapx")) {
            	mapx = item.get("mapx").toString();}
            
            if(item.containsKey("mapy")) {
            	mapy = item.get("mapy").toString();}
            
            if(item.containsKey("mlevel")) {
            	mlevel = item.get("mlevel").toString();}
            
            if(item.containsKey("overview")) {
            	overview = item.get("overview").toString();}
            

	       TourDetail3 tourdetail3 = new TourDetail3(
	    		   createdtime,
	    		   homepage,
	    		   modifiedtime,
	    		   tel,
	    		   telname,
	    		   title,
	    		   addr1,
	    		   addr2,
	    		   zipcode,
	    		   mapx,
	    		   mapy,
	    		   mlevel,
	    		   overview
	        		); 
	        req.setAttribute("tourdetail3", tourdetail3);	
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	
	

}
