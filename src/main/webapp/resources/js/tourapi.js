function areaEvent() {

	$(".area_select").click(function() {
		var click_id = $(this).attr("id");

		location.href = "tour.list.regional?sigunguCode=0&areaCode=" + click_id;

	});

}

function guEvent() {

	$(document).on('click',".gu_select",function(){
		
		var click_id = $(this).attr("id");
		
		console.log(click_id);
		location.href = "tour.list.regional?sigunguCode=" + click_id;
	});

}


function GuOfficeEvent() {

	var areaCode = document.getElementById("areaCode").value;
	var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=ugrsQN5mBJx2apH2PQGGoKmAb6uyNqMQ4VAQj7RjCnYdrLjq7xeLmrsdyjmj27EjoCoNmhp5uehb2xdSZ7xADg==&areaCode="+areaCode+"&numOfRows=35&MobileOS=ETC&MobileApp=AppTest&_type=json";
	var Gu_office = document.getElementById("Gu_office");
	console.log(areaCode);
	$.getJSON(url, function(data) {
		
		var totalCount = data.response.body.totalCount;
		var new_ul = document.getElementById("gu_ul");
		
		console.log(data);
		for(var i=0;i<totalCount;i++){
			
			
			
			if(totalCount == 1){
				var text = document.createTextNode(data.response.body.items.item.name);
			}else{
				var text = document.createTextNode(data.response.body.items.item[i].name);
			}
			
			
			var new_li = document.createElement("li");
			new_li.appendChild(text);
			new_li.id=data.response.body.items.item[i].code;
			new_li.className="gu_select";
			new_ul.appendChild(new_li);
			
			Gu_office.appendChild(new_ul);
		}
		

	});
}

function bookmark(){
	//처음에 확인
	//var b_mapx = $(this).find("#check_mapx").val();
	
	
	
	
	////////////////////////////////////////
	
	var b_id = $("#check_id").val();
	var b_mapx = $("#check_mapx").val();
	var b_mapy = $("#check_mapy").val();
	var b_contentid = $("#check_contentid").val();
	//var b_title = $("#check_title").val();
	let testArr = [];
	
	$(".item_title .title").each(function(i,c){
		console.log(i);
		let a = $(c).val();

		testArr[i] = a;
		
		
		
	});
	console.log(b_mapx);
		$.ajax({
			url : "tour.mark",
			data: {
				"b_id" : b_id,
				"b_contentid" : b_contentid
			},
			success : function(data) {
				console.log(data);
				if(data == 1){
					$("#mark_btn").css("color", "red");
				}else{
					$("#mark_btn").css("color", "white");
				}
			}
			
		});
		
	//클릭했을 때 적용
	$("#mark_btn").click(function() {
		if(!b_id){
			alert("로그인이 필요합니다");
		}else{
			$.ajax({
				url : "tour.mark.change",
				data: {
					"b_id" : b_id,
					"b_mapx" : b_mapx,
					"b_mapy" : b_mapy,
					"b_contentid" : b_contentid,
					"b_title" : b_title
				},
				success : function(data) {
					console.log(data);
					if(data == 1){
						$("#mark_btn").css("color", "red");
						//줄겨찾기 추가됨
					}else{
						$("#mark_btn").css("color", "white");
					}
				}
				
			});
		}
		
		
	})

}

function sidebar(){
	
		var duration = 300;

		var $side = $('#sidebar');
		var $sidebt = $side.find('button').on('click', function(){
			$side.toggleClass('open');

			if($side.hasClass('open')) {
				$side.stop(true).animate({right:'0px'}, duration);
				$sidebt.find('span').text('지역 필터');
			}else{
				$side.stop(true).animate({right:'-300px'}, duration);
				$sidebt.find('span').text('지역 필터');
			};
		});
	
}




$(function() {
	bookmark();
	areaEvent();
	sidebar();
	GuOfficeEvent();
	guEvent();
	
	
	
});
