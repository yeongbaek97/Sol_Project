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

	//로드가 완료 됐을때
	
	$(".item_title").each(function(i,c){
		//console.log(this.value);
		let mark_btn = $(this).children('.mark_btn');
		
		let b_id = $("#check_id").val();

		
		let b_mapx = $(this).children('.check_mapx').val();
		let b_mapy = $(this).children('.check_mapy').val();
		let b_title = $(this).children('.check_title').val();
		let b_contentid = $(this).children('.check_contentid').val();
		let b_image = $(this).children('.check_image').val();




		$.ajax({
			url : "tour.mark",
			data: {
				"b_id" : b_id,
				"b_contentid" : b_contentid
			},
			success : function(data) {

				
					if(data == 1){
						mark_btn.css("color", "green");
					}else{
						mark_btn.css("color", "red");
					}


			
				
			}
			
		});
		
		
		//클릭했을 때 적용
		mark_btn.click(function(e) {

			if(!b_id){
				alert("로그인이 필요합니다");
			}else{
				console.log(b_mapx);
				console.log(b_mapy);
				console.log(b_contentid);
				console.log(b_title);
				$.ajax({
					url : "tour.mark.change",
					data: {
						"b_id" : b_id,
						"b_mapx" : b_mapx,
						"b_mapy" : b_mapy,
						"b_contentid" : b_contentid,
						"b_title" : b_title,
						"b_image" : b_image
					},
					success : function(data) {
						console.log(data);
						if(data == 1){
							mark_btn.css("color", "green");
							//줄겨찾기 추가됨
						}else{
							mark_btn.css("color", "red");
						}

			
					}
					
				});
			}
			e.stopImmediatePropagation();
			
		})
		
		
		
		
		
		
		
		
	});

		 
	

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
