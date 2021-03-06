<%@page import="ho.model.HoBag"%>
<%@page import="java.util.List"%>
<%@page import="ho.model.HoMember"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String projectName = "/HoProject";
	String sessionValue = null;
	HoMember hm = null;
	List bagList = null;
	//# 1."yourid"로 저장된 세션값을 얻어온다.
	Object sess = session.getAttribute("yourid");
	//# 2. 값이 null이라면 LoginForm.jsp로 페이지 이동
	//# 3. null이 아니라면 String 형변환하여 변수에 지정
	System.out.println("세션값" + sess);

	if (sess != null) {
		sessionValue = (String) sess;
		hm = (HoMember) request.getAttribute("homem");
		bagList = (List)request.getAttribute("baglist");
	}
	
	int yourCoin = 0;
	
if(	hm.getMemCoin() != null ){
	yourCoin = Integer.parseInt(hm.getMemCoin());
}

	 
%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: HO[好]에 오신 것을 환영합니다 ::</title>

<link href="<%=projectName%>/ho/css/jquery.bxslider.css" rel="stylesheet" />
<link href="<%=projectName%>/ho/css/main.css" rel="stylesheet" />
<link href="<%=projectName%>/ho/css/coin.css" rel="stylesheet" />
<script src="<%=projectName%>/ho/js/jquery-1.10.2.min.js"></script>
<script src="<%=projectName%>/ho/js/jquery.bxslider.min.js"></script>
<script src="<%=projectName%>/ho/js/main.js"></script>
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
			window.location.href="<%=projectName%>/list.ho?cmd=search-input&option="
										+ option
										+ "&check="
										+ radio
										+ "&val="
										+ inputvalue;
							}
						});
	
		$(".coinRadio").change(function(){
			if($("#1m").is(":checked")){
				$("#CoinInput").val("10000");
				$("#CoinInput").attr("readonly","readonly");
			}
			if($("#5m").is(":checked")){
				$("#CoinInput").val("50000");
				$("#CoinInput").attr("readonly","readonly");
			}
			if($("#10m").is(":checked")){
				$("#CoinInput").val("100000");
				$("#CoinInput").attr("readonly","readonly");
			}
			if($("#50m").is(":checked")){
				$("#CoinInput").val("500000");
				$("#CoinInput").attr("readonly","readonly");
			}
			if($("#100m").is(":checked")){
				$("#CoinInput").val("1000000");
				$("#CoinInput").attr("readonly","readonly");
			}
			if($("#selfM").is(":checked")){
				$("#CoinInput").removeAttr("readonly");
				$("#CoinInput").focus();
				$("#CoinInput").select();
			}
	
		});
		
		$("#payFinBtn").click(function(){
			
			if($("#CoinInput").val()<=0){
				alert("결제 금액을 입력해주세요.");
			}else if(!$(".PaySelect").is(":checked")){
				alert("결제 수단을 골라주세요.");
			}else{
				alert("결제가 완료되었습니다.");
				window.location.href="<%=projectName%>/coin.ho?cmd=coin-pay&coin="+$('#CoinInput').val()+"&id=<%=sessionValue%>";
			}
			
		});

	});
	

</script>



