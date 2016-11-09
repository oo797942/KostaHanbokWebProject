<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ho.model.HoBoard"%>
<%@page import="java.util.List"%>

   <% String projectName = "/HoProject"; 
	String sessionValue = null;
	Object sess = session.getAttribute("yourid");
	if(sess == null){
		response.sendRedirect(projectName+"/hoho.ho?cmd=login-check");
	}
	
	List<HoBoard> boards=null;
	Object obj =request.getAttribute("BoardList");

	System.out.println(obj);
	if(obj !=null) boards = (List<HoBoard>)obj;

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=projectName %>/ho/css/jquery.bxslider.css" rel="stylesheet" />
<link href="<%=projectName %>/ho/css/main.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=projectName %>/ho/css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=projectName %>/ho/css/style2.css" type="text/css" media="all" />
<script src="<%=projectName %>/ho/js/jquery-1.10.2.min.js"></script>
<script src="<%=projectName %>/ho/js/jquery.bxslider.min.js"></script>
<script src="<%=projectName %>/ho/js/main.js"></script>
<style type="text/css">
#id,#name,#title,#content{
	float:right;
}
.form td{
	height:50px;
}
</style>
	
<script type="text/javascript">

$(function(){

	if("<%=sessionValue%>"=="null"){
		$("#shoplogin").show();
		$("#shoplogout").hide();
	}else{
		$("#shoplogin").hide();
		$("#shoplogout").show();
	}
	
	$("#shoplogin").click(function(){
		window.open("<%=projectName%>/shoplogin.ho?cmd=shoplogin-page", '_blank', 'width=290, height=380, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no' );	
		
	}).css('cursor','pointer');
	
	
	$("#shoplogout").click(function() {
		alert("로그아웃클릭하고 세션값 :<%=session.getAttribute("yourid")%>");

		window.location = "<%=projectName%>/logout.ho?cmd=logout-page";

		$("#shoplogout").hide();
		$("#shoplogin").show();
	
	}).css('cursor','pointer');
	
	$("#NoLoginMyPage").click(function(){
		window.open("<%=projectName%>/shoplogin.ho?cmd=shoplogin-page", '_blank', 'width=290, height=380, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no' );			
	});
	

	
	$("#searchInput").keypress(function(event){
		if(event.which == 13){
			var option = $("#searchCategory").val();
			var radio = $("input:radio[name=searchRadio]:checked").val();
			var inputvalue = $("#searchInput").val();
			window.location.href="<%=projectName%>/list.ho?cmd=search-input&option="+option+"&check="+radio+"&val="+inputvalue;			
		}
	});
	
	
});



</script>



</head>
<body>

 
	<header>
		<div id="menu">
			<img src="<%=projectName %>/ho/img/topMenu.png" />
		</div>
		<div id="Menuimg">
			<a href="<%=projectName%>/gostore.ho?cmd=go-store"><img id="logo" src="<%=projectName %>/ho/img/logo.png" /></a>
		</div>
		<div id="topMenu">
			<table id="smallMenu">
				<tr>
				<% if(sess != null){ %> 
				<td><text id="sessid"><%=sess %>님</text></td>
				<%} %>	
					<td><text id="shoplogin" name="login" >LOGIN</text></td>
					<td><text id="shoplogout" name="logout">LOGOUT</text></td>
					<td class="gray">l</td>
					<td><a href="<%=projectName %>/join.ho?cmd=join-form">JOIN</a></td>
					<td class="gray">l</td>
					<td><a href="#">CART</a></td>
					<td class="gray">l</td>
					<%if(sess!=null){ %>
					<td><a href="<%=projectName%>/mypage.ho?cmd=go-mypage&adid=<%=sess%>">MY PAGE</a></td>
					<%}else{ %>
					<td><a id="NoLoginMyPage">MY PAGE</a></td>
					<%} %>
					<td class="gray">l</td>
					<td><a href="<%=projectName%>/logout.ho?cmd=write-form">Q&A</a></td>
				</tr>
			</table>

			<div id="topCate">
				<a id="top-CateItem1">개량한복</a><br /> <br /> <a id="top-CateItem2">생활한복</a><br />
				<br /> <a id="top-CateItem3">퓨전한복</a><br /> <br /> <a
					id="top-CateItem4">아동한복</a><br /> <br />
					<a id="top-CateItem5"  href="<%=projectName%>/list.ho?cmd=search-category&category=악세서리">악세서리</a>
			</div>
			<div id="topCate-Cate1">
				<a class="man"  href="<%=projectName%>/list.ho?cmd=search-category&category=개량 한복 -남">남 자</a><br />
				<a class="woman"  href="<%=projectName%>/list.ho?cmd=search-category&category=개량 한복 -여">여 자</a>
			</div>
			<div id="topCate-Cate2">
				<a class="man"  href="<%=projectName%>/list.ho?cmd=search-category&category=생활 한복 -남">남 자</a><br />
				<a class="woman"  href="<%=projectName%>/list.ho?cmd=search-category&category=생활 한복 -여">여 자</a>
			</div>
			<div id="topCate-Cate3">
				<a class="man"  href="<%=projectName%>/list.ho?cmd=search-category&category=퓨전 한복 -남">남 자</a><br />
				<a class="woman"  href="<%=projectName%>/list.ho?cmd=search-category&category=퓨전 한복 -여">여 자</a>
			</div>
			<div id="topCate-Cate4">
				<a class="man" href="<%=projectName%>/list.ho?cmd=search-category&category=아동 한복 -남">남 자</a><br />
				<a class="woman" href="<%=projectName%>/list.ho?cmd=search-category&category=아동 한복 -여">여 자</a>
			</div>
			<a id="searchBtn">search</a> <a id="xbutton">X</a>
			<hr color="#f5f5f5" size="1" noshade="noshade" />
		</div>

		<div id="topSearch">
			<input type="text" id="searchInput" autocomplete="off"
				placeholder="Type Here To Search" /> <select id="searchCategory"
				name="searchCategory">
				<option value="total">통합검색</option>
				<option value="ge">개량 한복</option>
				<option value="se">생활 한복</option>
				<option value="fu">퓨전 한복</option>
				<option value="ah">아동 한복</option>
				<option value="ak">악세서리</option>
			</select> <input type="radio" id="titleSearch" name="searchRadio" value="title"
				class="searchRadio" checked="checked"/> <label class="searchLabel" for="titleSearch">상품 이름</label>
			<input type="radio" id="contentSearch" name="searchRadio" value="content"
				class="searchRadio" /> <label class="searchLabel"
				for="contentSearch" class="searchRadio">내용</label>
		</div>

	</header>
