<%@ page contentType ="text/html; charset=UTF-8"%>

<%
	String projectName = "/HoProject";
%>

<%
Object sess = session.getAttribute("yourid");

response.sendRedirect(projectName+"/mypage.ho?cmd=go-mypage&adid="+sess);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>


</body>
</html>