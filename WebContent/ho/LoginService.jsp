<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ho.model.HoMember"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<% 
	String projectName="/HoProject";
	// 실제로는 DB에서 가져와야하는 값
// 	String saveUser = "rkdans79";
// 	String savePass = "1234";
	
// 	// 이전화면 폼에서 넘겨받는 값
// 	String user = request.getParameter("adid");
// 	String pass = request.getParameter("adpw");
			
	// user, password가 같을 때 로그인 성공, 그렇지 않으면 로그인 실패
	HoMember hm = null;
	
	hm = (HoMember)request.getAttribute("homem");
	if( hm != null ){
		// #2. 세션에 "id"라는 이름에 변수 user 값을 저장
		System.out.println("로그인성공");
		session.setAttribute("yourid",hm.getMemId());
		
		// #1. 로그인 성공하면 바로 MainPage.jsp를 요청
		response.sendRedirect(projectName+"/main.ho?cmd=main-page");
	} else {
		System.out.println("로그인실패");
		// #1. 로그인에 실패하면 바로 LoginForm.jsp을 요청
		response.sendRedirect(projectName+"/main.ho?cmd=main-page");
	}			
%>
</body>
</html>