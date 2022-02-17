$(function() {
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.5700923166043, 126.98326280022346), //지도의 중심좌표.
		level: 4, //지도의 레벨(확대, 축소 정도)
		disableDoubleClickZoom: true
	};
	//37.5700923166043, 126.98326280022346 종각
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
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
    
    var infowindow = new kakao.maps.InfoWindow({zIndex:1, removable: true});
    
    // 장소 검색 객체를 생성합니다
    var ps2 = new kakao.maps.services.Places(map); 

    // 카테고리로 은행을 검색합니다
    ps2.categorySearch('AD5', placesSearchCB2, {useMapBounds:true}); 
    
    var markers = [];
    var category = "";
    // 커스텀 오버레이를 생성합니다
	customOverlay = new kakao.maps.CustomOverlay({
        map: map,
        yAnchor: 1 
    });
	
	
    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
    function placesSearchCB2 (data, status, pagination) {				    	
        if (status === kakao.maps.services.Status.OK) {
        	
            for (var i=0; i<data.length; i++) {
            	customOverlay.setMap(null);
            	category = data[i].category_name;
                displayMarker(data[i]);    
                console.log(data[i]);
                console.log(category);
                customOverlay.setMap(map);
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
        
        markers.push(marker);
    }
	
	$("#search").keyup(function(e) {
		if(e.keyCode == 13) {
			let search = $(this).val();
			
			let ps = new kakao.maps.services.Places(map); 
			ps.keywordSearch(search, placesSearchCB); 
			
			//기존 마커 삭제
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}   
			
			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
			        newY = data[0].y;
			        newX = data[0].x;
			        
				    // 이동할 위도 경도 위치를 생성합니다 
				    var moveLatLon = new kakao.maps.LatLng(newY, newX);
				    // 지도 중심을 이동 시킵니다
				    map.setCenter(moveLatLon);

				    var infowindow = new kakao.maps.InfoWindow({zIndex:1, removable: true});
				    
				    // 장소 검색 객체를 생성합니다
				    var ps2 = new kakao.maps.services.Places(map); 

				    // 카테고리로 은행을 검색합니다
				    ps2.categorySearch('AD5', placesSearchCB2, {useMapBounds:true}); 
				    
				    var category = "";
				    
				    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
				    function placesSearchCB2 (data, status, pagination) {				    	
				        if (status === kakao.maps.services.Status.OK) {
				        	
				            for (var i=0; i<data.length; i++) {
				            	customOverlay.setMap(null);
				            	category = data[i].category_name;
				                displayMarker(data[i]);    
				                console.log(data[i]);
				                console.log(category);
				                customOverlay.setMap(map);
				            }       
				            
				        }
				    }
				 
				    // 지도에 마커를 표시하는 함수입니다
				    function displayMarker(place) {
				    	var imageSrc, //= 'resources/img/hotel3.png', // 마커이미지의 주소입니다    
				        imageSize = new kakao.maps.Size(33, 37), // 마커이미지의 크기입니다
				        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				    	console.log(category.indexOf("유스호스텔"));
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
				        
				        markers.push(marker);
				    }
			    } 
			}
			
		}
	});
	
	
});