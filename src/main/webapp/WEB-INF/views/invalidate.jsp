<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
$(()=>{
	var url = 'https://developers.kakao.com/logout'
	var logout = window.open(url,"logout","width=100,height=100")
	logout.close()
})
</script>
<body>
</body>
</html>