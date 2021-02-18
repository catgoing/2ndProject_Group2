<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 확인</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>    
</head>
<script>

var id = '${user.id }';

$(function (){
	
	
	$("#btn").click(function(){
		
		var pwdchk = $('#pwdchk').val();
		
		$.ajax({
			url : 'doPwdCheck?id=' + id + '&pwd=' + pwdchk,
			type : 'get',
			success : function(data){
				console.log(data);
				if(data == 0){
					document.getElementById('error').innerHTML=
						'패스워드가 일치하지 않습니다';
					 document.getElementById('error').style.color='red';
					 
				} else location.href = "/savanna/controller?type=myInfo";
				
			}
		})
    });

})

	
</script>
<body>
<h1>패스워드 확인</h1>

<form name="fr">
	<p>패스워드를 입력해주세요</p>
	<input type="password" id="pwdchk">
	<input type="button" id="btn" value="확인" onclick="pwd_check(this.form)">
	<p id="error"></p>
</form>


</body>
</html>