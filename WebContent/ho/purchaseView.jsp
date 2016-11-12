<%@page import="ho.model.HoGoods"%>
<%@page import="ho.model.HoMember"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% String projectName = "/HoProject";
	String sessionValue = null;
//# 1."yourid"로 저장된 세션값을 얻어온다.
	Object sess = session.getAttribute("yourid");
//# 2. 값이 null이라면 LoginForm.jsp로 페이지 이동
//# 3. null이 아니라면 String 형변환하여 변수에 지정
System.out.println("세션값"+sess);
HoMember hm = null;
HoGoods hg = null;
if(sess != null){
	sessionValue = (String)sess;
 
	
	Object obj = request.getAttribute("homem");
	Object obj2 = request.getAttribute("Goods");
	if(obj!=null){
		hm=(HoMember)obj;
		System.out.println("purchaseView if문 안에 hm값인 : " +hm.getMemId());
		hg=(HoGoods)obj2;
		System.out.println("purchaseView if문 안에 hg값인 : " +hg.getGoodsName());
	}
// System.out.println(hm.getMemName());
// System.out.println(hg.getGoodsName());

System.out.println("goodsNo"+hg.getGoodsId());
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link href="<%=projectName%>/ho/css/jquery.bxslider.css"
	rel="stylesheet" />
<link href="<%=projectName %>/ho/css/main.css" rel="stylesheet" />
<link href="<%=projectName%>/ho/css/common.css" rel="stylesheet" />
<script src="<%=projectName%>/ho/js/jquery-1.10.2.min.js"></script>
<script src="<%=projectName%>/ho/js/jquery.bxslider.min.js"></script>
<script src="<%=projectName %>/ho/js/main.js"></script>

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
	
	$("#same").click(function(){
		$("#OrderRName").val("<%=hm.getMemName()%>");
		$("#OrderRTel").val("<%=hm.getMemTel()%>");
		$("#OrderRAddr").val("<%=hm.getMemAddr()%>");
		
	});
	
	
	$(".btn_submit").click(function(){
		if(!$(".OrderSettleCase").is(":checked")){
			alert("결제방식을 선택해주세요.");	
		}else{
			$("#goSubmit").submit();
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
	<form action="<%=projectName%>/final.ho" method="get" id="goSubmit">
	<input type="hidden" name="cmd" value="pay-view">
	<input type="hidden" name="OrderId" value="<%=sess %>">
	<input type="hidden" name="OrderSangpumNo" value="<%=hg.getGoodsId() %>">
	<input type="hidden" name="OrderSangpumName" value="<%=hg.getGoodsName() %>">
	<input type="hidden" name="OrderSize" value="<%=request.getParameter("size") %>">
	<input type="hidden" name="OrderSoo" value="<%=request.getParameter("cnt") %>">
	<input type="hidden" name="OrderPrice" value="<%=hg.getGoodsPrice() %>">
	<input type="hidden" name="OrderRentPrice" value=" <%= hg.getGoodsRentPrice() %>">
	<input type="hidden" name="OrderImg" value="<%=hg.getGoodsImg() %>">
	<input type="hidden" name="OrderTotalPrice" value="<%=request.getParameter("totalPrice") %>">
	<div class="alignleft">
		<div class="panel">
			<div>
				<div class="header">
					<h2 class="num">01</h2>	
					<div class="title" style="text-align: left;">
						주문리스트 확인 <span id="confirmProdStr"></span>
					</div>
				</div>
			</div>
			<div>
			
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="img" rowspan="2"><img src="/HoProject/ho/upload/<%=hg.getGoodsImg() %>" width="58"
								height="58" alt=""></td>
							<td class="nme" rowspan="2"><%=hg.getGoodsName() %></td>
							<td class="qty" rowspan="2"><%=request.getParameter("size") %> - <%=request.getParameter("cnt") %>개</td>
							<td class="price" rowspan="2"><%=hg.getGoodsPrice() %>원</td>
							<td class="td_numbig" rowspan="2">배송비 <%= hg.getGoodsRentPrice() %>원</td>
							<td class="amt" rowspan="2"><span class="total_price">
									총 가격:<%=request.getParameter("totalPrice") %>원</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


		<div class="panel">
			<div>
				<div class="header">
					<h2 class="num">02</h2>
					<div class="title" style="text-align: left;">주문고객정보</div>
				</div>
			</div>

			<table width="1000" height="350" class="table table-bordered">
				<tr>
					<td>
					<br/><br/>
						<!-- 주문자명 -->
						<div class="form-group">
							<label for="name" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-user" aria-hidden="true"></span> 주문자명
							</label>
							<div class="col-md-3">
								<input type="text" name="OrderSName" id="OrderSName" class="form-control"
									value="<%=hm.getMemName() %>" readonly="readonly" required>
							</div>
						</div><br /><br />

						<!-- 이메일 -->
						<div class="form-group">
							<label for="eamil" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
								Email
							</label>
							<div class="col-md-3">
								<input type="email" name="OrderSEmail" id="eamil" class="form-control"
									value="<%=hm.getMemEmail() %>" required="required">
							</div>
						</div><br/><br/> 

						<!-- 전화번호 -->
						<div class="form-group">
							<label for="tel" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-phone" aria-hidden="true"></span> 전화
							</label>
							<div class="col-md-3">
								<input type="text" name="OrderSTel" id="tel" class="form-control"
									value="<%=hm.getMemTel() %>" required="required">
							</div>
						</div><br /><br />

						<!-- 주소 & 상세주소 -->
						<div class="form-group">
							<label for="addr" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-home" aria-hidden="true"></span> 주소
							</label>
							<div class="col-md-5">
								<input type="text" name="OrderSAddr" id="addr" class="form-control" placeholder="주소를 입력하세요"
									value="<%=hm.getMemAddr() %>" required="required"><br/>
<!-- 								<input type="text" name="addrdetail" id="addr" class="form-control" placeholder="상세주소를 입력하세요" -->
<!-- 									value="" >  -->
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
		
		<div class="panel">
			<div>
				<div class="header">
					<h2 class="num">03</h2>
					<div class="title" style="text-align: left;">배송지정보</div>
					<input type="button" value="위와 동일" id="same"/>
				</div>
			</div>

			<table width="1000" height="350" class="table table-bordered">
				<tr>
					<td>
					<br/><br/>
						<!-- 수령자명 -->
						<div class="form-group">
							<label for="receiver" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-envelope" aria-hidden="true"></span>수령자명
							</label>
							<div class="col-md-3">
								<input type="text" name="OrderRName" id="OrderRName" class="form-control"
									value="" required="required">
							</div>
						</div><br/><br/> 

						<!-- 전화번호 -->
						<div class="form-group">
							<label for="tel" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-phone" aria-hidden="true"></span> 전화
							</label>
							<div class="col-md-3">
								<input type="text" name="OrderRTel" id="OrderRTel" class="form-control"
									value="">
							</div>
						</div><br /><br />

						<!-- 주소 & 상세주소 -->
						<div class="form-group">
							<label for="detail" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-home" aria-hidden="true"></span> 주소
							</label>
							<div class="col-md-5">
								<input type="text" name="OrderRAddr" id="OrderRAddr" class="form-control" placeholder="주소를 입력하세요"
									value=""><br/>
							</div>
						</div><br /><br />
						
						<!-- 배달시요구사항 -->
						<div class="form-group">
							<label for="demand" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>  배달시 요구사항
							</label>
							<div class="col-md-5">
								<input type="text" name="OrderRDemand" id="OrderRDemand" class="form-control" placeholder="입력하지마 ㅆ.."
									value="">
							</div>
						</div><br/><br/>
					</td>
				</tr>
			</table>
		</div>
	</div>
		
	<div class="alignleft">
		<div class="panel">
			<div>
				<div class="header">
					<h2 class="num">05</h2>
					<div class="title" style="text-align: left;">결제 금액</div>
					<div id="pay-info" class="body">
              <ul id="pay-list">
                <li>구매총액<span class="pr" style="color:#000;font-weight:bold">원</span></li>
                <li>회원등급 할인 (-)<span class="pr" id="level_profit_str">원</span></li>
                <li>주문쿠폰할인액 (-)<span class="pr" id="od_cp_price">0 원</span></li>
                <li>배송비 (+)<span class="pr">10,000 원</span></li>
                <li>추가배송비 (+)<span class="pr" id="od_send_cost2">0 원</span></li>
              </ul>
                <div id="total2">총 결제금액  <span class="pull-right" style="font-size:16px;">원</span><span class="pull-right" id="od_tot_price" style="font-size:16px;">72,380</span></div>
            </div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="alignright">
		<div class="panel">
			<div>
				<div class="header">
					<h2 class="num">06</h2>
					<div class="title" style="text-align: left;">결제 수단</div>
					</div>
				<div class="body">
					<div class="tabl minimal single-row" >
						<div class="radio"><input type="radio" id="od_settle_card" name="OrderSettleCase" class ="OrderSettleCase" value="신용카드"> <label for="od_settle_card">신용카드</label></div>
						<div class="radio"><input type="radio" id="od_settle_bank" name="OrderSettleCase"  class ="OrderSettleCase"  value="무통장"> <label for="od_settle_bank">무통장입금</label></div>
						<div class="radio"><input type="radio" id="od_settle_iche" name="OrderSettleCase"   class ="OrderSettleCase"  value="계좌이체"> <label for="od_settle_iche">에스크로 실시간 계좌이체</label></div>
					</div>		
         	   	</div>
         	 <div class="body bottom">
         	<p>무통장입금 주문건 3일이내 미입금 시, 자동 취소처리가 진행됩니다.</p>
         	<p>신용카드 결제시 화면 아래 '결제하기'버튼을 클릭하시면 신용카드 결제 창이 나타납니다. 
            <br>신용카드 결제 창을 통해 입력되는 고객님의 카드 정보는 128bit로 안전하게 암호화되어 전송되며 승인 처리 후 카드 정보는 승인 성공/ 실패 여부에 상관없이 자동 으로 폐기되므로, 안전합니다.</p>
            <p>신용카드 결제 신청시 승인 진행에 다소 시간이 소요될 수 있으므로 '중지', '새로고침'을 누르지 마시고 결과 화면이 나타 날때까지 기다려 주십시오. 
            <br>(결제하기 버튼 클릭시 결제창이 나타나지 않을 경우나 안전결제 모듈이 설치 되지 않을경우 <a href="http://admin.allthegate.com/admin_board/download_pds.jsp?filename=AGSPay_Setup.zip" style="font-weight: bold;">[여기]</a> 를 눌러 수동으로 플러그인을 설치하십시요.)</p>
			<p>신용카드/ 실시간 이체는 결제 후, 무통장입금은 입금확인 후 배송이 이루어집니다.</p>
			<p>국내 모든 카드 사용이 가능하며 해외에서 발행된 카드는 이용하실수 없습니다.</p>
			<p>HO[好] 는 구매안전서비스로 전자보증 서비스에 가입되어있습니다.</p>
			            
         	   	</div>
			</div>
		</div>
	</div>
	
	<div>	
		<div>
			<div id="display_pay_button" class="btn-group">
		   		<input type="button" value="결제하기" class="btn_submit" onclick=""/>
			</div>
			
			<div id="display_cancle_button" class="btn-group">
		   		<input type="button" value="취소하기" class="btn_cancle" onclick="">
			</div>
		</div>
	</div>	
	</form>
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