<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	            	  <span style="font-size:18px; color:#808080">Activities</span>
	            	  <hr />
	            	  <ul>
				  	<li><a id="selectsidebar">My Posts</a></li>
				  	<li><a href="MyAnswerPage.jsp" >My Answers</a></li>
				  </ul>
				 
	            </div>
	            
	           
	            <div id="feed">
	             	<div class="post">
	             		<span class="text">Question asked&nbsp;· Technology</span><br/>
	             		<span class="posttitle">What does it mean when a stock has low float?</span><br/>
	             		<span class="text">2017-11-10 21:03:54</span>
	             		<span class="text">&nbsp;· 1 Answer</span><br />
	             	<div style="margin-top:10px;">
	             	<button type="button" id="answerbutton" style="background-color:#F2F8FB;width: 100px;color:#3B6DA8;border: 1px solid #3B6DA8;font-size:13px;height:25px;outline:none;cursor: pointer;">Answer</button>
	             	<button type="button" id="viewanswersbutton" style="background-color:#d9d9d9;width: 130px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;">View Answers</button>
	             	<button type="button" id="bookmarkbutton" style="background-color:#d9d9d9;width: 130px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;">Bookmarked</button>
	             	</div>
	             	</div>
	             	
	            </div>
	         
	         
            </div>

	</body>
</html>