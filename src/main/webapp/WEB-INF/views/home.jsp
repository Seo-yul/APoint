<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Academy Point</title>
<!-- 카카오 썸네일 설정 이미지 만들어서 하기 -->

<!-- <meta property="og:type" content="website"> -->

<!-- <meta property="og:title" content="제목에 뜰 내용(굵은글씨)"> -->

<!-- <meta property="og:url" content="링크걸릴주소"> -->

<!-- <meta property="og:description" content="제목아래쪽에 한줄 나오는 짧은 소개글"> -->

<!-- <meta property="og:image" content="썸네일이미지 경로"> -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" href="http://apoint.cf/apoint/resources/images/favicon.ico">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--===============================================================================================-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--===============================================================================================-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="http://apoint.cf/apoint/resources/css/footer.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="http://apoint.cf/apoint/resources/css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="http://apoint.cf/apoint/resources/css/home.css">
<!--===============================================================================================-->
<script src="http://apoint.cf/apoint/resources/js/home.js"></script>
<!--===============================================================================================-->
<script type="text/javascript">
$(()=>{
	"use strict";
	//var thisday = "day${today}"
	var searchspan = $("span[name=tdate]").eq(${today-1}).addClass("active")
	var wpc = ${wpc}
	var mpc = ${mpc}
	var arryWeekPlan = ""
	var arryMonthPlan = ""

		if(wpc>0)
			arryWeekPlan += "${arryWeekPlan0}"
		if(wpc>1)
			arryWeekPlan += "<br>${arryWeekPlan1}"
		if(wpc>2)
			arryWeekPlan += "<br>${arryWeekPlan2}"
		if(wpc>3)
			arryWeekPlan += "<br>${arryWeekPlan3}"
		$("#weekPlan").html(arryWeekPlan)
			
			
		if(mpc>0)
			arryMonthPlan += "${arryMonthPlan0}"
		if(mpc>1)
			arryMonthPlan += "<br>${arryMonthPlan1}"
		if(mpc>2)
			arryMonthPlan += "<br>${arryMonthPlan2}"
		if(mpc>3)
			arryMonthPlan += "<br>${arryMonthPlan3}"
			
		$("#monthPlan").html(arryMonthPlan)
		
})

</script>
</head>
<body>

<!-- Top nav page content -->
<%@ include file="top.jsp" %>

<!-- Begin page content -->
	<div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
      <div class="row">
      <div class="col-xs-12 col-md-8">
      
     <div class="month">      
  <ul>
    <li>
      ${year}<br>
      <span style="font-size:18px"> ${month}</span><br>
      <span class="pull-right" id="time" style="font-size:14px" >${serverTime}</span>
    </li>
  </ul>
</div>

<ul class="weekdays">
  <li>Su</li>
  <li>Mo</li>
  <li>Tu</li>
  <li>We</li>
  <li>Th</li>
  <li>Fr</li>
  <li>Sa</li>
</ul>

<ul class="days">

<c:set value="${firstday}" var="fstday"></c:set>
<c:set value="${lastday}" var="latday"></c:set>
<%
String k = pageContext.getAttribute("fstday").toString();
int i = Integer.parseInt(k);
for(;i>0;i--){ %>
	<li></li>
	<%
}

k = pageContext.getAttribute("latday").toString();
i = Integer.parseInt(k);
for(int day=1;day<i+1;day++){ %>
	<li><span name="tdate">
	<%=day%>
	</span></li>
	<%
}
%>
</ul>
        </div>
        <!-- :eq(), :lt(), :gt(), :even, :odd --> 
      <div class="col-xs-6 col-md-4">
      <div class="well well-sm ">
        <p class="text-center" style="font-size:18px">Day + 7</p>
        <p class="text-center" style="font-size:15px" id="weekPlan">일정없음
        </p>
        </div>
        </div>
        <div class="col-xs-6 col-md-4">
         <div class="well well-sm">
         <p class="text-center" style="font-size:18px">Day + 30</p>
        <p class="text-center" style="font-size:15px" id="monthPlan">일정없음
        </p>
         </div>
      </div>
      </div>
        <div>
       <p class="pull-right">
          <a class="btn btn-lg btn-primary" href="http://apoint.cf/apoint/member/attendance" role="button">출석체크 &raquo;</a>
        </p>
        </div>
      </div>
      </div> <!-- /container -->
    
<!-- footer page content -->
<%@ include file="foot.jsp" %>
    
</body>
</html>
