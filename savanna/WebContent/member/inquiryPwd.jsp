<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 찾기</title>
</head>
<body>
<h1>패스워드 찾기</h1>
<form action="/savanna/controller?type=inquiryPwd" method="post">
	<table>
		<tr>
		<td>아이디</td>
		<td><input type="text" name="id"></td>
		</tr>
		<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td colspan="2">
		<input type="submit" value="확인"></td>
		</tr>
	</table>
</form>
</body>
</html>