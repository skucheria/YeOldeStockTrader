<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList" import = "java.time.*" import = "java.time.format.DateTimeFormatter"
    import = "java.text.*" import = "java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");

	String author = currentUser.getUsername();
	String postID = request.getParameter("param");
	int post = Integer.valueOf(postID);
	String answer = request.getParameter("response");
	
	DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	Calendar cal = Calendar.getInstance();
	String day = dateFormat.format(cal.getTime()).substring(0, dateFormat.format(cal.getTime()).indexOf(" "));
	String time = dateFormat.format(cal.getTime()).substring(dateFormat.format(cal.getTime()).indexOf(" ")+1, dateFormat.format(cal.getTime()).length());

	DatabaseFunction.createAnswer(author, post, answer, day, time);
%>
<script>
	window.location = "GeneralFeed.jsp";
</script>
</body>
</html>