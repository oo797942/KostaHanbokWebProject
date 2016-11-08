<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: HO[好]에 오신 것을 환영합니다 ::</title>

<% String projectName = "/HoProject"; %>
<link href="<%= projectName %>/ho/css/jquery.bxslider.css" rel="stylesheet" />
<link href="<%= projectName %>/ho/css/common.css" rel="stylesheet" />
<script src="<%= projectName %>/ho/js/jquery-1.10.2.min.js"></script>
<script src="<%= projectName %>/ho/js/jquery.bxslider.min.js"></script>


</head>
<body>
	<header>
		<div id="Menuimg">
			<a href="#"><img id="logo" src="<%= projectName %>/ho/img/logo.png" /></a>
		</div>
	<div id="admin"> admin 님이 접속하셨습니다. </div> <br/>
	
	<table id= "menutable">
		<tr>
		<td><a href="<%= projectName %>/1.ho?cmd=adminmenu1"><input type="button" class ="admenu" id="menu1" value="매출"/></a></td>
		<td><a href="<%= projectName %>/1.ho?cmd=adminmenu2"><input type="button" class ="admenu" id="menu2" value="상품"/></a></td>
		<td><a href="<%= projectName %>/1.ho?cmd=adminmenu3"><input type="button" class ="admenu" id="menu3" value="회원"/></a></td>
		<td><a href="<%= projectName %>/1.ho?cmd=adminmenu4"><input type="button" class ="admenu" id="menu4" value="게시판"/></a></td>	
			</table>
		
<!--   		<div id="menu-1" >	
			<input type="button" class ="menu" value="월별"/><br/>
			<input type="button" class ="menu" value="일별"/><br/>
			<input type="button" class ="menu" value="제품별"/>
		</div> -->

<!-- 		<div id="menu-2" >
			<input type="button" class ="menu" value="등록"/><br/>
			<input type="button" class ="menu" value="수정"/><br/>
			<input type="button" class ="menu" value="삭제"/>
		</div>
	 -->
<!-- 		<div id="menu-3">
			<input type="button" class ="menu" value="회원 등급"/><br/>
			<input type="button" class ="menu" value="포인트"/><br/>
			<input type="button" class ="menu" value="회원 관리"/>
		</div>  -->
	
	
	
	</header>
	
	<section>
		<select id = "select"> 
		<option>선택</option>
		<option>년도별</option>
		<option>월별</option>
		<option>제품별</option>
		</select>
		<a href="<%= projectName %>/1.ho?cmd=adminPagelist"><input type="button" id="check" value="검색"/></a>
		<br/>	<br/>
		<table border="1"  width="1000">
  	 
  		 <tr>
  	   		 <td> 등급 </td>
    		 <td> 이름 </td>
  	   		 <td> 전화번호 </td>
   		     <td> 이메일 </td>
   		     <td> 가격 </td>
 		 </tr>
   	
  		 <tr>	
   			<td><a href="adminMemView.jsp">실험</a></td>
 		  	<td><a href="adminMemView.jsp">실험</a></td>
  			<td><a href="adminMemView.jsp">실험</a></td>
   			<td><a href="adminMemView.jsp">실험</a></td>
   			<td><a href="adminMemView.jsp">실험</a></td>
   		</tr>
		</table>
		<a href="<%= projectName %>/1.ho?cmd=admin-page"><input type="button" id="back" value="뒤로가기"/></a>
	
	</section>
	
	
<!-- 밑 배 경 -->	
	<footer>
		<div id="footertitle"><a href="#"><img src="<%= projectName %>/ho/img/footerTitle.png"/></a></div>
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
					<td width="256px">
					<strong>시티은행 채무지급보증 안내</strong><br/><br/>
					당사는 고객님이 현금 결제한 금액에 대해<br/>
					시티은행과 채무지급보증 계약을 체결하여<br/>
					안전거래를 보장하고 있습니다.<br/><br/><br/><br/>
					</td>
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