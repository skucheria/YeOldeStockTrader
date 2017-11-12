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
	</head>
	<body>
		<header id="showcase">
			<div id="create-account">
				<h1>Create Account</h1>
				<span style="color: red;font-weight:bold">${err!=null? err : ''}</span><br>
				<form name="form" action="create.jsp" method="post" onsubmit="return validate()">
					<div class="top-row"> 
						<div class="field-wrap"> 
							<input class="input" type="text" placeholder="First Name" name = "firstname">
							<span id=#ferror></span>
						</div>
						<div class="field-wrap"> 
							<input class="input" type="text" placeholder="Last Name" name = "lastname">
							<span id=#lerror></span>
						</div>
					</div>
					<div class="field-wrap"> 
							<input class="input" type="text" placeholder="Username" name = "username">
							<span id=#uerror></span>
						</div>
					<div class="field-wrap"> 
						<input class="input" type="email"  placeholder="Email" name = "email">
						<span id=#eerror></span>
					</div>
					<div class="field-wrap"> 
						<input class="input" type="password" placeholder="Password" name = "password">
						<span id=#perror></span>
					</div>
					<div class="field-wrap"> 
					<input class="w3-button w3-red" type="submit" name="submit" value = "Submit">
					<a href="WelcomePage.jsp"><button class="w3-button w3-light-grey" id="button" name="cancel" value="Cancel">Cancel</button></a>
			</div>
				
		  </form>
		</div> <!-- create-account -->
		
		</header>

	</body>
</html>

	<%-- <body>
		<div id="create-account">
			<h1>Create Account</h1>
			<span style="color: red;font-weight:bold">${err!=null? err : ''}</span><br>
			<form action="create.jsp" method="post">
				<div class="top-row"> 
					<div class="field-wrap"> 
						<label>First Name
						<span class="required">*</span>
						</label>
						<input type="text" name = "firstName">
					</div>
					<div class="field-wrap"> 
						<label>Last Name
						<span class="required">*</span>
						</label>
						<input type="text" name = "lastName">
					</div>
				</div>
				<div class="field-wrap"> 
						<label>Username
						<span class="required">*</span>
						</label>
						<input type="text" name = "username">
					</div>
				<div class="field-wrap"> 
					<label>Email Address
					<span class="required">*</span>
					</label>
					<input type="email" name = "email">
				</div>
				<div class="field-wrap"> 
					<label>Set a Password
					<span class="required">*</span>
					</label>
					<input type="password" name = "password">
				</div>
				<div class="field-wrap"> 
					<input type = "submit" name = "submit" value = "Submit">
				</div>
				
		  </form>
		</div> <!-- create-account -->
	</body> --%>