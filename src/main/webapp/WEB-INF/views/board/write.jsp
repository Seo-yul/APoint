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
			<form id="boardform" enctype="multipart/form-data">
			<div class="newPost">
				<div id="newPostContainer" class="container-fluid"
					style="margin-top: 10px;"></div>
				<div class="forumDivOuter">
					<input style="margin-bottom: 10px;" type="text"
						class="form-control" id="title" name="title" maxlength="80"
						placeholder="Title is here">
					<div id="forumDiv">
						<textarea id="content"class="form-control autoExpand forumPost " rows="12"
							placeholder="Enter your story here" name="content" style="resize:none;"></textarea>
					</div>
				</div>
				<div class="panel-default">
				<div class="panel-heading">
				<input type="file" name="uploadfile">
				<hr>
				<div class ="text-right">
						<input type="button" class="forumPostButton btn btn-default" id="board-form-btn" value="글쓰기">
						</div>
				</div></div>
			</div>
			</form>
		</div>

	</div>

	<!-- footer -->
	
<!--===============================================================================================-->
</body>
</html>