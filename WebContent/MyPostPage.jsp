<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList"%>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	ArrayList<Post> feedPosts = DatabaseFunction.getPosts(currentUser.getUsername());
	ArrayList<Integer> bookmarks = new ArrayList<Integer>();
	Boolean isGuest = false;
	bookmarks = currentUser.getBookmarks();
	 
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
       
        function viewAnswers(id){
      	  	var postID = id; 		
      	  	window.location = "AllAnswer.jsp?param=" + id;
        } 
        function bookmark(id){ 
    			var guest = <%= isGuest %>
    			var postId = id;
 			var element = "post" + postId;
 			var old = document.getElementById(element).innerText;
 			var newText = " ";
 			if(old === "Bookmarked"){
 				newText = "Bookmark";
 			}
 			else{
 				newText = "Bookmarked";
 			}
 			var xhttp = new XMLHttpRequest();
		 	xhttp.open("POST", "bookmark.jsp?postID=" + postId, false);
			xhttp.send();
			const newHTML = xhttp.responseText;
			console.log(newHTML);
			document.getElementById(element).innerText = newText;
				
    						
        }
       
        function search(){
       	 	var searchText = document.getElementById("searchbar").value.trim();
        		
    			var xhttp = new XMLHttpRequest();
    			xhttp.open("GET", "search.jsp?search=" + searchText, false);
    			xhttp.send();
    			const search = xhttp.responseText;
    			document.getElementById("container").innerHTML = search;
        		
        }
	</script>
<html>
	<head>
	<link rel="stylesheet" href = "menubarstyle.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>My Posts - YeOldeStockTrader</title>
	</head>
	<body>
			<jsp:include page="statusBar.jsp" />
            
            <div id="container">
	            <div id="sidebar">
	            	  <span style="font-size:18px; color:#808080">Activity</span>
	            	  <hr />
	            	  <ul>
				  	<li><a id="selectsidebar">My Posts</a></li>
				  	<li><a href="MyAnswerPage.jsp" >My Answers</a></li>
				  </ul>
				 
	            </div>
	            
	           
	             <div id="feed">
		<%
	            			for(Post p : feedPosts){
	            				ArrayList<Answer> answers = p.getAnswers();
	            				String divID = "post" + p.getPostId();
	            				String bookmarked = "Bookmark";
	            				for(Integer num : bookmarks){
	            					if(num == p.getPostId()){
	            						bookmarked = "Bookmarked";
	            					}
	            				}
/* 	            				Answer top = DatabaseFunction.getTopAnswer(p.getPostId());
 */	            				/* ArrayList<Answer> list = new ArrayList<Answer>();
 							if(answers!=null)
	            					list.add(answers.get(0)); */
	            				String title = p.getDirection();
	            				String dateTime = p.getDate() + " " + p.getTime();
	            				User author = DatabaseFunction.getAuthorOfPost(p.getPostId());
	            				out.println("<div id = 'post' class='post'>");
	            				out.println("<span class='text'>Question asked by " + author.getFirstName() + " " + author.getLastName() + " · " + p.getCategory() +"</span><br/>"); 
	            				out.println("<span class='posttitle'>" + title + "</span><br/>");
	            				out.println("<span class='text'>" + dateTime + "</span>");
	            				out.println("<span class='text'>&nbsp;· " + answers.size() + " Responses</span><br />");
	            				out.println("<div style='margin-top:10px;''>");
	            				
	            				out.println("<form name='postForm' method = 'POST'>");
		            				out.println("<button type='button'  class='answerotherbutton' onclick = viewAnswers((" + p.getPostId() + ")) style='background-color:#d9d9d9;width: 130px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;'>View Answers</button>");
		            				out.println("<button type='button' id = " + divID + " class='answerotherbutton' onclick = bookmark((" + p.getPostId() + ")) style='background-color:#d9d9d9;width: 130px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;'>" + bookmarked + "</button>");
   							out.println("</form>");
	            				
	            				out.println("</div>");
	            				out.println("</div>");
	            				out.println("<br />");
							
	            			}
	            		
	            		%>	             
	            </div> 
	         
	         
            </div>
            
            <jsp:include page="stockTicker.jsp" />

	</body>
</html>