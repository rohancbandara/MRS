function filter() {
	var filter, table, tr, td, i;
	filter = document.getElementById("patient").value.toUpperCase();
	
	table = document.getElementById("mytable");
	tr = table.getElementsByTagName("tr");
	for (i = 1; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[2];
		if (td) {
			if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}

function filterApp() {
	var filter, table, tr1, td, i;
	filter = document.getElementById("app").value.toUpperCase();
	
	table = document.getElementById("apTable");
	tr = table.getElementsByTagName("tr1");
	for (i = 1; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[0];
		if (td) {
			if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}