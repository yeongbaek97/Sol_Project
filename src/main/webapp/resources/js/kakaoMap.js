$(function() {
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.5700923166043, 126.98326280022346), //지도의 중심좌표.
		level: 5 //지도의 레벨(확대, 축소 정도)
	};
	//37.5700923166043, 126.98326280022346 종각
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	
	$("button").click(function() {
		let lon = $(this).closest('tr').find('#lon').text();
		let lat = $(this).closest('tr').find('#lat').text();
		let name = $(this).closest('tr').find('#name').text();
		
		console.log(lon);
		console.log(lat);
		console.log(name);
		
		$.ajax({
			url : "https://dapi.kakao.com/v2/local/search/keyword.json",
			data : {query : name, x : lon, y : lat, radius : 200},
			beforeSend : function(req) {
				req.setRequestHeader("Authorization", "KakaoAK 2a5012215f9bc92d87ba9b465ec2e98b")
			},
			success : function(result) {
				console.log(JSON.stringify(result));
				
				//지도 이동
			    var moveLatLon = new kakao.maps.LatLng(lat, lon);
			    map.setCenter(moveLatLon);
			    
			    var position =  new kakao.maps.LatLng(lat, lon);
			    
			    //마커 생성
			    var marker = new kakao.maps.Marker({
		    	  position: position,
		    	  clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		    	});
			    
			    marker.setMap(map);
			    
			    // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
			    var iwContent = '<div style="padding:5px;">' +name +'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			    // 인포윈도우를 생성합니다
			    var infowindow = new kakao.maps.InfoWindow({
			        content : iwContent,
			        removable : iwRemoveable
			    });

			    // 마커에 클릭이벤트를 등록합니다
			    kakao.maps.event.addListener(marker, 'click', function() {
			          // 마커 위에 인포윈도우를 표시합니다
			          infowindow.open(map, marker);  
			    });
			}
		});
	});
});