</head>
<body>

	<header>
		<div id="menu">
			<img src="<%=projectName%>/ho/img/topMenu.png" />
		</div>
		<div id="Menuimg">
			<a href="<%=projectName%>/gostore.ho?cmd=go-store"><img id="logo"
				src="<%=projectName%>/ho/img/logo.png" /></a>
		</div>
		<div id="topMenu">
			<table id="smallMenu">
				<tr>
					<%
						if (sess != null) {
					%>
					<td><text id="sessid"><%=hm.getMemName()%>님</text></td>
					<%
						}
					%>
					<td><text id="shoplogin" name="login">LOGIN</text></td>
					<td><text id="shoplogout" name="logout">LOGOUT</text></td>
					<td class="gray">l</td>
					<td><a href="<%=projectName%>/join.ho?cmd=join-form">JOIN</a></td>
					<td class="gray">l</td>	
					<%
						if (sess != null) {
					%>
					<td><a href="<%=projectName%>/coin.ho?cmd=coin-charge">COIN</a></td>
					<%
						} else {
					%>
					<td><a id="NoLoginMyPage">COIN</a></td>
					<%
						}
					%>
					<td class="gray">l</td>
					<%
						if (sess != null) {
					%>
					<td><a
						href="<%=projectName%>/mypage.ho?cmd=go-mypage&adid=<%=sess%>">MY
							PAGE</a></td>
					<%
						} else {
					%>
					<td><a id="NoLoginMyPage">MY PAGE</a></td>
					<%
						}
					%>
					<td class="gray">l</td>
					<td><a href="<%=projectName%>/logout.ho?cmd=write-form">Q&A</a></td>
				</tr>
			</table>

			<div id="topCate">
				<a id="top-CateItem1">개량한복</a><br /> <br /> <a id="top-CateItem2">생활한복</a><br />
				<br /> <a id="top-CateItem3">퓨전한복</a><br /> <br /> <a
					id="top-CateItem4">아동한복</a><br /> <br /> <a id="top-CateItem5"
					href="<%=projectName%>/list.ho?cmd=search-category&category=악세서리">악세서리</a>
			</div>
			<div id="topCate-Cate1">
				<a class="man"
					href="<%=projectName%>/list.ho?cmd=search-category&category=개량 한복 -남">남
					자</a><br /> <a class="woman"
					href="<%=projectName%>/list.ho?cmd=search-category&category=개량 한복 -여">여
					자</a>
			</div>
			<div id="topCate-Cate2">
				<a class="man"
					href="<%=projectName%>/list.ho?cmd=search-category&category=생활 한복 -남">남
					자</a><br /> <a class="woman"
					href="<%=projectName%>/list.ho?cmd=search-category&category=생활 한복 -여">여
					자</a>
			</div>
			<div id="topCate-Cate3">
				<a class="man"
					href="<%=projectName%>/list.ho?cmd=search-category&category=퓨전 한복 -남">남
					자</a><br /> <a class="woman"
					href="<%=projectName%>/list.ho?cmd=search-category&category=퓨전 한복 -여">여
					자</a>
			</div>
			<div id="topCate-Cate4">
				<a class="man"
					href="<%=projectName%>/list.ho?cmd=search-category&category=아동 한복 -남">남
					자</a><br /> <a class="woman"
					href="<%=projectName%>/list.ho?cmd=search-category&category=아동 한복 -여">여
					자</a>
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
			</select> <input type="radio" id="titleSearch" name="searchRadio"
				value="title" class="searchRadio" checked="checked" /> <label
				class="searchLabel" for="titleSearch">상품 이름</label> <input
				type="radio" id="contentSearch" name="searchRadio" value="content"
				class="searchRadio" /> <label class="searchLabel"
				for="contentSearch" class="searchRadio">내용</label>
		</div>

	</header>
	<section>
		<div id="CoinTop">
			<p>코인 충전</p>
		</div>
		<p style="text-align: left;"  class="TopP"><strong><%=hm.getMemName() %>님</strong>의 보유 코인: 
		<%=String.format("%,d", yourCoin) %>개</p>
		<br/>
		<input type="text" id="CoinInput" name="CoinInput" value="0" readonly="readonly"/>
		<br/><br/>
		
		<input class="coinRadio" type="radio" name="CoinMoney" value="10000" id="1m"/>
		<label for="1m">10000원</label>
		<input class="coinRadio" type="radio" name="CoinMoney" value="10000" id="5m"/>
		<label for="5m">50000원</label>
		 <input class="coinRadio" type="radio" name="CoinMoney" value="10000" id="10m"/>
		 <label for="10m">100000원</label>
		 <input class="coinRadio" type="radio" name="CoinMoney" value="10000" id="50m"/>
		<label for="50m"> 500000원</label>
		<input class="coinRadio"  type="radio" name="CoinMoney" value="10000" id="100m"/>
		<label for="100m">1000000원</label>
		<input class="coinRadio" type="radio" name="CoinMoney" value="10000" id="selfM"/>
		<label for="selfM">직접입력</label>
		
		<br/><br/>
		<div id="CoinTop">
			<p>결제 수단</p>
		</div>
		<br/>
		<input class="PaySelect" type="radio" name="PaySelect"  id="phone"/>
		<label for="phone">핸드폰 결제</label>
		<input class="PaySelect" type="radio" name="PaySelect"  id="card"/>
		<label for="card">카드 결제</label>
		<input class="PaySelect" type="radio" name="PaySelect"  id="bankbook"/>
		<label for="bankbook">무통장 입금</label>
	
		<br/><br/>
		
		<button id="payFinBtn" style="font-size:20pt;">결제 진행</button>
	
		<br/><br/>
	
	</section>
	<footer>
		<div id="footertitle">
			<a href="#"><img src="<%=projectName%>/ho/img/footerTitle.png" /></a>
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