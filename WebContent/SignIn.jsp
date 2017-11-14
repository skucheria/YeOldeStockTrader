<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sign In</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
		<link href="https://fonts.googleapis.com/css?family=Arvo|Libre+Baskerville|Muli|Noto+Serif|Nunito" rel="stylesheet">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<script>
			$('document').ready(function(){
				var inputs = $("form#myForm input, form#myForm text, form#myForm password");
				var validateInputs = function validateInputs(inputs) {
				  var validForm = true;
				  inputs.each(function(index) {
				    var input = $(this);
				    if (!input.val()) {
				      $("#button").attr("disabled", true);
				      validForm = false;
				    }
				  });
				  return validForm;
				}
				
				inputs.change(function() {
				  if (validateInputs(inputs)) {
				    $("#button").attr("disabled", false);
				  }
				});
			});
	
		</script>
	</head>
	<body>
		<header id = "showcase">
			<div id="login"  style="display: block;">
				<h1> Sign In </h1>
				<span style="color: red;font-weight:bold">${err!=null? err : ''}</span><br>
				<form id="myForm" action = "authenticate.jsp" method=POST >
					<div class="field-wrap"> 
						<input class="input" placeholder="Username" type = "text" name = "username" /><br>
					</div>
					<div class="field-wrap"> 
						<input class="input" placeholder="Password" type = "password" name = "password"/><br>
					</div>
					<div class="field-wrap"> 
						<input id="button" class="w3-button w3-red cancel" type = "submit" name = "submit" value = "Submit" disabled="disabled">
						<button class="w3-button w3-light-grey" id="button" name="cancel" value="Cancel">Cancel</button>
					</div>
				</form>		
			</div>
		</header>
	</body>
</html> 