<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booklist for admin</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/savanna/js/bootstrap.js"></script>
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">
<link href="/savanna/css/savanna.css" rel="stylesheet">
<link href="/savanna/css/member.css" rel="stylesheet">
<link href="/savanna/css/book.css" rel="stylesheet">
<link href="/savanna/css/paging.css" rel="stylesheet">
<link href="/savanna/css/sidebar.css" rel="stylesheet">

<style>
.img-container {
	background-color: white;
	padding: 0px;
	margin: 5px 5px 5px 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 5%;
}
.img-placeholder {
	background-color: white;
	padding: 0px;
	width: 23vh;
	height: 35vh;
	align-items: center;
	justify-content: center;
	border-radius: 5%;
	box-shadow: 0 20px 20px rgba(0,0,0,0.2);
	overflow: none;
}
img {
	width: 23vh;
	height: 35vh;
	object-fit: contain;
}
</style>
<script>
	function enterCreateBookView(frm) {
		frm.action = "controller?type=EnterCreateBook";
		frm.submit();
	}
</script>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>
	<%@ include file="/common/adminSidebar.jspf" %>

	<h1>상품 관리</h1>
	<div class="container ">
	<table class="">
	<thead >
		<tr>
			<th width="5%">인덱스</th>
			<th width="10%">썸네일</th>
			<th width="30%">서명</th>
			<th width="15%">저자</th>
			<th width="15%">출판사</th>
			<th width="10%">가격</th>
			<th width="10%">재고</th>
		<tr>
	</thead>
	<tbody>
	<c:forEach var="vo" items="${list }">
		<tr class="book">
			<td>${vo.book_no }</td>
			<td>
				<img class="img" src="images/${vo.book_no}.jpg" alt="제품이미지">
			</td>
			<td>
				<a href="controller?type=EnterDetail&book_no=${vo.book_no }">
				${vo.book_name }
				</a>
			</td>
			<td>${vo.writer }</td>
			<td>${vo.publisher }</td>
			<td>${vo.price }</td>
			<td class="stock">&lt;&lt;${vo.stock }&gt;&gt;</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr><td colspan="8">
			<form method="post">
				<input type="button" value="신규 등록" onclick="enterCreateBookView(this.form)">
				<input type="button" value="재고 수정(카트방식)">
				<input type="button" value="돌아가기" onclick="history.back()">
			</form>
			</td>
		</tr>
		<%@ include file="../common/pageNavigation.jsp" %>
	</tfoot>
	</table>
	</div>
</body>
</html>