<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String first = request.getParameter("firstName");
	String last = request.getParameter("lastName");
	String email = request.getParameter("email");

	String username = request.getParameter("username");
	String password = request.getParameter("password");
/* 	Boolean valid = DatabaseFunction.authenticate(username, password);
 	Boolean valid =  DatabaseFunction.createAccount(first, last, email,  username,  password);
 	*/
 	User u = DatabaseFunction.getUserFromName("kucheria");
 	
 	System.out.println(u.getUsername() + " " + u.getFirstName() + " " + u.getLastName());
 	
/* 	if(valid == false){
		System.out.println("Account already exists with current username/email");
	}
	else
		System.out.println("Success"); */
 
%>

</body>
</html>