<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password"); 
	Boolean valid = DatabaseFunction.authenticate(username, password);
	if(valid){
		System.out.println("valid");
		User u = DatabaseFunction.getUserFromName(username);
		request.setAttribute("currentUser", u);
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/GeneralFeed.jsp");
		dispatch.forward(request, response);
		//forward to main feed page
	}
	else{
		System.out.println("not valid");
		request.setAttribute("err", "Invalid username and password combination.");
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/SignIn.jsp");
		dispatch.forward(request, response);
	} 
%>

</body>
</html>