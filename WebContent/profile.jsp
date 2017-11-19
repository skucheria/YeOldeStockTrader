
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	String fullname = currentUser.getFirstName() + " " + currentUser.getLastName();
	ArrayList<Post> feedPosts = DatabaseFunction.getPosts(currentUser.getUsername());
	ArrayList<Integer> bookmarks = new ArrayList<Integer>();
	bookmarks = currentUser.getBookmarks();
	Boolean isGuest = false;
%>

<html>
    <head>
    <!-- 
      <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
    			<link rel="stylesheet" href = "menubarstyle.css">
    		
    
        <title>Profile Page</title>
        <style>

            body{
                /*font-family: Arial;*/
                background-color: #f2f2f2;                

            }

            .info{
                font-size: 14pt;
                font-style: italic;
                font-weight: 400;
                padding-left: 20px;
                float: left;
                height:35px;
                width: 60%;
                border: solid 1px lightgray;
                margin: 6px 15px 6px 2px;
                background-color:#f2f2f2;
                color: #6D6D6D;
                line-height:200%;
                border-radius: 5px;

            }

            #newPassword{

                /*border: solid 1px yellow;*/
                font-size: 14pt;
                font-style: italic;
                font-weight: 400;
                padding-left: 20px;
                float: left;
                height:35px;
                width: 60%;
                border: solid 1px lightgray;
                margin: 5px 15px 2px 0px;
                background-color:#f2f2f2;
                color: #6D6D6D;
                line-height:200%;
                border-radius: 5px;


            }

            .spaceHolder{
                float: left;
                width: 65%;
                height:40px;
                margin-top:2px;
            }
            
            #rightDiv{

                float: left;
                margin-left: 45px;
                height: 180px;
                width: 60%;
            }

            .buttonStyle{

                background-color: #4775d1;
                border: none;
                outline: none;
                color: white;
                width:100%;
				height:35px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 10pt;
                font-weight: bold;
                border-radius: 5px;
                cursor: pointer;
                
            }

/* 
            .profileicon{
                height:30px;
                width:30px;
                border-radius: 50px;
            } */
            /*.postbutton{*/

                /*background-color:#F2F8FB;*/
                /*width: 120px;*/
                /*color:#3B6DA8;*/
                /*border: 1px solid #3B6DA8;*/
                /*font-size:13px;*/
                /*height:25px;*/
                /*outline: none;*/

            /*}*/

            /*.postotherbutton{*/
                /*border:0px;*/
                /*color:#6D6D6D;*/
                /*font-size:13px;*/
                /*height:25px;*/
                /*outline: none;*/

            /*}*/
            .answers{
                padding: 15px;
                width: 88%;
                margin: 0px 0px 15px 30px;
                background-color:white;
                border-radius:5px;
                box-shadow: 0 10px 6px -6px #cccccc;
               

            }

            .text{
                color:#808080;
                font-size: 15px;
            }

            .posttitle{
                font-size: 20px;
                font-weight: bold;
                line-height:40px;
            }





            /*#profileicon{*/
                /*height:30px;*/
                /*width:30px;*/
                /*border-radius: 50px;*/
            /*}*/
  <%--

            #addquestionbutton{
                background-color: #4775d1;
                border: none;
                color: white;
                width:120px;
                height:30px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                outline:none;
                border-radius: 5px;
            }

            #searchbar{
                vertical-align: middle;
                width: 300px;
                height: 30px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
                background-color: white;
                background-image: url('search_icon.png');
                background-size: 25px;
                background-position: 10px 0px;
                background-repeat: no-repeat;
                padding: 12px 20px 12px 45px;
                outline:none;
            }



            #menu
          {
                background-color: white;
                font-size:16px;
                position: fixed;
                width: 100%;
                height: 50px;
                position: absolute;
                top:0;
                left:0;
                /*margin-left:-10px;*/
                /*margin-top:-10px;*/
                z-index:1;
            }
            #menu ul
            {
                list-style: none;
                padding: 0;
                margin: 0;
            }
            #menu li a
            {
                text-decoration: none;
                background-color: white;
                color: #404040;
                width:150px;
                height: 50px;
                display: block;
                text-align: center;
                line-height: 50px;
            }
            #menu li
            {
                /*   padding-left:5px;
                  padding-right:5px; */
                float:left;
                position: relative;
            }
            #menu li a:hover
            {
                background-color: #e6e6e6;
            }
            #menu ul ul
            {
                visibility: hidden;
                position: absolute;
                top:50px;
                left:0px;
            }
            #menu ul li:hover ul
            {
                visibility: visible;
            }

            #addquestion{
                margin-top:10px;
            }

            #profile{
                margin-top:10px;
                margin-right: 15px;
            }

            #search{
                padding-top: 10px;
                margin-left: 30px;
                margin-right: 15px;
            }

            #logo{
                margin-top:5px;
                margin-left:120px;
            }

            .icon {
                vertical-align: middle;
                padding-right:8px;
                line-height:  40px;
            }

