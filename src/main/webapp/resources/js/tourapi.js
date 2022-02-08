
function tourapia(){

	$(function() {
		$.ajax({
			// 서버로 보낼 주소 입력
			url : "tour.list",
			// type 설정
			type : 'GET',
			// 요청한 데이터 형식
			dataType : 'json',
			// 전송할 데이터
			data : {},
			// 성공적으로 응답을 받으면
			success : function(data) {
				// 전송에 성공하면 실행될 코드
				
				console.log(data);
				
			}
			
		});
		
});

}
