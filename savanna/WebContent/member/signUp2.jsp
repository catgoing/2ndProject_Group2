<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
		
	var id_result = 0;
		$(function (){
			$('#id').keyup(function(){
				var id = $('#id').val();
				$.ajax({
					url : '/savanna/controller?type=idCheck?id=' + id,
					type : 'get',
					success : function(data){
						console.log(data);
						if(data == 1){
							document.getElementById('id_check').innerHTML=
								'이미 사용 중인 아이디입니다';
							 document.getElementById('id_check').style.color='red';
							 id_result = 1;
							 
						} else {
							id_result = 0;
						}
						
					},
					
					error : function(jqXHR, textStatus, errorThrown ){
						alert("[예외발생] Ajax 처리실패!!! \n"
								+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
								+ "textStatus : " + textStatus + "\n"
								+ "errorThrown: " + errorThrown);
					}
				})
			});
			
		}
		);
	
		$(function(){
			
			var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,12}$/);
			
			$('#id').keyup(function(){
				
				if(!userIdCheck.test($('#id').val())){
					id_result = 1;
					document.getElementById('id_check').innerHTML=
						'아이디는 영어(대,소문자), 숫자, -, _ 5~12자리만 가능합니다';
					 document.getElementById('id_check').style.color='red';

				} else{
					document.getElementById('id_check').innerHTML='사용 가능한 아이디입니다';
					document.getElementById('id_check').style.color='blue'
					id_result = 0;
				}
				/*
				if($(result) == 1){
					document.getElementById('id_check').innerHTML=
						'다른 사용자가 사용하고 있는 아이디입니다';
					document.getElementById('id_check').style.color='red';
				}*/
				
			});	
		}
		);
	
	
	 var check_SC = 0;
     var check_length = 0;
	  function check_pw(){
		  check_SC = 0;
          var pw = document.getElementById('pw').value;
          var SC = ["!","@","#","$","%", "^", "&", "*", "(", ")", "-", "=", "'\'", "/", "+", "."];
     
          for(var i=0;i<SC.length;i++){
              if(pw.indexOf(SC[i]) != -1){
                  check_SC = 1;
              }
             
          }

          if(check_SC == 0){
        	  document.getElementById('check1').innerHTML='특수문자를 하나 이상 포함해야 합니다';
              document.getElementById('check1').style.color='red';
          }
          
          if(pw.length < 4 || pw.length > 12){
        	  check_length = 0;
              document.getElementById('check1').innerHTML='비밀번호는 4~12글자만 가능합니다';
              document.getElementById('check1').style.color='red';
          }
          
          else {
        	  check_length = 1;
          }
          
          if(check_SC == 1 && check_length == 1){
        	  document.getElementById('check1').innerHTML='';
          }
          if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
              if(document.getElementById('pw').value==document.getElementById('pw2').value){
                  document.getElementById('check2').innerHTML='비밀번호가 일치합니다'
                  document.getElementById('check2').style.color='blue';
              }
              else{
                  document.getElementById('check2').innerHTML='비밀번호가 일치하지 않습니다';
                  document.getElementById('check2').style.color='red';
              }
          }
 
      }
	
	  
	  function null_check(){
		if(fr.id.value == "" || id_result != 0){
			alert("아이디를 확인해주세요");
			fr.id.focus();
			return false;
		} else if(fr.pwd.value == ""){
			alert("패스워드를 입력해주세요");
			fr.pwd.focus();
			return false;
		} else if(fr.pwd2.value == ""){
			alert("패스워드를 입력해주세요");
			fr.pwd2.focus();
			return false;
		} else if(fr.name.value == ""){
			alert("이름을 입력해주세요");
			fr.name.focus();
			return false;
		} else if(fr.phone.value == ""){
			alert("휴대전화를 입력해주세요");
			fr.phone.focus();
			return false;
		} else if(fr.email.value == ""){
			alert("이메일을 입력해주세요");
			fr.email.focus();
			return false;
		} else if(fr.addr.value == ""){
			alert("주소를 입력해주세요");
			fr.addr.focus();
			return false;
		} else if(fr.pwd.value != fr.pwd2.value) {
			alert("패스워드가 일치하지 않습니다");
			fr.pwd2.focus();
			return false;
		} else if(check_SC == 0 || check_length == 0){
			alert("패스워드를 확인해주세요");
			fr.pwd.focus();
			return false;
		}
		
		else return true;
		
		}
	  
	  
	
</script>
</head>
<body>
	<h1>회원가입</h1>
  	<form action="controller?type=doSignUp" method="post" name="fr" onsubmit="return null_check()">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="id" id="id" maxlength="12"></td>
            </tr>
            <tr>
                <td colspan=2><span id="id_check"></span>
            </tr>
            <tr>
                <td>패스워드</td>
                <td><input type="password" name="pwd" id="pw" maxlength="12" onchange="check_pw()"></td>
            </tr>
            <tr>
                <td colspan=2><span id="check1"></span>
            </tr>
            <tr>
                <td>패스워드 확인</td>
                <td><input type="password" name="pwd2" id="pw2" maxlength="12" onchange="check_pw()"></td>
            </tr>
            <tr>
                <td colspan=2><span id="check2"></span>
            </tr>
             <tr>
                <td>이름</td>
                <td><input type="text" name="name"></td>
            </tr>
                        <tr>
                <td>휴대전화</td>
                <td><input type="text" name="phone"></td>
            </tr>
                        <tr>
                <td>이메일</td>
                <td><input type="email" name="email"></td>
            </tr>           
            <tr>
                <td>주소</td>
                <td><input type="text" name="addr"></td>
            </tr>            
            <tr>
                <td>
                    <input type="submit" name="sbm" value="확인">
                </td>
            </tr>
        </table> 
        </form>
         

</body>
</html>