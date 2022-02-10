<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3> ${pid}님 </h3>
<h3> 총 결제 금액 ${sumsum}원의 </h3>
<h3> 카카오페이 결제가 정상적으로 완료되었습니다. </h3>
 
 <button onclick="window.self.close()">창 닫 기</button>
 
</body>
</html>