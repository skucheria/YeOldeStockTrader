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

	String first = request.getParameter("firstname");
	String last = request.getParameter("lastname");
	String email = request.getParameter("email");
	String username = request.getParameter("username");
	String password = request.getParameter("password"); 
	String picLink = request.getParameter("picture");
	Boolean valid =  DatabaseFunction.createAccount(first, last, email,  username,  password, picLink);
	//some varialbe = request.getParameter("upload");
	if(valid){
		User u = DatabaseFunction.getUserFromName(username);
	
		request.getSession().setAttribute("currentUser", u);
		request.getSession().setMaxInactiveInterval(100000);
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/GeneralFeed.jsp");
		User currentUser = (User) request.getSession().getAttribute("currentUser");
		dispatch.forward(request, response); 
		//forward to main feed page
	}
	else{
		request.setAttribute("err", "Username/email is already being used");
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/CreateAccount.jsp");
		dispatch.forward(request, response);
	} 
%>
</body>
</html>