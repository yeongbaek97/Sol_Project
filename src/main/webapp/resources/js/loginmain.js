$(function() {
	"use strict";

	/*
	 * ================================================================== [
	 * Validate ]
	 */
	$('.validate-form').on('submit', function() {

		var input = $('.validate-input .input100');
		var check = true;

		for (var i = 0; i < input.length; i++) {
			console.log(input[i]);
			if (validate(input[i]) == false) {
				showValidate(input[i]);
				check = false;
			}
		}

		return check;
	});

	$('.validate-form .input100').each(function() {
		$(this).focus(function() {
			hideValidate(this);
		});
	});

	function validate(input) {
		if ($(input).val().trim() == '') {
			return false;
		}
	}

	function showValidate(input) {
		var thisAlert = $(input).parent();

		$(thisAlert).addClass('alert-validate');
	}

	function hideValidate(input) {
		var thisAlert = $(input).parent();

		$(thisAlert).removeClass('alert-validate');
	}

});

function login() {
	var m_id = document.getElementById("m_id").value;
	var m_pw = document.getElementById("m_pw").value;
	
	$.ajax({
		type: "POST",
		url : "login",
		data: {
			m_id: m_id,
			m_pw: m_pw
		},
		success: function(data) {
			location.href="goto.Index"
		}
	})
}

function logout() {
	$.ajax({
		type: "GET",
		url : "logout",
		data: {
		},
		success: function(data) {
			location.href="goto.Index"
		}
	})

}