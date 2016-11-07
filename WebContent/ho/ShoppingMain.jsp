<%@ page contentType="text/html; charset=UTF-8"%>

<% String projectName = "/HoProject";
	String sessionValue = null;
//# 1."yourid"로 저장된 세션값을 얻어온다.
	Object sess = session.getAttribute("yourid");
//# 2. 값이 null이라면 LoginForm.jsp로 페이지 이동
//# 3. null이 아니라면 String 형변환하여 변수에 지정
System.out.println("세션값"+sess);

if(sess != null){
	sessionValue = (String)sess;
} %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: HO[好]에 오신 것을 환영합니다 ::</title>

<link href="<%=projectName %>/ho/css/jquery.bxslider.css" rel="stylesheet" />
<link href="<%=projectName %>/ho/css/main.css" rel="stylesheet" />
<script src="<%=projectName %>/ho/js/jquery-1.10.2.min.js"></script>
<script src="<%=projectName %>/ho/js/jquery.bxslider.min.js"></script>
<script src="<%=projectName %>/ho/js/main.js"></script>
<script type="text/javascript">
$(function(){

	if("<%=sessionValue%>"=="null"){
		alert("여기 1");
		$("#shoplogin").show();
		$("#shoplogout").hide();
	}else{
		alert("여기 2");
		$("#shoplogin").hide();
		$("#shoplogout").show();
	}
	
	$("#shoplogin").click(function(){
		window.open("<%=projectName%>/shoplogin.ho?cmd=shoplogin-page", '_blank', 'width=290, height=380, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no' );	
		
	}).css('cursor','pointer');
	
	
	$("#shoplogout").click(function() {
		alert("로그아웃클릭하고 세션값 :<%=session.getAttribute("yourid")%>");
		var param = {a:"k", fromWhere:"shop"};

		$.get("<%=projectName%>/logout.ho?cmd=logout-page",param,kkk);
		$("#shoplogout").hide();
		$("#shoplogin").show();
	
	}).css('cursor','pointer');
	
});
function kkk(result){
	
}



</script>



</head>
<body>


	<header>
		<div id="menu">
			<img src="<%=projectName %>/ho/img/topMenu.png" />
		</div>
		<div id="Menuimg">
			<a href="#"><img id="logo" src="<%=projectName %>/ho/img/logo.png" /></a>
		</div>
		<div id="topMenu">
			<table id="smallMenu">
				<tr>
					<td><text id="shoplogin" name="login" >LOGIN</text></td>
					<td><text id="shoplogout" name="logout">LOGOUT</text></td>
					<td class="gray">l</td>
					<td><a href="#">JOIN</a></td>
					<td class="gray">l</td>
					<td><a href="#">CART</a></td>
					<td class="gray">l</td>
					<td><a href="#">MY PAGE</a></td>
					<td class="gray">l</td>
					<td><a href="#">Q&A</a></td>
				</tr>
			</table>

			<div id="topCate">
				<a id="top-CateItem1">개량한복</a><br /> <br /> <a id="top-CateItem2">생활한복</a><br />
				<br /> <a id="top-CateItem3">퓨전한복</a><br /> <br /> <a
					id="top-CateItem4">아동한복</a><br /> <br /> <a id="top-CateItem5">악세서리</a>
			</div>
			<div id="topCate-Cate1">
				<a class="man">남 자</a><br /> <a class="woman">여 자</a>
			</div>
			<div id="topCate-Cate2">
				<a class="man">남 자</a><br /> <a class="woman">여 자</a>
			</div>
			<div id="topCate-Cate3">
				<a class="man">남 자</a><br /> <a class="woman">여 자</a>
			</div>
			<div id="topCate-Cate4">
				<a class="man">남 자</a><br /> <a class="woman">여 자</a>
			</div>
			<a id="searchBtn">search</a> <a id="xbutton">X</a>
			<hr color="#f5f5f5" size="1" noshade="noshade" />
		</div>

		<div id="topSearch">
			<input type="text" id="searchInput" autocomplete="off"
				placeholder="Type Here To Search" /> <select id="searchCategory"
				name="searchCategory">
				<option value="total">통합검색</option>
				<option value="ge">개량한복</option>
				<option value="se">생활한복</option>
				<option value="fu">퓨전한복</option>
				<option value="ah">아동한복</option>
				<option value="ak"">악세서리</option>
			</select> <input type="radio" id="titleSearch" name="searchRadio" value="제목"
				class="searchRadio" /> <label class="searchLabel" for="titleSearch">제목</label>
			<input type="radio" id="contentSearch" name="searchRadio" value="내용"
				class="searchRadio" /> <label class="searchLabel"
				for="contentSearch" class="searchRadio">내용</label>
		</div>

	</header>
	<section>
		<div id="banner_wrap">
			<ul id="slide_banner">
				<li><img class="slide"
					src="<%=projectName %>/ho/img/banner_image_01.jpeg" alt="사진1" /></li>
				<li><img class="slide"
					src="<%=projectName %>/ho/img/banner_image_02.png" alt="사진2" /></li>
				<li><img class="slide"
					src="<%=projectName %>/ho/img/banner_image_03.jpg" alt="사진2" /></li>
			</ul>
		</div>
		<table id="slidefocus">
			<tr>
				<td id="slide1">오늘의 상품</td>
			</tr>
			<tr>
				<td id="slide2">계절 맞춤</td>
			</tr>
			<tr>
				<td id="slide3">어쩌구 저쩌구</td>
			</tr>
			<tr>
				<td id="slide4">행복하자 우리</td>
			</tr>
			<tr>
				<td id="slide5">아프지말고</td>
			</tr>
		</table>

		<img src="<%=projectName %>/ho/img/banner_image_01.jpeg" class="hotItem"
			name="hot1" /> <img src="<%=projectName %>/ho/img/banner_image_01.jpeg"
			class="hotItem" name="hot2" /> <img
			src="<%=projectName %>/ho/img/banner_image_01.jpeg" class="hotItem"
			name="hot3" /> <img src="<%=projectName %>/ho/img/banner_image_01.jpeg"
			class="hotItem" name="hot4" />


	</section>
	<footer>
		<div id="footertitle">
			<a href="#"><img src="<%=projectName %>/ho/img/footerTitle.png" /></a>
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