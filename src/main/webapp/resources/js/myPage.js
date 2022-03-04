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