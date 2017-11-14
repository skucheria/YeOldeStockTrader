<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	ArrayList<Post> feedPosts = DatabaseFunction.getTopPosts();
	ArrayList<Integer> bookmarks = new ArrayList<Integer>();
	int bookPost = -1;
	Boolean isGuest = false;
	if(currentUser != null){
		 bookmarks = currentUser.getBookmarks();
	}
	else{
		isGuest = true;
	}
	
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
                    <li><a style="color:#4775d1;"><img class="icon" src="home_icon_blue.png" height="30px"/>Home</a></li>
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
	             	<div class="answer">
	             		<span class="text">Answer&nbsp;· Technology</span><br/>
	             		<span class="posttitle">What does it mean when a stock has low float?</span><br/>
	             		
	             		<div style="vertical-align:middle; float:left; width:40px;">
	             			<img id="profileicon" src="https://assets.entrepreneur.com/content/3x2/1300/20150406145944-dos-donts-taking-perfect-linkedin-profile-picture-selfie-mobile-camera-2.jpeg" >
	             		</div >
	             		<div style="vertical-align:middle; float:left;">
	             		<span class="text">&nbsp;Ivy Lu</span>
	             		<span class="text">&nbsp;· Answered at 2017-11-10 21:03:54</span><br />
	             		</div>
	             		<div style="clear:both"></div>
	             		<div style="padding-top:10px;">
	             		If cost savings were the most important and overriding factor for you, then I would go with Iowa State (my Dad’s undergraduate alma mater) over USC (my own alma mater).
	             		</div>
	             		<div style="margin-top:10px;">
		             	<button type="button" id="postbutton" style="background-color:#F2F8FB;width: 120px;color:#3B6DA8;border: 1px solid #3B6DA8;font-size:13px;height:25px;outline:none;cursor: pointer;">Upvote  |  20</button>
		             	<button type="button" id="postotherbutton" style="background-color:#d9d9d9;width: 100px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;">Downvote</button>
		             	</div>
	             	</div>
	             	
	             	
	            </div>
	         
	         
            </div>	
	</body>
</html>