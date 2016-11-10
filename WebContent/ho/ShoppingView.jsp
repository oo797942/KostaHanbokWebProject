<%@page import="ho.model.HoGoodsImg"%>
<%@page import="ho.model.HoGoods"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String projectName = "/HoProject";
	HoGoodsImg himg = null;
	HoGoods hg = (HoGoods) request.getAttribute("GoodsView");
	if (request.getAttribute("GoodsImgView") != null) {
		himg = (HoGoodsImg) request.getAttribute("GoodsImgView");
	}

	String sessionValue = null;

	Object sess = session.getAttribute("yourid");

	System.out.println("세션값" + sess);

	if (sess != null) {
		sessionValue = (String) sess;
	}

	int totalPrice = hg.getGoodsPrice() + hg.getGoodsRentPrice();

	String Lsize = hg.getGoodsLsize();
	String Msize = hg.getGoodsMsize();
	String Ssize = hg.getGoodsSsize();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>뷰</title>
<link href="<%=projectName%>/ho/css/jquery.bxslider.css"
	rel="stylesheet" />
<link href="<%=projectName%>/ho/css/main.css" rel="stylesheet" />
<link href="<%=projectName%>/ho/css/view.css" rel="stylesheet" />
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
			window.location.href="<%=projectName%>/list.ho?cmd=search-input&option="
										+ option
										+ "&check="
										+ radio
										+ "&val="
										+ inputvalue;
							}
						});

		var totalPriceTemp =<%=hg.getGoodsPrice()%>+<%=hg.getGoodsRentPrice()%>;

		$("#totalPrice").text(totalPriceTemp);
		
		for(var i=1; i<=$("#LSize").val();i++){
			$("#countSelect").append("<option value="+i+">"+i+"벌</option>");
		}
		
		$("#sizeSelect").change(function(){
			if($("#sizeSelect").val()=="L"){
				$('#countSelect').children().remove();
				for(var i=1; i<=$("#LSize").val();i++){
					$("#countSelect").append("<option value="+i+">"+i+"벌</option>");
				}

			}else if($("#sizeSelect").val()=="M"){
				$('#countSelect').children().remove();
				for(var i=1; i<=$("#MSize").val();i++){
					$("#countSelect").append("<option value="+i+">"+i+"벌</option>");
				}

				
			}else if($("#sizeSelect").val()=="S"){
				$('#countSelect').children().remove();
				for(var i=1; i<=$("#SSize").val();i++){
					$("#countSelect").append("<option value="+i+">"+i+"벌</option>");
				}

			}
		});

		$("#countSelect").change(function() {
					var totalPriceReal = (<%=hg.getGoodsPrice()%>* $("#countSelect").val())+<%=hg.getGoodsRentPrice()%>;
					$("#totalPrice").text(totalPriceReal);
				});

	});
</script>



</head>
<body>

	<nav>
		<table id="shoppingBag" cellspacing="0">
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td style="background: #696969;"><a href="#"
					style="color: white;">장바구니</a></td>
			</tr>
			<tr>
				<td>
					<table cellspacing="15" width="125px">
						<tr>
							<td class="shoppingBagItem"><img
								src="<%=projectName%>/ho/img/banner_image_01.jpeg" width="90px"
								height="90px" /></td>
						</tr>
						<tr>
							<td class="shoppingBagItem"></td>
						</tr>
						<tr>
							<td class="shoppingBagItem"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</nav>

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
					<td><text id="sessid"><%=sess%>님</text></td>
					<%
						}
					%>
					<td><text id="shoplogin" name="login">LOGIN</text></td>
					<td><text id="shoplogout" name="logout">LOGOUT</text></td>
					<td class="gray">l</td>
					<td><a href="<%=projectName%>/join.ho?cmd=join-form">JOIN</a></td>
					<td class="gray">l</td>
					<td><a href="#">CART</a></td>
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
	<input id="LSize" type="hidden" value="<%=Lsize%>"/>
	<input id="MSize" type="hidden" value="<%=Msize%>"/>
	<input id="SSize" type="hidden" value="<%=Ssize%>"/>
	
		<table id="viewTable" cellspacing="0">
			<tr>
				<td id="viewTableImg" rowspan="9" width="600px"><img
					id="itemView"
					src="<%=projectName%>/ho/upload/<%=hg.getGoodsImg()%>" /></td>
				<td class="viewInfo" colspan="2"><%=hg.getGoodsName()%></td>
			</tr>
			<tr>
				<td class="viewInfo" colspan="2"><%=hg.getGoodsCate()%></td>
			</tr>
			<tr id="pinkColor">
				<td class="viewInfo" width="100px">판매가</td>
				<td class="viewInfo"><%=String.format("%,d", hg.getGoodsPrice())%>원</td>
			</tr>
			<tr>
				<td class="viewInfo">택배비</td>
				<td class="viewInfo"><%=String.format("%,d", hg.getGoodsRentPrice())%>원</td>
			</tr>
			<tr>
				<td class="viewInfo">원단</td>
				<td class="viewInfo"><%=hg.getGoodsColor()%></td>
			</tr>
			<tr>
				<td class="viewInfo">사이즈</td>
				<td class="viewInfo"><select id="sizeSelect">
						<option value="L">L</option>
						<option value="M">M</option>
						<option value="S">S</option>
				</select></td>
			</tr>
			<tr>
				<td class="viewInfo">구매 벌수</td>
				<td class="viewInfo">
				<select id="countSelect"></select></td>
			</tr>
			<tr>
				<td class="viewInfo">총액</td>
				<td class="viewInfo"><label id="totalPrice"></label>원</td>
			</tr>
			<tr>
				<td id="btnTableTd" colspan="2">
					<table id="btnTable" width="100%" cellspacing="0">
						<tr>
							<td class="tdBtn" width="50%" style="text-align: center;">바로구매</td>
							<td class="tdBtn" style="text-align: center;">장바구니</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br />
		<table width="1024px" cellspacing="0">
			<tr>
				<%
					if (himg != null) {
				%>
				<td width="33%"><img class="infoImage"
					src="<%=projectName%>/ho/upload/<%=himg.getImgOne()%>"></td>
				<td width="33%"><img class="infoImage"
					src="<%=projectName%>/ho/upload/<%=himg.getImgTwo()%>"></td>
				<td><img class="infoImage"
					src="<%=projectName%>/ho/upload/<%=himg.getImgThree()%>"></td>
				<%
					} else {
				%>
				<td width="33%"><img class="infoImage"
					src="<%=projectName%>/ho/img/noGoodsImg.png"></td>
				<td width="33%"><img class="infoImage"
					src="<%=projectName%>/ho/img/noGoodsImg.png"></td>
				<td><img class="infoImage"
					src="<%=projectName%>/ho/img/noGoodsImg.png""></td>
				<%
					}
				%>
			</tr>
		</table>
		<img width="1024px" src="<%=projectName%>/ho/img/refund_info.png" />
		<table width="1024px" cellspacing="0" border="1">
			<tr>
				<td width="20%">등록일</td>
				<td width="20%">아이디</td>
				<td>평점</td>
				<td width="50%">내용</td>
			</tr>
		</table>
		<br /> <input type="text" autocomplete="off"
			placeholder="후기를 입력해 주세요." id="replyInput" name="replyInput" /><a
			id="insertReply" href="#">입력</a> <br /> <br />
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