<%@page import="ho.model.HoMember"%>
<%@page import="ho.model.HoBag"%>
<%@page import="java.util.List"%>
<%@page import="ho.model.HoReply"%>
<%@page import="ho.model.HoGoodsImg"%>
<%@page import="ho.model.HoGoods"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String projectName = "/HoProject";
	HoGoodsImg himg = null;
	HoGoods hg = null;
	Object obj1=request.getAttribute("GoodsView");
	if(obj1!=null) hg = (HoGoods)obj1; System.out.println("11번쨰");
	
	System.out.println("12번쨰줄 " +hg.getGoodsId());
	if (request.getAttribute("GoodsImgView") != null) {
		himg = (HoGoodsImg) request.getAttribute("GoodsImgView");
	}
	
	List<HoReply> reply = null;
	Object obj = request.getAttribute("replyList");
	if(obj!=null) reply = (List<HoReply>) obj;

	String sessionValue = null;

	Object sess = session.getAttribute("yourid");

	System.out.println("세션값" + sess);

	if (sess != null) {
		sessionValue = (String) sess;
	}
	System.out.println("30번쨰 줄");
	int totalPrice = hg.getGoodsPrice() + hg.getGoodsRentPrice();

	String Lsize = hg.getGoodsLsize();
	String Msize = hg.getGoodsMsize();
	String Ssize = hg.getGoodsSsize();

	System.out.println("37번쨰 줄");
	
	

	HoMember hm = null;
	List bagList = null;

	if (sess != null) {
		sessionValue = (String) sess;
		hm = (HoMember) request.getAttribute("homem");
		bagList = (List)request.getAttribute("baglist");
	}
	
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
	
	$("#hideprice").hide();
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
		$("#hideprice").val(<%=hg.getGoodsPrice()%>);
		$("#countSelect").change(function() {
					var totalPriceReal = (<%=hg.getGoodsPrice()%>* $("#countSelect").val())+<%=hg.getGoodsRentPrice()%>;
					$("#totalPrice").text(totalPriceReal);
					$("#hideprice").val(totalPriceReal);
		});
		
		
		$("#bagoo").click(function(){
			<% System.out.println("#bagoo 안에 : " +hg.getGoodsId()); %>
					$("#frm").submit();
		});
		
		$("#bagooNoLogin").click(function(){
			window.open("<%=projectName%>/shoplogin.ho?cmd=shoplogin-page", '_blank', 'width=290, height=380, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no' );			
		});
		
		$("#jjimNoLogin").click(function(){
			window.open("<%=projectName%>/shoplogin.ho?cmd=shoplogin-page", '_blank', 'width=290, height=380, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no' );			
		});
		
		$("#insertReply").click(function(){
			$.ajax({         
		        url : '<%=projectName%>/checkid.ho?cmd=Reply-check&id=<%=sess%>&no=<%=hg.getGoodsId()%>',
		        type : 'post',
		        success : function(data){
		        	if(data==1){
		        		$("#frm2").submit();
					}else{
						alert("구매가 이루어진 후 후기를 쓰실수 있습니다.");
					}
		        },
		        error : function(){
		           alert('에러 발생');   
		        }
		     });
		});
		$("#jjim").click(function(){
			
			window.location.href="<%=projectName%>/bag.ho?cmd=bag-insert&itemname=<%=hg.getGoodsName()%>&imgs=<%= hg.getGoodsImg()%>&itemno=<%= hg.getGoodsId()%>";
		});

	});

</script>



