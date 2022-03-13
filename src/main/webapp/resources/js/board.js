function writePost() {
	var form = $('#writePostForm')[0];
	var formData = new FormData(form);
	console.log(form)
	console.log(formData)
	
	$.ajax({
		type: "POST",
		enctype: 'multipart/form-data',
		url : "write.post",
		data: formData,
		processData: false,
        contentType: false,
        cache: false,
		success: function(data) {
			location.href="goto.board"
		}
	})
	
}

function detailPost() {
	var tr = event.currentTarget;
	var b_no = tr.getElementsByTagName('td')[0].childNodes[0].nodeValue;

	document.getElementById("b_no").value = b_no;
	document.getElementById("postForm").submit();
}

function writeComment() {
	var c_no = document.getElementById("c_no").value;
	var b_no = document.getElementById("c_no").value;
	var c_writer = document.getElementById("c_writer").value;
	var c_comment = document.getElementById("c_comment").value;
	
	console.log(c_no);
	console.log(c_comment);
	
	$.ajax({
		type: "GET",
		url : "write.comment",
		data: {
			c_no: c_no,
			b_no: b_no,
			c_writer: c_writer,
			c_comment: c_comment
		},
		success: function(data) {
			window.location.reload();
		}
	})
}

function modifyPost() {
	var b_no = document.getElementById("c_no").value;
	var b_title = document.getElementById("b_title").value;
	var b_content = document.getElementById("b_content").value;
	var b_image = document.getElementById("b_image").value;
	
	if(document.getElementById("modifyButton").innerHTML == "수정 완료") {
		$.ajax({
			type: "GET",
			url : "modify.post",
			data: {
				b_no: b_no,
				b_title: b_title,
				b_content: b_content,
				b_image: b_image
			},
			success: function(data) {
				window.location.reload();
			}
		})
	} else {
		document.getElementById("postTable").getElementsByTagName("tr")[0].getElementsByTagName("td")[1].innerHTML = "<input id='b_title' value=" +b_title +">"											
		document.getElementById("postTable").getElementsByTagName("tr")[2].getElementsByTagName("td")[0].innerHTML = "<input id='b_content' value=" +b_content +">"		

		document.getElementById("modifyButton").innerHTML = "수정 완료"
	}
	
	
		
	
}

function deletePost() {
	var deletePost = confirm('삭제하시겠습니까?');
	var b_no = document.getElementById("c_no").value;
	
	if(deletePost == true) {
		$.ajax({
			type: "GET",
			url : "delete.post",
			data: {
				b_no: b_no
			},
			success: function(data) {
				location.href="goto.board";
			}
		})
	} else {
		return;
	}
	
}

function modifyComment() {
	var button = event.currentTarget;
	
	if(document.getElementById("modifyButton2").innerHTML == "수정 완료") {
		var c_comment = button.parentNode.parentNode.getElementsByTagName("td")[2].firstChild.value
		var c_seq = button.parentNode.parentNode.getElementsByTagName("td")[0].firstChild.value
		console.log(c_comment)
		console.log(c_seq)
		
		$.ajax({
			type: "GET",
			url : "modify.comment",
			data: {
				c_seq: c_seq,
				c_comment: c_comment
			},
			success: function(data) {
				window.location.reload();
			}
		})
	} else {
		var c_comment = button.parentNode.parentNode.getElementsByTagName("td")[2].innerHTML
		var c_seq = button.parentNode.parentNode.getElementsByTagName("td")[0].firstChild.value
		console.log(c_comment)
		console.log(c_seq)
		button.parentNode.parentNode.getElementsByTagName("td")[2].innerHTML = "<input id='c_comment' value=" +c_comment +">"	
		
		document.getElementById("modifyButton2").innerHTML = "수정 완료"
	}
}

function deleteComment() {
	var deletePost = confirm('삭제하시겠습니까?');
	var c_seq = document.getElementById("c_seq").value;
	var b_no = document.getElementById("c_no").value;
	
	if(deletePost == true) {
		$.ajax({
			type: "GET",
			url : "delete.comment",
			data: {
				c_seq: c_seq,
				b_no: b_no
			},
			success: function(data) {
				window.location.reload();
			}
		})
	} else {
		return;
	}
}