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
	var b_id = $("#check_id").val();
	var b_mapx = $("#check_mapx").val();
	var b_mapy = $("#check_mapy").val();
	var b_contentid = $("#check_contentid").val();
	var b_title = $("#check_title").val();
		$.ajax({
			url : "tour.mark",
			data: {
				"b_id" : b_id,
				"b_contentid" : b_contentid
			},
			success : function(data) {
				console.log(data);
				if(data == 1){
					$("#mark_btn").css("background-color", "red");
				}else{
					$("#mark_btn").css("background-color", "white");
				}
			}
			
		});
		
	//클릭했을 때 적용
	$("#mark_btn").click(function() {
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
					$("#mark_btn").css("background-color", "red");
				}else{
					$("#mark_btn").css("background-color", "white");
				}
			}
			
		});
	})

}




$(function() {
	bookmark();
	areaEvent();
	GuOfficeEvent();
	guEvent();
	
	
});
