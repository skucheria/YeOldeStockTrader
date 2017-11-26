<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="Database.*" import="Classes.*"
	import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	ArrayList<Post> feedPosts = DatabaseFunction.getTopPosts();
	Boolean isGuest = false;
	if (currentUser == null) {
		isGuest = true;
	}
%>
<head>
<script src="JavaScript/jquery-1.10.2.js" type="text/javascript">
$(function() {
    // this will get the full URL at the address bar
    var url = window.location.href;

    // passes on every "a" tag
    $(".menu a").each(function() {
        // checks if its the same on the address bar
        if (url == (this.href)) {
            $(this).closest("li").addClass("active");
        }
    });
});
		function logInOut(){
			<%-- <%
				session.invalidate();
			%> --%>
			var guest = <%=isGuest%>
       		window.location = "WelcomePage.jsp"; 
		}
		function updateMessages() {
		    var ps = document.getElementById("notify");
		    notificationCount = currentUser.numberNotifications();
		    ps.innerHTML = "<img class="icon" src="notification_icon.png" height="25px"/> " +   notificationCount + " Notifications";
		}
		setTimeout(updateMessages, 500);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Status bar for top of page</title>
</head>
<body>
	<div id="menu">
		<ul>
			<li id="logo"><img style="height: 40px;" src="logo.png"></li>
			<li><a href="GeneralFeed.jsp"><img class="icon"
					src="home_icon.png" height="30px" />Home</a></li>
			<li><a href="MyPostPage.jsp"><img class="icon"
					src="answer_icon.png" height="25px" />Activities</a></li>
			<li><a href="NotificationPage.jsp" id="notify"><img
					class="icon" src="notification_icon.png" height="25px" />Notifications</a>
			</li>
			<li id="search"><input type="text" id="searchbar"
				placeholder="Search YeOlderStockTrader">
				<button type="button" id="searchbutton" onclick = "search()" style="background-color: #4775d1;border: none;color: white;width:60px;height:30px;text-align: 
				center;text-decoration: none;display: inline-block;font-size: 14px;outline:none;">Search</button>
			</li>		
			<li id="profile"><img id="profileicon"
				src=<%=currentUser.getProf() %>>
			</li>
			<li id="addquestion" style = "padding-right:10px">
				<button type="button" onclick="makePost()" id="addquestionbutton">Add
					Question</button>
			
			
				<%
					if (isGuest) {
						out.println("<li><button type='button' onclick = 'logInOut()' id='loginoutbutton'>Log In</button></li>");
					} else {
						out.println("<button type='button' onclick = 'logInOut()' id='loginoutbutton'>Log Out</button>");
					}
				%>
			
		</ul>
	</div>
</body>
</html>