$("#dropdown").change(function (event) {
	var categoria = "."+$(this).find(':selected').text();

	if(categoria == ".Todas"){
		$(".panellivro").removeClass("oculto");
	} else {
		$(".panellivro").addClass("oculto");
		$(categoria).removeClass("oculto");
	}
});