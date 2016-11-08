<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String projectName = "/HoProject";
	String id = request.getParameter("userId");
	Object obj = request.getAttribute("result");
	Integer result = 0;
	if(obj!=null){
		result = (Integer)obj;	
	}
	 
%>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 아이디 중복 확인 </title>
<script type="text/javascript" src = "<%=projectName %>/ho/js/jquery-3.1.1.js"></script>
<script type="text/javascript">

	$(function(){
		$("#useId").hide();
	
		var res =<%=result%>;
		if(res==1){
			$("#isDup").text("중복입니다.");
			$("#useId").hide();
		}else{
			$("#isDup").text("사용할수 있는 아이디입니다.");
			$("#useId").show();

		}
		$("[name='useId']").click(function(){
			var id = $("#check").val();
			$(opener.document).find("[name='id']").val(id);	
			$(opener.document).find("[name='id']").attr("readonly","readonly");
			window.close();
		});
	
		
		
// 		$("[name='useId']").click(function(){
// 			var id = $("#check").val();
// 			$(opener.document).find("[name='id']").val(id);	
// 			$(opener.document).find("[name='id']").attr("readonly","readonly");
// 			window.close();
// 		});
		
	});
	function openWin() {
		var id = document.getElementById("check").value;
		
		window.location.href = "<%=projectName%>/ck.ho?cmd=check-id&userId=" + id;
	}
	
	
</script>
</head>
<body> 
<input type="text" size="10" name="check" id = 'check' maxlength="10" value="<%=id%>"/>
<input type="button" value="중복확인"  onclick="openWin()"><br/>

<text id="isDup"></text>
<input type="button" size="10" id="useId" name="useId" value="아이디사용"/><br/>	
</body>
</html>