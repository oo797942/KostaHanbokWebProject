<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: HO[好]에 오신 것을 환영합니다 ::</title>

<link href="./css/jquery.bxslider.css" rel="stylesheet" />
<link href="./css/main.css" rel="stylesheet" />
<script src="./js/jquery-1.10.2.min.js"></script>
<script src="./js/jquery.bxslider.min.js"></script>
<script src="./js/script.js"></script>


</head>
<body>
	<header>
		<div id="menu">
			<img src="../img/topMenu.png" />
		</div>
		<div id="Menuimg">
			<img id="logo" src="../img/logo.png" />
		</div>
		<div id="topMenu">
			<table id="smallMenu">
				<tr>
					<td><a href="#">LOGIN</a></td>
					<td class="gray">l</td>
					<td><a href="#">JOIN</a></td>
					<td class="gray">l</td>
					<td><a href="#">Q&A</a></td>
					<td class="gray">l</td>
					<td><a href="#">CART</a></td>
					<td class="gray">l</td>
					<td><a href="#">ORDER</a></td>
				</tr>
			</table>

			<div id="topCate">
				<a id="top-CateItem1">개량한복</a><br /> <br /> <a id="top-CateItem2">생활한복</a><br />
				<br /> <a id="top-CateItem3">퓨전한복</a><br /> <br /> <a
					id="top-CateItem4">아동한복</a><br /> <br /> <a id="top-CateItem5">악세서리</a>
			</div>
			<div id="topCate-Cate1">
				<a class="man">남자</a><br /> <a class="woman">여자</a>
			</div>
			<div id="topCate-Cate2">
				<a class="man">남자</a><br /> <a class="woman">여자</a>
			</div>
			<div id="topCate-Cate3">
				<a class="man">남자</a><br /> <a class="woman">여자</a>
			</div>
			<div id="topCate-Cate4">
				<a class="man">남자</a><br /> <a class="woman">여자</a>
			</div>
			<a id="searchBtn">search</a> <a id="xbutton">X</a>
			<hr size="1" noshade="noshade" />
		</div>

		<div id="topSearch">
			<input type="text" id="searchInput" autocomplete="off" placeholder="Type Here To Search" />
		</div>

	</header>
	<section>
		<div id="banner_wrap">
			<ul id="slide_banner">
				<li><img class="slide" src="../img/banner_image_01.jpeg"
					alt="사진1" /></li>
				<li><img class="slide" src="../img/banner_image_02.png"
					alt="사진2" /></li>
				<li><img class="slide" src="../img/banner_image_03.jpg"
					alt="사진2" /></li>
			</ul>
		</div>
		<table id="slidefocus">
			<tr>
				<td id="slide1">오늘의 상품</td>
			</tr>
			<tr>
				<td id="slide2">계절 맞춤</td>
			</tr>
			<tr>
				<td id="slide3">어쩌구 저쩌구</td>
			</tr>
			<tr>
				<td id="slide4">행복하자 우리</td>
			</tr>
			<tr>
				<td id="slide5">아프지말고</td>
			</tr>
		</table>

	</section>
	<footer> </footer>

</body>
</html>