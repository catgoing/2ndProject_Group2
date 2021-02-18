<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입완료</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<script>
		alert("정보가 수정되었습니다");
		if('${user.id}' == 'a'){
			location.href = "controller?type=memList";
		}
		if('${user.id}' != 'a'){
		location.href = "myInfo.jsp";
		}
	</script>
</body>
</html>