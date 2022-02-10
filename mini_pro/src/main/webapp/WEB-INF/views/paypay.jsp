<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>kakaoPay api 이용하기</h1>

	<!-- <form method="get" action="/feign/ftest">
		<button>카카오페이로 결제하기 테스트</button>
	</form> -->
	 <script type="text/javascript">
		location.href="/feign/kakaoPay"
	</script> 
	<form method="post" action="/feign/kakaoPay">
		<button>카카오페이로 결제하기</button>
	</form>
	
</body>
</html>