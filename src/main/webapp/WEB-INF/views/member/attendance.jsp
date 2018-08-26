<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>출석체크</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" href="../resources/images/favicon.ico">
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
<link rel="stylesheet" type="text/css" href="http://apoint.cf/apoint/resources/css/attendance.css">
<!--===============================================================================================-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--===============================================================================================-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="http://apoint.cf/apoint/resources/js/attendance.js"></script>
<!--===============================================================================================-->
</head>
<body>

<!-- Top nav page content -->
<%@ include file="../top.jsp" %>

<!-- Begin page content -->
	<div class="container">

      <!-- 메인 -->
        <div class="col-md-10 col-md-offset-1">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<input type="hidden" value="${sessionScope.userdevice.computerName}" name="ud">
						<p class="lead">출석현황</p>(<c:if test="${sessionScope.userdevice!=null}"><c:out value="${sessionScope.userdevice.computerName}" default="기기를 등록해주세요."></c:out></c:if>)
					</div>
					<div class="col col-xs-6 text-right">
						<a class="btn btn-sm btn-success" href="javascript: $.goattendance()" role="button">출석체크 &raquo;</a>
          <a class="btn btn-sm btn-info" href="javascript: $.goregistdevice()" role="button">기기등록 &raquo;</a>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
  			<div class="panel-body">
    			<ul class="list-group">
    			<li class="list-group-item list-group-item-question list-group-no-note clearfix">
				<div class="col col-xs-6">
				날짜
				</div>
				<div class="col col-xs-3">
				출석
				   <c:if test="${userinfo.grade=='admin'}">
				<a class="btn btn-danger btn-xs" href="javascript: $.todayabsence()" role="button">오늘결석</a>
				<a class="btn btn-success btn-xs" href="javascript: $.todayattend()"role="button">오늘출석</a>
				</c:if>
				</div>
				<c:if test="${arryAllAttendance!=null}">
				<div class="col col-xs-1">
				</c:if>
				<c:if test="${arryAllAttendance==null}">
				<div class="col col-xs-3">
				</c:if>
				위치
				</div>
    			<%--이하 사용자 출석정보 --%>
    			<c:choose>
    			<c:when test="${arryAllAttendance!=null}">
    			<div class="col col-xs-2">
    			<select class="form-control" id="idselect">
    			<option selected disabled hidden>학생 선택</option>
    			<c:forEach var="alist" items="${arryKakaoUserInfo}">
    			<option value="${alist.userID}">${alist.nickname}(${alist.userID})</option>
    			</c:forEach>
    			</select>
    			</div>
				</li>
				<c:forEach var="alist" items="${arryAllAttendance}">
    			<li class="list-group-item list-group-item-question list-group-no-note clearfix select-user ${alist.userId}" style="display: none;">
				<div class="col col-xs-6">
				<c:out value="${alist.checkDate} "></c:out>
				</div>
				<div class="col col-xs-3">
				<c:if test="${alist.status==1}">
				<i class="far fa-check-circle" aria-hidden="true"></i>
				</c:if>
				<c:if test="${alist.status==0}">
				<i class="fa fa-ban" aria-hidden="true"></i>
				</c:if>
				</div>
				<div class="col col-xs-1">
					<c:out value="${alist.computerName} "></c:out>
				</div>
				<div class="col col-xs-2">
					<a class="btn btn-success btn-xs" href="javascript: $.checkattend('${alist.nickname}','${alist.checkDate}')"role="button">출석변경</a>
					<a class="btn btn-danger btn-xs" href="javascript: $.checkabsence('${alist.nickname}','${alist.checkDate}')" role="button">결석변경</a>
				</div>
				</li>
    			</c:forEach>
    			<form id="gocheck">
				<input type="hidden" id="uid" name="userId">
				<input type="hidden" id="udt" name="checkDate">
				</form>
    			</c:when>
    			<%-- --%>
    			<c:when test="${arryAllAttendance==null}">
				</li>
				<c:if test="${sessionScope.userdevice!=null}">
    			<c:forEach var="list" items="${arryAttendance}">
    			<li class="list-group-item list-group-item-question list-group-no-note clearfix">
				<div class="col col-xs-6">
				${list.checkDate}
				</div>
				<div class="col col-xs-3">
				<c:if test="${list.status==1}">
				<i class="far fa-check-circle" aria-hidden="true"></i>
				</c:if>
				<c:if test="${list.status==0}">
				<i class="fa fa-ban" aria-hidden="true"></i>
				</c:if>
				
				</div>
				<div class="col col-xs-3">
				${list.computerName}
				</div>
				</li>
    			</c:forEach>
    			</c:if>
    			</c:when>
    			</c:choose>
    			<!--  정보 끝  -->
				</ul>
  			</div>
			</div>



			
			<div class="panel-body">
			<ul class="list-group">
						<c:choose>
							<c:when test="${blist==null}">
								<c:forEach var="gul" items="${blist}">
								<li class="list-group-item list-group-item-question list-group-no-note clearfix">
								<div class="col col-xs-8">
								<div class="list-title-wrapper clearfix ">
										
										<div class="list-tag clearfix">
										&nbsp;#&nbsp;<span class="list-group-item-text article-id"><c:out value="${gul.boardnum} "></c:out></span>
										</div>
										<h5 class="list-group-item-heading list-group-item-evaluate">
										<a href="./mainread?boardnum=${gul.boardnum}"><c:out value="${gul.title} "></c:out></a>
										<c:if test="${gul.originalfile!=null}"><i class="fa fa-paperclip"></i></c:if></h5>
										</div>
										</div>
										<div class="col col-xs-4">
										<div class="list-summary-wrapper clearfix">
										<div class="item-evaluate-wrapper clearfix">
										
										<i class="fa fa-user" aria-hidden="true"></i><c:out value="${gul.userid} "></c:out>
										<c:if test="${sessionScope.userId!=null}">
										<c:if test="${sessionScope.userId==gul.userid}">
										<a href="./mainread?boardnum=${gul.boardnum}" class="btn btn-default"><i class="fa fa-key"></i></a>
										<a href="./deleteBoard?boardnum=${gul.boardnum}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
										</c:if></c:if>
										<br>${gul.regdate.getYear()+1900}-<c:if test="${gul.regdate.getMonth()+1<10}">0</c:if>${gul.regdate.getMonth()+1}-<c:if test="${gul.regdate.getDate()+1<10}">0</c:if>${gul.regdate.getDate()} ${gul.regdate.getHours()}:${gul.regdate.getMinutes()}:<c:if test="${gul.regdate.getSeconds()<10}">0</c:if>${gul.regdate.getSeconds()}
										</div></div></div></li>
								</c:forEach>
							</c:when>
						</c:choose>
						</ul>
			</div>
			
			
			
			<div class="panel-footer">
				<div class="row">
					<div class="col col-xs-4">Page ${navi.getCurrentPage()} of ${navi.getTotalPageCount()}
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
		</div>
	</div>
        
        
        
        
        
     </div> <!-- /container -->
    
<!-- footer page content -->
<%@ include file="../foot.jsp" %>
    
</body>
</html>
