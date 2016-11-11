<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		String projectName = "/HoProject";
		response.sendRedirect(projectName+"/coin.ho?cmd=coin-charge");
	%>

</body>
</html>