function modify() {
	var currentInfo = document.getElementById("currentInfo");
	var modifyInfo = document.getElementById("modifyInfo");
	
	currentInfo.style.display = "none";
	modifyInfo.style.display = "inline";
}

function modifyCancel() {
	var currentInfo = document.getElementById("currentInfo");
	var modifyInfo = document.getElementById("modifyInfo");
	
	currentInfo.style.display = "inline";
	modifyInfo.style.display = "none";
}

function modifyInfo() {
	var m_pw = document.getElementById("m_pw").value;
	var m_name = document.getElementById("m_name").value;
	var m_number = document.getElementById("m_number").value;
	var m_email = document.getElementById("m_email").value;
	
	$.ajax({
		type: "GET",
		url : "modifyInfo",
		data: {
			m_pw: m_pw,
			m_name: m_name,
			m_number: m_number,
			m_email: m_email
		},
		success: function(data) {
			window.location.reload();
		}
	})
}

function deleteBookmark() {
	var b_id = document.getElementById("b_id").value;
	var b_contentid = document.getElementById("b_contentid").value;
	
	$.ajax({
		type: "GET",
		url : "deleteBookmark",
		data: {
			b_id: b_id,
			b_contentid: b_contentid
		},
		success: function(data) {
			window.location.reload();
		}
	})
}