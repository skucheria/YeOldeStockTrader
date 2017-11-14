<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	ArrayList<Post> feedPosts = DatabaseFunction.getTopPosts();
	Boolean isGuest = false;
	if(currentUser == null){
		isGuest = true;
	}
	
%>
<head>
<script type="text/javascript">
		function logInOut(){
			<%-- <%
				session.invalidate();
			%> --%>
			var guest = <%= isGuest %>
       		window.location = "WelcomePage.jsp"; 
		}
		function updateMessages() {
		    var ps = document.getElementById("notify");
		    
		    ps.innerHTML = "<img class="icon" src="notification_icon.png" height="25px"/>Notifications " + notificationCount;
		}
		setTimeout(updateMessages, 500);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Status bar for top of page</title>
</head>
<body>
<div id="menu">
               <ul>
                   <li id="logo">
                   <img src="logo.png">
                   </li>
                   <li><a style="color:#4775d1"><img class="icon" src="home_icon_blue.png" height="30px"/>Home</a></li>
                   <li><a href="MyPostPage.jsp"><img class="icon" src="answer_icon.png" height="25px"/>Activities</a>
                   </li>
                   <li><a href="NotificationPage.jsp" id="notify"><img class="icon" src="notification_icon.png" height="25px"/>Notifications</a>
                   
                   </li>
                   <li id="search">
                   <input type="text" id="searchbar" placeholder="Search YeOlderStockTrader">
                   </li>
                   <li id="profile">
                  		<img id="profileicon" src="https://assets.entrepreneur.com/content/3x2/1300/20150406145944-dos-donts-taking-perfect-linkedin-profile-picture-selfie-mobile-camera-2.jpeg" >
                   </li>
                   <li id="addquestion">
                  		<button type="button" onclick = "makePost()" id="addquestionbutton">Add Question</button>
                   </li>
                   <li id="addquestion">
                   <%
                   	if(isGuest){
                   		out.println("<button type='button' onclick = 'logInOut()' id='loginoutbutton'>Log In</button>");
                   	}
                   	else{
                   		out.println("<button type='button' onclick = 'logInOut()' id='loginoutbutton'>Log Out</button>");
                   	}
                   %>	
                   </li>
                   <div style="clear:both"></div>
               </ul>
           </div>
</body>
</html>