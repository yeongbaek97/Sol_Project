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
/*
 * http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=인증키&areaCode=1&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest
 */
function GuOfficeEvent(areaCode) {

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



/*function getURLParams(url) {
    var result = {};
    url.replace(/[?&]{1}([^=&#]+)=([^&#]*)/g, function(s, k, v) { result[k] = decodeURIComponent(v); });
    return result;
}*/



//url 파라미터 가져오기
/*function getParameterByName(name) {

    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");

    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),

            results = regex.exec(location.search);

    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));

}*/




$(function() {
	//var areaCode = getParameterByName('areaCode');
	var areaCode = document.getElementById("areaCode").value;
	areaEvent();
	GuOfficeEvent(areaCode);
	guEvent();
});
