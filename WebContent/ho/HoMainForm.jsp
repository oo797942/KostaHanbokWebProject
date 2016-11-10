<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String projectName = "/HoProject"; 
	String sessionValue = null;
	String loginCk="LOGIN"; 
	//# 1."yourid"로 저장된 세션값을 얻어온다.
	Object sess = session.getAttribute("yourid");
	//# 2. 값이 null이라면 LoginForm.jsp로 페이지 이동
	//# 3. null이 아니라면 String 형변환하여 변수에 지정
	System.out.println("세션값"+sess);
	if(sess != null){
		sessionValue = (String)sess;
		loginCk="LOGOUT";
	}   
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=text/html; charset=UTF-8">
<title>Ho</title>
<link rel="stylesheet" type="text/css" href="<%= projectName %>/ho/css/jquery.bxslider.css"
	media="all" />
<link rel="stylesheet" type="text/css" href="<%= projectName %>/ho/css/HoMainForm.css" media="all" />
<style type="text/css">
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: black; text-decoration: underline;}
</style>
<script src="<%= projectName %>/ho/js/jquery-3.1.1.min.js"></script>
<script src="<%= projectName %>/ho/plugin/jquery.bxslider.min.js"></script>
<script src="<%= projectName %>/ho/plugin/jquery.fitvids.js"></script>
<script type="text/javascript" src="<%= projectName %>/ho/js/HoMainForm.js"></script>
<script type="text/javascript">	
$(function(){
	
	var a = "<%=loginCk%>";
	if(a=="LOGOUT"){
		$("#adlogin").attr('name',"logout");
	}else{
		
	}
	
	$('[name="logout"]').click(function() {
		var param = {a:"<%=sess%>"};
		$.get("<%=projectName%>/logout.ho?cmd=logout-page",param,kkk);
		$("#footmenu").hide();
	}).css('cursor','pointer');

	
	$.ajax({			
			url : '<%=projectName%>/logout.ho?cmd=product-page',
			type : 'post',
			success : function(data){
// 				alert(data);
				<%-- var data12 = $('person', data);
					$('#productimg').append("<tr>");
				data12.each(function(){
					var text = $('name',this).text();
					$('#productimg').append("<td>"+"<img width='180px' height='180px' src=<%=projectName%>/ho/upload/"+text+"></td>");
				});	
					$('#productimg').append("</tr>"); --%>
			},
			error : function(){
				alert('에러 발생');	
			}
	});
	
	
	
});
	function kkk(){
		
	<%if(sess==null){%>
		$("#adlogin").attr("name","login");
	<%loginCk="LOGIN";
			System.out.println(loginCk);%>
			<%}%>
			$("#cmd").attr("name","main-page");
			document.log_f.action="<%= projectName %>/xxxxx.ho?";
			document.log_f.submit();
	}
