/**
 * 
 */
$(function(){
	$('#signup>form').validate({
		rules : {
			id : {required : true,minlength : 6, maxlength :20},
			password1 : {minlength : 6, maxlength : 12},
			password2 : {equalTo : '#password1'},
			username : {required : true},
			tel : { required : true},
			email : {required : true , email : true},
			birth : {},
			height : {},
			chest : {},
			shoulder : {}
		},
		success : function(label){   // 성공할시 label을 가져온다     	// 함수선언  ex) prototype
			label.text('성공').addClass('valid')
		}
	});
	
	//attr() -> prop() 변경
//	$(".check-all").click(function() {
//		$("input[name=agree]:checkbox").prop("checked", true);
//	});
//	$(".uncheck-all").click(function() {
//		$("input[name=agree]:checkbox").prop("checked", false);
//	});

//	$(".check-all").click(function() {
//	$('.agree').prop('checked',this.checked);
//	$('.agree').prop('checked',$(this).is(':checked'));
//	});
	
////	$('.agree').click(function(){
//		if(!$(this).prop('checked')){
//			$('.check-all').prop('checked',false);
//		}
//	});
});