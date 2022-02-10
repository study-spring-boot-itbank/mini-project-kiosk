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
<script src="http://localhost:8911/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 function wan(){
	window.opener.postMessage({ code9 : "delall" },"*");
	window.self.close();
} 

</script>
<body>

<h3> ${pid}님 </h3>
<h3> 총 결제 금액 ${sumsum}원의 </h3>
<h3> 카카오페이 결제가 정상적으로 완료되었습니다. </h3>
 <!-- <form action="feign/wan" method="get">
 	<input type="submit" value="창못닫음" >
 </form> -->
 <button onclick="wan()">창닫기</button>
 
</body>
</html>