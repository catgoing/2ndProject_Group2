<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	function memList(frm){
		frm.action = "controller?type=memList";
		//	frm.action = "memList";
 		frm.submit();
 	}
	
 	function myInfo(frm){
 		frm.action = "controller?type=pwdCheck";
 		frm.submit();
 	}
 	
 	function myHistory(frm) {
 		frm.action = "controller?type=myHistory";
 		frm.submit();
 	}
 	
 	function logout(frm) {
 		frm.action = "controller?type=logout";
 		frm.submit();
 	}
 	
 	function signIn(frm){
 		frm.action = "controller?type=signIn";
 		frm.submit();
 	}
 	
 	function signUp(frm) {
 		frm.action = "controller?type=signUp";
 		frm.submit();
 	}

</script>
</head>
<body>
	<h1>메인화면</h1>
	
	<c:choose>
	<c:when test="${user.id == 'a' }">
	<p id="user_name"> 관리자 로그인</p>
	<form method="post">
		<input type="button" value="회원정보" onclick="memList(this.form)">
		<input type="button" value="내역관리" onclick="myHistory(this.form)">
		<input type="button" value="로그아웃" onclick="logout(this.form)">
	</form>
	</c:when>
	<c:when test="${null == user.id }">
	<form method="post">
		<input type="button" value="로그인" onclick="signIn(this.form)">
		<input type="button" value="회원가입" onclick="signUp(this.form)">
	</form>
	</c:when>
	<c:otherwise>
		<p id="user_name"> ${user.name }님 환영합니다</p>
	<form method="post">
		<input type="button" value="내정보" onclick="myInfo(this.form)">
		<input type="button" value="내역확인" onclick="myHistory(this.form)">
		<input type="button" value="로그아웃" onclick="logout(this.form)">
	</form>
	</c:otherwise>
	</c:choose>
	
</body>
</html>