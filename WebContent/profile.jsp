
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile Page</title>


    <%--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">--%>

    <style>

        body{
            font-family: Arial;
            background-color: #f2f2f2;

        }

        .info{
            font-size: 14pt;
            font-style: italic;
            font-weight: 400;
            padding-left: 20px;
            float: left;
            height:40px;
            width: 205px;
            border: solid 1px lightgray;
            margin: 15px 15px 10px 5px;
            background-color:#f2f2f2;
            color: #6D6D6D;
            line-height:200%;
            border-radius: 5px;

        }

        .spaceHolder{
            float: left;
            width: 120px;
            height:40px;
            /*background-color: skyblue;*/
            margin-left: 10px;
            margin-top: 16px;
        }

        #rightDiv{

            float: left;
            margin-left: 50px;
            height: 220px;
            width: 400px;
            /*border: solid 1px black;*/
        }

        .buttonStyle{

            background-color: #990000;
            border: none;
            outline: none;
            color: white;
            width:120px;
            height:40px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 8.5pt;
            font-weight: bold;
            border-radius: 5px;
        }


        .profileicon{
            height:30px;
            width:30px;
            border-radius: 50px;
        }
        .postbutton{

            background-color:#F2F8FB;
            width: 120px;
            color:#3B6DA8;
            border: 1px solid #3B6DA8;
            font-size:13px;
            height:25px;
            outline: none;

        }

        .postotherbutton{
            border:0px;
            color:#6D6D6D;
            font-size:13px;
            height:25px;
            outline: none;

        }
        .answers{
            padding: 15px;
            width: 660px;
            margin: 0px 0px 15px 40px;
            background-color:white;
            border-radius:5px;
            /*box-shadow:0 8px 5px 0 rgba(0,0,0,0.1),0 1px 10px 0 rgba(0,0,0,0.1);*/
            /*box-shadow: 2px 2px 3px rgba(0,0,0,0.02);*/
            /*box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;*/
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





        #profileicon{
            height:30px;
            width:30px;
            border-radius: 50px;
        }

        #addquestionbutton{
            background-color: #990000;
            border: none;
            color: white;
            width:120px;
            height:30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            outline:none;
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
            font-size:18px;
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



    </style>
</head>


<body>



<jsp:include page="statusBar.jsp" />

<div id="outerContainer"
     style="
        width: 780px;
        height: auto;
        margin : 70px auto 0 auto;
        background-color: #f2f2f2;
        box-shadow:0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
        border-radius: 5px;
        /*border: solid 1px green;*/
        clear:both;
        overflow:auto;
        ">


    <div id="topPart" style="
            background-color: #fefefe;
            min-height: 350px;
            width:  780px;
            /*border: solid 1px black;*/
            float: left;
            /*margin-top: 60px;*/
            border-radius: 5px;
            /*margin-bottom: px"
    >

        <div style="font-size: 25pt;margin: 20px 10px 25px 60px;font-weight: bold;">
            User Profile
        </div>

        <div id="leftDiv" style="
                float:left;
                height:220px;
                width:220px;
                margin-left: 60px;
                    background-color: #f2f2f2">
            <img src="http://www-scf.usc.edu/~csci201/images/jeffrey_miller.jpg"
                 style="width: 220px;"
            >
        </div>


        <div id="rightDiv">

            <div id="userName" class="info">
                wawa
            </div>

            <div class="info" >
                ******
            </div>

            <div class="spaceHolder">
                <button type="button" class="buttonStyle">Update Password</button>
            </div>


            <div id="email" class="info"> email</div>

            <div class="spaceHolder">
                <button type="button" class="buttonStyle">New Profile Picture</button>
            </div>

        </div>


    </div>











    <div id="lowerPart" style="
            min-height: 300px;
            width:  780px;float: left;
            /*border: solid 1px pink;*/
            ">
        <div style="font-size: 18pt;margin: 30px 10px 15px 40px;font-weight: bold;">
            Recent Posts
        </div>




        <div class="answers">
            <span class="text">Answer</span><br/>
            <span class="posttitle">What does it mean when a stock has low float?</span><br/>

            <div style="vertical-align:middle; float:left; width:40px;">
                <img class="profileicon" src="http://www-scf.usc.edu/~csci201/images/jeffrey_miller.jpg" >
            </div >
            <div style="vertical-align:middle; float:left;">
                <span class="text">&nbsp;wawa</span>
                <span class="text">&nbsp;· Answered at 2017-11-10 21:03:54</span><br />
            </div>
            <div style="clear:both"></div>
            <div style="margin-top:10px;">
                <button type="button" class="postbutton">Upvote  |  20</button>
                <button type="button" class="postotherbutton">Downvote</button>
            </div>
        </div>


        <div class="answers">
            <span class="text">Answer</span><br/>
            <span class="posttitle">title title title title title title?</span><br/>

            <div style="vertical-align:middle; float:left; width:40px;">
                <img class="profileicon" src="http://www-scf.usc.edu/~csci201/images/jeffrey_miller.jpg" >
            </div >
            <div style="vertical-align:middle; float:left;">
                <span class="text">&nbsp;wawa</span>
                <span class="text">&nbsp;· Answered at 2017-11-10 21:03:54</span><br />
            </div>
            <div style="clear:both"></div>
            <div style="margin-top:10px;">
                <button type="button" class="postbutton">Upvote  |  1</button>
                <button type="button" class="postotherbutton">Downvote</button>
            </div>
        </div>

        <div class="answers">
            <span class="text">Answer</span><br/>
            <span class="posttitle">title title title title title title?</span><br/>

            <div style="vertical-align:middle; float:left; width:40px;">
                <img class="profileicon" src="http://www-scf.usc.edu/~csci201/images/jeffrey_miller.jpg" >
            </div >
            <div style="vertical-align:middle; float:left;">
                <span class="text">&nbsp;wawa</span>
                <span class="text">&nbsp;· Answered at 2017-11-10 21:03:54</span><br />
            </div>
            <div style="clear:both"></div>
            <div style="margin-top:10px;">
                <button type="button" class="postbutton">Upvote  |  1</button>
                <button type="button" class="postotherbutton">Downvote</button>
            </div>
        </div>

        <div class="answers">
            <span class="text">Answer</span><br/>
            <span class="posttitle">title title title title title title?</span><br/>

            <div style="vertical-align:middle; float:left; width:40px;">
                <img class="profileicon" src="http://www-scf.usc.edu/~csci201/images/jeffrey_miller.jpg" >
            </div >
            <div style="vertical-align:middle; float:left;">
                <span class="text">&nbsp;wawa</span>
                <span class="text">&nbsp;· Answered at 2017-11-10 21:03:54</span><br />
            </div>
            <div style="clear:both"></div>
            <div style="margin-top:10px;">
                <button type="button" class="postbutton">Upvote  |  1</button>
                <button type="button" class="postotherbutton">Downvote</button>
            </div>
        </div>

    </div>


</div><%-- container--%>













</body>
</html>
