$(function() {

	$(window).scroll(function() {
		$("nav").animate({
			top: $(document).scrollTop() + 100
		},0);
	});

	$("#topMenu").hide();
	$("#topCate-Cate1").hide();
	$("#topCate-Cate2").hide();
	$("#topCate-Cate3").hide();
	$("#topCate-Cate4").hide();
	$("#topSearch").hide();

	$("#top-CateItem1").click(function() {
		for (var i = 1; i <= 5; i++) {
			$("#topCate-Cate" + i).hide();
			$("#top-CateItem" + i).css("font-weight", "");
		}
		$("#top-CateItem1").css("font-weight", "bold");
		$("#topCate-Cate1").show();
	}).css('cursor', 'pointer');
	$("#top-CateItem2").click(function() {
		for (var i = 1; i <= 5; i++) {
			$("#topCate-Cate" + i).hide();
			$("#top-CateItem" + i).css("font-weight", "");
		}
		$("#top-CateItem2").css("font-weight", "bold");
		$("#topCate-Cate2").show();
	}).css('cursor', 'pointer');
	$("#top-CateItem3").click(function() {
		for (var i = 1; i <= 5; i++) {
			$("#topCate-Cate" + i).hide();
			$("#top-CateItem" + i).css("font-weight", "");
		}
		$("#top-CateItem3").css("font-weight", "bold");
		$("#topCate-Cate3").show();
	}).css('cursor', 'pointer');
	$("#top-CateItem4").click(function() {
		for (var i = 1; i <= 5; i++) {
			$("#topCate-Cate" + i).hide();
			$("#top-CateItem" + i).css("font-weight", "");
		}
		$("#top-CateItem4").css("font-weight", "bold");
		$("#topCate-Cate4").show();
	}).css('cursor', 'pointer');
	$("#top-CateItem5").click(function() {
		for (var i = 1; i <= 5; i++) {
			$("#topCate-Cate" + i).hide();
			$("#top-CateItem" + i).css("font-weight", "");
		}
		$("#top-CateItem5").css("font-weight", "bold");
		$("#topCate-Cate5").show();
	}).css('cursor', 'pointer');

	var mySlider = $('#slide_banner').bxSlider({
		mode : 'horizontal',// 가로 방향 수평 슬라이드
		speed : 200, // 이동 속도를 설정
		pager : false, // 현재 위치 페이징 표시 여부 설정
		moveSlides : 1, // 슬라이드 이동시 개수
		slideWidth : 1024, // 슬라이드 너비
		minSlides : 1, // 최소 노출 개수
		maxSlides : 1, // 최대 노출 개수
		auto : false, // 자동 실행 여부
		autoHover : false, // 마우스 호버시 정지 여부
		controls : false
	});

	$("#slide1").mouseover(function() {
		mySlider.goToSlide(0);
	});

	$("#slide2").mouseover(function() {
		mySlider.goToSlide(1);
	});

	$("#slide3").mouseover(function() {
		mySlider.goToSlide(2);
	});
	
	$("#slide4").mouseover(function() {
		mySlider.goToSlide(3);
	});
	
	$("#slide5").mouseover(function() {
		mySlider.goToSlide(4);
	});

	$("#menu").click(function() {
		// $("#topMenu").css('display','block');
		$("#topMenu").slideDown(500);
		$("#menu").hide();
	});

	$("#xbutton").click(function() {
		if ($("#topSearch").attr('style') == 'display: block;') {
			$("#topSearch").slideUp(500);
			setTimeout(function() {
				$("#topMenu").slideUp(500);
				$("#searchBtn").text("search");
			}, 500);
			$("#menu").show();

		} else {
			$("#topMenu").slideUp(500);
			$("#menu").show();
		}
	}).css('cursor', 'pointer');

	$(".man").click(function() {
		$(".woman").css("font-weight", "");
		$(this).css("font-weight", "bold");
	}).css('cursor', 'pointer');

	$(".woman").click(function() {
		$(".man").css("font-weight", "");
		$(this).css("font-weight", "bold");
	}).css('cursor', 'pointer');

	$("#searchBtn").click(function() {
		if ($("#searchBtn").text() == "search") {
			$("#topSearch").slideDown(500);
			$("#searchInput").focus();
			$("#searchInput").select();
			$("#searchBtn").text("close");
		} else {
			$("#topSearch").slideUp(500);
			$("#searchBtn").text("search");
		}
	});


});
