
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Profile Page</title>


        <%--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">--%>

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
                width: 205px;
                border: solid 1px lightgray;
                margin: 16px 15px 14px 5px;
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
                width: 225px;
                border: solid 1px lightgray;
                margin: 16px 15px 14px 5px;
                background-color:#f2f2f2;
                color: #6D6D6D;
                line-height:200%;
                border-radius: 5px;


            }

            #spaceHolder1{

                float: left;
                width: 120px;
                height:40px;
                /*background-color: skyblue;*/
                margin-left: 10px;
                margin-top: -2px;
                margin-bottom: 8px;
                cursor: pointer;

            }

            #spaceHolder2{

                float: left;
                width: 120px;
                height:40px;
                /*background-color: skyblue;*/
                margin-left: 10px;
                margin-top: 17px;
                cursor: pointer;

            }

            #rightDiv{

                float: left;
                margin-left: 45px;
                height: 180px;
                width: 380px;
                /*border: solid 1px black;*/
            }

            .buttonStyle{

                background-color: #4775d1;
                border: none;
                outline: none;
                color: white;
                width:120px;
                height:35px;
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
                width: 595px;
                margin: 0px 0px 15px 30px;
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





            /*#profileicon{*/
                /*height:30px;*/
                /*width:30px;*/
                /*border-radius: 50px;*/
            /*}*/

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



        </style>
    </head>


    <body>



        <div id="menu">
            <ul>
                 <li id="logo">
                 	<img style="height:40px;" src="logo.png">
                </li>  
                <li><a href="GeneralFeed.jsp"><img class="icon" src="home_icon.png" height="30px"/>Home</a></li>
                <li><a href="MyPostPage.jsp"><img class="icon" src="answer_icon.png" height="25px"/>Answer</a>
                </li>
                <li><a href="#"><img class="icon" src="notification_icon.png" height="25px"/>Notifications</a>

                </li>
                <li id="search">
                    <input type="text" id="searchbar" placeholder="Search YeOlderStockTrader">
                </li>
                <li id="profile">
                    <img class="profileicon" src="https://assets.entrepreneur.com/content/3x2/1300/20150406145944-dos-donts-taking-perfect-linkedin-profile-picture-selfie-mobile-camera-2.jpeg" >
                </li>
                <li id="addquestion">
                    <button type="button" id="addquestionbutton">Add Question</button>
                </li>

                <div style="clear:both"></div>
            </ul>
        </div>




        <div id="outerContainer"
             style="
                width: 680px;
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
                    height: 260px;
                    width:  680px;
                    /*border: solid 1px black;*/
                    float: left;
                    /*margin-top: 60px;*/
                    border-radius: 5px;
                    /*margin-bottom: px"
            >

                <div style="font-size: 18pt;margin: 20px 10px 18px 45px;font-weight: bold;">
                    Jeffrey Miller
                </div>

                <div id="leftDiv" style="
                        float:left;
                        height:160px;
                        width:160px;
                        margin-left: 45px;
                            background-color: #f2f2f2">
                    <img src="http://www-scf.usc.edu/~csci201/images/jeffrey_miller.jpg"
                         style="width: 160px;"
                    >
                </div>


                <div id="rightDiv">


                        <input type="text" id="newPassword" name="newPasswordInput" value="******"><br>

                    <div id="spaceHolder1">
                        <button type="button" class="buttonStyle">Update Password</button>
                    </div>


                    <div id="email" class="info"> Email</div>

                    <div id="spaceHolder2">
                        <button type="button" class="buttonStyle">New Profile Picture</button>
                    </div>

                </div>


            </div>

            <div id="lowerPart" style="
                    min-height: 300px;
                    width:  680px;float: left;
                    /*border: solid 1px pink;*/
                    ">
                <div style="font-size: 15pt;margin: 20px 10px 12px 30px;font-weight: bold;">
                    Recent Posts
                </div>




                <div class="answers">
                    <span class="text">Answer&nbsp;· Technology</span><br/>
                    <span class="posttitle">What does it mean when a stock has low float?</span><br/>

                    <div style="vertical-align:middle; float:left; width:40px;">
                        <img class="profileicon" src="https://assets.entrepreneur.com/content/3x2/1300/20150406145944-dos-donts-taking-perfect-linkedin-profile-picture-selfie-mobile-camera-2.jpeg" >
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
                        <button type="button" class="postbutton" style="background-color:#F2F8FB;width: 120px;color:#3B6DA8;border: 1px solid #3B6DA8;font-size:13px;height:25px;outline:none;cursor: pointer;">Upvote  |  20</button>
                        <button type="button" class="postotherbutton" style="background-color:#d9d9d9;width: 100px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;">Downvote</button>
                    </div>
                </div>



                <div class="answers">
                    <span class="text">Answer&nbsp;· Technology</span><br/>
                    <span class="posttitle">What does it mean when a stock has low float?</span><br/>

                    <div style="vertical-align:middle; float:left; width:40px;">
                        <img class="profileicon" src="https://assets.entrepreneur.com/content/3x2/1300/20150406145944-dos-donts-taking-perfect-linkedin-profile-picture-selfie-mobile-camera-2.jpeg" >
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
                        <button type="button" class="postbutton" style="background-color:#F2F8FB;width: 120px;color:#3B6DA8;border: 1px solid #3B6DA8;font-size:13px;height:25px;outline:none;cursor: pointer;">Upvote  |  20</button>
                        <button type="button" class="postotherbutton" style="background-color:#d9d9d9;width: 100px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;">Downvote</button>
                    </div>
                </div>



                <div class="answers">
                    <span class="text">Answer&nbsp;· Technology</span><br/>
                    <span class="posttitle">What does it mean when a stock has low float?</span><br/>

                    <div style="vertical-align:middle; float:left; width:40px;">
                        <img class="profileicon" src="https://assets.entrepreneur.com/content/3x2/1300/20150406145944-dos-donts-taking-perfect-linkedin-profile-picture-selfie-mobile-camera-2.jpeg" >
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
                        <button type="button" class="postbutton" style="background-color:#F2F8FB;width: 120px;color:#3B6DA8;border: 1px solid #3B6DA8;font-size:13px;height:25px;outline:none;cursor: pointer;">Upvote  |  20</button>
                        <button type="button" class="postotherbutton" style="background-color:#d9d9d9;width: 100px;color:#6D6D6D;border: 1px solid #6D6D6D;font-size:13px;height:25px;outline:none;cursor: pointer;">Downvote</button>
                    </div>
                </div>







            </div>


        </div><%-- container--%>













    </body>
</html>
