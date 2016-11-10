<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="ho.model.HoGoods"%>
<%@ page import="java.util.List" %>
<% String projectName = "/HoProject"; 
	List<HoGoods> goods=null;
	Object obj =request.getAttribute("GoodsList");


	if(obj !=null) goods = (List<HoGoods>)obj;
/*페이지 번호*/

	String pagenum = request.getParameter("pagenum");
	int pageno = 0;
	int totalRecord =0;	
	if(pagenum!=null) pageno=Integer.parseInt(pagenum);//현재 눌린번호

	if(pageno<1){//현재 페이지
 		pageno = 1;
	}
	//------------------------------------------------------------------//
	  totalRecord=(Integer)request.getAttribute("totalRecord"); //총 레코드 수
	  //System.out.println("totalRecord는:!!!!"+request.getAttribute("totalRecord"));
	   System.out.println(totalRecord);
	   int page_per_record_cnt =3;	//페이지 당 레코드 수
	   int group_per_page_cnt =4;	//페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]

	   int record_end = pageno*page_per_record_cnt;//끝페이지
	   int record_start= record_end-(page_per_record_cnt-1);//시작페이지
	   if(record_end>totalRecord){
	      record_end = totalRecord;
	   }
	   System.out.println(record_end);//10
	   int total_page = totalRecord;
	   
	   System.out.println(total_page);//2
	   if(pageno>total_page){//누른 페이지 번호>10;
	      pageno = total_page; //누른 페이지 번호 = 10
	   }
	   int group_no = pageno/group_per_page_cnt+( pageno%group_per_page_cnt>0 ? 1:0);
	   //현재 그룹번호 = 현재페이지/페이지당 보여줄 페이지 번호수+(햔재페이지%페이지당 보여줄 번호수>0?1:0)
	   int page_eno = group_no*group_per_page_cnt;   //현재 그룹 끝번호   
	   int page_sno = page_eno-(group_per_page_cnt-1);   //현재 그룹 시작번호=현재 그룹 끝번호-(페이지당 보여줄 번호수-1)

	   if(page_eno>total_page){
	      page_eno=total_page;
	   }
	   int prev_pageno = page_sno-group_per_page_cnt;
	   int next_pageno = page_sno+group_per_page_cnt;
	   if(prev_pageno<1){
//	      이전 페이지 번호가 1보다 작을 경우      
	      prev_pageno=1;
//	      이전 페이지를 1로
	   }
	   if(next_pageno>total_page){
//	      다음 페이지보다 전체페이지 수보가 클경우      
	      next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
	   }	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: HO[好]에 오신 것을 환영합니다 ::</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 나눔고딕 -->
<link href='http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css' rel='stylesheet' type='text/css' />

<link href="<%= projectName %>/ho/css/jquery.bxslider.css" rel="stylesheet" />
<link href="<%= projectName %>/ho/css/common.css" rel="stylesheet" />
<script src="<%= projectName %>/ho/js/jquery-1.10.2.min.js"></script>
<script src="<%= projectName %>/ho/js/jquery.bxslider.min.js"></script>
<script type="text/javascript">

</script>

</head>
<body>
	<header>
		<div id="Menuimg">
			<a href="#"><img id="logo" src="<%= projectName %>/ho/img/logo.png" /></a>
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
	
	<section>
			<a href="<%= projectName %>/1.ho?cmd=adminmenu2"><input type="button" id="back" value="뒤로가기"/></a>
		

		<table  id="insertTable" border="1" bordercolor="darkblue" width="1000"  class="table table-hover table-striped" >
  	 
  	 <tr class="info"   id="listTable">
    		 <td> 카테고리 </td>
  	   		 <td> 상품명 </td>
  	   		 <td> 수량 </td>
  	   		 <td> 사진 </td>
 	   		 <td> 구분 </td>
 	 </tr>
   
   	<% for(HoGoods good : goods){ %>
   	<tr >
   		<td id="itemtable"><a href="<%= projectName %>/1.ho?cmd=adminGoodsView&id=<%=good.getGoodsId()%>"><%=good.getGoodsCate() %></a></td>
 	
 	  	<td><a href="<%= projectName %>/1.ho?cmd=adminGoodsView&id=<%=good.getGoodsId()%>"><%=good.getGoodsName() %></a></td>
  	
  		<td><%=good.getGoodsSoo()%></td>
  	
  	    <td><img width="50px" height="50px" src="<%=projectName%>/ho/upload/<%= good.getGoodsImg() %>"></td>
  	
  		<td width="100"><a href="<%= projectName %>/1.ho?cmd=adminPageDelete&count=<%=good.getGoodsSoo()%>id=<%= good.getGoodsName()%>">
  		<input type="button" id="tddel" value="삭제하기"/></a>
  		<a href="<%= projectName %>/1.ho?cmd=adminGoodsInventory&id=<%= good.getGoodsName()%>&count=<%=good.getGoodsSoo()%>">
  		<input type="button" id="tdmodify" value="입고"/></a>
  		</td>
  	</tr>
   <% } %>
  </table>  
      
      <a href="<%=projectName%>/xxx.ho?cmd=list-page&pagenum=1">[맨앞으로]</a>
	
	<a href="<%=projectName%>/xxx.ho?cmd=list-page&pagenum=<%=prev_pageno%>">[이전]</a> 
	<%for(int i =page_sno;i<=page_eno;i++){%>
	<a href="<%=projectName%>/xxx.ho?cmd=list-page&pagenum=<%=i %>">
	<%if(pageno == i){ %>
			[<%=i %>]
		<%}else{ %>
			<%=i %>
		<%} %>
	</a> 

<%} %>
<a href="<%=projectName%>/xxx.ho?cmd=list-page&pagenum=<%=next_pageno%>" >[다음]</a>
<a href="<%=projectName%>/xxx.ho?cmd=list-page&pagenum=<%=total_page %>">[맨뒤로]</a>

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