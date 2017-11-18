<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="Classes.*" import="java.util.concurrent.TimeUnit"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Stock Ticker</title>
<link rel="stylesheet" href = "Ticker.css">
</head>
<body>
	<%
		if(request.getSession().getAttribute("stockList") == null){
			StockList stockList = new StockList();
			request.getSession().setAttribute("stockList", stockList);
		}
	
		String[][] table;
		while(true){
			StockList listStocks = (StockList)(request.getSession().getAttribute("stockList"));
			if(listStocks != null){
				table = listStocks.getTable();
				break;
			}
			else{
				TimeUnit.SECONDS.sleep(1);
			}
		}
	%>
	<table id="stockTicker">
		<%
			for (String[] list : table) {
		%>
		<tr>
			<%
				for (String item : list) {
			%>
			<td><%=item%></td>
			<%
				}
			%>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>