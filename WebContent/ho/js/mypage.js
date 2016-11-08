$(function() {

	var addrBtn = $("#changAddrBtn");
	var shoulderBtn = $("#changeShoulderBtn");
	var bustBtn = $("#changeBustBtn");
	var heightBtn = $("#changeHeightBtn");
	var passBtn = $("#changePassBtn");
	var emailBtn = $("#changeEmailBtn");
	var telBtn = $("#changeTelBtn");
	var nameBtn = $("#changeNameBtn");



	passBtn.click(function() {
		$("#myPagePassChange").removeAttr("readonly");
		return false;
	});

	nameBtn.click(function() {

		$("#myPageName").removeAttr("readonly");
		$("#myPageName").focus();
		$("#myPageName").select();
		return false;
	});

	emailBtn.click(function() {
		$("#myPageemail").removeAttr("readonly");
		$("#myPageemail").focus();
		$("#myPageemail").select();
		return false;
	});

	telBtn.click(function() {
		$("#myPagetel").removeAttr("readonly");
		$("#myPagetel").focus();
		$("#myPagetel").select();
		return false;
	});

	addrBtn.click(function() {

		$("#myPageaddr").removeAttr("readonly");
		$("#myPageaddr").focus();
		$("#myPageaddr").select();
		return false;

	});

	bustBtn.click(function() {

		$("#myPagebust").removeAttr("readonly");
		$("#myPagebust").focus();
		$("#myPagebust").select();
		return false;

	});

	shoulderBtn.click(function() {

		$("#myPageshoulder").removeAttr("readonly");
		$("#myPageshoulder").focus();
		$("#myPageshoulder").select();
		return false;

	});

	heightBtn.click(function() {

		$("#myPageheight").removeAttr("readonly");
		$("#myPageheight").focus();
		$("#myPageheight").select();
		return false;

	});
});