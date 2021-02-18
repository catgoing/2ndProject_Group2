<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
</head>
<script>
	
	function withdrawal(){
		location.href = "withdrawal.jsp"
	}
	
	function main(){
		location.href = "main.jsp"
	}

</script>
<body>
	<h1>내정보</h1>
	
	<form action="controller?type=update" method="post" id="fr_info">
	<table id="info_t">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" id="name" value=${user.name }></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="text" name="pwd" id="pwd" value=${user.pwd }></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="phone" id="phone" value=${user.phone }></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="addr" id="addr" value=${user.addr }></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" id="email" value=${user.email }></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><input type="text" name="regdate" id="regdate" readonly value=${user.regdate } ></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="수정">
				<input type="hidden" name="id" value=${user.id }>
				<input type="hidden" name="regdate" value=${user.regdate }>
				<input type="hidden" name="mem_no" value=${user.mem_no }>
			</td>
			<td><input type="button" value="탈퇴" onclick="withdrawal()"></td>
			
		</tr>		
		<tr>
			<td colspan="2"><input type="button" value="메인으로" onclick="main()"></td>
		</tr>		
	</table>
	</form>
	

</body>
</html>