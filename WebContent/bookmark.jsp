<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList"%>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	String id = request.getParameter("postID"); 
	int postnum = Integer.valueOf(id);
	DatabaseFunction.bookmark(postnum, currentUser.getUsername());
%>
