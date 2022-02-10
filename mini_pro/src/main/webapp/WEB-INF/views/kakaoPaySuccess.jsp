<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c"
uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
*{margin: 0;padding: 0;box-sizing: border-box;}
.wrap{width:100%;overflow: hidden;padding:30px;text-align: center;}
.wrap h2{margin-bottom:20px;}
.wrap p{margin-bottom:5px;}
.wrap button{float:right;margin-top:20px;}
</style>
<script src="http://localhost:8911/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 function wan(){
	window.opener.postMessage({ code9 : "delall" },"*");
	window.self.close();
} 

</script>
<body>

	<div class="wrap">
		<h2>결제완료</h2>
		<p>${pid}님</p>
		<p>총 결제 금액 ${sumsum}원의</p>
		<p>카카오페이 결제가</p>
		<p>정상적으로 완료되었습니다.</p>
		<!-- <form action="feign/wan" method="get">
			<input type="submit" value="창못닫음" >
		</form> -->
		<button onclick="wan()">창닫기</button>
	</div>
 
</body>
</html>