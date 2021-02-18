<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<h1>아이디 찾기</h1>
<form action="/savanna/controller?type=inquiryId" method="post">
	<table>
		<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td>휴대전화</td>
		<td><input type="text" name="phone"></td>
		</tr>
		<tr>
		<td colspan="2">
		<input type="submit" value="확인"></td>
		</tr>
	</table>
</form>

</body>
</html>