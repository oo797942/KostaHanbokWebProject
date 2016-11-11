<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="ho.model.HoGoods"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%

	String result =  null;
	Object obj =request.getAttribute("result");
	int su = 0;
	if(obj!=null) su = (int)obj; result = Integer.toString(su);
	
	System.out.println("result 는 : " + result);
	
	out.write(result);
%>