<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String projectName = "/HoProject"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인이 필요한 페이지</title>

<link rel="stylesheet" type="text/css" href="<%= projectName %>/ho/css/jquery.bxslider.css"
	media="all" />
<link rel="stylesheet" type="text/css" href="<%= projectName %>/ho/css/HoMainForm.css" media="all" />
<link href="<%=projectName %>/ho/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=projectName %>/ho/css/joinok.css" rel="stylesheet">
<link href="<%=projectName %>/ho/css/main.css" rel="stylesheet" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<%=projectName %>/ho/js/main.js"></script>

</head>
<body>

	<header>
		<div id="menu">
			<img src="<%=projectName %>/ho/img/topMenu.png" />
		</div>
		<div id="Menuimg">
			<a href="<%=projectName%>/kk.ho?cmd=main-page"><img id="logo" src="<%=projectName%>/ho/img/logo.png" /></a>
	
		</div>
		

	</header>
	
	<h1 id="mar">  </h1>
	<h1> 로그인이 필요한 페이지 입니다.</h1>
	<a href="<%=projectName%>/kk.ho?cmd=shop-main"><input type="button" value="메인으로가기" id="log_btn"></a>
	
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