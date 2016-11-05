<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<link href="/HoProject/ho/css/jquery.bxslider.css" rel="stylesheet" />
<link href="/HoProject/ho/css/main.css" rel="stylesheet" />
<link href="/HoProject/ho/css/mypage.css" rel="stylesheet" />
<script src="/HoProject/ho/js/jquery-1.10.2.min.js"></script>
<script src="/HoProject/ho/js/jquery.bxslider.min.js"></script>
<script src="/HoProject/ho/js/main.js"></script>
</head>
<body>

	<header>
		<div id="menu">
			<img src="/HoProject/ho/img/topMenu.png" />
		</div>
		<div id="Menuimg">
			<a href="#"><img id="logo" src="/HoProject/ho/img/logo.png" /></a>
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
	<section>
		<div id="myPageTop">
			<p>MY PAGE</p>
		</div>

		<div id="myPageTopMenu">
			<table id="myPageTopTable">
				<tr>
					<td class="topTableBtn">회원정보</td>
					<td class="topTableBtn">쇼핑내역</td>
					<td class="topTableBtn">보안설정</td>
					<td width="70%"></td>
				</tr>
			</table>
		</div>

		<table id="myPageMainBodyTable" cellspacing="15">

			<tr>
				<td class="BodyTableStyle">좌측</td>
				<td class="BodyTableStyle">우측</td>
			</tr>


		</table>

		<br />
		<table id="myPageContent" cellspacing="0" border="1">
			<tr>
				<td id="myPageContentMenu">좌측 메뉴 !</td>
				<td>우측 본문</td>
			</tr>
		</table>
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