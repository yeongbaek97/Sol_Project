package com.sol.pj.hj;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

@Service
public class AccomDAO {

	public static String getTagValue(String tag, Element eElement) {
    	//결과를 저장할 result 변수 선언
    	String result = "";
    	NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
    	result = nlList.item(0).getTextContent();
    	
    	return result;
	}
	
	public List<Accom> accomJSON(HttpServletRequest request) throws IOException, Exception {
		String areaCode = request.getParameter("areaCode");
		String pageNo = request.getParameter("pageNo");
		String claf = request.getParameter("classification");
		int clf =  Integer.parseInt(claf);
		
		
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" +"1D%2F%2BDjUy7duh9je4ux3zfFcJ%2BQL%2BA%2Fvjiu2FWcZBqV4WxON4LqvXV8SZr26WUdP1cXTiSqBP63cLT2uDHauDOA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + pageNo); /*현재 페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC*/
		
        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("O", "UTF-8")); /*(A=제목순, B=조회순, C=수정일순, D=생성일순) , 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)*/
        urlBuilder.append("&" + URLEncoder.encode("cat1","UTF-8") + "=" + URLEncoder.encode("B02", "UTF-8")); /*대분류 코드*/
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("32", "UTF-8")); /*관광타입(숙박) ID*/
        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(areaCode, "UTF-8")); /*지역코드*/
        urlBuilder.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*시군구코드(areaCode 필수)*/
        urlBuilder.append("&" + URLEncoder.encode("cat2","UTF-8") + "=" + URLEncoder.encode("B0201", "UTF-8")); /*중분류 코드(cat1필수)*/
        urlBuilder.append("&" + URLEncoder.encode("cat3","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소분류 코드(cat1,cat2필수)*/
        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*목록 구분 (Y=목록, N=개수)*/
        urlBuilder.append("&" + URLEncoder.encode("modifiedtime","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*콘텐츠 수정일*/
        
        // XML 파서 씨발
        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/xml");
        
        InputStream is = conn.getInputStream();
        InputStreamReader isr = new InputStreamReader(is);
        InputSource isc = new InputSource(isr);
        isc.setEncoding("UTF-8");
        
        
        DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		Document doc = dBuilder.parse(isc);

		doc.getDocumentElement().normalize();

		
		XPathFactory xpathFactory = XPathFactory.newInstance();
        XPath xpath = xpathFactory.newXPath();
        // XPathExpression expr = xpath.compile("/response/body/items/item");
        XPathExpression expr = xpath.compile("//items/item");
        NodeList nList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);

		//NodeList nList = doc.getElementsByTagName("item");
		
        List<Accom> acc = new ArrayList<Accom>();
        
		for(int i=0; i<nList.getLength(); i++) {
			Accom accm = new Accom();
			Node nNode = nList.item(i);
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
				Element element = (Element) nNode;
				
				String title = getTagValue("title", element);
				String addr = getTagValue("addr1", element);
				
				String img = getTagValue("firstimage", element);
				if(img != null) {
					accm.setImg(img);
				} else {
					//이미지없음
					img = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACgCAMAAACBpqFQAAAAMFBMVEXu7u6ZmZmurq7Z2dnDw8Pe3t7Ozs6+vr6enp7p6enJycmpqanj4+Ojo6O5ubmzs7NLxFgzAAAB2klEQVR4nO3X3XLCIBCGYZa/BEjM/d9tWYgprXbGHtS25n0OVCLj6De7YTUGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPAvTHZc2WlYRBs+7w77pZS9dz/7xf4iK+NKxui8XPMIm8yXpb5w/VKYpRqDfW0p+qjPGla0TehhTW2Rh7BqNmWVko6wVokprHJTeC+q1UZZelheGtfDsm0Rh7AmXV2ktt6lX5JSH7L4X/wBz7RKXqYezZ6Ku4bV316GsKzUoopi90SNmbWorMTf+vbP5doNp8gXYWW5mCEsX3cne2zS4KRIK68ziK2Ftlo/98IKvYCOsNIstWs3c4Rl3NbuaucQNJWawd3K0vvZHMbTME17NrrJj07RiVY2X7S8eljZuXwNK84So6b1HtZB5ywZ2Xsf/mrSVn+ptuLNaVhzitqn6xiWjq7T1MdUNzrN9NAeNSzXW2rplZV1+jTxQ2XpLmvNPjmYPpfZ80ylu4cm+D572Xp8pr5t1qzO0YOjR8PyfrWLtJHiuo2whsVNGxZZe1pS9H5FWMPicxvWv86ptGtnOgq/L+oBkJ3+/9blmYYsAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4EneAHYKB+xqekqbAAAAAElFTkSuQmCC";
					accm.setImg(img);
				}
				
				String classifi = getTagValue("cat3", element);
	            /*
	            cat3: 소분류
	    			B02010100: 관광호텔 / B02010200: 수상관광호텔 (정보 없음)
	    			B02010300: 전통호텔 (정보 없음) / B02010400: 가족호텔
	    			B02010500: 콘도미니엄 / B02010600: 유스호스텔
	    			B02010700: 펜션 / B02010800: 여관 (결과 1개)
	    			B02010900: 모텔 / B02011000: 민박
	    			B02011100: 게스트하우스  / B02011200: 홈스테이
	    			B02011300: 서비스드레지던스 / B02011400: 의료관광호텔 (정보 없음)
	    			B02011500: 소형호텔 / B02011600: 한옥스테이
	            */
			
	        	String cla = "";
	        	if(classifi == "B02010100" || classifi == "B02010400" || classifi == "B02011500") {
	        		cla = "Hotel";
	        	} else if(classifi == "B02010500") {
	        		cla = "condo";
	        	} else if(classifi == "B02010700") {
	        		cla = "pension";
	        	} else if(classifi == "B02010900") {
	        		cla = "Motel";
	        	} else if(classifi == "B02011000" || classifi == "B02011100" || classifi == "B02011200"
	        			|| classifi == "B02011300") {
	        		cla = "etc";
	        	} else if(classifi == "B02011600" || classifi == "B02010600") {
	        		cla = "special";
	        	} else {
	        		cla = "There's no accommodation";
	        	}
	        	
	        	switch (clf) {
				case 1: accm.setClassifi(cla); break;
				case 2: accm.setClassifi(cla); break;
				case 3: accm.setClassifi(cla); break;
				case 4: accm.setClassifi(cla); break;
				case 5: accm.setClassifi(cla); break;
				case 6: accm.setClassifi(cla); break;
				default: accm.setClassifi(cla); break;
				}
				
	        	String xx = getTagValue("mapx", element);
	        	BigDecimal mapX = new BigDecimal(xx);
	        	String yy = getTagValue("mapy", element);
	        	BigDecimal mapY = new BigDecimal(yy);
	        	
	        	accm.setTitle(title);
	        	accm.setAddr(addr);
	        	accm.setMapX(mapX);
	        	accm.setmapY(mapY);
	        	
		        	if(accm != null) {
		        		acc.add(accm);
		        	}
			}
		
		}
		return acc;
		

	}
	
}
