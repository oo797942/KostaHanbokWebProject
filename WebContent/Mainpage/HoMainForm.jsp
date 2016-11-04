<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=text/html; charset=UTF-8">
<title>Ho</title>
<link rel="stylesheet" type="text/css" href="./css/jquery.bxslider.css"
	media="all" />
<link rel="stylesheet" type="text/css" href="./css/main.css" media="all" />
<script src="./js/jquery-3.1.1.min.js"></script>
<script src="./plugin/jquery.bxslider.min.js"></script>
<script src="./plugin/jquery.fitvids.js"></script>
<script type="text/javascript" src="./js/main.js">
	
</script>
</head>
<body>

	<header>
		<div>
			<ul id="slide_banner">
				<li><div>
						<iframe id="movie" width=100% height=52%
							src="https://www.youtube.com/embed/1ya6sytK1Zw?autoplay=1&loop=1&playlist=1ya6sytK1Zw&modestbranding=1&controls=0&showinfo=0"
							frameborder="0" allowfullscreen>
					</div>
					</iframe></li>
				<li><img width=100% height=100% alt="사진1"
					src="./img/slideimg1.jpg"></li>
				<li><img width=100% height=100% alt="사진2"
					src="./img/slideimg2.jpg"></li>
				<li><img width=100% height=100% alt="사진3"
					src="./img/slideimg3.jpg"></li>
			</ul>
		</div>

		<div id="logoimg">
			<a href="NewFile.jsp"><img src="./img/logo.jpg"></a>
		</div>


		<div id="SideMenu">
			<ul class="sm1">
				<li id="news" class="sm">NEWS</li>
				<li id="store" class="sm">STORE</li>
				<li id="about" class="sm">ABOUT</li>
				<li id="product" class="sm">PRODUCT</li>
			</ul>
		</div>

		<div id="menu">
			<img src="./img/menu.png">
		</div>


		<div id="topMenu">
			<div id="Menuimg">
				<a href="NewFile.jsp"><img src="./img/logo.jpg"></a>
			</div>
			<div id="topCate">
				<a id="top-CateItem1">개량한복</a> <br />
				<br /> <a id="top-CateItem2">생활한복</a> <br />
				<br /> <a id="top-CateItem3">퓨전한복</a> <br />
				<br /> <a id="top-CateItem4">아동한복</a> <br />
				<br /> <a id="top-CateItem5">악세서리</a>
			</div>

			<div id="topCate-Cate1">
				<a class="man">남 자</a> <br /> <a class="woman">여 자</a>
			</div>
			<div id="topCate-Cate2">
				<a class="man">남 자</a> <br /> <a class="woman">여 자 </a>
			</div>
			<div id="topCate-Cate3">
				<a class="man">남 자 </a><br /> <a class="woman">여 자 </a>
			</div>
			<div id="topCate-Cate4">
				<a class="man">남 자</a> <br /> <a class="woman">여 자 </a>
			</div>
			<a id="topXbutton">X</a>
		</div>
		<div id="topimage">
			<img />
		</div>

		<div id="ContentBackground"></div>
		<div id=newsContent class="Content">
			<a class="contentXbutton">X</a> newsContent 내용
		</div>
		<div id=storeContent class="Content">
			<a class="contentXbutton">X</a> storeContent 내용
		</div>

		<div id=aboutContent class="Content">
			<a class="contentXbutton">X</a> aboutContent 내용
		</div>

		<div id=productContent class="Content">
			<a class="contentXbutton">X</a> productContent 내용
		</div>

	</header>

	<footer>
		<div id="admin">
			<a id="adlogin">login</a>
		</div>
		<form action="NewFile.jsp" method="get" name="log_f" id="login_f">
			<div id="footmenu">
				<table>
					<tr>
						<td></td>
						<td id="foottop" align="center">X</td>
					</tr>
					<tr>
						<td>id</td>
						<td><input type="text" name="loginid" id="adid" /></td>
					</tr>
					<tr>
						<td>pw &nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><input type="text" id="loginpw" name="adpw" /></td>
					</tr>
					<tr>
						<td></td>
						<td align="left"><input type="submit" id="ok" value="login" /></td>
					</tr>
				</table>
			</div>
		</form>
	</footer>




</body>
</html>