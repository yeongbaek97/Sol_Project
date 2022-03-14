let totalData; //총 데이터 수
let dataPerPage = 6; //한 페이지에 나타낼 글 수
let pageCount = 10; //페이징에 나타낼 페이지 수
let globalCurrentPage=1; //현재 페이지
let globalareaCode; //지역
let globalclassification; //종류

window.onload = function() {
	document.getElementById("btn").onclick = function() {
		url = apiUrl();
		startXHR(); // function startXHR로 이동
	}
}

// ////// api_url
var xhr;
var area;
var areacode;
var page;
var pageNo;
var clas;
var classification;
var url;



function apiUrl() {
	area = document.getElementById("areaCode");
	areacode = area.options[area.selectedIndex].value;
	globalareaCode = area.options[area.selectedIndex].value;



	clas = document.getElementById("classification");
	classification = clas.options[clas.selectedIndex].value;
	globalclassification = clas.options[clas.selectedIndex].value;

	var Turl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"; // URL
	Turl += "?ServiceKey="
			+ "1D%2F%2BDjUy7duh9je4ux3zfFcJ%2BQL%2BA%2Fvjiu2FWcZBqV4WxON4LqvXV8SZr26WUdP1cXTiSqBP63cLT2uDHauDOA%3D%3D";
	Turl += "&pageNo=1";
	Turl += "&numOfRows=" + 6; // 한페이지결과
	Turl += "&MobileApp=AppTest";
	Turl += "&MobileOS=ETC";
	Turl += "&arrange=O"; // 대표이미지 반드시 있는(O=제목순, P=조회순, Q=수정일순, R=생성일순 /
							// 없는(A=제목순, B=조회순, C=수정일순, D=생성일순)
	Turl += "&cat1=B02";
	Turl += "&contentTypeId=" + 32;
	Turl += "&areaCode=" + areacode;
	Turl += "&sigunguCode=";
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

// ///// 데이터 불러오기
function process() {
	// xml 데이터
	var dataX = xhr.responseXML;

	// json으로 변환
	var data = xmlToJson.parse(dataX);
	var body = data.response["body"];
	var item = data.response["body"].items.item;
	var totalCount = body.totalCount;
	totalData = totalCount;
	
	
	
	
	// 출력

	
	//글 목록 표시 호출 (테이블 생성)
	
	 if(globalCurrentPage == 1){
		 displayData(1, dataPerPage);
		 //페이징 표시 호출
		 paging(totalData, dataPerPage, pageCount, 1);
	 }
	 
	 


	var img;
	var cla;
	var classifi;
	var list_item = "";
	  
	if (totalCount == 0) { // item 갯수 안가져올때
			
	} else if (totalCount == 1) { // item 갯수 1개일때

	} else {

		for (var i = 0; i < item.length; i++) {
			if (item[i].firstimage != null) {
				img = item[i].firstimage;
			} else {
				// 이미지없음
				img = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACgCAMAAACBpqFQAAAAMFBMVEXu7u6ZmZmurq7Z2dnDw8Pe3t7Ozs6+vr6enp7p6enJycmpqanj4+Ojo6O5ubmzs7NLxFgzAAAB2klEQVR4nO3X3XLCIBCGYZa/BEjM/d9tWYgprXbGHtS25n0OVCLj6De7YTUGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPAvTHZc2WlYRBs+7w77pZS9dz/7xf4iK+NKxui8XPMIm8yXpb5w/VKYpRqDfW0p+qjPGla0TehhTW2Rh7BqNmWVko6wVokprHJTeC+q1UZZelheGtfDsm0Rh7AmXV2ktt6lX5JSH7L4X/wBz7RKXqYezZ6Ku4bV316GsKzUoopi90SNmbWorMTf+vbP5doNp8gXYWW5mCEsX3cne2zS4KRIK68ziK2Ftlo/98IKvYCOsNIstWs3c4Rl3NbuaucQNJWawd3K0vvZHMbTME17NrrJj07RiVY2X7S8eljZuXwNK84So6b1HtZB5ywZ2Xsf/mrSVn+ptuLNaVhzitqn6xiWjq7T1MdUNzrN9NAeNSzXW2rplZV1+jTxQ2XpLmvNPjmYPpfZ80ylu4cm+D572Xp8pr5t1qzO0YOjR8PyfrWLtJHiuo2whsVNGxZZe1pS9H5FWMPicxvWv86ptGtnOgq/L+oBkJ3+/9blmYYsAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4EneAHYKB+xqekqbAAAAAElFTkSuQmCC";
			}

			cla = item[i].cat3;
			if (cla == "B02010100") {
				classifi = "호텔";
			} else if (cla == "B02010900") {
				classifi = "모텔";
			} else if (cla == "B02010700") {
				classifi = "펜션";
			} else if (cla == "B02010500") {
				classifi = "콘도";
			} else if (cla == "B02011000") {
				classifi = "민박";
			} else if (cla == "B02011100") {
				classifi = "게스트하우스";
			} else if (cla == "B02011200") {
				classifi = "홈스테이";
			} else if (cla == "B02011300") {
				classifi = "서비스드레지던스";
			} else if (cla == "B02011600") {
				classifi = "한옥스테이";
			} else if (cla == "B02010400") {
				classifi = "가족호텔";
			} else if (cla == "B02010600") {
				classifi = "유스호스텔";
			} else {
				classifi = "There's no Result";
			}

			
			
			

			list_item += "<li class='accom_item' onclick='accomMap();'>";
			list_item += "<div>";
				list_item += "<div>";
					list_item += "<img src=" + img
					+ " style=\"width: 250px; height: 150px;\">";

				list_item += "</div>";
				
				
				list_item += "<div>";
					list_item += item[i].title;
					list_item += "<input type='hidden' id='mapx' value=" + item[i].mapx + ">";
					list_item += "<input type='hidden' id='mapy' value=" + item[i].mapy + ">";

					list_item += "<input type='hidden' id='addr1' value='" + item[i].addr1 + "'>";
					list_item += "<input type='hidden' id='title' value='" + item[i].title + "'>";

				list_item += "</div>";

				console.log(item[i].addr1);
			
	
			list_item += "</div>";
			list_item += "</li>";
			

			
			

			document.getElementById("accom_list_item").innerHTML = list_item;
		}
		

	}
}




function paging(totalData, dataPerPage, pageCount, currentPage) {
	  console.log("currentPage : " + currentPage);

	  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
	  
	  if(totalPage<pageCount){
	    pageCount=totalPage;
	  }
	  
	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	  
	  if (last > totalPage) {
	    last = totalPage;
	  }

	  let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
	  let next = last + 1;
	  let prev = first - 1;

	  let pageHtml = "";

	  if (prev > 0) {
	    pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
	  }

	 //페이징 번호 표시 
	  for (var i = first; i <= last; i++) {
	    if (currentPage == i) {
	      pageHtml +=
	        "<li class='on'><a href='#' id='" + i + "'>" + i + "</a></li>";
	    } else {
	      pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";
	    }
	  }

	  if (last < totalPage) {
	    pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";
	  }

	  $("#pagingul").html(pageHtml);
	  let displayCount = "";
	  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
	  $("#displayCount").text(displayCount);


	  //페이징 번호 클릭 이벤트 
	  $("#pagingul li a").click(function () {
	    let $id = $(this).attr("id");
	    selectedPage = $(this).text();

	    if ($id == "next") selectedPage = next;
	    if ($id == "prev") selectedPage = prev;
	    
	    //전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage = selectedPage;
	    //페이징 표시 재호출
	    paging(totalData, dataPerPage, pageCount, selectedPage);
	   
	    //글 목록 표시 재호출
	    url = displayData(selectedPage, dataPerPage);
		startXHR();
	    
	  });
	}







//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {
	
		area = document.getElementById("areaCode");
		areacode = area.options[area.selectedIndex].value;



		clas = document.getElementById("classification");
		classification = clas.options[clas.selectedIndex].value;

		var Turl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"; // URL
		Turl += "?ServiceKey="
				+ "1D%2F%2BDjUy7duh9je4ux3zfFcJ%2BQL%2BA%2Fvjiu2FWcZBqV4WxON4LqvXV8SZr26WUdP1cXTiSqBP63cLT2uDHauDOA%3D%3D";
		Turl += "&pageNo=" + globalCurrentPage;
		Turl += "&numOfRows=" + 6; // 한페이지결과
		Turl += "&MobileApp=AppTest";
		Turl += "&MobileOS=ETC";
		Turl += "&arrange=O"; // 대표이미지 반드시 있는(O=제목순, P=조회순, Q=수정일순, R=생성일순 /
								// 없는(A=제목순, B=조회순, C=수정일순, D=생성일순)
		Turl += "&cat1=B02";
		Turl += "&contentTypeId=" + 32;
		Turl += "&areaCode=" + globalareaCode;
		Turl += "&sigunguCode=";
		Turl += "&cat2=B0201";
		Turl += "&cat3=" + globalclassification;
		Turl += "&listYN=Y";
		Turl += "&modifiedtime=";

		return Turl;
	
  
}





