<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>35기IT</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--===============================================================================================-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="http://apoint.cf/apoint/resources/js/oddit.js"></script>
<!--===============================================================================================-->
</head>
<body>

<!-- Top nav page content -->
<%@ include file="top.jsp" %>

<!-- Begin page content -->
	<div class="container">
      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
      
      <div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<p class="lead">IT Class Board</p>
					</div>
					<div class="col col-xs-6 text-right">
						<a href="./mainwrite"><button type="button"
								class="btn btn-sm btn-primary btn-create">글쓰기</button></a>
					</div>
				</div>
			</div>
      
         <div class="panel panel-default">
<!--          	바디 -->
         	<div class="panel-body">
    			<ul class="list-group">
    			<li class="list-group-item list-group-item-question list-group-no-note clearfix ">
    			
    			
    			안녕
    			
    			
    			
    			
    			</li>
    			</ul>
    		</div>
<!--     		바디끝 -->
<!-- 검색, 페이징 -->
    		<div class="panel-footer">
				<div class="row">
					<div class="col col-xs-4">Page ${navi.getCurrentPage()} of ${navi.getTotalPageCount()}
					</div>
					 <div class="col-md-3">
					<form action="mainboard" method="get">
                <div class="input-group">
                    <input class="form-control" id="board-search" name="searchText" placeholder="제목 검색" required>
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                    </span>
                </div>
            </form>
					</div>
					<c:if test="${(navi.totalRecordsCount)>0}">
					<div class="col col-xs-5">
						<ul class="pagination pull-right">
						
							
							<c:if test="${(navi.currentGroup>0)}">
							<li><a href="./mainboard?page=1">1</a></li>
							<li><a id="beforeG">&laquo;</a></li>
							</c:if>
							<c:if test="${navi.currentPage!=1}">
							<li><a href="./mainboard?page=${navi.currentPage-1}">&lt;</a></li>
							</c:if>
							<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
							<li id="pagenav${counter}"><a href="./mainboard?page=${counter}">${counter}</a></li>
							</c:forEach>
							
							
							<c:if test="${navi.currentPage!=navi.totalPageCount}">
							<li><a href="./mainboard?page=${navi.currentPage+1}">&gt;</a></li>
							</c:if>
							<c:if test="${navi.currentGroup!=navi.maxGroup}">
							<li><a id="nextG">&raquo;</a></li>
							<li><a href="./mainboard?page=${navi.totalPageCount}">${navi.totalPageCount}</a></li>
							</c:if>
							
						</ul>
					</div>
					</c:if>
				</div>
			</div>
<!--     		검색, 페이징 끝 -->
    	</div>
      </div> <!-- jumbotron -->
      </div> <!-- /container -->
    
<!-- footer page content -->
<%@ include file="foot.jsp" %>
    
</body>
</html>
