let totalData; // 총 데이터 수
let dataPerPage = 6; // 한 페이지에 나타낼 글 수
let pageCount = 10; // 페이징에 나타낼 페이지 수
let globalCurrentPage=1; // 현재 페이지
let globalareaCode; // 지역
let globalclassification; // 종류

window.onload = function() {
	
		url = apiUrl();
		console.log(url);
		startXHR(); // function startXHR로 이동
	
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
	var word = document.getElementById("word_input");
	console.log(word);
	console.log(word.value);
	/*
	 * area = document.getElementById("areaCode"); areacode =
	 * area.options[area.selectedIndex].value; globalareaCode =
	 * area.options[area.selectedIndex].value;
	 * 
	 * 
	 * 
	 * clas = document.getElementById("classification"); classification =
	 * clas.options[clas.selectedIndex].value; globalclassification =
	 * clas.options[clas.selectedIndex].value;
	 */

	var Turl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword"; // URL
	Turl += "?ServiceKey="
			+ "ugrsQN5mBJx2apH2PQGGoKmAb6uyNqMQ4VAQj7RjCnYdrLjq7xeLmrsdyjmj27EjoCoNmhp5uehb2xdSZ7xADg==";
	Turl += "&pageNo=1";
	Turl += "&numOfRows=" + 10; // 한페이지결과
	Turl += "&MobileApp=AppTest";
	Turl += "&MobileOS=ETC";
	Turl += "&arrange=P";
	Turl += "&keyword=" + URLEncoder.encode(word, "UTF-8");
	Turl += "&listYN=Y";
	Turl += "&_type=json";




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
	var dataX = xhr.response;

	// json데이터 파싱
	var data = JSON.parse(dataX);
	var body = data.response["body"];
	var item = data.response["body"].items.item;
	var totalCount = body.totalCount;
	totalData = totalCount;
	
	console.log("총갯수 :" + totalCount);
	console.log(item);
	
	// 출력

	
	// 글 목록 표시 호출 (테이블 생성)
	
	 /*if(globalCurrentPage == 1){
		 displayData(1, dataPerPage);
		 // 페이징 표시 호출
		 paging(totalData, dataPerPage, pageCount, 1);
	 }
	 */
	 


	var img;
	var cla;
	var classifi;
	var list_item= "";
	var list_item_39 = "";
	var list_item_12 = "";
	var list_item_15 = "";
	var list_item_14 = "";
	var list_item_28 = "";
	  
	

		for (var i = 0; i < item.length; i++) {
			
			
			
			if (item[i].firstimage != null) {
				img = item[i].firstimage;
			} else {
				// 이미지없음
				img = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACgCAMAAACBpqFQAAAAMFBMVEXu7u6ZmZmurq7Z2dnDw8Pe3t7Ozs6+vr6enp7p6enJycmpqanj4+Ojo6O5ubmzs7NLxFgzAAAB2klEQVR4nO3X3XLCIBCGYZa/BEjM/d9tWYgprXbGHtS25n0OVCLj6De7YTUGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPAvTHZc2WlYRBs+7w77pZS9dz/7xf4iK+NKxui8XPMIm8yXpb5w/VKYpRqDfW0p+qjPGla0TehhTW2Rh7BqNmWVko6wVokprHJTeC+q1UZZelheGtfDsm0Rh7AmXV2ktt6lX5JSH7L4X/wBz7RKXqYezZ6Ku4bV316GsKzUoopi90SNmbWorMTf+vbP5doNp8gXYWW5mCEsX3cne2zS4KRIK68ziK2Ftlo/98IKvYCOsNIstWs3c4Rl3NbuaucQNJWawd3K0vvZHMbTME17NrrJj07RiVY2X7S8eljZuXwNK84So6b1HtZB5ywZ2Xsf/mrSVn+ptuLNaVhzitqn6xiWjq7T1MdUNzrN9NAeNSzXW2rplZV1+jTxQ2XpLmvNPjmYPpfZ80ylu4cm+D572Xp8pr5t1qzO0YOjR8PyfrWLtJHiuo2whsVNGxZZe1pS9H5FWMPicxvWv86ptGtnOgq/L+oBkJ3+/9blmYYsAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4EneAHYKB+xqekqbAAAAAElFTkSuQmCC";
			}

			//cla = item[i].cat3;

			
			
			list_item += "<div class='list_item'>";
			list_item += "<div class='item_img'>";
			list_item += "<img src=" + img
						+" style='width: 100%; height: 180px; object-fit: cover;'>";
			
			list_item += "</div>";
			
			
			
			
			list_item += "<div class='item_title check_attr'>";
			list_item += "<div class='mark_btn'>";
			list_item += "<span>★</span>";
			list_item += "</div>";
			list_item += "<div><img src='resources/img/neogul.png'style='position: absolute; width: 100px; height: 80px; left: -50px; top: -18px'></div>";
			list_item += "<div class='list_title'>"+ item[i].title+ "</div>";
			list_item += "<div class='list_addr'>"+ item[i].addr1+ "</div>";
			list_item += "</div>";
			list_item += "</div>";
			
			
			
			
			
			
			

			

			
			document.getElementById("tour_list_view").innerHTML = list_item;
			

			//document.getElementById("search_list_39").innerHTML = list_item_39;
			/*document.getElementById("search_list_12").innerHTML = list_item_12;
			document.getElementById("search_list_15").innerHTML = list_item_15;
			document.getElementById("search_list_14").innerHTML = list_item_14;
			document.getElementById("search_list_28").innerHTML = list_item_28;*/
		}
		

	
}




function paging(totalData, dataPerPage, pageCount, currentPage) {
	  console.log("currentPage : " + currentPage);

	  totalPage = Math.ceil(totalData / dataPerPage); // 총 페이지 수
	  
	  if(totalPage<pageCount){
	    pageCount=totalPage;
	  }
	  
	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	  let last = pageGroup * pageCount; // 화면에 보여질 마지막 페이지 번호
	  
	  if (last > totalPage) {
	    last = totalPage;
	  }

	  let first = last - (pageCount - 1); // 화면에 보여질 첫번째 페이지 번호
	  let next = last + 1;
	  let prev = first - 1;

	  let pageHtml = "";

	  if (prev > 0) {
	    pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
	  }

	 // 페이징 번호 표시
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


	  // 페이징 번호 클릭 이벤트
	  $("#pagingul li a").click(function () {
	    let $id = $(this).attr("id");
	    selectedPage = $(this).text();

	    if ($id == "next") selectedPage = next;
	    if ($id == "prev") selectedPage = prev;
	    
	    // 전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage = selectedPage;
	    // 페이징 표시 재호출
	    paging(totalData, dataPerPage, pageCount, selectedPage);
	   
	    // 글 목록 표시 재호출
	    url = displayData(selectedPage, dataPerPage);
		startXHR();
	    
	  });
	}







// 현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
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





/*
 * $("#dataPerPage").change(function () { dataPerPage = $("#dataPerPage").val();
 * //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 paging(totalData,
 * dataPerPage, pageCount, globalCurrentPage); displayData(globalCurrentPage,
 * dataPerPage); });
 */

































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
	url = apiUrl();
	startXHR();
	sidebar2();
});
