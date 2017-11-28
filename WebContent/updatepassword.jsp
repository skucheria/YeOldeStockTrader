<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Database.*" import="Classes.*" import = "java.util.ArrayList"%>
    
<%
	String pass = request.getParameter("new");
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	DatabaseFunction.updatePassword(pass, currentUser.getUsername());
%>

