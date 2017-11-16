<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList"%>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	String id = request.getParameter("answerID"); 
	int answerID = Integer.valueOf(id);
	DatabaseFunction.upVote(answerID, currentUser.getUsername());
	int newRating = DatabaseFunction.getAnswerRating(answerID);
%>


<button type="button" id="postbutton" onclick = "upvote(<%= answerID %>)" style="background-color:#F2F8FB;width: 120px;color:#3B6DA8;border: 1px solid #3B6DA8;font-size:13px;height:25px;outline:none;cursor: pointer;">Upvote  |  <%=newRating %> </button>
<button type="button" id="postotherbutton" onclick = "downvote(<%= answerID %>)" style="background-color:#d9d9d9;width: 100px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;">Downvote</button>