--%>

        </style>
    </head>
	
	<script>
	function bookmark(id){ 
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
    function viewAnswers(id){
  	  	var postID = id; 		
  	  	window.location = "AllAnswer.jsp?param=" + id;

    } 
	
	</script>

    <body>

		<jsp:include page="statusBar.jsp" />

        <div id="outerContainer"
             style="
                width: 55%;
                height: auto;
                margin : 70px auto 0 auto;
                background-color: #f2f2f2;
                box-shadow:0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
                border-radius: 5px;
                /*border: solid 1px green;*/
                /*clear:both;*/
                overflow:auto;
                ">


            <div id="topPart" style="
                    background-color: #fefefe;
                    height: 50%;
                    width:  100%;
                    float: left;
                    border-radius: 5px;
                    padding-bottom:25px;
            ">

                <div style="font-size: 18pt;margin: 20px 10px 18px 45px;font-weight: bold;">
                    <%= fullname %>
                </div>

                <div id="leftDiv" style="
                        float:left;
                        height:180px;
                        width:180px;
                        margin-left: 45px;
                        margin-right: 20px;
                        background-color: #f2f2f2;
                        ">
                    <img src="http://www-scf.usc.edu/~csci201/images/jeffrey_miller.jpg"
                         style="width: 180px;"
                    >
                </div>


                <div id="rightDiv">


                    <input type="text" id="newPassword" name="newPasswordInput" value="******"><br>
                    
                    <div id="email" class="info"> Email</div>
                    
                    <div class="spaceHolder">
                        <button type="button" class="buttonStyle">Update Password</button>
                    </div>

                    <div class="spaceHolder">
                        <button type="button" class="buttonStyle">New Profile Picture</button>
                    </div>

                </div>


            </div>

            <div id="lowerPart" style="
                    min-height: 300px;
                    width:  100%;
                    float: left;
                    /*border: solid 1px pink;*/
                    ">
                <div style="font-size: 15pt;margin: 20px 10px 12px 30px;font-weight: bold;">
                    Recent Posts
                </div>




           <%
           	for(Post p : feedPosts){
				String divID = "post" + p.getPostId();
				String bookmarked = "Bookmark";
				for(Integer num : bookmarks){
					if(num == p.getPostId()){
						bookmarked = "Bookmarked";
					}
				}
				String title = p.getDirection();
				String dateTime = p.getDate() + " " + p.getTime();
				User author = DatabaseFunction.getAuthorOfPost(p.getPostId());
				out.println("<div id = 'post' class='answers'>");
				out.println("<span class='text'>Question asked by " + author.getFirstName() + " " + author.getLastName() + " · " + p.getCategory() +"</span><br/>"); 
				out.println("<span class='posttitle'>" + title + "</span><br/>");
				out.println("<span class='text'>" + dateTime + "</span>");
				out.println("<span class='text'>&nbsp;· " + p.getAnswers().size() + " Responses</span><br />");
				out.println("<div style='margin-top:10px;''>");
				
				out.println("<form name='postForm' method = 'POST'>");
   				out.println("<button type='button'  class='answerotherbutton' onclick = viewAnswers((" + p.getPostId() + ")) style='background-color:#d9d9d9;width: 130px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;'>View Answers</button>");
   				out.println("<button type='button' id = " + divID + " class='answerotherbutton' onclick = bookmark((" + p.getPostId() + ")) style='background-color:#d9d9d9;width: 130px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;'>" + bookmarked + "</button>");
				out.println("</form>");
				
				out.println("</div>");
				out.println("</div> <br />");  
           	}
			%>					
	            
               





            </div>


        </div><%-- container--%>













    </body>
</html>
