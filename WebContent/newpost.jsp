
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link rel="stylesheet" href = "menubarstyle.css">
    
        <title>New Post</title>


        <%--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">--%>

        <style>

            body{
                /*font-family: Arial;*/
                background-color: #f2f2f2;

            }

            #postTitle{

                font-size: 14pt;
                font-style: italic;
                font-weight: 400;
                padding-left: 20px;
                float: left;
                height:35px;
                width:580px;
                border: solid 1px lightgray;
                margin: 15px 15px 15px 5px;
                background-color:#f2f2f2;
                color: #6D6D6D;
                line-height:200%;
                border-radius: 5px;
                outline:none;
            }

            #stockName{

                font-size: 14pt;
                font-style: italic;
                font-weight: 400;
                padding-left: 20px;
                float: left;
                height:35px;
                width:280px;
                border: solid 1px lightgray;
                margin: 10px 15px 14px 5px;
                background-color:#f2f2f2;
                color: #6D6D6D;
                line-height:200%;
                border-radius: 5px;
                outline:none;
            }

            #tickerName{

                font-size: 14pt;
                font-style: italic;
                font-weight: 400;
                padding-left: 20px;
                float: right;
                height:35px;
                width:280px;
                border: solid 1px lightgray;
                margin: 10px 5px 15px 5px;
                background-color:#f2f2f2;
                color: #6D6D6D;
                line-height:200%;
                border-radius: 5px;
                outline:none;

            }



            #inputDiv{

                float: left;
                margin-left: 45px;
                height: 250px;
                width: 590px;
                /*border: solid 1px black;*/
            }


/*
            #profileicon{
                height:30px;
                width:30px;
                border-radius: 50px;
            }

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
                cursor: pointer;
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
            }*/



/*             #menu
            {
                background-color: white;
                font-size:16px;
                position: fixed;
                width: 100%;
                height: 50px;
                position: absolute;
                top:0;
                left:0;
           
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
            } */



        </style>
    </head>


    <body>


	<jsp:include page="statusBar.jsp" />
	
    <!-- <div id="menu">
        <ul>
            <li id="logo">
                    <img style="height:40px;" src="logo.png">
                    </li>  
            <li><a href="#"><img class="icon" src="home_icon.png" height="30px"/>Home</a></li>
            <li><a href="#"><img class="icon" src="answer_icon.png" height="25px"/>Answer</a>
            </li>
            <li><a href="#"><img class="icon" src="notification_icon.png" height="25px"/>Notifications</a>

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
    </div> --%> -->

    <form name="form" method="post" action = "createpost.jsp">
        <div id="outerContainer"
             style="
            width: 680px;
            height: auto;
            margin : 0px auto 0 auto;
            background-color: #f2f2f2;
            box-shadow:0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
            border-radius: 5px;
            /*border: solid 1px green;*/
            /*clear:both;*/
            overflow:auto;
            position:relative;
            top:50px;
            ">


            <div id="topPart" style="
                background-color: #fefefe;
                width:  680px;
                height: 430px;
                /*border: solid 1px black;*/
                float: left;
                /*margin-top: 60px;*/
                border-radius: 5px;
                /*margin-bottom: px"
            >

                <div style="font-size: 18pt;margin: 20px 10px 5px 50px;font-weight: bold;">
                    New Post
                </div>




                <div id="inputDiv">
                
                    <textarea name = "question" rows="10" cols="55" placeholder="Write question/comment" required
                              style="
                    resize: none;
                    background-color:#f2f2f2;
                    border-radius: 5px;
                    margin-left: 5px;
                    margin-top: 2px;
                    border: solid 1px lightgray;
                    padding-left: 10px;
                    font-size: 14pt;
                    outline: none;
                    color: #6D6D6D;
                    "></textarea>

                    <input type="text" id="stockName" name="stockNameInput" placeholder="Stock Name" required><br>

                    <input type="text" id="tickerName" name="tickerNameInput" placeholder="Stock Ticker"><br>

                    <select name="options" style="
                    background-color: #f2f2f2;
                    border: solid 1px lightgray;
                    margin-left: 5px;
                    margin-top: 10px;
                    margin-bottom: 25px;
                    width: 580px;
                    height: 35px;
                    outline: none;
                    font-size: 10pt;
                    font-style: italic;
                    ">
                        <option value="Technology">Technology</option>
                        <option value="Energy">Energy</option>
                        <option value="Automotive">Automotive</option>
                        <option value="Biotech">Biotech</option>
                        <option value="FoodBeverage">Food and Beverage</option>
                        <option value="E-Commerce">E-Commerce</option>
                        <option value="Oil">Oil/Gas/Natural Energy</option>
                        <option value="RealEstate">Real Estate</option>
                        <option value="Cryptocurrency">Cryptocurrency</option>

                    </select>

                    
                </div>
         	</div>

            <div id="lowerPart" style="
                height: 70px;
                width:  680px;float: left;
                /*border: solid 1px pink;*/
                ">
                <button type="button" onclick="location.href='GeneralFeed.jsp';"
                        style="
                        float: left;
                        margin-top: 15px;
                        margin-left: 410px;
                        width: 100px;
                        height: 40px;
                        border-radius: 5px;
                        border: none;
                        font-size: 12pt;
                        color: white;
                        background-color: lightgray;
                        cursor: pointer;
                        outline: none;
                ">Cancel</button>

                <button type="submit"
                        style="
                        float: right;
                        width: 100px;
                        height: 40px;
                        border-radius: 5px;
                        border: none;
                        font-size: 12pt;
                        color: white;
                        background-color: #4775d1;
                        margin-top: 15px;
                        margin-right:50px;
                        cursor: pointer;
                        outline: none;

                ">Submit</button>
           </div>
        </div><%-- container--%>
    </form>
 </body>
</html>
