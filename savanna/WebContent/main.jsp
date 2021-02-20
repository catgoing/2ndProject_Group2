<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/savanna/css/savanna.css" rel="stylesheet">

<title>메인화면</title>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>
  <aside>
  </aside>
  <section>
    <article>
      <%@ include file="book/CardList.jsp" %>
    </article>
  </section>

</body>
</html>
