<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	<c:forEach var="menu" items="${menuList }">
		${menu.menu }
		<button type="button">	${menu.img }</button>
		${menu.price }
		<br>
	</c:forEach>
 -->	
		
	<!-- 
	${menuList[0].menu }
	${menuList[0].img}
	${menuList[0].price}
		</form>
		${menuList[1].img}
	${menuList[2].price}
 -->
 
 	<form action="addCart">
	<input readonly type="text" value="${menuList[0].menu }" name="menu" >
	<input readonly type="text" value="${menuList[0].img}" name="img" >
	<input readonly type="text" value="${menuList[0].price}" name="price" >
	<input type="submit" value="담기">
	</form>
	
	 	<form action="addCart">
	<input readonly type="text" value="${menuList[1].menu }" name="menu" >
	<input readonly type="text" value="${menuList[1].img}" name="img" >
	<input readonly type="text" value="${menuList[1].price}" name="price" >
	<input type="submit" value="담기">
	</form>
	
	 	<form action="addCart">
	<input readonly type="text" value="${menuList[2].menu }" name="menu" >
	<input readonly type="text" value="${menuList[2].img}" name="img" >
	<input readonly type="text" value="${menuList[2].price}" name="price" >
	<input type="submit" value="담기" id= btn1>
	</form>
	 $(function(){
	$('#btn1').on('click',reqAjax1);})
	
		<c:forEach var="cart" items="${cartList }">
			${cart.menu }
			${cart.img }
			${cart.price }
		<br>
	</c:forEach>
</body>
</html>