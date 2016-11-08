<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% String projectName = "/HoProject"; %>
<%
	Object obj = session.getAttribute("yourid");
	String id=null;
	if(obj != null){
		id=(String)obj;
	}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>로그인</title>

    <!-- Bootstrap -->
    <link href="<%=projectName%>/ho/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link href="<%=projectName%>/ho/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Style -->
    <link href="<%=projectName%>/ho/css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></scri.row>.containerpt>
    <![endif]-->
    <script type="text/javascript" src="<%=projectName%>/ho/js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
    $(function(){
    	var result = "<%=request.getParameter("result")%>";
    	var loginid = "<%=request.getAttribute("loginid")%>";
  		alert("팝업시"+loginid);
    	var id = "<%=id%>";
    	if(id!="null"){
    /* 		alert("랄랄라"+id); */
    		//$(opener.document).find("#shoplogin").text("LOGOUT");
  			
    		$(opener.document).find("#shoplogin").hide();
    		$(opener.document).find("#shoplogout").show();
    		opener.location.href="<%=projectName%>/log.ho?cmd=shop-main";

    		window.close();
    	}else{
    		if(result=="2"){
    			alert("다시로긴해");
    		}
    		
    	}
    });
    
    </script>
  </head>
  <body>
  <br/>
    <div class="container">
      <div class="row">
        
        <div class="col-md-3">
          <div class="login-box well">
        <form accept-charset="UTF-8" role="form" method="get" action="<%=projectName%>/shoplogin.ho" >
            <input type="hidden" name="cmd" value="shop-login" />
            <legend>로그인</legend>
            <div class="form-group">
                <label for="username-email">이메일 or 아이디</label>
                <input name="adid" value='' id="username-email" placeholder="E-mail or Username" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input name="adpw" id="password" value='' placeholder="Password" type="password" class="form-control" />
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-default btn btn-primary btn-login-submit btn-block m-t-md" value="Login" />
            </div>
            <span class='text-center'><a href="/bbs/index.php?mid=index&act=dispMemberFindAccount" class="text-sm">비밀번호 찾기</a></span>
            <hr />
        </form>
          </div>
        </div>
      </div>
    </div>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="<%=projectName %>/ho/js/bootstrap.min.js"></script>
  </body>
  </html>