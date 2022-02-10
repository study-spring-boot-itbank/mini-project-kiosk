<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
		/* 	function close7() {
				   self.opener=self;
				   window.close();
				} */
			//window.parent.postMessage({ code : ${pid2} },"*");
            window.opener.postMessage({ code : ${pid2} },"*");
			window.self.close();
</script>
${pid2} 가 언 디 파 인 드 라 고?
<a href="paypay">feign실험</a>
</body>
</html>