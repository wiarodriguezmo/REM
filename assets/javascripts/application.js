// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}


$(function () {
	$('#prb').click();
});
function todo() {
	$('.pb').hide();
	$('.eb').hide();
	$('.rb').hide();
	$('.rpb').show();
	$('.reb').show();
	$('.rrb').show();
}
function problema() {
	$('.rpb').show();
	$('.reb').hide();
	$('.rrb').hide();
	$('.pb').show();
	$('.eb').hide();
	$('.rb').hide();
}
function examen() {
	$('.reb').show();
	$('.rpb').hide();
	$('.rrb').hide();
	$('.eb').show();
	$('.pb').hide();
	$('.rb').hide();
}
function recurso() {
	$('.rrb').show();
	$('.rpb').hide();
	$('.reb').hide();
	$('.rb').show();
	$('.pb').hide();
	$('.eb').hide();
}

//-----------------------------------Filtros de opción examen--------------------------------------------------
$(document).ready(function () {  
	$("#sel1").change(function () {
		var textoSem = this.options[this.selectedIndex].value;
		var texto = $("#filtroEx").val();
		$(".ide").each(function () {
			console.log(textoSem, textoPar,$(this))
			if ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false) {

				var textoPar = $("#sel2").val();
				if ((textoSem == "semestre") && (textoPar == "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.container-box div').show();
					$('.rpb').hide();
					$('.rrb').hide();
					$(this).fadeOut();
				}
				if ((textoSem != "semestre") && (textoPar == "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.rpb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-semestre="' + textoSem + '"]').show();
					$(this).fadeOut();
				}
				if ((textoSem == "semestre") && (textoPar != "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.rpb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-parcial="' + textoPar + '"]').show();
					$(this).fadeOut();
				}
				if ((textoSem != "semestre") && (textoPar != "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.rpb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-semestre="' + textoSem + '" ][ data-parcial="' + textoPar + '"]').show();
					$(this).fadeOut();
				}
			} else {
				var textoPar = $("#sel2").val();

				if ((textoSem == "semestre") && (textoPar == "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.container-box div').show();
					$('.rpb').hide();
					$('.rrb').hide();
				}
				if ((textoSem != "semestre") && (textoPar == "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {

					$('.rpb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-semestre="' + textoSem + '"]').show();

				}
				if ((textoSem == "semestre") && (textoPar != "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.rpb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-parcial="' + textoPar + '"]').show();
				}
				if ((textoSem != "semestre") && (textoPar != "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.rpb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-semestre="' + textoSem + '" ][ data-parcial="' + textoPar + '"]').show();
				}

			}
		});
		$('.container-box div div').show();
	});
});

$(document).ready(function () {
	$("#sel2").change(function () {
		var textoPar = this.options[this.selectedIndex].value;
		var texto = $("#filtroEx").val();
		$(".ide").each(function () {
			if ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false) {
				var textoSem = $("#sel1").val();
				if ((textoSem == "semestre") && (textoPar == "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.container-box div').show();
					$('.rpb').hide();
					$('.rrb').hide();
					$(this).fadeOut();
				}
				if ((textoSem != "semestre") && (textoPar == "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.rpb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-semestre="' + textoSem + '"]').show();
					$(this).fadeOut();
				}
				if ((textoSem == "semestre") && (textoPar != "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.rpb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-parcial="' + textoPar + '"]').show();
					$(this).fadeOut();
				}
				if ((textoSem != "semestre") && (textoPar != "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.rpb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-semestre="' + textoSem + '" ][ data-parcial="' + textoPar + '"]').show();
					$(this).fadeOut();
				}
			} else {
				var textoSem = $("#sel1").val();
				if ((textoSem == "semestre") && (textoPar == "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.container-box div').show();
					$('.rpb').hide();
					$('.rrb').hide();
				}
				if ((textoSem != "semestre") && (textoPar == "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.rpb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-semestre="' + textoSem + '"]').show();
				}
				if ((textoSem == "semestre") && (textoPar != "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.rpb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-parcial="' + textoPar + '"]').show();
				}
				if ((textoSem != "semestre") && (textoPar != "parcial") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.rpb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-semestre="' + textoSem + '" ][ data-parcial="' + textoPar + '"]').show();
				}
			}
		});
		$('.container-box div div').show();
	});
});


$(document).ready(function () {
	$(function () {
		$("#filtroEx").keyup(function () {
			var texto = $(this).val();
			$(".ide").each(function () {
				if ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false) {
					$(this).fadeOut();
				} else {
					var textoSem = $("#sel1").val();
					var textoPar = $("#sel2").val();
					if ((textoSem == "semestre") && (textoPar == "parcial")) {
						$('.container-box div').show();
						$('.rpb').hide();
						$('.rrb').hide();
					}
					if ((textoSem != "semestre") && (textoPar == "parcial")) {
						$('.rpb').hide();
						$('.rrb').hide();
						$('.container-box div').hide();
						$('.container-box div[data-semestre="' + textoSem + '"]').show();
					}
					if ((textoSem == "semestre") && (textoPar != "parcial")) {
						$('.rpb').hide();
						$('.rrb').hide();
						$('.container-box div').hide();
						$('.container-box div[data-parcial="' + textoPar + '"]').show();
					}
					if ((textoSem != "semestre") && (textoPar != "parcial")) {
						$('.rpb').hide();
						$('.rrb').hide();
						$('.container-box div').hide();
						$('.container-box div[data-semestre="' + textoSem + '" ][ data-parcial="' + textoPar + '"]').show();
					}
				}
			});
			$('.container-box div div').show();
		});
	});
});  
// --------------------------------------Fin filtros de opción examen--------------------------------------------

//-----------------------------------------Filtros de opción problema--------------------------------------------
$(document).ready(function () { 
	$(function () {
		$("#filtroPb").keyup(function () {
			var textoP = $(this).val();
			$(".idp").each(function () {
				if ($(this).text().toUpperCase().includes(textoP.toUpperCase()) == false) {
					$(this).fadeOut();
				} else {
					var textoDif = $("#sel0").val();
					var textoCur = $("#selCursoP").val();
					if ((textoDif == "dificultad") && (textoCur == "curso")) {
						$('.container-box div').show();
						$('.reb').hide();
						$('.rrb').hide();
					}
					if ((textoDif != "dificultad") && (textoCur == "curso")) {
						$('.reb').hide();
						$('.rrb').hide();
						$('.container-box div').hide();
						$('.container-box div[data-dificultad="' + textoDif + '"]').show();
					}
					if ((textoDif == "dificultad") && (textoCur != "curso")) {
						$('.reb').hide();
						$('.rrb').hide();
						$('.container-box div').hide();
						$('.container-box div[data-cursoP="' + textoCur + '"]').show();
					}
					if ((textoDif != "dificultad") && (textoCur != "curso")) {
						$('.reb').hide();
						$('.rrb').hide();
						$('.container-box div').hide();
						$('.container-box div[data-dificultad="' + textoDif + '"][data-cursoP="' + textoCur + '"]').show();
					}
				}
			});
			$('.container-box div div').show();
		});
	});
});

$(document).ready(function () {
	$("#sel0").change(function () {
		var textoDif = this.options[this.selectedIndex].value;
		var texto = $("#filtroPb").val();
		$(".idp").each(function () {
			if ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false) {
				var textoCur = $("#selCursoP").val();
				if ((textoDif == "dificultad") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.container-box div').show();
					$('.reb').hide();
					$('.rrb').hide();
					$(this).fadeOut();
				}
				if ((textoDif != "dificultad") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.reb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-dificultad="' + textoDif + '"]').show();
					$(this).fadeOut();
				}
				if ((textoDif == "dificultad") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.reb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-cursoP="' + textoCur + '"]').show();
					$(this).fadeOut();
				}
				if ((textoDif != "dificultad") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.reb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-dificultad="' + textoDif + '"][data-cursoP="' + textoCur + '"]').show();
					$(this).fadeOut();
				}
			} else {
				var textoCur = $("#selCursoP").val();

				if ((textoDif == "dificultad") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.container-box div').show();
					$('.reb').hide();
					$('.rrb').hide();
				}
				if ((textoDif != "dificultad") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {

					$('.reb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-dificultad="' + textoDif + '"]').show();
				}
				if ((textoDif == "dificultad") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.reb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-cursoP="' + textoCur + '"]').show();
				}
				if ((textoDif != "dificultad") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.reb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-dificultad="' + textoDif + '"][data-cursoP="' + textoCur + '"]').show();
				}
			}
		});
		$('.container-box div div').show();
	});
});
 
$(document).ready(function () {
	$("#selCursoP").change(function () {
		var textoCur = this.options[this.selectedIndex].value;
		var texto = $("#filtroPb").val();
		$(".idp").each(function () {
			if ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false) {

				var textoDif = $("#sel0").val();
				if ((textoDif == "dificultad") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.container-box div').show();
					$('.reb').hide();
					$('.rrb').hide();
					$(this).fadeOut();
				}
				if ((textoDif != "dificultad") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.reb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-dificultad="' + textoDif + '"]').show();
					$(this).fadeOut();
				}
				if ((textoDif == "dificultad") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.reb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-cursoP="' + textoCur + '"]').show();
					$(this).fadeOut();
				}
				if ((textoDif != "dificultad") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.reb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-dificultad="' + textoDif + '"][data-cursoP="' + textoCur + '"]').show();
					$(this).fadeOut();
				}
			} else {
				var textoDif = $("#sel0").val();

				if ((textoDif == "dificultad") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.container-box div').show();
					$('.reb').hide();
					$('.rrb').hide();
				}
				if ((textoDif != "dificultad") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {

					$('.reb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-dificultad="' + textoDif + '"]').show();

				}
				if ((textoDif == "dificultad") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.reb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-cursoP="' + textoCur + '"]').show();
				}
				if ((textoDif != "dificultad") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.reb').hide();
					$('.rrb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-dificultad="' + textoDif + '"][data-cursoP="' + textoCur + '"]').show();
				}

			}
		});
		$('.container-box div div').show();
	});
});  
//-------------------------------------Fin filtros de opción problema------------------------------------

//---------------------------------------Filtros de opción recurso---------------------------------------
$(document).ready(function () { 
	$(function () {
		$("#filtroRe").keyup(function () {
			var textoR = $(this).val();
			$(".idr").each(function () {
				if ($(this).text().toUpperCase().includes(textoR.toUpperCase()) == false) {
					$(this).fadeOut();
				} else {
					var textoFor = $("#sel3").val();
					var textoCur = $("#selCursoR").val();
					if ((textoFor == "Formato") && (textoCur == "curso")) {
						$('.container-box div').show();
						$('.reb').hide();
						$('.rpb').hide();
					}
					if ((textoFor != "Formato") && (textoCur == "curso")) {
						$('.reb').hide();
						$('.rpb').hide();
						$('.container-box div').hide();
						$('.container-box div[data-formato="' + textoFor + '"]').show();
					}
					if ((textoFor == "Formato") && (textoCur != "curso")) {
						$('.reb').hide();
						$('.rpb').hide();
						$('.container-box div').hide();
						$('.container-box div[data-cursoR="' + textoCur + '"]').show();
					}
					if ((textoFor != "Formato") && (textoCur != "curso")) {
						$('.reb').hide();
						$('.rpb').hide();
						$('.container-box div').hide();
						$('.container-box div[data-formato="' + textoFor + '"][data-cursoR="' + textoCur + '"]').show();
					}
				}
			});
			$('.container-box div div').show();
		});
	});
}); 

$(document).ready(function () {
	$("#sel3").change(function () {
		var textoFor = this.options[this.selectedIndex].value;
		var texto = $("#filtroRe").val();
		$(".idr").each(function () {
			if ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false) {
				var textoCur = $("#selCursoR").val();
				if ((textoFor == "Formato") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.container-box div').show();
					$('.reb').hide();
					$('.rpb').hide();
					$(this).fadeOut();
				}
				if ((textoFor != "Formato") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.reb').hide();
					$('.rpb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-formato="' + textoFor + '"]').show();
					$(this).fadeOut();
				}
				if ((textoFor == "Formato") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.reb').hide();
					$('.rpb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-cursoR="' + textoCur + '"]').show();
					$(this).fadeOut();
				}
				if ((textoFor != "Formato") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.reb').hide();
					$('.rpb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-formato="' + textoFor + '"][data-cursoR="' + textoCur + '"]').show();
					$(this).fadeOut();
				}
			} else {
				var textoCur = $("#selCursoR").val();

				if ((textoFor == "Formato") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.container-box div').show();
					$('.reb').hide();
					$('.rpb').hide();
				}
				if ((textoFor != "Formato") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {

					$('.reb').hide();
					$('.rpb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-formato="' + textoFor + '"]').show();
				}
				if ((textoFor == "Formato") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.reb').hide();
					$('.rpb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-cursoR="' + textoCur + '"]').show();
				}
				if ((textoFor != "Formato") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.reb').hide();
					$('.rpb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-formato="' + textoFor + '"][data-cursoR="' + textoCur + '"]').show();
				}
			}
		});
		$('.container-box div div').show();
	});
});
 
$(document).ready(function () {
	$("#selCursoR").change(function () {
		var textoCur = this.options[this.selectedIndex].value;
		var texto = $("#filtroRe").val();
		$(".idr").each(function () {
			if ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false) {

				var textoFor = $("#sel3").val();
				if ((textoFor == "Formato") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.container-box div').show();
					$('.reb').hide();
					$('.rpb').hide();
					$(this).fadeOut();
				}
				if ((textoFor != "Formato") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.reb').hide();
					$('.rpb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-formato="' + textoFor + '"]').show();
					$(this).fadeOut();
				}
				if ((textoFor == "Formato") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.reb').hide();
					$('.rpb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-cursoR="' + textoCur + '"]').show();
					$(this).fadeOut();
				}
				if ((textoFor != "Formato") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == false)) {
					$('.reb').hide();
					$('.rpb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-formato="' + textoFor + '"][data-cursoR="' + textoCur + '"]').show();
					$(this).fadeOut();
				}
			} else {
				var textoFor = $("#sel3").val();

				if ((textoFor == "Formato") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.container-box div').show();
					$('.reb').hide();
					$('.rpb').hide();
				}
				if ((textoFor != "Formato") && (textoCur == "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {

					$('.reb').hide();
					$('.rpb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-formato="' + textoFor + '"]').show();

				}
				if ((textoFor == "Formato") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.reb').hide();
					$('.rpb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-cursoR="' + textoCur + '"]').show();
				}
				if ((textoFor != "Formato") && (textoCur != "curso") && ($(this).text().toUpperCase().includes(texto.toUpperCase()) == true)) {
					$('.reb').hide();
					$('.rpb').hide();
					$('.container-box div').hide();
					$('.container-box div[data-formato="' + textoFor + '"][data-cursoR="' + textoCur + '"]').show();
				}

			}
		});
		$('.container-box div div').show();
	});
}); 
//------------------------------------------Fin filtros de opción recurso--------------------------------------------



$(function () {
	$('#trouble').click();
});
$(function () {
	$('#exam').click();
});
$(function () {
	$('#resource').click();
});
function all() {
	$('.pro').hide();
	$('.exm').hide();
	$('.rec').hide();
	//$('.prob').show();
	//$('.exmb').show();
	//$('.recb').show();
}
function ftrouble() {
	//$('.prob').show();
	//$('.exmb').hide();
	//$('.recb').hide();
	$('.pro').show();
	$('.exm').hide();
	$('.rec').hide();
}
function fexam() {
	//$('.exmb').show();
	//$('.prob').hide();
	//$('.recb').hide();
	$('.exm').show();
	$('.pro').hide();
	$('.rec').hide();
}
function fresource() {
	//$('.recb').show();
	//$('.prob').hide();
	//$('.exmb').hide();
	$('.rec').show();
	$('.pro').hide();
	$('.exm').hide();
}

// Acciones en caja de búsqueda básica y avanzada
function changeSearchBasic() {
	let state = $('#icon-advanced').attr('aria-expanded');
	if(state=="true"){
		$('.form-search-basic').css('opacity', '1');
		$('.form-search-basic input').prop("disabled", false);
		$('#icon-advanced').css("transform","rotate(0deg)")
	} else {
		$('.form-search-basic').css('opacity', '0.3');
		$('.form-search-basic input').attr('disabled', 'disabled');
		$('#icon-advanced').css("transform","rotate(180deg)")
	}
}
$( document ).ready(function() {
	$("#funnel").click(function() {
		$('#myModal').modal();
	});

	$("#lauch-modal-credits").click(function() {
		$('#modal-creditos').modal();
	});
  });