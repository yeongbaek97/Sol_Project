package com.sol.pj.tour;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol.pj.accom.Accom;

@Service
public class TourDAO {
	
	@Autowired
	private SqlSession ss;

	public void getTourList(int pageNo, HttpServletRequest req) {
		String areaCode = req.getParameter("areaCode");
		String ContentTypeId = req.getParameter("ContentTypeId");
		String sigunguCode = req.getParameter("sigunguCode");
		String cafe = "";
		
		
		if(req.getParameter("areaCode")==null) {
			areaCode = (String) req.getSession().getAttribute("areaCode");
		}
		if(req.getParameter("ContentTypeId")==null) {
			ContentTypeId = (String) req.getSession().getAttribute("ContentTypeId");
		}
		if(req.getParameter("sigunguCode")==null) {
			sigunguCode = (String) req.getSession().getAttribute("sigunguCode");
		}
		
		
		if(ContentTypeId.equals("39")) {
			cafe = "&cat1=A05&cat2=A0502&cat3=A05020900";
		}
		/*System.out.println("asd " + sigunguCode);*/
		//투어 리스트를 가져온다
		String requrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList";
		requrl += "?serviceKey=ugrsQN5mBJx2apH2PQGGoKmAb6uyNqMQ4VAQj7RjCnYdrLjq7xeLmrsdyjmj27EjoCoNmhp5uehb2xdSZ7xADg==";
		requrl += "&areaCode=" + areaCode;
		requrl += "&contentTypeId=" + ContentTypeId;
		requrl += "&pageNo=" + pageNo;
		requrl += "&numOfRows=9";
		requrl += "&MobileOS=ETC";
		requrl += "&MobileApp=AppTest";
		requrl += "&_type=json";
		if(!cafe.equals("")) {
			requrl += cafe;
		}
		if(!sigunguCode.equals("0")) {
			requrl += "&sigunguCode=" + sigunguCode;
		}
		System.out.println(requrl);
		
		
		

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
            JSONArray item = (JSONArray) items.get("item");
            System.out.println("3" + item);

            //totalCount
            int allTourListCount;
            allTourListCount =Integer.parseInt(body.get("totalCount").toString());
            System.out.println(allTourListCount);
            
            int pageCount = (int) Math.ceil(allTourListCount / 9);	//10은 url주소에서 페이지당 10개 보여주는걸로 설정되었기 때문

            
            //페이지 변수값 넘겨주기
            req.setAttribute("pageCount", pageCount);	//전체 페이지 수
            req.setAttribute("curPage", pageNo);		//현재 페이지 수
            
            
            
            
            
            ArrayList<TourList> tourList = new ArrayList<TourList>();
            String addr1 = null;
            String contentid = null;
            String title = null;
            String firstimage2 = null;
            String mapx = null;
            String mapy = null;
            
            for(int i=0 ; i < item.size(); i++) {
            	
            	JSONObject itemObject = (JSONObject) item.get(i);
            	
            	// nullpoint 처리
            	//addr1
            	if(!itemObject.containsKey("addr1")) {
            		addr1 = "없음";
                } else {
                	addr1 = itemObject.get("addr1").toString();
                }
            	//contentid
            	if(!itemObject.containsKey("contentid")) {
            		contentid = "없음";
                } else {
                	contentid = itemObject.get("contentid").toString();
                }
            	//title
            	if(!itemObject.containsKey("title")) {
            		title = "없음";
                } else {
                	title = itemObject.get("title").toString();
                }
            	//firstimage2
            	if(!itemObject.containsKey("firstimage2")) {
            		firstimage2 = "resources/img/s.jpg";
                } else {
                	firstimage2 = itemObject.get("firstimage2").toString();
                }
            	//mapx,mapy
            	if(!itemObject.containsKey("mapx")) {
            		mapx = "없음";
            		mapy = "없음";
                } else {
                	mapx = itemObject.get("mapx").toString();
                	mapy = itemObject.get("mapy").toString();
                }
            	
            	
            	
            	//각 객체 저장
            	TourList tl = new TourList(
            			addr1,
            			contentid,
            			title,
            			mapx,
            			mapy,
            			firstimage2
            			);
            	tourList.add(tl);
            }
            req.setAttribute("tourList", tourList);
            req.getSession().setAttribute("areaCode", areaCode);
            req.getSession().setAttribute("ContentTypeId", ContentTypeId);
            req.getSession().setAttribute("sigunguCode", sigunguCode);
            System.out.println(tourList.get(0).getAddr1());
            
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	
	
	
	
	
	public void getTourDetail_CT12(HttpServletRequest req) {
		
		String contentid = req.getParameter("contentid");

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
		requrl += "?serviceKey=ugrsQN5mBJx2apH2PQGGoKmAb6uyNqMQ4VAQj7RjCnYdrLjq7xeLmrsdyjmj27EjoCoNmhp5uehb2xdSZ7xADg==";
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
            

	        TourDetailCT12 tourdetail = new TourDetailCT12(
	        		parking,
	    	        chkpet,
	    	        infocenter,
	    	        restdate,
	    	        usetime,
	    	        expguide,
	    	        expagerange,
	    	        chkbabycarriage,
	    	        contentid
	        		); 
	        req.setAttribute("tourdetail", tourdetail);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public void getTourDetail_CT14(HttpServletRequest req) {
		
		String contentid =req.getParameter("contentid");
		
		
		
		
		String accomcountculture = "";
		String chkbabycarriageculture = "";
        String chkpetculture = "";
        String discountinfo = "";
        String infocenterculture = "";
        String parkingculture = "";
        String parkingfee = "";
        String restdateculture = "";
        String usefee = "";
        String usetimeculture = "";
        String scale = "";
        String spendtime = "";

		
		System.out.println(contentid);
		String requrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro";
		requrl += "?serviceKey=ugrsQN5mBJx2apH2PQGGoKmAb6uyNqMQ4VAQj7RjCnYdrLjq7xeLmrsdyjmj27EjoCoNmhp5uehb2xdSZ7xADg==";
		////////
		requrl += "&contentTypeId=14";
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
 
            if(item.containsKey("accomcountculture")) {
            	accomcountculture = item.get("accomcountculture").toString();}
            
            if(item.containsKey("chkbabycarriageculture")) {
            	chkbabycarriageculture = item.get("chkbabycarriageculture").toString();}
            
            if(item.containsKey("chkpetculture")) {
            	chkpetculture = item.get("chkpetculture").toString();}
            
            if(item.containsKey("discountinfo")) {
            	discountinfo = item.get("discountinfo").toString();}
            
            if(item.containsKey("infocenterculture")) {
            	infocenterculture = item.get("infocenterculture").toString();}
            
            if(item.containsKey("parkingculture")) {
            	parkingculture = item.get("parkingculture").toString();}
            
            if(item.containsKey("parkingfee")) {
            	parkingfee = item.get("parkingfee").toString();}
            
            if(item.containsKey("restdateculture")) {
            	restdateculture = item.get("restdateculture").toString();}
            
            if(item.containsKey("usefee")) {
            	usefee = item.get("usefee").toString();}
           
            if(item.containsKey("usetimeculture")) {
            	usetimeculture = item.get("usetimeculture").toString();}
            
            if(item.containsKey("scale")) {
            	scale = item.get("scale").toString();}
            
            if(item.containsKey("spendtime")) {
            	spendtime = item.get("spendtime").toString();}
            

	        TourDetailCT14 tourdetail = new TourDetailCT14(
	        		accomcountculture,
	        		chkbabycarriageculture,
	                chkpetculture,
	                discountinfo,
	                infocenterculture,
	                parkingculture,
	                parkingfee,
	                restdateculture,
	                usefee,
	                usetimeculture,
	                scale,
	                spendtime,
	                contentid
	        		); 
	        req.setAttribute("tourdetail", tourdetail);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public void getTourDetail_CT15(HttpServletRequest req) {
	
		String contentid =req.getParameter("contentid");
	
	
	
	
	String agelimit = "";
    String bookingplace = "";
    String discountinfofestival = "";
    String eventenddate = "";
    String eventhomepage = "";
    String eventplace = "";
    String eventstartdate = "";
    String festivalgrade = "";
    String placeinfo = "";
    String playtime = "";
    String program = "";
    String spendtimefestival = "";
    String sponsor1 = "";
    String sponsor1tel = "";
    String sponsor2 = "";
    String sponsor2tel = "";
    String subevent = "";
    String usetimefestival = "";
	
	
	System.out.println(contentid);
	String requrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro";
	requrl += "?serviceKey=ugrsQN5mBJx2apH2PQGGoKmAb6uyNqMQ4VAQj7RjCnYdrLjq7xeLmrsdyjmj27EjoCoNmhp5uehb2xdSZ7xADg==";
	////////
	requrl += "&contentTypeId=15";
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

        if(item.containsKey("agelimit")) {
        	agelimit = item.get("agelimit").toString();}
        
        if(item.containsKey("bookingplace")) {
        	bookingplace = item.get("bookingplace").toString();}
        
        if(item.containsKey("discountinfofestival")) {
        	discountinfofestival = item.get("discountinfofestival").toString();}
        
        if(item.containsKey("eventenddate")) {
        	eventenddate = item.get("eventenddate").toString();}
        
        if(item.containsKey("eventhomepage")) {
        	eventhomepage = item.get("eventhomepage").toString();}
        
        if(item.containsKey("eventplace")) {
        	eventplace = item.get("eventplace").toString();}
        
        if(item.containsKey("eventstartdate")) {
        	eventstartdate = item.get("eventstartdate").toString();}
        
        if(item.containsKey("festivalgrade")) {
        	festivalgrade = item.get("festivalgrade").toString();}
        
        if(item.containsKey("placeinfo")) {
        	placeinfo = item.get("placeinfo").toString();}
        
        if(item.containsKey("playtime")) {
        	playtime = item.get("playtime").toString();}
        
        if(item.containsKey("program")) {
        	program = item.get("program").toString();}
        
        if(item.containsKey("spendtimefestival")) {
        	spendtimefestival = item.get("spendtimefestival").toString();}
        
        if(item.containsKey("sponsor1")) {
        	sponsor1 = item.get("sponsor1").toString();}
        
        if(item.containsKey("sponsor1tel")) {
        	sponsor1tel = item.get("sponsor1tel").toString();}
        
        if(item.containsKey("sponsor2")) {
        	sponsor2 = item.get("sponsor2").toString();}
        
        if(item.containsKey("sponsor2tel")) {
        	sponsor2tel = item.get("sponsor2tel").toString();}
        
        if(item.containsKey("subevent")) {
        	subevent = item.get("subevent").toString();}
        
        if(item.containsKey("usetimefestival")) {
        	usetimefestival = item.get("usetimefestival").toString();}
        

        TourDetailCT15 tourdetail = new TourDetailCT15(
        		agelimit,
        	    bookingplace,
        	    discountinfofestival,
        	    eventenddate,
        	    eventhomepage,
        	    eventplace,
        	    eventstartdate,
        	    festivalgrade,
        	    placeinfo,
        	    playtime ,
        	    program ,
        	    spendtimefestival,
        	     sponsor1,
        	     sponsor1tel,
        	     sponsor2,
        	     sponsor2tel,
        	     subevent,
        	     usetimefestival,
        	     contentid
        		); 
        req.setAttribute("tourdetail", tourdetail);
		
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}
	public void getTourDetail_CT28(HttpServletRequest req) {
	
		String contentid =req.getParameter("contentid");
	
	
	
	
	String accomcountleports = "";
    String chkbabycarriageleports = "";
    String chkpetleports = "";
    String expagerangeleports = "";
    String infocenterleports = "";
    String openperiod = "";
    String parkingfeeleports = "";
    String parkingleports = "";
    String reservation = "";
    String restdateleports = "";
    String scaleleports = "";
    String usefeeleports = "";
    String usetimeleports = "";
	
	
	System.out.println(contentid);
	String requrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro";
	requrl += "?serviceKey=ugrsQN5mBJx2apH2PQGGoKmAb6uyNqMQ4VAQj7RjCnYdrLjq7xeLmrsdyjmj27EjoCoNmhp5uehb2xdSZ7xADg==";
	////////
	requrl += "&contentTypeId=28";
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
        
        
        
       
        if(item.containsKey("accomcountleports")) {
        	accomcountleports = item.get("accomcountleports").toString();}
        
        if(item.containsKey("chkbabycarriageleports")) {
        	chkbabycarriageleports = item.get("chkbabycarriageleports").toString();}
        
        if(item.containsKey("chkpetleports")) {
        	chkpetleports = item.get("chkpetleports").toString();}
        
        if(item.containsKey("expagerangeleports")) {
        	expagerangeleports = item.get("expagerangeleports").toString();}
        
        if(item.containsKey("infocenterleports")) {
        	infocenterleports = item.get("infocenterleports").toString();}
        
        if(item.containsKey("openperiod")) {
        	openperiod = item.get("openperiod").toString();}
        
        if(item.containsKey("parkingfeeleports")) {
        	parkingfeeleports = item.get("parkingfeeleports").toString();}
        
        if(item.containsKey("parkingleports")) {
        	parkingleports = item.get("parkingleports").toString();}
        
        if(item.containsKey("reservation")) {
        	reservation = item.get("reservation").toString();}
        
        if(item.containsKey("restdateleports")) {
        	restdateleports = item.get("restdateleports").toString();}
        
        if(item.containsKey("scaleleports")) {
        	scaleleports = item.get("scaleleports").toString();}
        
        if(item.containsKey("usefeeleports")) {
        	usefeeleports = item.get("usefeeleports").toString();}
        
        if(item.containsKey("usetimeleports")) {
        	usetimeleports = item.get("usetimeleports").toString();}
        

        TourDetailCT28 tourdetail = new TourDetailCT28(
        		 accomcountleports,
                 chkbabycarriageleports,
                 chkpetleports,
                 expagerangeleports,
                 infocenterleports,
                 openperiod,
                 parkingfeeleports,
                 parkingleports,
                 reservation,
                 restdateleports,
                 scaleleports,
                 usefeeleports,
                 usetimeleports,
                 contentid
        		); 
        req.setAttribute("tourdetail", tourdetail);
		
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}
	public void getTourDetail_CT39(HttpServletRequest req) {
		
		String contentid =req.getParameter("contentid");

		String discountinfofood = "";
	    String firstmenu = "";
	    String infocenterfood = "";
	    String kidsfacility = "";
	    String opendatefood = "";
	    String opentimefood = "";
	    String packing = "";
	    String parkingfood = "";
	    String reservationfood = "";
	    String restdatefood = "";
	    String scalefood = "";
	    String seat = "";
	    String smoking = "";
	    String treatmenu = "";
	    String lcnsno = "";
	    
		
		
		System.out.println(contentid);
		String requrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro";
		requrl += "?serviceKey=ugrsQN5mBJx2apH2PQGGoKmAb6uyNqMQ4VAQj7RjCnYdrLjq7xeLmrsdyjmj27EjoCoNmhp5uehb2xdSZ7xADg==";
		////////
		requrl += "&contentTypeId=39";
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
	        
	        
	        
	        
	        
	        
	        
		    
	        
	       
	        if(item.containsKey("discountinfofood")) {
	        	discountinfofood = item.get("discountinfofood").toString();}
	        
	        if(item.containsKey("firstmenu")) {
	        	firstmenu = item.get("firstmenu").toString();}
	        
	        if(item.containsKey("infocenterfood")) {
	        	infocenterfood = item.get("infocenterfood").toString();}
	        
	        if(item.containsKey("kidsfacility")) {
	        	kidsfacility = item.get("kidsfacility").toString();}
	        
	        if(item.containsKey("opendatefood")) {
	        	opendatefood = item.get("opendatefood").toString();}
	        
	        if(item.containsKey("opentimefood")) {
	        	opentimefood = item.get("opentimefood").toString();}
	        
	        
	        
	       
		    
		    
	        if(item.containsKey("packing")) {
	        	packing = item.get("packing").toString();}
	        
	        if(item.containsKey("parkingfood")) {
	        	parkingfood = item.get("parkingfood").toString();}
	        
	        if(item.containsKey("reservationfood")) {
	        	reservationfood = item.get("reservationfood").toString();}
	        
	        if(item.containsKey("restdatefood")) {
	        	restdatefood = item.get("restdatefood").toString();}
	        
	        if(item.containsKey("scalefood")) {
	        	scalefood = item.get("scalefood").toString();}
	        
	        if(item.containsKey("seat")) {
	        	seat = item.get("seat").toString();}
	        
	        if(item.containsKey("smoking")) {
	        	smoking = item.get("smoking").toString();}
	        
	        if(item.containsKey("treatmenu")) {
	        	treatmenu = item.get("treatmenu").toString();}
	        
	        if(item.containsKey("lcnsno")) {
	        	lcnsno = item.get("lcnsno").toString();}
	        

	        TourDetailCT39 tourdetail = new TourDetailCT39(
	        		 discountinfofood,
	    		     firstmenu,
	    		     infocenterfood,
	    		     kidsfacility,
	    		     opendatefood,
	    		     opentimefood,
	    		     packing,
	    		     parkingfood,
	    		     reservationfood,
	    		     restdatefood,
	    		     scalefood,
	    		     seat,
	    		     smoking,
	    		     treatmenu,
	    		     lcnsno,
	    		     contentid
	        		); 
	        req.setAttribute("tourdetail", tourdetail);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	

	
	public void getTourDetail2(HttpServletRequest req) {
		String contentid =req.getParameter("contentid");
		
		String infoname = "";
        String infotext = "";

		System.out.println(contentid);
		String requrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo";
		requrl += "?serviceKey=ugrsQN5mBJx2apH2PQGGoKmAb6uyNqMQ4VAQj7RjCnYdrLjq7xeLmrsdyjmj27EjoCoNmhp5uehb2xdSZ7xADg==";
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

	public void getTourDetail_common(HttpServletRequest req) {
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
		requrl += "?serviceKey=ugrsQN5mBJx2apH2PQGGoKmAb6uyNqMQ4VAQj7RjCnYdrLjq7xeLmrsdyjmj27EjoCoNmhp5uehb2xdSZ7xADg==";
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
            

	       TourDetailCommon tourdetailcommon = new TourDetailCommon(
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
	        req.setAttribute("tourdetailcommon", tourdetailcommon);	
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}






	public void getdetailImage(HttpServletRequest req) {
		
		int contentid = Integer.parseInt(req.getParameter("contentid"));
		
		/*String createdtime = "";
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
        String overview = "";*/

		String requrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage";
		requrl += "?serviceKey=ugrsQN5mBJx2apH2PQGGoKmAb6uyNqMQ4VAQj7RjCnYdrLjq7xeLmrsdyjmj27EjoCoNmhp5uehb2xdSZ7xADg==";
		requrl += "&MobileOS=ETC";
		requrl += "&MobileApp=AppTest";
		requrl += "&_type=json";
		requrl += "&contentId=" + contentid;
		requrl += "&imageYN=Y";
		requrl += "&subImageYN=Y";

		
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
            System.out.println("1111" + body);
            JSONObject items = (JSONObject) body.get("items");
            System.out.println("2" + items);
            
            ArrayList<String> originimgurl = new ArrayList<String>();
            
            
            if(body.get("totalCount").toString().equals("1")||body.get("totalCount").toString().equals("0")) {		//1개일때
            	JSONObject item = (JSONObject) items.get("item");

                 originimgurl.add(item.get("originimgurl").toString());

            	
            }else {													//여러개일때
            	 JSONArray item = (JSONArray) items.get("item");
                 
                 for(int i=0 ; i < item.size(); i++) {
                 	
                 	JSONObject itemObject = (JSONObject) item.get(i);

                 	originimgurl.add(itemObject.get("originimgurl").toString());
                 }

            }
            
            req.setAttribute("originimgurl", originimgurl);

	       
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	
	
public void getsearch(HttpServletRequest req) {

		try {
			
			String keyword = req.getParameter("keyword");
			

			String requrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword";
			requrl += "?serviceKey=ugrsQN5mBJx2apH2PQGGoKmAb6uyNqMQ4VAQj7RjCnYdrLjq7xeLmrsdyjmj27EjoCoNmhp5uehb2xdSZ7xADg==";
			requrl += "&MobileOS=ETC";
			requrl += "&MobileApp=AppTest";
			requrl += "&_type=json";
			requrl += "&keyword="+URLEncoder.encode(keyword, "UTF-8");
			
			System.out.println(requrl);
			
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
            System.out.println("1111" + body);
            JSONObject items = (JSONObject) body.get("items");
            System.out.println("2" + items);

            

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	}






public int getmark(Bookmark b,HttpServletRequest req) {
	
	List<Bookmark> bookmark = ss.getMapper(BookmarkMapper.class).getMarkByID(b);

	if(bookmark.size() !=0) {
		for(Bookmark list: bookmark) {
			
			if(req.getParameter("b_contentid").equals(list.getB_contentid())) {

				return 1;
			}
			
		}
	}
	
	
	return 0;
}

public int getmark_change(Bookmark b,HttpServletRequest req) {
	
	List<Bookmark> bookmark = ss.getMapper(BookmarkMapper.class).getMarkByID(b);
	//conid랑 비교해서 같은게 있으면 리턴값 보내고
	
	//없으면 데이터 저장해서 리턴값 다른거 보내고
	
	System.out.println(bookmark.size());
	//System.out.println(bookmark.get(0).getB_contentid());
	//System.out.println(req.getParameter("b_contentid"));
	
	
	if(bookmark.size() !=0) {
		for(Bookmark list: bookmark) {
			
			if(req.getParameter("b_contentid").equals(list.getB_contentid())) {
				//제거
				ss.getMapper(BookmarkMapper.class).deleteMark(b);
				System.out.println("제거됨");
				return 0;
			}
			
		}
	}
	
	//추가
	ss.getMapper(BookmarkMapper.class).setMark(b);
	System.out.println("추가됨");
	return 1;
}
	
	
	
	
	
	
	
	
	


	public void TourRank(HttpServletRequest req, TourRank tr) {
		
		TourRankMapper trm = ss.getMapper(TourRankMapper.class);
		
		if(trm.getTourRank(tr) == 1) {
			trm.countTourRank(tr);
		} else {
			trm.insertTourRank(tr);
		}
		
	}

	public void getTourRank(HttpServletRequest req) {
		
		TourRankMapper trm = ss.getMapper(TourRankMapper.class);
		
		List<TourRank> tourRankList = trm.getTourRankList();
		req.setAttribute("tourRankList", tourRankList);
	}


	public void searchRank(HttpServletRequest req, SearchRank sr) {
		
		SearchRankMapper srm = ss.getMapper(SearchRankMapper.class);
		
		if(srm.getSearchRank(sr) == 1) {
			srm.countSearchRank(sr);
		} else {
			srm.insertSearchRank(sr);
		}
		
	}

	public void getSearchRank(HttpServletRequest req) {
		SearchRankMapper srm = ss.getMapper(SearchRankMapper.class);
		
		List<SearchRank> searchRankList = srm.getSearchRankList();
		//req.setAttribute("searchRankList", searchRankList);
		req.getSession().setAttribute("searchRankList", searchRankList);
	}

	
	

}
