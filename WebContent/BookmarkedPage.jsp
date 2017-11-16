<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	ArrayList<Post> feedPosts = DatabaseFunction.getTopPosts();
	ArrayList<Integer> bookmarks = new ArrayList<Integer>();
	bookmarks = currentUser.getBookmarks();
	
	
%>
<html>
	<head>
	<link rel="stylesheet" href = "menubarstyle.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bookmarks - YeOlderStockTrader</title>
	</head>
	<body>
			<div id="menu">
                <ul>
                    <li id="logo">
                    <img style="height:40px;" src="logo.png">
                    </li>      
                    <li><a style="color:#4775d1;"><img class="icon" src="home_icon.png" height="30px"/>Home</a></li>
                    <li><a href="MyPostPage.jsp"><img class="icon" src="answer_icon.png" height="25px"/>Activities</a>
                    </li>
                    <li><a href="NotificationPage.jsp"><img class="icon" src="notification_icon.png" height="25px"/>Notifications</a>
                    
                    </li>
                    <li id="search">
                    <input type="text" id="searchbar" placeholder="Search YeOlderStockTrader">
                    </li>
                    <li id="profile">
                   		<img id="profileicon" src="https://assets.entrepreneur.com/content/3x2/1300/20150406145944-dos-donts-taking-perfect-linkedin-profile-picture-selfie-mobile-camera-2.jpeg" >
                    </li>
                    <li id="addquestion">
                   		<button type="button" id="addquestionbutton">Add Question</button>
                    </li>
                    
                    <div style="clear:both"></div>
                </ul>
            </div>
<%-- 			<jsp:include page="statusBar.jsp" />
 --%>            
            <div id="container">
	            <div id="sidebar">
	            	  <span style="font-size:18px; color:#808080">Feeds</span>
	            	  <hr />
	            	  <ul>
				  	<li><a href="GeneralFeed.jsp" >Top Stories</a></li>
				  	<li><a id="selectsidebar">Bookmarked Posts</a></li>
				  </ul>
				 
	            </div>
	            
	           
	            <div id="feed">
	            
	            
           <%
           	for(Post p : feedPosts){
				String divID = "post" + p.getPostId();
				String bookmarked = "Bookmark";
				for(Integer num : bookmarks){
					if(num == p.getPostId()){
						out.println("<div id = 'post' class='post'>");

						bookmarked = "Bookmarked";
						String title = p.getDirection();
						String dateTime = p.getDate() + " " + p.getTime();
						User author = DatabaseFunction.getAuthorOfPost(p.getPostId());
						out.println("<span class='text'>Question asked by " + author.getFirstName() + " " + author.getLastName() + " · " + p.getCategory() +"</span><br/>"); 
						out.println("<span class='posttitle'>" + title + "</span><br/>");
						out.println("<span class='text'>" + dateTime + "</span>");
						out.println("<span class='text'>&nbsp;· " + p.getAnswers().size() + " Responses</span><br />");
						out.println("<div style='margin-top:10px;''>");
						
						out.println("<form name='postForm' method = 'POST'>");
		   				out.println("<button type='button' id='answerbutton' name = 'answer' onclick = answerQuestion((" + p.getPostId() + ")) style='background-color:#F2F8FB;width: 100px;color:#3B6DA8;border: 1px solid #3B6DA8;font-size:13px;height:25px;outline:none;cursor: pointer;'>Answer</button>");
		   				out.println("<button type='button'  class='answerotherbutton' onclick = viewAnswers((" + p.getPostId() + ")) style='background-color:#d9d9d9;width: 130px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;'>View Answers</button>");
		   				out.println("<button type='button' id = " + divID + " class='answerotherbutton' onclick = bookmark((" + p.getPostId() + ")) style='background-color:#d9d9d9;width: 130px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;'>" + bookmarked + "</button>");
						out.println("</form>");
						
						out.println("</div>");
						out.println("</div> <br />");  

					}
				}
           	}
			%>					
	
	            </div>
	         
	         
            </div>	
	</body>
</html>