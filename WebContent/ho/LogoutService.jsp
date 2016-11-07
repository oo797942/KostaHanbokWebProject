<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
String sess = request.getParameter("a");
System.out.println("ajax내의 세션값(이프밖)"+sess);
if(sess != null){
	
	session.removeAttribute("yourid");%>
	
	<%System.out.println("ajax내의 세션값(이프안)"+sess);
	}else{
	response.sendRedirect("HoMainForm.jsp");	
	}
%>
