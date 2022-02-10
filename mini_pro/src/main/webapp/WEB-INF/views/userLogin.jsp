<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	text-decoration: none;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

.login_pop{background: #fff;width:350px;height:350px;}
.login_pop .login_in{padding:30px;}
.login_pop .login_in h2{text-align: center;font-size:32px;line-height:60px;font-weight: bold;}
.login_pop .login_in form{padding-top:20px;}
.login_pop .login_in form .line{width:100%;margin-bottom:10px;display: flex;}
.login_pop .login_in form .line span{width:25%;line-height:32px;display: block;}
.login_pop .login_in form .line input{line-height:26px;width:75%;display: block;outline: none;}
.login_pop .login_in form .hidden{display: none;}
.login_pop .login_in form .btn{overflow: hidden;}
.login_pop .login_in form .btn input{width:100%;height:44px;}
.login_pop .login_in form .join{margin-top:15px;}
.login_pop .login_in form .join input{height:44px;width:100%;}
</style>
<body>

	<!-- url 실행시 (/kaja/login) 실행후 return kaja/userLogin 의해 지금 파일로 옴
	여기 form을 통해 이름, pw 입력 받은 후 로그인 누르면 /loginHaja로 감
	
	loginPage(/kaja/login) 로그인 페이지에 대한것
	.loginProcessUrl(loginHaha) /loginHaja에서 실제 로그인을 실시함, action은 /loginHaja로 실시
	
	.defaultSuccessUrl(/toResult) /toResult로 이동 > resutl.jsp
 -->

	<!-- <form action="/loginHaja" method="post">
		ID: <input type="text" name="username" required="required"><br>
		PW: <input type="password" name="password" required="required"><br>
		<input type="submit" value="로그인"> <a href="join"><input
			type="button" value="회원가입"></a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
	</form> -->

	<div class="login_pop">
		<div class="login_in">
			<h2>키오스크</h2>
			<form action="/loginHaja" method="post">
				<div class="id line">
					<span>아이디</span> <input type="text" name="username" class="id" required="required">
				</div>

				<div class="pw line">
					<span>비밀번호</span> <input type="password" name="password" class="pw" required="required">
				</div>

				<div class="btn">
					<input type="submit" value="로그인">
				</div>

				<div class="join">
					<a href="join"><input type="button" value="회원가입"></a>
				</div>
				  
				<div class="hidden">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</div>
			</form>
		</div>
	</div>

</body>
</html>