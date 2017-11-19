<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList" import = "java.time.*" import = "java.time.format.DateTimeFormatter"
    import = "java.text.*" import = "java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");

	String author = currentUser.getUsername();
	String title = request.getParameter("titleInput"); //getting the title
	String stockName = request.getParameter("stockNameInput"); //getting the title
	String ticker = request.getParameter("tickerNameInput"); //getting the title
	String category = request.getParameter("options"); //getting the title
	String question = request.getParameter("question"); //getting the title
    
    DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
    Calendar cal = Calendar.getInstance();
    String day = dateFormat.format(cal.getTime()).substring(0, dateFormat.format(cal.getTime()).indexOf(" "));
    String time = dateFormat.format(cal.getTime()).substring(dateFormat.format(cal.getTime()).indexOf(" ")+1, dateFormat.format(cal.getTime()).length());
    
    System.out.println(author);
    System.out.println(stockName);
    System.out.println(ticker);
    System.out.println(question);
    System.out.println(day);
    System.out.println(time);
    System.out.println(category);

    
    
    
 	DatabaseFunction.createPost(author, stockName, ticker, question, day, time, category);
 
 	request.getSession().setAttribute("currentUser", currentUser);
 	response.sendRedirect("GeneralFeed.jsp");
	/* RequestDispatcher dispatch = request.getSession().getServletContext().getRequestDispatcher("/GeneralFeed.jsp");
	dispatch.forward(request, response); */
	

%>
</body>
</html>