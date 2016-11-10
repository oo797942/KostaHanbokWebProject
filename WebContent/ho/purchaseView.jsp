<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%
	String projectName = "/HoProject";
%>
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
<link href="<%=projectName%>/ho/css/common.css" rel="stylesheet" />
<script src="<%=projectName%>/ho/js/jquery-1.10.2.min.js"></script>
<script src="<%=projectName%>/ho/js/jquery.bxslider.min.js"></script>

</head>
<body>
	<header> </header>

	<section>
	<div class="alignleft">
		<div class="panel">
			<div>
				<div class="header">
					<h2 class="num">01</h2>
					<div class="title" style="text-align: left;">
						주문리스트 확인 <span id="confirmProdStr">(총 1개 / 75,000원)</span>
					</div>
				</div>
			</div>
			<div>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="img" rowspan="2"><img src="img/suzi.jpg" width="58"
								height="58" alt=""></td>
							<td class="nme" rowspan="2">dsadsadsaad</td>
							<td class="qty" rowspan="2">1 개</td>
							<td class="price" rowspan="2">**가격**</td>
							<td class="amt" rowspan="2"><span class="total_price">
									**총가격**</span></td>
							<td class="td_numbig" rowspan="2">배송비 10,000원</td>
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
								<input type="text" name="name" id="name" class="form-control"
									value="" readonly="readonly" required>
							</div>
						</div><br /><br />

						<!-- 이메일 -->
						<div class="form-group">
							<label for="eamil" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
								Email
							</label>
							<div class="col-md-3">
								<input type="email" name="email" id="eamil" class="form-control"
									value="" required="required">
							</div>
						</div><br/><br/> 

						<!-- 전화번호 -->
						<div class="form-group">
							<label for="tel" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-phone" aria-hidden="true"></span> 전화
							</label>
							<div class="col-md-3">
								<input type="text" name="tel" id="tel" class="form-control"
									value="" required="required">
							</div>
						</div><br /><br />

						<!-- 주소 & 상세주소 -->
						<div class="form-group">
							<label for="addr" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-home" aria-hidden="true"></span> 주소
							</label>
							<div class="col-md-5">
								<input type="text" name="addr" id="addr" class="form-control" placeholder="주소를 입력하세요"
									value="" required="required"><br/>
								<input type="text" name="addr" id="addr" class="form-control" placeholder="상세주소를 입력하세요"
									value="" >
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
				</div>
			</div>

			<table width="1000" height="350" class="table table-bordered">
				<tr>
					<td>
					<br/><br/>
						<!-- 배송지명 -->
						<div class="form-group">
							<label for="delivery" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-user" aria-hidden="true"></span> 배송지명
							</label>
							<div class="col-md-5">
								<input type="text" name="delivery" id="delivery" class="form-control"
									value="" placeholder="배송지명을 입력하세요" required="required">
							</div>
						</div><br /><br />

						<!-- 수령자명 -->
						<div class="form-group">
							<label for="receiver" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-envelope" aria-hidden="true"></span>수령자명
							</label>
							<div class="col-md-3">
								<input type="email" name="receiver" id="receiver" class="form-control"
									value="" required="required">
							</div>
						</div><br/><br/> 

						<!-- 전화번호 -->
						<div class="form-group">
							<label for="tel" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-phone" aria-hidden="true"></span> 전화
							</label>
							<div class="col-md-3">
								<input type="text" name="tel" id="tel" class="form-control"
									value="">
							</div>
						</div><br /><br />

						<!-- 주소 & 상세주소 -->
						<div class="form-group">
							<label for="detail" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-home" aria-hidden="true"></span> 주소
							</label>
							<div class="col-md-5">
								<input type="text" name="detail" id="detail" class="form-control" placeholder="주소를 입력하세요"
									value=""><br/>
							</div>
						</div><br /><br />
						
						<!-- 배달시요구사항 -->
						<div class="form-group">
							<label for="demand" class="col-md-2 control-label"> <span
								class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>  배달시 요구사항
							</label>
							<div class="col-md-5">
								<input type="text" name="demand" id="demand" class="form-control" placeholder="입력하지마 ㅆ.."
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
                <div id="total2">총 결제금액<span class="pull-right" style="font-size:16px;">원</span><span class="pull-right" id="od_tot_price" style="font-size:16px;">72,380</span></div>
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
						<div class="radio"><input type="radio" id="od_settle_card" name="od_settle_case" value="신용카드"> <label for="od_settle_card">신용카드</label></div>
						<div class="radio"><input type="radio" id="od_settle_bank" name="od_settle_case" value="무통장"> <label for="od_settle_bank">무통장입금</label></div>
						<div c	lass="radio"><input type="radio" id="od_settle_iche" name="od_settle_case" value="계좌이체"> <label for="od_settle_iche">에스크로 실시간 계좌이체</label></div>
					</div>		
         	   	</div>
         	 <div class="body bottom"     font-family: "DINPro-Medium";>
         	<p>무통장입금 주문건 3일이내 미입금 시, 자동 취소처리가 진행됩니다.</p>
         	<p>신용카드 결제시 화면 아래 '결제하기'버튼을 클릭하시면 신용카드 결제 창이 나타납니다. 
            <br>신용카드 결제 창을 통해 입력되는 고객님의 카드 정보는 128bit로 안전하게 암호화되어 전송되며 승인 처리 후 카드 정보는 승인 성공/ 실패 여부에 상관없이 자동 으로 폐기되므로, 안전합니다.</p>
            <p>신용카드 결제 신청시 승인 진행에 다소 시간이 소요될 수 있으므로 '중지', '새로고침'을 누르지 마시고 결과 화면이 나타 날때까지 기다려 주십시오. 
            <br>(결제하기 버튼 클릭시 결제창이 나타나지 않을 경우나 안전결제 모듈이 설치 되지 않을경우 <a href="http://admin.allthegate.com/admin_board/download_pds.jsp?filename=AGSPay_Setup.zip">[여기]</a> 를 눌러 수동으로 플러그인을 설치하십시요.)</p>
			<p>신용카드/ 실시간 이체는 결제 후, 무통장입금은 입금확인 후 배송이 이루어집니다.</p>
			<p>국내 모든 카드 사용이 가능하며 해외에서 발행된 카드는 이용하실수 없습니다.</p>
			<p>HO[好] 는 구매안전서비스로 전자보증 서비스에 가입되어있습니다.</p>
			            
         	   	</div>
			</div>
		</div>
	</div>
	
	
	<div id="display_pay_button" class="btn-group">
   		<input type="button" value="결제하기" class="btn_submit" onclick="">
	</div>

	</section>

	<footer> </footer>

</body>
</html>