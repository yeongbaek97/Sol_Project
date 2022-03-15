
function searchEnter(e) {

	var word = document.getElementById('word').value;
	if (e.keyCode == 13) {
		location.href="tour.list.search?word="+word;
	};
}

function searchEnter(){
	let word = document.getElementById('word').value;
	
	location.href="tour.list.search?word=" +word;


}

