<%@page import="ho.model.HoMember"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String projectName = "/HoProject";
%>
<%
	HoMember ho = null;
	long exp = 0;
	String rank = null;
	Object sess = session.getAttribute("yourid");
	Object obj = request.getAttribute("homem");
	if (obj != null)
		ho = (HoMember) obj;
	if (ho.getMemExp() == null) {
		exp = 0;
	} else {
		exp = Long.parseLong(ho.getMemExp());
	}

	if (exp < 10000000) {
		rank = "귀족";
	} else if (exp >= 10000000 && exp < 50000000) {
		rank = "왕";
	} else {
		rank = "경민";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<link href="<%=projectName%>/ho/css/jquery.bxslider.css"
	rel="stylesheet" />
<link href="<%=projectName%>/ho/css/main.css" rel="stylesheet" />
<link href="<%=projectName%>/ho/css/mypage.css" rel="stylesheet" />
<script src="<%=projectName%>/ho/js/jquery-1.10.2.min.js"></script>
<script src="<%=projectName%>/ho/js/jquery.bxslider.min.js"></script>
<script src="<%=projectName%>/ho/js/main.js"></script>
<script src="<%=projectName%>/ho/js/mypage.js"></script>
</head>
<body>

	<header>
		<div id="menu">
			<img src="<%=projectName%>/ho/img/topMenu.png" />
		</div>
		<div id="Menuimg">
			<a href="#"><img id="logo" src="<%=projectName%>/ho/img/logo.png" /></a>
		</div>
		<div id="topMenu">
			<table id="smallMenu">
				<tr>
					<td><a href="#">LOGIN </a></td>
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
	<section style="background: #f5f5f5;">
		<div id="myPageTop">
			<p>MY PAGE</p>
		</div>

		<div id="myPageTopMenu">
			<table id="myPageTopTable">
				<tr>
					<td class="topTableBtn">회원정보</td>
					<td class="topTableBtn">쇼핑내역</td>
					<td width="70%"></td>
				</tr>
			</table>
		</div>

		<form action="<%=projectName%>/mypage.ho?cmd=submit-mypage"
			method="post">
			
			<input type="hidden" value="<%=sess %>" name="myId"/>

			<table id="myPageMainBodyTable" cellspacing="15">

				<tr>
					<td class="BodyTableStyle" width="50%"><span id="titleSpan"><strong><%=ho.getMemName()%></strong>님의
							정보</span> <br /> <br />
						<table id="VipTable">
							<tr>
								<td rowspan="2" width="55px"><img id="vipLogo"
									src="<%=projectName%>/ho/img/vip_king.png" /></td>
								<td>VIP등급 : <%=rank%></td>
							</tr>
							<tr>
								<td>EXP: <%=exp%></td>
							</tr>
						</table> <br /> <span style="font-size: 20pt;">보유 코인:</span> <br /> <span
						style="font-size: 13pt;"><%=ho.getMemCoin()%></span> <br /> <br />

						<button class="changeBtn" style="float: right; margin-top: 16px;">비밀번호
							변경</button></td>
					<td class="BodyTableStyle"><span id="titleSpan">연락처</span> <br />
						<br /> 이메일: <input type="text" id="myPageemail" name="email"
						value="<%=ho.getMemEmail()%>" readonly="readonly" /><br /> <br />
						<br /> 전화번호: <input type="text" id="myPagetel" name="tel"
						value="<%=ho.getMemTel()%>" readonly="readonly" /><br /> <br />
						<br /> <br />
						<button class="changeBtn"
							style="margin-left: 15px; margin-top: 15px; float: right;">이메일
							변경</button>
						<button class="changeBtn"
							style="margin-left: 15px; margin-top: 15px; float: right;">전화번호
							변경</button></td>
				</tr>
				<tr>
					<td class="BodyTableStyle"><span id="titleSpan">거주지 및
							신체정보</span><br /> <br /> 주소:<br /> <input type="text" id="myPageaddr" name="addr"
						value="<%=ho.getMemAddr()%>" readonly="readonly" /> <br /> <br />
						키: <input type="text" id="myPageheight" size="12" name="height"
						readonly="readonly" value="<%=ho.getMemHeight()%>" /> 가슴: <input
						type="text" id="myPagebust" name="bust"  size="12" readonly="readonly"
						value="<%=ho.getMemBust()%>" /> 어깨: <input type="text" size="12"
						readonly="readonly" id="myPageshoulder" name="shoulder"
						value="<%=ho.getMemShoulder()%>" /> <br /> <br /> <br />
						<button id="changeShoulderBtn" class="changeBtn"
							style="margin-left: 15px; margin-top: 25px; float: right;">어깨
							수정</button>
						<button id="changeBustBtn" class="changeBtn"
							style="margin-left: 15px; margin-top: 25px; float: right;">가슴
							수정</button>
						<button id="changeHeightBtn" class="changeBtn"
							style="margin-left: 15px; margin-top: 25px; float: right;">키
							수정</button>
						<button id="changAddrBtn" class="changeBtn"
							style="margin-top: 25px; float: right;">주소 수정</button></td>
					<td class="BodyTableStyle" style="vertical-align: text-bottom;"><input
						type="submit" class="changeBtn" value="수정 완료"
						style="float: right;" /></td>
				</tr>


			</table>
		</form>
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