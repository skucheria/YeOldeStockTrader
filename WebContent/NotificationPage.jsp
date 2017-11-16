<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
<link rel="stylesheet" href = "menubarstyle.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Notifications - YeOldeStockTrader</title>
	</head>
	<body>
			<jsp:include page="statusBar.jsp" />
            
            <div id="container">
	           
	            <div id="notification">
	            		<strong style="font-size:18px;">All Notifications</strong> <br/> <hr/>
	             	<div id="postbookmarked" style="padding:10px;">
		             	<div style="float:left; width:10%;"><img class="icon" src="Q.png" height="60px"/></div>
		             	<div style="height:60px; width:85%; float:right;display: flex;align-items: center; ">Your post "What does it mean when a stock has low float?" is bookmarked by Ivy Lu</div>     		
		             	<div style="clear:both"></div>
	             	</div>	             	
	             	<div id="answerupvoted" style="padding:10px">
	             		<div style="float:left; width:10%;"><img class="icon" src="A.png" height="60px"/></div>
		             	<div style="height:60px; width:85%; float:right;display: flex;align-items: center;">Your answer for post "What does it mean when a stock has low float?" is upvoted by Ivy Lu</div>     		
		             	<div style="clear:both"></div>
	             	</div>	             	
	             	<div class="postanswered" style="padding:10px" >	  
	             		<div style="float:left; width:10%;"><img class="icon" src="Q.png" height="60px"/></div>
		             	<div style="height:60px; width:85%; float:right;display: flex;align-items: center;">Your Post "What does it mean when a stock has low float?" is answered by Ivy Lu </div>     		
		             	<div style="clear:both"></div>            		
	             	</div>
	             	
	            </div>
	         
	         
            </div>

	</body>
</html>