<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<!-- Bootstrap core CSS -->
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/savanna/css/savanna.css" rel="stylesheet">
<link href="/savanna/css/sidebar.css" rel="stylesheet">
<link href="/savanna/css/paging.css" rel="stylesheet">
<title>:: 찜목록 ::</title>
</head>
<style>
	#wishtitle{
		margin-right: 100px;
		text-align: center;
		font-weight: bold;
	}
	ul, ol{
		list-style: none;
	}
	.wish {
        width: 800px;
        margin: auto;
        height:100%;
        min-height:100%;
        position: relative;
    }
    table {
        max-width: 700px;
        margin:auto;
    }
    td{
    	text-align: center;
    }
    .title {
    	text-align: center;
    }
    #cartbtn,#delbtn {
	    font-size: 14px;
		font-weight: normal;
	    line-height: 1.42857143;
	    margin-bottom: 0;
		padding: 6px 12px;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: middle;
		border-radius: 4px;
    }
    #cartbtn:hover, #delbtn:hover {
		color: white;
		background-color: #292929;
	}
	.footer {
	   width:100%;
	   position:absolute;
	   bottom:0;
	}
	 
    img {
	  max-width: 100%;
	}
	#left{
		text-align: left;
	}
/*부트스트랩css의 table td의 border-top속성을 일부td에서 무효화하고 width="%"를 주기위해 inline으로 style을 적용함*/


</style>
<script>
	function input_cart(frm){
		frm.action = "/savanna/controller?type=wishitemToCart";
		frm.method = "post";
		frm.submit();
	}
	function delete_wish(frm){
		frm.action = "/savanna/controller?type=deleteWishList";
		frm.method = "post";
		frm.submit();
	}
</script>
<body>
	<%@ include file="/common/menu.jspf" %>
	<%@ include file="/common/memberSidebar.jspf" %>
	<br>
	<h1 id="wishtitle">위시리스트</h1>
	<br>
	<div class="wish">
	<table class="table">
		<thead>
			<tr>
				<th class="title" colspan="3">상품정보</th>
				<th class="title">판매정보</th>
				<th class="title">선택</th>			
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty list }">
			<c:forEach var="vo" items="${list }">
				<tr class="list">
             		<td rowspan="2" width="10%"><img src="images/${vo.book_no}.jpg" alt="제품이미지"></td>
			        <td id="left" colspan="2" width="45%"><a href="controller?type=EnterDetail&book_no=${vo.book_no }">${vo.book_name }</a></td>
			        <td rowspan="2" width="20%" ><fmt:formatNumber value="${vo.price }" pattern="###,###"/>원</td>
			        <td>
			        <form>
			        	<input type="button" class="btn" id="cartbtn" value="장바구니" onclick="input_cart(this.form)">
			        	<input type="hidden" name="book_no" value="${vo.book_no }">
		        	</form>
		        	</td>
			    </tr>
			    <tr>
			        <td id="left" width="20%" style="border-top:none">${vo.writer }</td>
			        <td id="left" style="border-top:none">${vo.publisher }</td>
			        <td style="border-top:none">
			        <form>
			        	<input type="submit" class="btn" id="delbtn" value="삭제" onclick="delete_wish(this.form)">
			        	<input type="hidden" name="book_no" value="${vo.book_no }">
		        	</form>
		        	</td>        
		    	</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">찜목록이 비어있습니다.</td>
				</tr>
			</c:if>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="5">
			<%@ include file="../common/pageNavigation3.jsp" %>
			</td>
		</tr>
		</tfoot>
	</table>
	</form>
	</div>

	<%@ include file="/common/foot.jspf"%>

</body>
</html>
