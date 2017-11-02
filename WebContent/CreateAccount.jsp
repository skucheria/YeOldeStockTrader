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
			<form action="" method="post">
				<div class="top-row"> 
					<div class="field-wrap"> 
						<label>First Name
						<span class="required">*</span>
						</label>
						<input type="text">
					</div>
					<div class="field-wrap"> 
						<label>Last Name
						<span class="required">*</span>
						</label>
						<input type="text">
					</div>
				</div>
				<div class="field-wrap"> 
					<label>Email Address
					<span class="required">*</span>
					</label>
					<input type="email">
				</div>
				<div class="field-wrap"> 
					<label>Set a Password
					<span class="required">*</span>
					</label>
					<input type="password">
				</div>
		  </form>
		</div> <!-- create-account -->
	</body>
</html>