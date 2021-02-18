<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style>
	/***** 페이지 표시 부분 스타일(시작) ****/
	.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #ff4aa5;
	}
	.paging li a:hover {
		background-color: #00B3DC;
		color: white;
	}
	
	.list:hover {
		cursor:pointer;
		background-color: #00B3DC;
		color: white;
	}
</style>
<script>

	
</script>
</head>
<body>
<h1>회원목록</h1>
	<table>
		<caption>회원 전체 목록</caption>
		<thead>
			<tr class="title">
				<th class="no">회원번호</th>
				<th class="id">아이디</th>
				<th class="pwd">패스워드</th>
				<th class="name">이름</th>
				<th class="phone">휴대전화</th>
				<th class="addr">주소</th>
				<th class="email">이메일</th>
				<th class="regdate">가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<a href="main.jsp"></a>
				<tr class="list" onclick="location.href = '/savanna/controller?type=memDetail?id=${vo.id }'">
					<td >${vo.mem_no }</td>
					<td>${vo.id }</td>
					<td>${vo.pwd }</td>
					<td>${vo.name}</td>
					<td>${vo.phone }</td>
					<td>${vo.addr }</td>
					<td>${vo.email }</td>
					<td>${vo.regdate }</td>
				</tr>
				
		</c:forEach>
		</tbody>
		<tfoot>
		 	<tr>
		 	<td colspan="7">
		 		<ol class="paging">
		 				<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:if test="${pageNo == pvo.nowPage }">
					<li class="now">${pageNo }</li>
				</c:if>
				<c:if test="${pageNo != pvo.nowPage }">
					<li>
						<a href="/savanna/controller?type=memList?cPage=${pageNo }">${pageNo }</a>
					</li>
				</c:if>		
			</c:forEach>
		 	</ol>
		 	</td>
		 	</tr>
   
		</tfoot>
	</table>

</body>
</html>