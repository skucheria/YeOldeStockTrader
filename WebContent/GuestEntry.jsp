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
	request.setAttribute("currentUser", null);
	request.getSession().setMaxInactiveInterval(100000);
	RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/GeneralFeed.jsp");
	dispatch.forward(request, response); 

%>

</body>
</html>