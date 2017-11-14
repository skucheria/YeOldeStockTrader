<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="Database.*" import="Classes.*"
	import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	/* ArrayList<Notification> notifications = currentUser.getNotifications();
	currentUser.notificationsSeen(); */
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notification List</title>
</head>
<body>
	<table>
		<%-- <%
			for (Notification n : notifications) {
		%>
		<tr><%=n.getMessage()%></tr>
		<%
			}
		%> --%>
	</table>
</body>
</html>