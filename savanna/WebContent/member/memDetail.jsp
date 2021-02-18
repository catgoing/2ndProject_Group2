<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<script>
	
	function withdrawal(frm){
		frm.action = "controller?type=adminWithdrawal";
		frm.submit();
	}
	
	function main(){
		location.href = "main.jsp"
	}
	
	function memList(){
		location.href = "controller?type=memList"
	}

</script>
<body>
	<h1>회원정보</h1>
	
	<form action="controller?type=adminUpdate" method="post" id="fr_info">
	<table id="info_t">
		<tr>
			<th>회원번호</th>
			<td><input type="text" name="mem_no" id="mem_no" readonly value=${vo.mem_no }></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" id="id" readonly value=${vo.id }></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" id="name" value=${vo.name }></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="text" name="pwd" id="pwd" value=${vo.pwd }></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="phone" id="phone" value=${vo.phone }></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="addr" id="addr" value=${vo.addr }></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" id="email" value=${vo.email }></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><input type="text" name="regdate" id="regdate" readonly value=${vo.regdate } ></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="수정">
			</td>
			<td><input type="button" value="탈퇴" onclick="withdrawal(this.form)"></td>
			
		</tr>		
		<tr>
			<td colspan="2"><input type="button" value="메인으로" onclick="main()"></td>
		</tr>		
		<tr>
			<td colspan="2"><input type="button" value="목록으로" onclick="memList()"></td>
		</tr>		
	</table>
	</form>
	

</body>
</html>