<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Kanji Rank</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" href="./resources/images/favicon.ico">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="./resources/css/footer.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<!--===============================================================================================-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--===============================================================================================-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="./resources/js/help.js"></script>
<!--===============================================================================================-->
</head>
<body>


<!-- Top nav page content -->
<%@ include file="top.jsp" %>


<!-- Begin page content -->
	<div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h2><i class="fab fa-twitter"></i>트위터 랭킹</h2>
        <h4>현재 도쿄 거주중인 일본인들이 자주 사용하는 한자 랭킹을 나타냅니다. <br>
        현 시간의 일주일 전 시간을 기준으로 합니다.	
        </h4>
        <p>
         <c:if test="${userinfo.grade=='admin'}">
          <a class="btn btn-xs btn-primary" href="http://apoint.cf/apoint/refresh" role="button">랭킹갱신 &raquo;</a>
         </c:if>
         </p>
         <c:if test="${kanlist!='null'}">
         
         <div class="panel panel-default">
         	<div class="panel-body">
    			<ul class="list-group">
    			<li class="list-group-item list-group-item-question list-group-no-note clearfix ">
    			  <div class="col col-xs-6">
         			 <div class="col col-xs-2">
        			 <c:out value="한자"></c:out><br>
			         </div>
			         <div class="col col-xs-4">
			         <c:out value="뜻"></c:out><br>
			         </div>
			         <div class="col col-xs-2">
			         <c:out value="빈도"></c:out><br>
			         </div>
        		 </div>
        		  <div class="col col-xs-6">
         			 <div class="col col-xs-2">
        			 <c:out value="한자"></c:out><br>
			         </div>
			         <div class="col col-xs-4">
			         <c:out value="뜻"></c:out><br>
			         </div>
			         <div class="col col-xs-2">
			         <c:out value="빈도"></c:out><br>
			         </div>
        		 </div>
        		 </li>
        		 
    			
    			<c:forEach var="alist" items="${kanlist}" varStatus="i">
    			<c:if test="${i.index%2==0}">
         <li class="list-group-item list-group-item-question list-group-no-note clearfix">
         </c:if>
         <div class="col col-xs-6">
          <div class="col col-xs-2">
         <c:out value="${alist.kanji}"></c:out><br>
         </div>
         <div class="col col-xs-4">
         <c:out value="${alist.kor}"></c:out><br>
         </div>
         
         <div class="col col-xs-2">
         <c:out value="${alist.counter}회"></c:out><br>
         </div>
         </div>
         
         <c:if test="${i.index%2==1}">
         </li>
         </c:if>
         </c:forEach>
    			</ul>
    			</div>
         </div>
         
         
         
         
         </c:if>
         <c:if test="${kanlist=='null'}">
         <c:out value="랭킹 갱신 준비중입니다."></c:out>
         </c:if>
      </div>
      </div> <!-- /container -->
    
<!-- footer page content -->
<%@ include file="foot.jsp" %>

</body>
</html>
