<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Create Account</title>
	</head>
	<body>
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
	</body>
</html>