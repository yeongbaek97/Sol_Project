<<<<<<< HEAD
function searchEnter(e) {

	var value = document.getElementById('search_input').value;
	if (e.keyCode == 13) {
		location.href="tour.list.search?keyword="+value;
	}
	;

=======
function searchEnter(){
	let word = document.getElementById('word').value;
	
	location.href="tour.list.search?word=" +word;
>>>>>>> fd3975503d89891ca997fbb401880048e6fbd571
};