<section>

	<h2>Contact Form</h2>
	
	<form class="form" action="<%=projectName%>/qa.ho?" method="post">
	<input type="hidden" name=cmd value="qna-input"/>
		<table>
		<tr>
		<td height="40px">
		<p class="id">
			<label for="id">id</label>
			<input type="text" name="id" id="id" value="<%=sess%>" />
		
		</p>
		<br/>
		</td>
		</tr>
		
		<tr>
		<td height="40px">
		<p class="name">
			<label for="name">Name</label>
			<input type="text" name="name" id="name"  />
			
		</p>
		<br/>
		</td>
		</tr>
		
		<tr>
		<td height="40px">
		<p class="title">
			<label for="title">Title</label>
			<input type="text" name="title" id="title"  />
			
		</p>
		<br/>
		</td>
		</tr>
		
		<tr>
		<td>	
		<p class="text">
			<textarea name="content" id="content" placeholder="Write something to us" /></textarea>
		</p>
		<br/>
		</td>
		</tr>
		
		<tr>
		<td>
		<p class="submit">
			<input type="submit" value="Send" />
		</p>
		</td>
		</tr>
		</table>
	</form>

</section>

<footer>
		<div id="footertitle">
			<a href="#"><img src="/HoProject/ho/img/footerTitle.png" /></a>
		</div>
		<div id="topfooter">
			<table id="footerTable">
				<tr>
					<td class="rightBorder" width="256px"><strong>고객센터</strong><br />
						<br /> 상담가능시간 : 오전 9시~오후 6시 (토요일 및 공휴일 휴무)<br /> 경기도 성남시 분당구 삼평동
						682 유스페이스2 B동 8층<br /> Tel : 010-1234-5678 :: Fax : 02-1234-5678
						<br /> Mail : admin@kosta.co.kr</td>
					<td class="rightBorder" width="256px"><strong>(주)HO</strong><br />
						<br /> 경기도 성남시 분당구 삼평동 682 (유스페이스2 B동 8층)<br /> 대표이사 : 이강문<br />
						사업자등록번호 : 123-45-67890<br /> 통신판매업신고 : 코스타 123456호<br /> <br /></td>
					<td class="rightBorder" width="256px"><strong>전자금융
							분쟁처리</strong><br /> <br /> Tel : 1588-0184 Fax : 02-589-8833<br /> Mail
						: mediation@corp.auction.co.kr<br /> 저작권침해신고<br /> <br /> <br />
						<br /></td>
					<td width="256px"><strong>시티은행 채무지급보증 안내</strong><br /> <br />
						당사는 고객님이 현금 결제한 금액에 대해<br /> 시티은행과 채무지급보증 계약을 체결하여<br /> 안전거래를
						보장하고 있습니다.<br /> <br /> <br /> <br /></td>
				</tr>
			</table>
		</div>
		<div id="botfooter">
			<table>
				<tr>
					<td colspan="4"><span style="color: #808080">(주) 143기
							2조의 사전 서면 동의 없이 HO 한복점의 일체의 정보, 콘텐츠 및 UI등을 상업적 목적으로 전재, 전송, 스크래핑
							등 무단 사용할 수 없습니다.</span><br /> <span style="color: #4169e1">HO
							한복점은 통신판매의 당사자입니다. 따라서 HO 한복점은 상품 · 거래정보 및 거래에 대하여 책임을 집니다.<br />
							<span style="color: #808080">Copyright ©<strong>
									Kosta HO Korea Co., Ltd.</strong> All rights reserved.
						</span><br /></td>
				</tr>
			</table>
		</div>
	</footer>


</body>
</html>