</head>
<body>
<%if(sess!=null){ %>
	<nav>
		<table id="shoppingBag" cellspacing="0">
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td style="background: #696969;"><a href="#"
					style="color: white;">찜목록</a></td>
			</tr>
			<tr>
				<td>
					<table cellspacing="15" width="125px">
					<%for(int i=0; i<bagList.size(); i++){ %>
					<%HoBag hbag = (HoBag)bagList.get(i); %>
						<tr>
							<td class="shoppingBagItem">
							<a href="<%=projectName %>/view.ho?cmd=goods-view&id=<%=hbag.getShopNo() %>&name=<%=hbag.getShopName() %>">
							<img src="<%=projectName%>/ho/upload/<%=hbag.getShopImg() %>" width="90px" height="90px" />
							</a>
							<br/>
							<p style="font-size: 10pt"><%=hbag.getShopName() %></p>
							</td>
						</tr>
					<%} %>
					<%for(int i=0; i<3-bagList.size();i++){ %>
					<tr>
					<td class="shoppingBagItem"></td>
					</tr>
					<%} %>
					</table> 
				</td>
			</tr>
		</table>
	</nav>
<%} %>
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
	<input id="LSize" type="hidden" value="<%=Lsize%>"/>
	<input id="MSize" type="hidden" value="<%=Msize%>"/>
	<input id="SSize" type="hidden" value="<%=Ssize%>"/>
	<form name="frm" id="frm" method="get" action="<%=projectName%>/xx.ho">
		<input type="hidden" name="adid" value="<%=sess %>">			
		<input type="hidden" name="cmd" value="page-view">
		<input type="hidden" name="name" value="<%=hg.getGoodsName()%>">
		<input type="hidden" name="price" value="<%=String.format("%,d", hg.getGoodsPrice())%>">
		<input type="hidden" name="img" value="<%=hg.getGoodsImg()%>">
		<input type="hidden" name="tackbae" value="<%=String.format("%,d", hg.getGoodsRentPrice())%>">
		<input type="hidden" name="goodsid" value="<%=request.getParameter("id") %>">
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
				<td class="viewInfo" name="price"><%=String.format("%,d", hg.getGoodsPrice())%>원</td>
			</tr>
			<tr>
				<td class="viewInfo">택배비</td>
				<td class="viewInfo" name="tackbae"><%=String.format("%,d", hg.getGoodsRentPrice())%>원</td>
			</tr>
			<tr>
				<td class="viewInfo">원단</td>
				<td class="viewInfo" name="wondan"><%=hg.getGoodsColor()%></td>
			</tr>
			<tr>
				<td class="viewInfo">사이즈</td>
				<td class="viewInfo"><select id="sizeSelect" name="size">
						<option value="L">L</option>
						<option value="M">M</option>
						<option value="S">S</option>
				</select></td>
			</tr>
			<tr>
				<td class="viewInfo">구매 벌수</td>
				<td class="viewInfo">
				<select id="countSelect" name="cnt"></select></td>
			</tr>
			<tr>
				<td class="viewInfo">총액</td>
				<td class="viewInfo">
				<input type="text" id="hideprice" name="totalPrice">
				<label id="totalPrice" name="totalPrice">원</label></td>
			</tr>
			<tr>
				<td id="btnTableTd" colspan="2">
				
					<table id="btnTable" width="100%" cellspacing="0">
						<tr>
						<%if(sess!=null){ %>
							<td id="bagoo" class="tdBtn" width="50%" style="text-align: center;">바로구매</td>
							<td id="jjim" class="tdBtn" style="text-align: center;">찜하기</td>
							<%}else{%>
							<td id="bagooNoLogin" class="tdBtn" width="50%" style="text-align: center;">바로구매</td>
							<td id="jjimNoLogin" class="tdBtn" style="text-align: center;">찜하기</td>
						<%} %>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
		</form>
		
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
				<td width="50%">내용</td>
				<%if(reply.isEmpty()){ %>
			      <tr><td colspan="3"> 등록된 게시물이 없습니다. </td></tr>
				<%}else{
					for(HoReply replylist : reply){
					%>
					<tr>
					<td><%=replylist.getReplyDate() %></td>
					<td><%=replylist.getReplyId() %></td>
					<td><%=replylist.getReplyContent() %></td>
					</tr>
				<%		}
					} %>
			</tr>
		</table>
		
		
		
		<form id="frm2" method="post" action= "<%=projectName%>/xx.ho">
		<input type="hidden" name="cmd" value="GoodsReply">
`		<input type="hidden" name="name" value="<%=hg.getGoodsId()%>">
		<input type="hidden" name="id" value="<%=sess%>">			
		<input type="hidden" name="name1" value="<%=hg.getGoodsName() %>">
		<br /> <input type="text" autocomplete="off"
		
			placeholder="후기를 입력해 주세요." id="replyInput" name="replyInput" />
			<input type="button" value="입력" id="insertReply"><br /> <br /> 
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