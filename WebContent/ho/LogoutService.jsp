<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String projectName = "/HoProject"; %>
	
<% 
session.invalidate();
response.sendRedirect(projectName+"/logout.ho?cmd=shop-main");

%>
