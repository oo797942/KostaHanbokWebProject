<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import ="ho.model.HoGoods" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: HO[好]에 오신 것을 환영합니다 ::</title>

<% String projectName = "/HoProject";

	HoGoods goods = null;
	Object obj = request.getAttribute("GoodsView");
	if(obj != null) goods = (HoGoods)obj;
	
	System.out.println(goods.getGoodsCate());

%>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="<%= projectName %>/ho/css/jquery.bxslider.css" rel="stylesheet" />
<link href="<%= projectName %>/ho/css/common.css" rel="stylesheet" />
<script src="<%= projectName %>/ho/js/jquery-3.1.1.min.js"></script>
<script src="<%= projectName %>/ho/js/jquery.bxslider.min.js"></script>
<script type="text/javascript">
	$(function(){		
	$("#category1 > option[value='<%= goods.getGoodsCate() %>']").attr("selected","selected");
	$("#category2 > option[value='<%= goods.getGoodsColor() %>']").attr("selected","selected");
	$("#category3> option[value='<%= goods.getGoodsSize() %>']").attr("selected","selected");
	});
</script>

</head>
<body>
	<header>
		<div id="Menuimg">
			<a href="<%= projectName %>/1.ho?cmd=admin-page"><img id="logo" src="<%= projectName %>/ho/img/logo.png" /></a>
		</div>
	<div id="admin"> admin 님이 접속하셨습니다.
		<a href="<%=projectName%>/1.ho?cmd=main-page"><input type="button" value="Logout" id="logoutbtn" name="logoutbtn"></a>
	 </div> <br/>
	<table id= "menutable">
		<tr>
	<td><a href="<%= projectName %>/1.ho?cmd=adminmenu1"><input type="button" class ="admenu" id="menu1" value="매출"/></a></td>
		<td><a href="<%= projectName %>/1.ho?cmd=adminmenu2"><input type="button" class ="admenu" id="menu2" value="상품"/></a></td>
		<td><a href="<%= projectName %>/1.ho?cmd=adminmenu3"><input type="button" class ="admenu" id="menu3" value="회원"/></a></td>
		<td><a href="<%= projectName %>/1.ho?cmd=adminmenu4"><input type="button" class ="admenu" id="menu4" value="게시판"/></a></td>	
			</tr>
		</table>
	</header>
	
	<section class="secView">
			
		<!-- 등록 -->
			<table border="2" id="insertTable" class="table table-striped" width="1000" height="560"  >
		<tr>
			<td class="itemtable">상품명</td>
			<td colspan="3"><input type="text" class= "Goodsinsert" value="<%=goods.getGoodsName() %>" disabled="disabled" style="width: 100%"></td>
		</tr>
		<tr>
			<td class="itemtable">카테고리</td>
			<td><select id="category1" class= "GoodsSelect"  disabled="disabled" style="width: 100%">
			<option class="op" selected="selected">선택</option>
			<option class="op" value="생활 한복 -남">생활 한복 -남</option>
			<option class="op" value="생활 한복 -여">생활 한복 -여</option>
			<option class="op" value="개량 한복 -남">개량 한복 -남</option>
			<option class="op" value="개량 한복 -여">개량 한복 -여</option>
			<option class="op" value="퓨전 한복 -남">퓨전 한복 -남</option>
			<option class="op" value="퓨전 한복 -여">퓨전 한복 -여</option>
			<option class="op" value="아동 한복 -남">아동 한복 -남</option>
			<option class="op" value="아동 한복 -여">아동 한복 -여</option>
			<option class="op" value="악세서리">악세서리</option>
			</select></td>
			
		<td class="itemtable">원단</td>
			<td colspan="3"><select id="category2" class= "GoodsSelect"  disabled="disabled" style="width: 100%">
					<option class="op"  selected="selected">선택</option>
					<option class="op" value="양단">양단</option>
					<option class="op" value="본견(비단)">본견(비단)</option>
					<option class="op" value="보화단">보화단</option>
					<option class="op" value="옥사">옥사</option>
					<option class="op" value="물실크">물실크</option>
			</select>
			</td>
		</tr>

		<tr>
			<td class="itemtable">디자인 사진</td>
			<td colspan="3"><input type="file" class= "Goodsinsert" value="<%=goods.getGoodsImg()%>" disabled="disabled" style="width: 100%"></td>
			</tr>
		<tr>
		
		<tr>
			<td class="itemtable">설명</td>
			<td colspan="3"><textarea  rows="4"  class= "GoodsContent"disabled="disabled"><%=goods.getGoodsInfo()%></textarea style="width: 100%"></td>
		</tr>
		
		<tr>
			<td class="itemtable">사이즈</td>
			<td colspan="3">
			L<input type="text"  id="Lsize" name="Lsize" value="<%= goods.getGoodsLsize()%>" disabled="disabled" style="width: 25%"> 
			M<input type="text"  id="Msize"  name="Msize" value="<%= goods.getGoodsMsize()%>" disabled="disabled" style="width: 25%"> 
			S<input type="text"  id="Ssize" name="Ssize" value="<%= goods.getGoodsSsize()%>" disabled="disabled" style="width: 25%"> 	
			</td>
		</tr>
		
		<tr>
			<td class="itemtable">수량</td>
			<td colspan="3"><input type="text" class= "Goodsinsert" value="<%=goods.getGoodsSoo()%>"  disabled="disabled" style="width: 100%"></td>
		</tr>
		<tr>
			<td class="itemtable">가격</td>
			<td colspan="3"><input type="text" class= "Goodsinsert" value="<%=goods.getGoodsPrice()%>" disabled="disabled" style="width: 100%"></td>
		</tr>
		<tr>
			<td class="itemtable">배송비</td>
			<td colspan="3"><input type="text" class= "Goodsinsert" value="<%=goods.getGoodsRentPrice()%>" disabled="disabled" style="width: 100%"></td>
		</tr>
	
		<tr>
			<td class="itemtable">할인율</td>
			<td colspan="3"><input type="text"  class= "Goodsinsert"  placeholder="%로 입력해주세요."  value=<%= goods.getGoodsDc() %> maxlength="2" disabled="disabled" style="width: 100%"></td>
		</tr>
		</table>
			
			<a href="<%= projectName %>/1.ho?cmd=list-page"><input type="button" id="back" value="뒤로가기"/></a>
			<a href="<%= projectName %>/1.ho?cmd=adminGoodsUpdate&id=<%=goods.getGoodsId()%>"><input type="button" id="next" value="수정하기"/></a>
			<a href="<%= projectName %>/1.ho?cmd=adminPageDelete&id=<%=goods.getGoodsName()%>"><input type="button" id="delete" value="삭제하기"/></a>
		

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