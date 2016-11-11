<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
 %>
 
 <% 
	String projectName = "/HoProject";
  
 	response.sendRedirect(projectName+"/main.ho?cmd=goodsview&name1="+request.getParameter("name")+"&name="+request.getParameter("id")+"&id="+request.getParameter("name1"));	

 	%>

 