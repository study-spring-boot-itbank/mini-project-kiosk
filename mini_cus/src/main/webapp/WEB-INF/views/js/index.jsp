<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>키오스크</title>
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="fontawesome/css/all.css">
	<link rel="stylesheet" href="fontawesome/css/fontawesome.css">
	<link rel="stylesheet" href="fontawesome/css/brands.css">
	<link rel="stylesheet" href="fontawesome/css/solid.css">

	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="js/main.js"></script>
	<script src="fontawesome/js/all.js"></script>
	<script src="js/index.js"></script>
</head>
<body>
<div class="login_pop">
		<div class="login_in">
			<h2>키오스크</h2>
			<form action="" method="post">
				<div class="id line">
					<span>아이디</span>
					<input type="text" name="" class="id">
				</div>

				<div class="pw line">
					<span>비밀번호</span>
					<input type="password" name="" class="pw">
				</div>

				<div class="hidden">
					<input type="hidden" name="">
				</div>

				<div class="btn">
					<input type="submit" value="로그인">
					<input type="button" value="취소">
				</div>

				<div class="join">
					<input type="button" onclick="" value="회원가입">
				</div>
			</form>
		</div>
	</div>
	<div id="wrap">
		<div class="main">

			<section class="left">
				
				<div class="left_tap">
					<ul>
						<li class="on">메뉴1</li>
						<li>메뉴2</li>
						<li>메뉴3</li>
						<li>메뉴4</li>
					</ul>
				</div>

				<div class="left_con">
					<div class="left_list">
						<div class="list_in">
							<div class="list_menu">
								<ul>
									<li id="btn"  onclick="document.getElementById('frm').submit();">
									<form name="s1" action="addCart" id="frm">
										<div class="list_wrap" >
											<div class="img"><img src="${menuList[0].img}"></div>
											<div class="text" >
												<input readonly type="text" value="${menuList[0].menu}" name="menu" class="ippp">
												<input readonly type="text" value="${menuList[0].img}" name="img" class="ippp">
												<input readonly type="text" value="${menuList[0].price}" name="price" class="ippp">
												
												<h2>${menuList[0].menu}</h2>
												<p>${menuList[0].price}</p>
												<input type="submit" value="담기" class="ippp">
											</div>
										</div>
									</form>	
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2 name=menu>${menuList[1].menu }</h2>
												<p>${menuList[1].price}</p>
											</div>
										</div>
									</li>
									
									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[2].menu }</h2>
												<p>${menuList[2].price}</p>
											</div>
										</div>
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[3].menu }</h2>
												<p>${menuList[3].price}</p>
											</div>
										</div>
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[4].menu }</h2>
												<p>${menuList[4].price}</p>
											</div>
										</div>
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[5].menu }</h2>
												<p>${menuList[5].price}</p>
										</div>
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[6].menu }</h2>
												<p>${menuList[6].price}</p>
											</div>
										</div>
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[7].menu }</h2>
												<p>${menuList[7].price}</p>
											</div>
										</div>
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[8].menu }</h2>
												<p>${menuList[8].price}</p>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="left_list">
						<div class="list_in">
							<div class="list_menu">
								<ul>
									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[9].menu }</h2>
												<p>${menuList[9].price}</p>
											</div>
										</div>
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[10].menu }</h2>
												<p>${menuList[10].price}</p>
											</div>
										</div>
									</li>
									
									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[11].menu }</h2>
												<p>${menuList[11].price}</p>
											</div>
										</div>
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[12].menu }</h2>
												<p>${menuList[12].price}</p>
											</div>
										</div>
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[13].menu }</h2>
												<p>${menuList[13].price}</p>
											</div>
										</div>
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[14].menu }</h2>
												<p>${menuList[14].price}</p>
											</div>
										</div>
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[15].menu }</h2>
												<p>${menuList[15].price}</p>
											</div>
										</div>
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[16].menu }</h2>
												<p>${menuList[16].price}</p>
											</div>
										</div>
									</li>

									<li>
										<div class="list_wrap">
											<div class="img"></div>
											<div class="text">
												<h2>${menuList[17].menu }</h2>
												<p>${menuList[17].price}</p>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="left_list">
						<div class="list_in">
							메뉴리스트3
						</div>
					</div>

					<div class="left_list">
						<div class="list_in">
							메뉴리스트4
						</div>
					</div>
				</div>
			</section>

			<section class="right">
				
				<div class="right_tap">
					<ul>
						<li class="on">장바구니</li>
						<li>채팅</li>
					</ul>
				</div>

				<div class="right_con">
					<div class="right_list">
						<div class="right_in">
							장바구니
						</div>
					</div>

					<div class="right_list">
						<div class="right_in">
							채팅
						</div>
					</div>
				</div>
					<div class="right_btn">
					<div class="btn_in">
						<div class="no_btn btn">
							<h3>결제취소</h3>
						</div>

						<div class="ok_btn btn">
							<h3>결제하기</h3>
						</div>
					</div>
				</div>
			</section>

		</div>
	</div>
	
</body>
</html>