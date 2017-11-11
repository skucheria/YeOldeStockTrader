<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div id="login" style="display: block;">
			<h1> Sign In </h1>
			<span style="color: red;font-weight:bold">${err!=null? err : ''}</span><br>
			<form action="authenticate.jsp" method="GET" >
				<div class="field-wrap"> 
					Username<input type = "text" name = 'username' /><br>
				</div>
				<div class="field-wrap"> 
					Password<input type = "password" name = "password"/><br>
				</div>
				<div class="field-wrap"> 
					<input type = "submit" name = "submit" value = "Submit">
				</div>
			</form>		
		</div>
	</body>
</html>