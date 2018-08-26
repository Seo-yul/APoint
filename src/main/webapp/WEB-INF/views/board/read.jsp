<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>apoint-읽기</title>
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
<link rel="stylesheet" type="text/css" href="http://apoint.cf/apoint/resources/css/orgin.css">
<!--===============================================================================================-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--===============================================================================================-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="http://apoint.cf/apoint/resources/js/orgin.js"></script>
<!--===============================================================================================-->
</head>

<body>

	<!-- Fixed navbar -->



	<!-- Begin page content -->
	<div class="container">
		<div class="page-header">
			<h1>Write your story</h1>
		</div>

	</div>
	<div class="col-md-10 col-md-offset-1">

		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<p class="lead">아름다운 당신의 이야기를 작성해주세요.</p>
					</div>
					<div class="col col-xs-6 text-right">
						<a href="./mainboard"><button type="button"
								class="btn btn-sm btn-primary btn-create">목록으로</button></a>
					</div>
				</div>
			</div>
			<div class="newPost">
				<div id="newPostContainer" class="container-fluid"
					style="margin-top: 10px;"></div>
				<div class="forumDivOuter">
				<ul class="list-group">
				<li id="note-title" class="list-group-item note-title">
				<c:out value="${board.title}"></c:out>
				</li>
				
				<li class="list-group-item note-item clearfix">
						<div class="content-body panel-body pull-left">
						<fieldset class="form">
						<article class="list-group-item-text note-text">
						<p><c:out value="${board.content}"></c:out></p>
						</article>
						</fieldset>
						</div>
						</li>
				</ul>
				
				
				
				
				</div>
				<div class="panel-default">
				<div class="panel-heading">
				첨부파일: <c:if test="${board.originalfile!=null}"><i class="fa fa-paperclip"></i>
				<a href="download?boardnum=${board.boardnum}">${board.originalfile}</a>
				</c:if>
				
				<c:if test="${board.userid==sessionScope.userId}">
				<div class ="text-right">
				<form action="./mainupdate" method="post">
						<input type="hidden" name = boarduserid value="${board.userid}">
						<input type="hidden" name = boardnum value="${board.boardnum}">
						<input type="hidden" name="savecheck" value="false">
						<input type="submit" class="forumPostButton btn btn-default" value="수정하기">
						</form></div>
						<hr>
				</c:if>
				
				
				<!--댓글-->
				<ul class="list-group">
						<li class="list-group-item note-title">
						<h3 class="panel-title">
						<c:out value="댓글"></c:out>
						<span>갯수</span>
						</h3>
						</li>
						<!-- 반복리스트 -->
						<li class="list-group-item note-item clearfix">
						<div class="content-body panel-body pull-left">
						<div class="avatar avatar-medium clearfix ">
						댓글 작성자
						</div>
						<fieldset class="form">
						<article class="list-group-item-text note-text">
						댓글내용
						</article>
						</fieldset>
						</div>
						</li>
						<!-- 여기까지 -->
						</ul>
						
						<c:if test="${sessionScope.userId!=null}">
						<div class="panel-body">
							<form method="post" action="">
							<fieldset>
							<div class="form-group">
							<textarea class="form-control" rows="3" placeholder="바르고 고운말을 사용합시다." autofocus="" style="resize: none;"></textarea>
							</div>
							</fieldset>
							<button class="btn pull-right">댓글달기</button>
							
							</form>
						</div>
						</c:if>
						<c:if test="${sessionScope.userId==null}">
						<div class="panel-body">
							<fieldset>
							<div class="form-group">
							<span class="list-group-item note-title" style="text-align: center;"><a href="./">로그인</a>을 하시면 댓글을 입력하실수 있습니다.</span>
							</div>
							</fieldset>
						</div>
						</c:if>
				</div></div>
			</div>
		</div>

	</div>
	
	
	
</body>
</html>