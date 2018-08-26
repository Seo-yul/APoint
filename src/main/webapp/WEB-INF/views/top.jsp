<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<style>
@media ( max-width : 575px) {
	.img-circle{
		width:25px;
	}
}
@media ( min-width : 576px) {
	.img-circle{
		width:25px;
	}
}
@media ( min-width : 768px) {
	.img-circle{
		width:40px;
	}
}
@media ( min-width : 992px) {
	.img-circle{
		width:40px;
	}
}
@media ( min-width : 1200px) {
	.img-circle{
		width:40px;
	}
}
</style>
<!-- <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->
<script type="text/javascript">
$(()=>{
var count = -10
var nickname = "${sessionScope.userinfo.nickname}"
	if(nickname.length>0){
		$("#getNickname").css('padding-bottom','10px')
 		$("#statbtn").html("LogOut <img alt='카카오로그아웃' src='http://apoint.cf/apoint/resources/images/kakaolink_btn_small_out.png'>")
		$("#getNickname").html("<img class='img-circle' alt='카카오프사' src='${sessionScope.userinfo.thumbnail_image}'>"+nickname)
	}else{
		$("#getNickname").html("Guest")
	}
	$.goUser = ()=>{
		if(nickname.length>0){
			count ++
			if(count==0){
			var codes = prompt()
			var url = "http://apoint.cf/apoint/goUser.go?codes="+codes
			 	$(location).attr('href', url);
				}
			}
	}
	$.goKakaoLogin = ()=>{
		var nickname = "${sessionScope.userinfo.nickname}"
			if(nickname.length<1){
			var url = "https://kauth.kakao.com/oauth/authorize?client_id=22ea902191dce54f33acf4ab9685d75a&redirect_uri=http://apoint.cf/apoint/oauth&response_type=code"
				$(location).attr('href', url);
					//카카오 로그인
			}else{
				//kakao sso 완전 로그아웃 만료시간 기다림없음.
				$('#navbar').html("<iframe src='https://developers.kakao.com/logout' width=1 height=1 frameborder=1></iframe>")				
				var url = "http://apoint.cf/apoint/logout.go"
 			 		$(location).attr('href', url);
				}
				
 			
				
		}
})

</script>
<body>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="http://apoint.cf/apoint/">Academy Point</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li id="home"><a href="http://apoint.cf/apoint/">Home</a></li>
            <li id="dictionary"><a href="http://apoint.cf/apoint/dictionary" >Dictionary</a></li>
            <li id="help"><a href="http://apoint.cf/apoint/help" >KanjiRank</a></li>
            <c:if test="${userinfo.grade=='admin'}">
			<li id="Manage"><a href="http://apoint.cf/apoint/manage" >Manage</a></li>
			</c:if>
            
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Class<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li id="oddtime"><a href="http://apoint.cf/apoint/timetable">TimeTable</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">35기</li>
                <li id="oddit">
                <a href="http://apoint.cf/apoint/oddit">
               IT</a></li>
                <li id="oddjp">
                <a href="http://apoint.cf/apoint/oddjp">
             일본어</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">36기</li>
                <li id="evenit"><a href="#">준비중</a></li>
                <li id="evenjp"><a href="#">준비중</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a id="statbtn" href="javascript:$.goKakaoLogin();">LogIn
            <img alt="카카오로그인" src="http://apoint.cf/apoint/resources/images/kakaolink_btn_small_ov.png">
            </a></li>
            <li class="divider"></li>
            <li id="logstat"><a href="javascript:$.goUser()" id="getNickname">Guest<span class="sr-only">(current)</span></a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

</body>
</html>