<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList"%>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");

	String query = request.getParameter("search").toLowerCase().trim();
	ArrayList<Post> posts = DatabaseFunction.getTopPosts();
	ArrayList<Integer> bookmarks = new ArrayList<Integer>();
	ArrayList<Post> feedPosts = new ArrayList<Post>();
	if(currentUser != null){
		 bookmarks = currentUser.getBookmarks();
	}
	
	
	if(query.equals("")){
		for(Post p : posts){
			feedPosts.add(p);
		}
	}
	else{
		for(Post p : posts){
			String content = p.getDirection().toLowerCase();
			if(content.contains(query)){
				feedPosts.add(p);
			}
		}
	}
	

%>


	<div id="sidebar">
	            	  <span style="font-size:18px; color:#808080">Feeds</span>
	            	  <hr />
	            	  <ul>
				  	<li><a id="selectsidebar">Top Stories</a></li>
				  	<li><a href="BookmarkedPage.jsp" >Bookmarked Posts</a></li>
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
		            				out.println("<button type='button' id='answerbutton' name = 'answer' onclick = answerQuestion((" + p.getPostId() + ")) style='background-color:#F2F8FB;width: 100px;color:#3B6DA8;border: 1px solid #3B6DA8;font-size:13px;height:25px;outline:none;cursor: pointer;'>Answer</button>");
		            				out.println("<button type='button'  class='answerotherbutton' onclick = viewAnswers((" + p.getPostId() + ")) style='background-color:#d9d9d9;width: 130px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;'>View Answers</button>");
		            				out.println("<button type='button' id = " + divID + " class='answerotherbutton' onclick = bookmark((" + p.getPostId() + ")) style='background-color:#d9d9d9;width: 130px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;'>" + bookmarked + "</button>");
   							out.println("</form>");
	            				
	            				out.println("</div>");
	            				out.println("</div>");
	            				int ansIndex = 0;
	            				for(Answer a : answers){ //need to add a span for the actual response
	            					if(ansIndex<1){
		            				String ansID = "answer" + a.getAnswerID();
		            				out.println("<div id='answer' class='answer'>");
		            				out.println("<span class='text'>Top Response</span><br/>");
		            				out.println("<span class='posttitle'>" + p.getDirection() + "</span><br/>");
								out.println("<div style='vertical-align:middle; float:left; width:40px;''>");
								out.println("<img id='profileicon' src='https://assets.entrepreneur.com/content/3x2/1300/20150406145944-dos-donts-taking-perfect-linkedin-profile-picture-selfie-mobile-camera-2.jpeg'>");
								out.println("</div>");
								out.println("<div style='vertical-align:middle; float:left;''>");
								User answerer = DatabaseFunction.getUserFromName(a.getAuthor());
								dateTime = a.getDate() + " " + a.getTime();
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
								ansIndex++;
	            				}
	            			}
	            		
	            		%>	             
	            </div> 