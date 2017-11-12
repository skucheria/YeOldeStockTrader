<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	ArrayList<Post> feedPosts = DatabaseFunction.getTopPosts();
%>
	<head>
	<link rel="stylesheet" href = "menubarstyle.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>General Feed Page</title>
	</head>
	<body>
			<div id="menu">
                <ul>
                    <li id="logo">
                    <img src="logo.png">
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
				  	<li><a id="selectsidebar">Top Stories</a></li>
				  	<li><a href="BookmarkedPage.jsp" >Bookmarked Answers</a></li>
				  </ul>
	            </div>
	            
	           
	            <div id="feed">
	            		<%
	            			for(Post p : feedPosts){
	            				ArrayList<Answer> answers = p.getAnswers();
	            				String divID = "post" + p.getPostId();
	            				String title = p.getDirection();
	            				String dateTime = p.getDate() + " " + p.getTime();
	            				out.println("<div id = 'post' class=" + divID + ">");
	            				out.println("<span class='text'>Question asked</span><br/>");
	            				out.println("<span class='posttitle'>" + title + "</span><br/>");
	            				out.println("<span class='text'>" + dateTime + "</span>");
	            				out.println("<span class='text'>&nbsp;· 1 Answer</span><br />");
	            				out.println("<div style='margin-top:10px;''>");
	            				out.println("<button type='button' id='answerbutton'>Answer</button>");
	            				out.println("<button type='button' class='answerotherbutton'>View Answers</button>");
	            				out.println("<button type='button' class='answerotherbutton'>Bookmarked</button>");
	            				out.println("</div>");
	            				out.println("</div> <br />");
							
	            				for(Answer a : answers){ //need to add a span for the actual response
		            				String ansID = "answer" + a.getAnswerID();
		            				out.println("<div id='answer' class=" + ansID +">");
		            				out.println("<span class='text'>Answer</span><br/>");
		            				out.println("<span class='posttitle'>" + a.getResponse() + "</span><br/>");
								out.println("<div style='vertical-align:middle; float:left; width:40px;''>");
								out.println("<img id='profileicon' src='https://assets.entrepreneur.com/content/3x2/1300/20150406145944-dos-donts-taking-perfect-linkedin-profile-picture-selfie-mobile-camera-2.jpeg'>");
								out.println("</div>");
								out.println("<div style='vertical-align:middle; float:left;''>");
								User answerer = DatabaseFunction.getUserFromName(a.getAuthor());
								dateTime = a.getDate() + " " + a.getTime();
								int rating = a.getRating();
								out.println("<span class='text'>&nbsp;" + answerer.getFirstName() + answerer.getLastName() +  "</span>");
								out.println("<span class='text'>&nbsp;· Answered at " + dateTime + "</span><br />");
								out.println("</div>");
								out.println("<div style='clear:both'></div>");
								out.println("<div style='margin-top:10px;''>");
								out.println("<button type='button' id='postbutton'>Upvote  |  " + rating + "</button>");
								out.println("<button type='button' class='postotherbutton'>Downvote</button>");
								out.println("</div>");
								out.println("</div> <br />");
	            				}
	            			}
	            		
	            		%>	             
	            </div> 
            </div>
	</body>
</html>