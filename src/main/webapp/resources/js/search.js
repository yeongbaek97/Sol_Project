function search() {
	let word = document.getElementById('word').value;
	
	location.href="tour.list.search?word=" +word;
}