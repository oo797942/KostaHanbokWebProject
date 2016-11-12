<%@ page contentType ="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%
String projectName = "/HoProject";
 %>
 
 <%
	String id = (String) session.getAttribute("yourid");
	String itemname = request.getParameter("itemname");
	String img = request.getParameter("imgs");
	String shopid = request.getParameter("itemno");
	
 response.sendRedirect(projectName+"/view.ho?cmd=goods-view&id="+shopid+"&name="+itemname+"&name1="+shopid); 
 
 
 %>


</body>
</html>