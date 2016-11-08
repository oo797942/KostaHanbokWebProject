<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>

<%@ page import="ho.model.HoMember" %> 
<% String projectName = "/HoProject"; 
	 
	HoMember member=null;
	Object obj =request.getAttribute("MemUpdate");
	
	if(obj !=null) member = (HoMember)obj;
	 
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%response.sendRedirect(projectName+"/xxx.ho?cmd=adminMemlist"); %>

</body>
</html>