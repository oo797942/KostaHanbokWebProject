<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="ho.model.HoMember"%>
<%@ page import="ho.service.HoMemberService"%>
<%@ page import="java.util.List"%>

<%
	String projectName = "/HoProject";

	HoMember member = null;
	Object obj = request.getAttribute("MemView");

	if (obj != null)
		member = (HoMember) obj;
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: HO[好]에 오신 것을 환영합니다 ::</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<link href="<%=projectName%>/ho/css/jquery.bxslider.css"
	rel="stylesheet" />
<link href="<%=projectName%>/ho/css/common.css" rel="stylesheet" />
<script src="<%=projectName%>/ho/js/jquery-1.10.2.min.js"></script>
<script src="<%=projectName%>/ho/js/jquery.bxslider.min.js"></script>

</head>
<body>
	<header>
	<div id="Menuimg">
			<a href="<%= projectName %>/1.ho?cmd=admin-page"><img id="logo"
				src="<%=projectName%>/ho/img/logo.png" /></a>
	</div>
	<div id="admin"> admin 님이 접속하셨습니다.
		<a href="<%=projectName%>/1.ho?cmd=main-page"><input type="button" value="Logout" id="logoutbtn" name="logoutbtn"></a>
	 </div> <br/>

		<table id="menutable">
			<tr>
				<td><a href="<%=projectName%>/1.ho?cmd=adminmenu1"><input
						type="button" class="admenu" id="menu1" value="매출" /></a></td>
				<td><a href="<%=projectName%>/1.ho?cmd=adminmenu2"><input
						type="button" class="admenu" id="menu2" value="상품" /></a></td>
				<td><a href="<%=projectName%>/1.ho?cmd=adminmenu3"><input
						type="button" class="admenu" id="menu3" value="회원" /></a></td>
				<td><a href="<%=projectName%>/1.ho?cmd=adminmenu4"><input
						type="button" class="admenu" id="menu4" value="게시판" /></a></td>
		</table>
	</header>

	<section>

		<form class="form-horizontal" method="post"
			action="<%=projectName%>/xx.ho?">
			<input type="hidden" name="cmd" value="adminMemUpdateSave" /> <input
				type="hidden" name="mId" value="<%=member.getMemId()%>" /> <input
				type="submit" id="modify" value="수정하기" />

			<table border="2" width="1000" height="630">
				<tr>
					<td colspan="2"><label class="memberfont">회원관리ㅣ이이ㅣ </label></td>
				</tr>

				<tr>
					<td>
						<div class="form-group">
							<label for="id" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-user" aria-hidden="true"></span> ID
							</label>
							<div class="col-md-6">
								<input type="text" name="id" id="id" class="form-control"
									value="<%=member.getMemId()%>">
							</div>
						</div>
						<br />
						<br />

						<div class="form-group">
							<label for="name" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-user" aria-hidden="true"></span> 이름
							</label>
							<div class="col-md-6">
								<input type="text" name="name" id="name" class="form-control"
									value="<%=member.getMemName()%>">
							</div>
						</div>
						<br />
					<br />

						<div class="form-group">
							<label for="eamil" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
								Email
							</label>
							<div class="col-md-6">
								<input type="email" name="email" id="eamil" class="form-control"
									value="<%=member.getMemEmail()%>">
							</div>
						</div>
						<br />
					<br />

						<div class="form-group">
							<label for="addr" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-home" aria-hidden="true"></span> 주소 :
							</label>
							<div class="col-md-6">
								<input type="text" name="addr" id="addr" class="form-control"
									value="<%=member.getMemAddr()%>">
							</div>
						</div>
						<br />
					<br />

						<div class="form-group">
							<label for="tel" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-phone" aria-hidden="true"></span> 전화
								:
							</label>
							<div class="col-md-6">
								<input type="text" name="tel" id="tel" class="form-control"
									value="<%=member.getMemTel()%>">
							</div>
						</div>
						<br />
					<br />


					</td>

					<td>
						<div class="form-group">
							<label for="coin" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-phone" aria-hidden="true"></span> 코인
								:
							</label>
							<div class="col-md-6">
								<input type="text" name="coin" id="coin" class="form-control"
									value="<%=member.getMemCoin()%>">
							</div>
						</div>
						<br />
					<br />

						<div class="form-group">
							<label for="height" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-ok" aria-hidden="true"></span> 키 :
							</label>
							<div class="col-md-6">
								<input type="text" name="height" id="height"
									class="form-control" value="<%=member.getMemHeight()%>">
							</div>
						</div>
						<br />
					<br />

						<div class="form-group">
							<label for="chest" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-ok" aria-hidden="true"></span> 가슴 :
							</label>
							<div class="col-md-6">
								<input type="text" name="chest" id="chest" class="form-control"
									value="<%=member.getMemBust()%>">
							</div>
						</div>
						<br />
					<br />

						<div class="form-group">
							<label for="shoulder" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-ok" aria-hidden="true"></span> 어깨:
							</label>
							<div class="col-md-6">
								<input type="text" name="shoulder" id="shoulder"
									class="form-control" value="<%=member.getMemShoulder()%>">
							</div>
						</div>
						<br />
					<br />

						<div>
							<label for="grade"> <span
								class="glyphicon glyphicon-heart" aria-hidden="true"></span> 등급
								:
							</label> <select>
								<option>천인</option>
								<option>상민</option>
								<option>중인</option>
								<option>양반</option>
							</select>
						</div>
						<br />
					<br />

					</td>
				</tr>

			</table>
		</form>
		<a href="<%=projectName%>/1.ho?cmd=adminMemlist"><input type="button" id="back" value="뒤로가기" /></a>

	</section>


	<!-- 밑 배 경 -->
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
					<td width="256px"><strong>시티은행 채무지급보증 안내</strong><br />
					<br /> 당사는 고객님이 현금 결제한 금액에 대해<br /> 시티은행과 채무지급보증 계약을 체결하여<br />
						안전거래를 보장하고 있습니다.<br />
					<br />
					<br />
					<br /></td>
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