/*$("#dataPerPage").change(function () {
    dataPerPage = $("#dataPerPage").val();
    //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    displayData(globalCurrentPage, dataPerPage);
 });*/

































function sidebar2() {

	var duration = 500;

	var $side = $('#sidebar2');

	console.log($side.find('.btn_a'));
	var $sidebt = $side.find('.btn_a').on('click', function() {
		$side.toggleClass('open');

		if ($side.hasClass('open')) {
			$side.stop(true).animate({
				right : '0px'
			}, duration);
			$sidebt.find('span').text('지도 검색');
		} else {
			$side.stop(true).animate({
				right : '-900px'
			}, duration);
			$sidebt.find('span').text('지도 검색');
		}
		;
	});

}

$(function() {
	sidebar2();
});



function accomMap() {
	var li = event.currentTarget;
	
	var mapx = li.querySelector("#mapx").value;
	var mapy = li.querySelector("#mapy").value;
	var addr1 = li.querySelector("#addr1").value;
	var title = li.querySelector("#title").value;
	

	var addr = addr1.split(" ");
	console.log(addr[0]);
	console.log(addr[1]);
	
	var title2 = title.split(" ");
	console.log(title2[0]);
	console.log(title2[1]);
	
	var search = addr[0] +" " +addr[1] +" " +title;
	
	var container = document.getElementById('accomMap'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(mapy, mapx), //지도의 중심좌표.
		level: 7, //지도의 레벨(확대, 축소 정도)
		disableDoubleClickZoom: true
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 

	// 키워드로 장소를 검색합니다
	ps.keywordSearch(search, placesSearchCB); 
	
	var category = "";
	 
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();

	        for (var i=0; i<data.length; i++) {
	        	customOverlay.setMap(null);
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	            category = data[0].category_name;
	            console.log(category);
	            displayMarker(data[0]);  
	            console.log(data[0]);
	            customOverlay.setMap(map);
	        }       

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}
	
	// 지도에 마커를 표시하는 함수입니다
    function displayMarker(place) {
    	var imageSrc, //= 'resources/img/hotel3.png', // 마커이미지의 주소입니다    
        imageSize = new kakao.maps.Size(33, 37), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    	if(category.indexOf("호텔") >= 0) {
    		imageSrc = 'resources/img/markerImage/hotel.png';
    	} else if(category.indexOf("모텔") >= 0) {
    		imageSrc = 'resources/img/markerImage/motel.png';
    	} else if(category.indexOf("펜션") >= 0) {
    		imageSrc = 'resources/img/markerImage/pension.png';
    	} else if(category.indexOf("리조트") >= 0) {
    		imageSrc = 'resources/img/markerImage/resort.png';
    	} else if(category.indexOf("게스트하우스") >= 0) {
    		imageSrc = 'resources/img/markerImage/guesthouse.png';
    	} else if(category.indexOf("민박") >= 0) {
    		imageSrc = 'resources/img/markerImage/homestay.png';
    	} else if(category.indexOf("캠핑") >= 0) {
    		imageSrc = 'resources/img/markerImage/camping.png';
    	} else if(category.indexOf("유스호스텔") >= 0) {
    		imageSrc = 'resources/img/markerImage/youthhostel.png';
    	} else {
    		imageSrc = 'resources/img/markerImage/etc.png';
    	}
    	   
	    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

        // 마커를 생성하고 지도에 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(place.y, place.x),
            image: markerImage // 마커이미지 설정 
        });

        // 커스텀 오버레이를 생성합니다
    	customOverlay = new kakao.maps.CustomOverlay({
            map: map,
            yAnchor: 1 
        });
    	
    	var customOverlayBackgroundColor;
    	
        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function() {
        	if(marker.T.Yj.indexOf("hotel") >= 0) {
        		customOverlayBackgroundColor = '#EB6868';
	    	} else if(marker.T.Yj.indexOf("motel") >= 0) {
	    		customOverlayBackgroundColor = '#4472C4';
	    	} else if(marker.T.Yj.indexOf("pension") >= 0) {
	    		customOverlayBackgroundColor = '#ED7D31';
	    	} else if(marker.T.Yj.indexOf("resort") >= 0) {
	    		customOverlayBackgroundColor = '#7030A0';
	    	} else if(marker.T.Yj.indexOf("guesthouse") >= 0) {
	    		customOverlayBackgroundColor = '#548235';
	    	} else if(marker.T.Yj.indexOf("homestay") >= 0) {
	    		customOverlayBackgroundColor = '#ADB9CA';
	    	} else if(marker.T.Yj.indexOf("camping") >= 0) {
	    		customOverlayBackgroundColor = '#00B050';
	    	} else if(marker.T.Yj.indexOf("youthhostel") >= 0) {
	    		customOverlayBackgroundColor = '#ffC000';
	    	} else {
	    		customOverlayBackgroundColor = '#828282';
	    	}
        	
        	document.documentElement.style.setProperty("--customOverlayBackgroundColor", customOverlayBackgroundColor);
        	
        	var content = 
        	'<div class="customoverlay">' +
            '  <a href="' +place.place_url +'" target="_blank">' +
            '    <span class="title">' +place.place_name; '</span>' +
            '  </a>' +
            '</div>';

	        // 커스텀 오버레이가 표시될 위치입니다 
	        var position = new kakao.maps.LatLng(place.y, place.x);  

	        // 커스텀 오버레이를 생성합니다
        	customOverlay.setContent(content);
        	customOverlay.setPosition(position);
	        
        });
        
    }
}
