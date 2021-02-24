<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/savanna/js/bootstrap.js"></script>
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">
<link href="/savanna/css/savanna.css" rel="stylesheet">
<link href="/savanna/css/member.css" rel="stylesheet">
<link href="/savanna/css/book.css" rel="stylesheet">
<link href="/savanna/css/sidebar.css" rel="stylesheet">


<script>
function deleteBook(frm) {
	frm.action = "controller?type=DeleteBook";
	frm.submit();
}
function enterUpdateBook(frm) {
	frm.action = "controller?type=EnterUpdateBook";
	frm.submit();
}
function cartInsert(frm) {
	frm.action = "controller?type=cartInsert";
	frm.submit();
}
function insertWishList(frm) {
	frm.action = "controller?type=insertWishList";
	frm.submit();
}
</script>
<meta charset="UTF-8">
<title>Universal Book Detail</title>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>
	<%@ include file="/common/bookSidebar.jspf" %>

	<br><h1>상품 상세보기</h1>
	<br>
	<form method="post">
		<table id="content">
		<thead>
		</thead>
		<tbody>
		<tr>
			<td colspan="2">
				<img src="images/${vo.book_no}.jpg" alt="제품이미지">
			</td>
		</tr>
		<tr>
			<td><label for="book_name">제목</label></td>
			<td>${vo.book_name}</td>
		</tr>
		<tr>
			<td><label for="writer">작가</label></td>
			<td>${vo.writer}</td>
		</tr>
		<tr>
			<td><label for="publisher">출판사</label></td>
			<td>${vo.publisher}</td>
		</tr>
		<tr>
			<td><label for="pub_date">출판일</label></td>
			<td>${vo.pub_date}</td>
		</tr>
		<tr>
			<td><label for="price">가격</label></td>
			<td>${vo.price }</td>
		</tr>
		<tr>
			<td><label for="book_desc">책소개</label></td>
			<td>${vo.book_desc}</td>
		</tr>
		<tr>
			<td><label for="stock">재고</label></td>
			<td>${vo.stock}</td>
		</tr>
		<tr>
			<td><label for="category">분류</label></td>
			<td>${vo.category }</td>
		</tr>
		</tbody>
		<tfoot>
		<c:choose>
			<c:when test="${user.id == 'a' }">
			<tr><td colspan="2">
				<input type="hidden" id="book_no" name="book_no" value="${vo.book_no }">
				<input type="button" value="수정모드" onclick="enterUpdateBook(this.form)">
				<input type="button" value="삭제" onclick="deleteBook(this.form)">
				<input type="button" value="돌아가기" onclick="history.back()">
			</td></tr>
			</c:when >
			<c:otherwise>
			<tr><td colspan="2">
				<input type="hidden" id="book_no" name="book_no" value="${vo.book_no }">
				<input type="button" value="장바구니에 넣기" onclick="cartInsert(this.form)">
				<input type="button" value="좋아요" onclick="insertWishList(this.form)">
				<input type="button" value="돌아가기" onclick="history.back()">
			</td></tr>
			</c:otherwise>
		</c:choose>
		</tfoot>
		</table>
	</form>
	
	<%@ include file="/common/foot2.jspf" %>
	
</body>
</html>