<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Create Account</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
		<link href="https://fonts.googleapis.com/css?family=Arvo|Libre+Baskerville|Muli|Noto+Serif|Nunito" rel="stylesheet">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

		<script>
		$('document').ready(function(){
			var inputs = $("form#myForm input, form#myForm text, form#myForm email, form#myForm password");
			var validateInputs = function validateInputs(inputs) {
			  var validForm = true;
			  inputs.each(function(index) {
			    var input = $(this);
			    if (!input.val() || $("input[type='file']").val() == false) {
			      $("#login").attr("disabled", true);
			      validForm = false;
			    }
			  });
			  return validForm;
			}


			inputs.change(function() {
			  if (validateInputs(inputs)) {
			    $("#login").attr("disabled", false);
			  }
			});
		});

			function readURL(input){
				if(input.files && input.files[0]){
					var reader= new FileReader();
	                reader.onload = function (e) {
	                    $('#profile-pic')
	                       .attr('src', e.target.result)
	                    	   .width(150)
	                    	   .height(150);
	                };

	                reader.readAsDataURL(input.files[0]);
	            }
			}
		</script>
	</head>
	<body>
		<header id="showcase">
			<div id="create-account">
				<h1>Create Account</h1>
				<span style="color: red;font-weight:bold">${err!=null? err : ''}</span><br>
				<form id="myForm" name="form" action="create.jsp" method="post">
					<div class="top-row">
						<div class="field-wrap">
							<input class="input" type="text" placeholder="First Name" name = "firstname">
						</div>
						<div class="field-wrap">
							<input class="input" type="text" placeholder="Last Name" name = "lastname">
						</div>
					</div>
					<div class="field-wrap">
							<input class="input" type="text" placeholder="Username" name = "username">
						</div>
					<div class="field-wrap">
						<input class="input" type="email"  placeholder="Email" name = "email">
					</div>
					<div class="field-wrap">
						<input class="input" type="password" placeholder="Password" name = "password">
					</div>
					<div class="field-wrap">
						<input class="upload" type="file" accept="image/gif, image/jpeg, image/png" name="upload" onchange="readURL(this)" enctype="multipart/form-data">
						<img id="profile-pic" src="#" alt="Choose A Profile Image" />
					</div>
					<div class="field-wrap">
					<input class="w3-button w3-red" id="login" type="submit" name="submit" value = "Submit" disabled="disabled">
					<a href="WelcomePage.jsp"><button class="w3-button w3-light-grey" id="button" name="cancel" value="Cancel">Cancel</button></a>
			</div>

		  </form>
		</div> <!-- create-account -->

		</header>

	</body>
</html>
