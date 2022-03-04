window.onload = function() {
	document.getElementById("btn").onclick = function() {
		url = apiUrl();
		startXHR(); //function startXHR로 이동
	}
}

//////// api_url
var xhr;
var area; var areacode;
var page; var pageNo;
var clas; var classification;
var url;
function apiUrl() {
	area = document.getElementById("areaCode");
	areacode = area.options[area.selectedIndex].value;
	
	page = document.getElementById("pageNo");
	pageNo = page.options[page.selectedIndex].value;
	
	clas = document.getElementById("classification");
	classification = clas.options[clas.selectedIndex].value;
	
	var Turl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"; // URL
	Turl += "?ServiceKey=" + "1D%2F%2BDjUy7duh9je4ux3zfFcJ%2BQL%2BA%2Fvjiu2FWcZBqV4WxON4LqvXV8SZr26WUdP1cXTiSqBP63cLT2uDHauDOA%3D%3D";
	Turl += "&pageNo=" + pageNo;
	Turl += "&numOfRows=" + 10;				//한페이지결과
	Turl += "&MobileApp=AppTest";
	Turl += "&MobileOS=ETC";
	Turl += "&arrange=O";				//대표이미지 반드시 있는(O=제목순, P=조회순, Q=수정일순, R=생성일순 / 없는(A=제목순, B=조회순, C=수정일순, D=생성일순)
	Turl += "&cat1=B02";
	Turl += "&contentTypeId=" + 32;
	Turl += "&areaCode=" + areacode;
	Turl += "&sigunguCode=" ;
	Turl += "&cat2=B0201";
	Turl += "&cat3=" + classification;
	Turl += "&listYN=Y";
	Turl += "&modifiedtime=";
	return Turl;
}

function createXHR() {
	if (window.ActiveXObject) {
		// 브라우저 IE (뉴버전 Msxml2.XMLHTTP / Microsoft.XMLHTTP)
		xhr = new ActiveXObject("Msxml2.XMLHTTP");
	} else {
		// 그 외 브라우저
		xhr = new XMLHttpRequest(); // xhr을 얻음
	}
}

function startXHR() {
	apiUrl();
	createXHR();
	xhr.open('GET', url, true);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				process();
			}
		}
	}
	xhr.send("");
}


/////// 데이터 불러오기
function process() {
	// xml 데이터 
	var dataX = xhr.responseXML;
	
	// json으로 변환
	var data = xmlToJson.parse(dataX);
	var item = data.response["body"].items.item;

	// 출력 
	var tabB = "<table id='test' border='1'>";
	var img;
	var cla; var classifi;
	for (var i = 1; i < item.length; i++) {
		if (item[i].firstimage != null) {
			img = item[i].firstimage;
		} else {
			//이미지없음
			img = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACgCAMAAACBpqFQAAAAMFBMVEXu7u6ZmZmurq7Z2dnDw8Pe3t7Ozs6+vr6enp7p6enJycmpqanj4+Ojo6O5ubmzs7NLxFgzAAAB2klEQVR4nO3X3XLCIBCGYZa/BEjM/d9tWYgprXbGHtS25n0OVCLj6De7YTUGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPAvTHZc2WlYRBs+7w77pZS9dz/7xf4iK+NKxui8XPMIm8yXpb5w/VKYpRqDfW0p+qjPGla0TehhTW2Rh7BqNmWVko6wVokprHJTeC+q1UZZelheGtfDsm0Rh7AmXV2ktt6lX5JSH7L4X/wBz7RKXqYezZ6Ku4bV316GsKzUoopi90SNmbWorMTf+vbP5doNp8gXYWW5mCEsX3cne2zS4KRIK68ziK2Ftlo/98IKvYCOsNIstWs3c4Rl3NbuaucQNJWawd3K0vvZHMbTME17NrrJj07RiVY2X7S8eljZuXwNK84So6b1HtZB5ywZ2Xsf/mrSVn+ptuLNaVhzitqn6xiWjq7T1MdUNzrN9NAeNSzXW2rplZV1+jTxQ2XpLmvNPjmYPpfZ80ylu4cm+D572Xp8pr5t1qzO0YOjR8PyfrWLtJHiuo2whsVNGxZZe1pS9H5FWMPicxvWv86ptGtnOgq/L+oBkJ3+/9blmYYsAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4EneAHYKB+xqekqbAAAAAElFTkSuQmCC";
		}

		cla = item[i].cat3;
		if(cla == "B02010100"){
			classifi = "호텔";
		} else if(cla == "B02010900"){
			classifi = "모텔";
		} else if(cla == "B02010700"){
			classifi = "펜션";
		} else if(cla == "B02010500"){
			classifi = "콘도";
		} else if(cla == "B02011000"){
			classifi = "민박";
		} else if(cla == "B02011100"){
			classifi = "게스트하우스";
		} else if(cla == "B02011200"){
			classifi = "홈스테이";
		} else if(cla == "B02011300"){
			classifi = "서비스드레지던스";
		} else if(cla == "B02011600"){
			classifi = "한옥스테이";
		} else if(cla == "B02010400"){
			classifi = "가족호텔";
		} else if(cla == "B02010600"){
			classifi = "유스호스텔";
		} else{
			classifi = "There's no Result";
		}
		
		tabB += "<tr>";
		tabB += "<td>" + item[i].title + "</td>";
		tabB += "<td>" + item[i].addr1 + "</td>";
		tabB += "<td><img src=" + img + " style=\"width: 250px; height: 150px;\"></td>";
		tabB += "<td>" + classifi + "</td>";
		tabB += "<td>" + item[i].mapx + "</td>";
		tabB += "<td>" + item[i].mapy + "</td>";
		tabB += "</tr>";
	}

	document.getElementById("accomTBody").innerHTML = tabB;
}

