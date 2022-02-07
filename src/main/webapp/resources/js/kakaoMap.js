$(function() {
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.5700923166043, 126.98326280022346), //지도의 중심좌표.
		level: 5 //지도의 레벨(확대, 축소 정도)
	};
	//37.5700923166043, 126.98326280022346 종각
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	map.setZoomable(false);
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

	let newX = getParameterByName("x");
	let newY = getParameterByName("y");
	
	// 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(newY, newX);
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
    
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});
    
    // 장소 검색 객체를 생성합니다
    var ps2 = new kakao.maps.services.Places(map); 

    // 카테고리로 은행을 검색합니다
    ps2.categorySearch('AD5', placesSearchCB2, {useMapBounds:true}); 
    
    var markers = [];
    
    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
    function placesSearchCB2 (data, status, pagination) {				    	
        if (status === kakao.maps.services.Status.OK) {
        	
            for (var i=0; i<data.length; i++) {
                displayMarker(data[i]);   
                console.log(data[i]);
            }    
        }
    }
    
    $("#narrow").click(function(e) {
		var level = map.getLevel(); 
		if(level <= 4) {
			map.setLevel(4);
		} else {
			map.setLevel(level - 1);
		}
	    ps2.categorySearch('AD5', placesSearchCB2, {useMapBounds:true}); 
	});
    
    $("#wide").click(function(e) {
		var level = map.getLevel(); 
		if(level >= 8) {
			map.setLevel(8);
		} else {
			map.setLevel(level + 1)
		}
		
	    ps2.categorySearch('AD5', placesSearchCB2, {useMapBounds:true}); 
	});
    
    // 지도에 마커를 표시하는 함수입니다
    function displayMarker(place) {
        // 마커를 생성하고 지도에 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(place.y, place.x) 
        });

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function() {
            // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
            infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
            infowindow.open(map, marker);
        });
        
        markers.push(marker);
    }
	
	$("#search").keyup(function(e) {
		if(e.keyCode == 13) {
			let search = $(this).val();
			
			//기존 마커 삭제
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}   
			 
			let ps = new kakao.maps.services.Places(map); 
			ps.keywordSearch(search, placesSearchCB); 
			
			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
			        newY = data[0].y;
			        newX = data[0].x;
			        
				    // 이동할 위도 경도 위치를 생성합니다 
				    var moveLatLon = new kakao.maps.LatLng(newY, newX);
				    // 지도 중심을 이동 시킵니다
				    map.setCenter(moveLatLon);
				    
				    var infowindow = new kakao.maps.InfoWindow({zIndex:1});
				    
				    // 장소 검색 객체를 생성합니다
				    var ps2 = new kakao.maps.services.Places(map); 

				    // 카테고리로 은행을 검색합니다
				    ps2.categorySearch('AD5', placesSearchCB2, {useMapBounds:true}); 
				    
				    
				    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
				    function placesSearchCB2 (data, status, pagination) {				    	
				        if (status === kakao.maps.services.Status.OK) {
				        	
				            for (var i=0; i<data.length; i++) {
				                displayMarker(data[i]);    
				                console.log(data[i]);
				            }       
				        }
				    }
				    
				   
				    
				    // 지도에 마커를 표시하는 함수입니다
				    function displayMarker(place) {
				        // 마커를 생성하고 지도에 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: new kakao.maps.LatLng(place.y, place.x) 
				        });

				        // 마커에 클릭이벤트를 등록합니다
				        kakao.maps.event.addListener(marker, 'click', function() {
				            // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				            infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
				            infowindow.open(map, marker);
				        });
				        
				        markers.push(marker);
				    }
			    } 
			}
			
		}
	});
	
	
});