</script>
</head>
<body>
	<header>
		<div>
			<ul id="slide_banner">
				<li><div>
						<iframe id="movie" width=100% height=52%
							src="https://www.youtube.com/embed/1ya6sytK1Zw?autoplay=1&loop=1&playlist=1ya6sytK1Zw&modestbranding=1&controls=0&showinfo=0"
							frameborder="0" allowfullscreen>
					</div>
					</iframe></li>
				<li><img width=100% height=100% alt="사진1"
					src="<%= projectName %>/ho/img/slideimg1.jpg"></li>
				<li><img width=100% height=100% alt="사진2"
					src="<%= projectName %>/ho/img/slideimg2.jpg"></li>
				<li><img width=100% height=100% alt="사진3"
					src="<%= projectName %>/ho/img/slideimg3.jpg"></li>
			</ul>
		</div>

		<div id="logoimg">
			<a href="HoMainForm.jsp"><img src="<%= projectName %>/ho/img/logo.jpg"></a>
		</div>


		<div id="SideMenu">
			<ul class="sm1">
				<li id="news" class="sm">NEWS</li>
				<a href="<%=projectName%>/gostore.ho?cmd=go-store" style="text-decoration:none"><li id="store" class="sm">STORE</li></a>
				<li id="about" class="sm">ABOUT</li>
				<li id="product" class="sm">PRODUCT</li>
			</ul>
		</div> 

		<div id="menu">
			<img src="<%= projectName %>/ho/img/menu.png">
		</div>


		<div id="topMenu">
			<div id="Menuimg">
				<a href="HoMainForm.jsp"><img src="<%= projectName %>/ho/img/logo.jpg"></a>
			</div>
			<div id="topCate">
				<a id="top-CateItem1">개량한복</a> <br />
				<br /> <a id="top-CateItem2">생활한복</a> <br />
				<br /> <a id="top-CateItem3">퓨전한복</a> <br />
				<br /> <a id="top-CateItem4">아동한복</a> <br />
				<br /> <a id="top-CateItem5">악세서리</a>
			</div>

			<div id="topCate-Cate1">
				<a class="man">남 자</a> <br /> <a class="woman">여 자</a>
			</div>
			<div id="topCate-Cate2">
				<a class="man">남 자</a> <br /> <a class="woman">여 자 </a>
			</div>
			<div id="topCate-Cate3">
				<a class="man">남 자 </a><br /> <a class="woman">여 자 </a>
			</div>
			<div id="topCate-Cate4">
				<a class="man">남 자</a> <br /> <a class="woman">여 자 </a>
			</div>
			<a id="topXbutton">X</a>
		</div>
		<div id="topimage">
			<img />
		</div>

		<div id="ContentBackground"></div>
		<div id=newsContent class="Content">
			<div class="path">
				<img alt="NEWS" src="<%= projectName %>/ho/img/company1.jpg">
				<img alt="NEWS" src="<%= projectName %>/ho/img/NEWS.jpg">
			</div>
			<a class="contentXbutton">X</a>
			<img alt="NEWS" src="<%= projectName %>/ho/img/depart.jpg">
			<img alt="NEWS" src="<%= projectName %>/ho/img/depart2.jpg">
			<hr size="3"><br/>
			<img alt="NEWS" src="<%= projectName %>/ho/img/day.jpg">
			<table>
			<tr>
			<td><img alt="NEWS" src="<%= projectName %>/ho/img/day2.jpg" ></td>
			<td><img alt="NEWS" src="<%= projectName %>/ho/img/day1.png"></td>
			</tr>
			</table>	 
		
		</div>
	

		<div id=aboutContent class="Content">
			<div class="path">
			<img alt="회사소개" src="<%= projectName %>/ho/img/company1.jpg">
			<img alt="회사소개" src="<%= projectName %>/ho/img/about.jpg">
			</div>
			<a class="contentXbutton">X</a> 
			<img alt="회사소개" src="<%= projectName %>/ho/img/Company.jpg" class="align"><br/>
			<img alt="회사소개글" src="<%= projectName %>/ho/img/HO_text.png" class="align">
			<img alt="회사소개글" src="<%= projectName %>/ho/img/HO_text2.png" class="align" >
		</div>

		<div id=productContent class="Content">
			<a class="contentXbutton">X</a> 
			<div class="path">
			<img alt="상품" src="<%= projectName %>/ho/img/company1.jpg">
			<img alt="상품" src="<%= projectName %>/ho/img/product.jpg">
			</div>
				<img alt="수지" src="<%= projectName %>/ho/img/tableproduct.jpg">		
			<a class="contentXbutton">X</a>
				<!-- img 사이즈 180x180 가로 5장 세로 3장 -->
				<table style="border: 1px solid white-space; width:60%; height: 100px; margin: auto; ">
		
				<tbody id = "productimg">
				
				</tbody>
		
			<%-- 	<tr >
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg">	</td>	
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg">	</td>	
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg">	</td>	
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg"></td>			
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg">	</td>
				</tr>
				<tr>
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg">	</td>	
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg"></td>			
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg"></td>			
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg"></td>			
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg">	</td>
				</tr>
					<tr>
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg">	</td>	
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg"></td>			
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg"></td>			
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg"></td>			
					<td><img alt="수지" src="<%= projectName %>/ho/img/suzi.jpg">	</td>
				</tr> --%>
				</table>
		</div>

	</header>

	<footer>
		<div id="admin">
			<text id="adlogin" name= "login"><%=loginCk%></text>
		</div>
		<form action="<%= projectName %>/xxxxx.ho?" method="get" name="log_f" id="login_f">
			<input type="hidden" id="cmd" name="cmd" value="login-page" >
			<div id="footmenu">
				<table>
					<tr>
						<td></td>
						<td id="foottop" align="center">X</td>
					</tr>
					<tr>
						<td>id</td>
						<td><input type="text" name="adid" id="adid" /></td>
					</tr>
					<tr>
						<td>pw &nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><input type="text" id="adpw" name="adpw" /></td>
					</tr>
					<tr>
						<td></td>
						<td align="left"><input type="submit" id="ok" value="login" /></td>
					</tr>
				</table>
			</div>
		</form>

		
	</footer>




</body>
</html>