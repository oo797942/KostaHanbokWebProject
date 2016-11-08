<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% String projectName= "/HoProject";%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>회원가입</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  
  <script src="<%=projectName %>/ho/js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
  <script src="<%=projectName %>/ho/js/jquery.validate.js" type="text/javascript" charset="utf-8"></script>
  <script src="<%=projectName %>/ho/js/script.js"type="text/javascript" ></script>
  <script type="text/javascript">
  var clickDu=false;
  $(function(){
	 $("#idcheck").click(function(){
		var id = $("#id").val();
		clickDu=true;
		window.open("<%=projectName%>/idchk.ho?cmd=check-id&userId="+id,"","width=400, height=350, top=200, left=500");
	 });
	 $("#joinButton").click(function(){
			if($('[name="id"]').val()==""|| $('[name="password"]').val()=="" ||$('[name="name"]').val()==""){
				alert("필수입력사항을 입력하세요(id,비밀번호,이름)");
				return;
			}else if($('[name="password1"]').val() != $('[name="password2"]').val()){
				alert("비밀번호가 일치하지 않습니다.");
				return;
				
				// 인풋테스트.attr('readonly') != "readonly"
			}else if(($('[name="id"]').attr('readonly')) != 'readonly' ){
				alert("중복체크하세요");
				return;
			}else if(($("#agree").is(":checked")==false)){
				alert("약관에 동의하세요");
				return;
			}
			else{
				$('#join').submit();
			}	
	 });
	  
	  
  });
  </script>
  </head>
  <body>

	
      <article class="container" >
        <div class="page-header" >
          <h1><img src="<%=projectName %>/ho/img/KakaoTalk_20161103_160036898.png" width="125" height="45" hspace="62"/>회원가입</h1>
        </div>
        <div class="col-md-6 col-md-offset-3" id="signup">
          <form action ="<%= projectName %>/xxxxx.ho?" role="form" id="join" method="post">
          <input type="hidden" name=cmd value=input-save>
            <div class="form-group">
              <label for="id">
               <span class="glyphicon glyphicon-user" aria-hidden="true"></span>   아이디</label>
              <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해 주세요" autocomplete="off">
              <input type="button" class="idcheck" name="idcheck" id="idcheck" value="중복확인">

            </div>
            <div class="form-group">
              <label for="password1">
               <span class="glyphicon glyphicon-lock" aria-hidden="true"></span> 비밀번호</label>
              <input type="password" class="form-control" name="password1" id="password1" placeholder="비밀번호"autocomplete="off">
            </div>
            <div class="form-group">
              <label for="password2">
              <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>  비밀번호 확인</label>
              <input type="password" class="form-control" name="password2" id="password2" placeholder="비밀번호 확인" autocomplete="off">
              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            <div class="form-group">
              <label for="username">
              <span class="glyphicon glyphicon-user" aria-hidden="true"></span>   이름</label>
              <input type="text" class="form-control" name="username" id="username" placeholder="이름을 입력해 주세요" autocomplete="off"> 
            </div>

            <div class="form-group">
              <label for="tel">
              <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>   휴대폰 번호</label>
                <input type="tel" class="form-control" name="tel" id="tel" placeholder="- 없이 입력해 주세요" maxlength="11" autocomplete="off">
            </div>

            <div class="form-group">
              <label for="sex">
              <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>   성별</label>
                
                <label class="radio">
                <input type="radio"  name="sex" id="male" value="남자" style="margin-right: 0"  >
                	남성	
              	</label>
               
                <label class="radio">
                <input type="radio" name="sex" id="female"value="여자" style=": right"  >
                	여성
              	</label>
            </div>

            <div class="form-group">
              <label for="email">
              <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>   이메일 주소</label>
              <input type="email" class="form-control" name="email" id="email" placeholder="이메일 주소" autocomplete="off">
            </div>
            
            
            <div class="form-group">
              <label for="birth">
              <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>  생년월일</label>
                <input type="date" class="form-control" name="birth" id="birth" autocomplete="off">
            </div>

            
            <div class="form-group">
              <label for="addr">
              <span class="glyphicon glyphicon-home" aria-hidden="true"></span>  주소</label>
                <input type="text" class="form-control" name="addr" id="addr" placeholder="주소는 아직 보류중이다 . " autocomplete="off">
            	<button  class="btn btn-primary" type="button" >주소찾기</button>
            </div>

            <div class="form-group">
              <label for="height">
              <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>  키</label>
                <input type="text" class="form-control" name="height" id="height" placeholder="cm 없이 입력해주세요" autocomplete="off">
            </div>

            <div class="form-group">
              <label for="chest">
              <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>  가슴둘레</label>
                <input type="text" class="form-control" name="chest" id="chest" placeholder="cm 없이 입력해주세요" autocomplete="off">
            </div>

            <div class="form-group">
              <label for="shoulder">
              <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>  어깨</label>
                <input type="text" class="form-control" name="shoulder" id="shoulder" placeholder="cm 없이 입력해주세요" autocomplete="off">
            </div>
            
            
            <div class="form-group">
                <label>
                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>   약관 동의</label><br/>
             <input id="agree" type="checkbox" autocomplete="on">
              <a href="#">이용약관</a>에 동의합니다.
              </div>
            </div>
            
            <div class="form-group text-center">
              <button type="button" class="btn btn-info" id="joinButton">회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
            
            
          </form>
        </div>
        
          <hr>
      </article>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
<!--     <script src="js/bootstrap.min.js"></script> -->
  </body>
</html>