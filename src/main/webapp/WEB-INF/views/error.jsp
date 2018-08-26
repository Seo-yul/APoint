<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에러페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(()=>{
	setTimeout(() => {
		var url = "http://apoint.cf/apoint/"
		$(location).attr('href', url);
	},3000)
})
</script>
<style type="text/css">
body{
background-image: url("./resources/images/error.gif");
background-repeat: no-repeat;
    background-position-x: center;
    background-position-y: -80%;
}

</style>
</head>
<body>
</body>
</html>