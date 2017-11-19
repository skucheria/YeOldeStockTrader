<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="Classes.*"
	import="java.util.concurrent.TimeUnit"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Stock Ticker</title>
<link rel="stylesheet" href="Ticker.css">
</head>
<body>
	<%
		if (request.getSession().getAttribute("stockList") == null) {
			StockList stockList = new StockList();
			request.getSession().setAttribute("stockList", stockList);
		}

		String[][] table;
		while (true) {
			StockList listStocks = (StockList) (request.getSession().getAttribute("stockList"));
			if (listStocks != null) {
				table = listStocks.getTable();
				break;
			} else {
				TimeUnit.SECONDS.sleep(1);
			}
		}
	%>
	
<head>
	<meta charset="utf-8" />
	<title>Table Style</title>
	<meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">
</head>

<body>
<table class="table-fill">
<thead>
<tr>
<th class="text-left">Ticker</th>
<th class="text-left">Price</th>
</tr>
</thead>
<tbody class="table-hover">
<%
for (int i = 1; i < table.length; i++) {
	if (table[i][0] != null) {
%>
<tr>
<td class="text-left"><%=table[i][table[i].length-1]%></td>
<td class="text-left"><%=table[i][0]%></td>
</tr>
<%
	}
}
%>
</tbody>
</table>
</body>
</html>