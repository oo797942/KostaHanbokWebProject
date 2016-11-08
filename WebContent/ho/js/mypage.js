$(function() {

	var addrBtn = $("#changAddrBtn");
	var shoulderBtn = $("#changeShoulderBtn");
	var bustBtn = $("#changeBustBtn");
	var heightBtn = $("#changeHeightBtn");

	addrBtn.click(function() {
		if (addrBtn.text() == "주소 수정") {
			$("#myPageaddr").removeAttr("readonly");
			$("#myPageaddr").focus();
			$("#myPageaddr").select();
			addrBtn.text("수정 완료");
		} else {
			$("#myPageaddr").attr("readonly", "readonly");
			addrBtn.text("주소 수정");
		}
	});

	bustBtn.click(function() {
		if (bustBtn.text() == "가슴 수정") {
			$("#myPagebust").removeAttr("readonly");
			$("#myPagebust").focus();
			$("#myPagebust").select();
			bustBtn.text("수정 완료");
		} else {
			$("#myPagebust").attr("readonly", "readonly");
			bustBtn.text("가슴 수정");
		}
	});

	shoulderBtn.click(function() {
		if (shoulderBtn.text() == "어깨 수정") {
			$("#myPageshoulder").removeAttr("readonly");
			$("#myPageshoulder").focus();
			$("#myPageshoulder").select();
			shoulderBtn.text("수정 완료");
		} else {
			$("#myPageaddr").attr("readonly", "readonly");
			shoulderBtn.text("어깨 수정");
		}
	});

	heightBtn.click(function() {
		if (heightBtn.text() == "키 수정") {
			$("#myPageheight").removeAttr("readonly");
			$("#myPageheight").focus();
			$("#myPageheight").select();
			heightBtn.text("수정 완료");
		} else {
			$("#myPageheight").attr("readonly", "readonly");
			heightBtn.text("키 수정");
		}
	});
});