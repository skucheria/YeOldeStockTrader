<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList"%>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	ArrayList<Post> feedPosts = DatabaseFunction.getPosts(currentUser.getUsername());
	ArrayList<Integer> bookmarks = new ArrayList<Integer>();
	Boolean isGuest = false;
	bookmarks = currentUser.getBookmarks();
	ArrayList<Answer> answers = DatabaseFunction.getAnswers(currentUser.getUsername());
	 
%>
<script type="text/javascript" >
		function logInOut(){
       		window.location = "WelcomePage.jsp"; 
		}
    		function makePost(){
    			var guest = <%= isGuest %>
    			console.log(guest);
    			if(guest === true){
    				console.log("Guest user trying to make post");
    			}
    			else{
    				console.log("regular user trying to make a new post");
    	       		window.location = "newpost.jsp"; 
    			}
    		}
       
        function upvote(id){
        		var guest = <%= isGuest %>
			var answerID = id;
			
			var xhttp = new XMLHttpRequest();
		 	xhttp.open("POST", "upvote.jsp?answerID=" + answerID, false);
			xhttp.send();
			var element = "answer" + answerID;
			const newHTML = xhttp.responseText;
			document.getElementById(element).innerHTML = newHTML;
        }
        function downvote(id){
      	  	var guest = <%= isGuest %>
			var answerID = id;
			var xhttp = new XMLHttpRequest();
		 	xhttp.open("POST", "downvote.jsp?answerID=" + answerID, false);
			xhttp.send();
			var element = "answer" + answerID;
			const newHTML = xhttp.responseText;
			document.getElementById(element).innerHTML = newHTML;
		}
        
	</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<link rel="stylesheet" href = "menubarstyle.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>My Answers - YeOldeStockTrader</title>
	</head>
	<body>
		<jsp:include page="statusBar.jsp" />
            
            <div id="container">
	            <div id="sidebar">
	            	  <span style="font-size:18px; color:#808080">Activity</span>
	            	  <hr />
	            	  <ul>
				  	<li><a href="MyPostPage.jsp">My Posts</a></li>
				  	<li><a id="selectsidebar" >My Answers</a></li>
				  </ul>
				 
	            </div>
	            
	           
	            <div id="feed">
	            <% 
	             	for(Answer a : answers){ //need to add a span for the actual response
		            				String ansID = "answer" + a.getAnswerID();
		            				out.println("<div id='answer' class='answer'>");
		            				out.println("<span class='text'>Response</span><br/>");
		            				out.println("<span class='posttitle'>" + DatabaseFunction.getPostForAnswer(a.getAnswerID()) + "</span><br/>");
								out.println("<div style='vertical-align:middle; float:left; width:40px;''>");
								out.println("<img id='profileicon' src='https://assets.entrepreneur.com/content/3x2/1300/20150406145944-dos-donts-taking-perfect-linkedin-profile-picture-selfie-mobile-camera-2.jpeg'>");
								out.println("</div>");
								out.println("<div style='vertical-align:middle; float:left;''>");
								User answerer = DatabaseFunction.getUserFromName(a.getAuthor());
								String dateTime = a.getDate() + " " + a.getTime();
								int rating = a.getRating();
								out.println("<span class='text'>&nbsp;" + answerer.getFirstName() + " " + answerer.getLastName() +  "</span>");
								out.println("<span class='text'>&nbsp;· Answered at " + dateTime + "</span><br />");
								out.println("</div>");
								out.println("<div style='clear:both'></div>");
								out.println("<div style='padding-top:10px;'>" + a.getResponse() + "<br />"); //div for answer content
								out.println("</div>");
								out.println("<div style='margin-top:10px;''> " );
	            					out.println("<form name='answerForm' id = " + ansID + " method = 'POST'>");
									out.println("<button type='button' onclick = 'upvote(" + a.getAnswerID() + ")' style='background-color:#F2F8FB;width: 120px;color:#3B6DA8;border: 1px solid #3B6DA8;font-size:13px;height:25px;outline:none;cursor: pointer;' id='postbutton'>Upvote  |  " + rating + " </button>");
									out.println("<button type='button' onclick = 'downvote(" + a.getAnswerID() + ")' style='background-color:#d9d9d9;width: 100px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;' class='postotherbutton' >Downvote</button>");
	   							out.println("</form>");

								out.println("</div>");
								out.println("</div> <br />");
	            					
	            				}
	            %>
	             	
	            </div>
	         
	         
            </div>
            <jsp:include page="stockTicker.jsp" />

	</body>
</html>