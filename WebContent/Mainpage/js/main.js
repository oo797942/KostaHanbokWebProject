$(function(){
	
	$("#topMenu").hide();
	$("#topCate-Cate1").hide();
	$("#topCate-Cate2").hide();
	$("#topCate-Cate3").hide();
	$("#topCate-Cate4").hide();
	$("#footmenu").hide();
	var mySlider = $('#slide_banner').bxSlider({
		mode: 'horizontal',// 가로 방향 수평 슬라이드
        speed: 200,        // 이동 속도를 설정
        pager: false,      // 현재 위치 페이징 표시 여부 설정
        moveSlides: 1,     // 슬라이드 이동시 개수
        minSlides: 1,      // 최소 노출 개수
        maxSlides: 1,      // 최대 노출 개수
        controls: false,    // 이전 다음 버튼 노출 여부
        video : true,
		useCSS : true,
		adaptiveHeight :true,

	});
	
	
	$("#news").mouseover(function(){
		mySlider.goToSlide(0);
	});
	$("#news").click(function(){
		$("#news").text("NEWS");
		$("#store").text("STORE");
		$("#about").text("ABOUT");
		$("#product").text("PRODUCT");
		$(this).text("_"+$(this).text());
		$("#topMenu").hide();
		$(".Content").hide();
		$("#footmenu").hide();
		$('#topimage').find("img").attr("src","");	
		$("#ContentBackground").css("display","block");
		$("#newsContent").css("display","block");
	}).css('cursor','pointer');
	
	
	$("#store").mouseover(function(){
		mySlider.goToSlide(1);
	});
	$("#store").click(function(){
		$("#news").text("NEWS");
		$("#store").text("STORE");
		$("#about").text("ABOUT");
		$("#product").text("PRODUCT");
		$(this).text("_"+$(this).text());
		$("#topMenu").hide();
		$(".Content").hide();
		$("#footmenu").hide();
		$('#topimage').find("img").attr("src","");	
		$("#ContentBackground").css("display","block");
		$("#storeContent").css("display","block");
	}).css('cursor','pointer');
	
	
	$("#about").mouseover(function(){
		mySlider.goToSlide(2);
	});
	$("#about").click(function(){
		$("#news").text("NEWS");
		$("#store").text("STORE");
		$("#about").text("ABOUT");
		$("#product").text("PRODUCT");
		$(this).text("_"+$(this).text());
		$("#topMenu").hide();
		$(".Content").hide();
		$("#footmenu").hide();
		$('#topimage').find("img").attr("src","");	
		$("#ContentBackground").css("display","block");
		$("#aboutContent").css("display","block");
	}).css('cursor','pointer');
	
	
	$("#product").mouseover(function(){
		mySlider.goToSlide(3);
	});
	$("#product").click(function(){
		$("#news").text("NEWS");
		$("#store").text("STORE");
		$("#about").text("ABOUT");
		$("#product").text("PRODUCT");
		$(this).text("_"+$(this).text());
		$("#topMenu").hide();
		$(".Content").hide();
		$("#footmenu").hide();
		$('#topimage').find("img").attr("src","");	
		$("#ContentBackground").css("display","block");
		$("#productContent").css("display","block");
	}).css('cursor','pointer');
	
	
	$("#menu").click(function(){
//		$("#topMenu").css('display','block');
		$(".Content").hide();
		$("#footmenu").hide();
		$("#ContentBackground").css("display","none");
		$("#topMenu").slideDown();
	}).css('cursor','pointer');
	
	$("#top-CateItem1").click(function(){
		for(var i = 1; i<=5; i++){
			$("#topCate-Cate"+i).hide();
			$("#top-CateItem"+i).css("font-weight","");
		}
		$("#top-CateItem1").css("font-weight","bold");
		$("#topCate-Cate1").show();
	}).css('cursor','pointer');
	
	$("#top-CateItem1").mouseover(function(){
		$('#topimage').find("img").attr("src","");		
		$('#topimage').find("img").attr("src","./img/CateItem1.jpg");
	});
	
	
	$("#top-CateItem2").click(function(){
		for(var i = 1; i<=5; i++){
			$("#topCate-Cate"+i).hide();
			$("#top-CateItem"+i).css("font-weight","");
		}$("#top-CateItem2").css("font-weight","bold");
		$("#topCate-Cate2").show();
	}).css('cursor','pointer');
	
	$("#top-CateItem2").mouseover(function(){
		$('#topimage').find("img").attr("src"," ");
		$('#topimage').find("img").attr("src","./img/CateItem2.jpg");
	});
	
	$("#top-CateItem3").click(function(){
		for(var i = 1; i<=5; i++){
			$("#topCate-Cate"+i).hide();
			$("#top-CateItem"+i).css("font-weight","");
		}$("#top-CateItem3").css("font-weight","bold");
		$("#topCate-Cate3").show();
	}).css('cursor','pointer');
	
	$("#top-CateItem3").mouseover(function(){
		$('#topimage').find("img").attr("src","");		
		$('#topimage').find("img").attr("src","./img/CateItem3.jpg");
	});

	
	$("#top-CateItem4").click(function(){
		for(var i = 1; i<=5; i++){
			$("#topCate-Cate"+i).hide();
			$("#top-CateItem"+i).css("font-weight","");
		}$("#top-CateItem4").css("font-weight","bold");
		$("#topCate-Cate4").show();
	}).css('cursor','pointer');
	
	$("#top-CateItem4").mouseover(function(){
		$('#topimage').find("img").attr("src","");		
		$('#topimage').find("img").attr("src","./img/CateItem4.jpg");
	});
	
	$("#top-CateItem5").click(function(){
		for(var i = 1; i<=5; i++){
			$("#topCate-Cate"+i).hide();
			$("#top-CateItem"+i).css("font-weight","");
		}$("#top-CateItem5").css("font-weight","bold");
		$("#topCate-Cate5").show();
	}).css('cursor','pointer');
	
	$("#top-CateItem5").mouseover(function(){
		$('#topimage').find("img").attr("src","");		
		$('#topimage').find("img").attr("src","./img/CateItem5.jpg");
	});
	
	$(".man").click(function(){
		$(".woman").css("font-weight","");
		$(this).css("font-weight","bold");
	}).css('cursor','pointer');

	$(".woman").click(function(){
		$(".man").css("font-weight","");
		$(this).css("font-weight","bold");
	}).css('cursor','pointer');
	
	$("#topXbutton").click(function(){
		$('#topimage').find("img").attr("src","");
		$("#topMenu").slideUp();
	}).css('cursor','pointer');

	$('#adlogin').click(function() {
		$(".Content").hide();
		$("#topMenu").hide();
		$('#topimage').find("img").attr("src","");
		$("#ContentBackground").css("display","none");
		$("#footmenu").slideDown();
	}).css('cursor','pointer');
	
	$("#foottop").click(function(){
		$("#footmenu").slideUp();
	}).css('cursor','pointer');
	
	$(".contentXbutton").click(function(){
		$("#news").text("NEWS");
		$("#store").text("STORE");
		$("#about").text("ABOUT");
		$("#product").text("PRODUCT");
		$(".Content").hide();
		$("#ContentBackground").css("display","none");
	}).css('cursor','pointer');
	
});