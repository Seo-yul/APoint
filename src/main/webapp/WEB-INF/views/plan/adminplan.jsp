<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>일정관리</title>
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
<link rel="stylesheet" type="text/css" href="http://apoint.cf/apoint/resources/css/footer.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="http://apoint.cf/apoint/resources/css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="http://apoint.cf/apoint/resources/css/adminplan.css">
<!--===============================================================================================-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--===============================================================================================-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="http://apoint.cf/apoint/resources/js/adminplan.js"></script>
<!--===============================================================================================-->
</head>
<body>

<!-- Top nav page content -->
<%@ include file="../top.jsp" %>

<!-- Begin page content -->
	<div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>일정관리</h1>
        <div class="col-md-6">
        <br>
        <h3>주간계획</h3>
        <form id="weekform">
        <input type="date" class="form-control" name="pdate" id="wpdate">
        <input type="text" class="form-control" name="toDo" id="wtoDo" placeholder="주간 계획을 적어주세요" >
        </form>
        <p>
          <a class="btn btn-success pull-right btn-block" id="weekbtn" role="button">저장 &raquo;</a>
        </p>
        </div>
        
        <div class="col-md-6">
        <br>
        <h3>월간계획</h3>
        <form id="monthform">
        <input type="date" class="form-control" name="pdate" id="mpdate">
        <input type="text" class="form-control" name="toDo" id="mtoDo" placeholder="월간 계획을 적어주세요" >
        </form>
        <p>
          <a class="btn btn-success pull-right btn-block" id="monthbtn" role="button">저장 &raquo;</a>
        </p>
        </div>
      </div>
      </div> <!-- /container -->
    
<!-- footer page content -->
<%@ include file="../foot.jsp" %>
    
</body>
</html>
