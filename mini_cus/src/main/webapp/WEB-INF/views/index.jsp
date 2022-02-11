<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<script type="text/javascript">
	var initialtab = [ 1, "sc1" ]
	function cascadedstyle(el, cssproperty, csspropertyNS) {
		if (el.currentStyle)
			return el.currentStyle[cssproperty]
		else if (window.getComputedStyle) {
			var elstyle = window.getComputedStyle(el, "")
			return elstyle.getPropertyValue(csspropertyNS)
		}
	}
	var previoustab = ""
	function expandcontent(cid, aobject) {
		if (document.getElementById) {
			highlighttab(aobject)
			detectSourceindex(aobject)
			if (previoustab != "")
				document.getElementById(previoustab).style.display = "none"
			document.getElementById(cid).style.display = "block"
			previoustab = cid
			if (aobject.blur)
				aobject.blur()
			return false
		} else
			return true
	}
	function highlighttab(aobject) {
		if (typeof tabobjlinks == "undefined")
			collecttablinks()
		for (i = 0; i < tabobjlinks.length; i++)
			tabobjlinks[i].style.backgroundColor = initTabcolor
		var themecolor = aobject.getAttribute("theme") ? aobject
				.getAttribute("theme") : initTabpostcolor
		aobject.style.backgroundColor = document
				.getElementById("tabcontentcontainer").style.backgroundColor = themecolor
	}
	function collecttablinks() {
		var tabobj = document.getElementById("tablist")
		tabobjlinks = tabobj.getElementsByTagName("A")
	}
	function detectSourceindex(aobject) {
		for (i = 0; i < tabobjlinks.length; i++) {
			if (aobject == tabobjlinks[i]) {
				tabsourceindex = i //source index of tab bar relative to other tabs
				break
			}
		}
	}
	function do_onload() {
		var cookiename = (persisttype == "sitewide") ? "tabcontent"
				: window.location.pathname
		var cookiecheck = window.get_cookie
				&& get_cookie(cookiename).indexOf("|") != -1
		collecttablinks()
		initTabcolor = cascadedstyle(tabobjlinks[1], "backgroundColor",
				"background-color")
		initTabpostcolor = cascadedstyle(tabobjlinks[0], "backgroundColor",
				"background-color")
		if (typeof enablepersistence != "undefined" && enablepersistence
				&& cookiecheck) {
			var cookieparse = get_cookie(cookiename).split("|")
			var whichtab = cookieparse[0]
			var tabcontentid = cookieparse[1]
			expandcontent(tabcontentid, tabobjlinks[whichtab])
		} else
			expandcontent(initialtab[1], tabobjlinks[initialtab[0] - 1])
	}
	if (window.addEventListener)
		window.addEventListener("load", do_onload, false)
	else if (window.attachEvent)
		window.attachEvent("onload", do_onload)
	else if (document.getElementById)
		window.onload = do_onload
</script>
<script type="text/javascript">
	var enablepersistence = true
	var persisttype = "local"
	function get_cookie(Name) {
		var search = Name + "="
		var returnvalue = "";
		if (document.cookie.length > 0) {
			offset = document.cookie.indexOf(search)
			if (offset != -1) {
				offset += search.length
				end = document.cookie.indexOf(";", offset);
				if (end == -1)
					end = document.cookie.length;
				returnvalue = unescape(document.cookie.substring(offset, end))
			}
		}
		return returnvalue;
	}
	function savetabstate() {
		var cookiename = (persisttype == "sitewide") ? "tabcontent"
				: window.location.pathname
		var cookievalue = (persisttype == "sitewide") ? tabsourceindex + "|"
				+ previoustab + ";path=/" : tabsourceindex + "|" + previoustab
		document.cookie = cookiename + "=" + cookievalue
	}
	window.onunload = savetabstate
</script>
<script type="text/javascript">
const receiveMessage = async (e) =>
{
  if(e.data.hasOwnProperty('code')){
	  if(e.origin === 'http://localhost:8911'){
		  sessionStorage.setItem("code2", e.data.code);
		  var a = sessionStorage.getItem("code2");
		  console.log(e);
		  location.href="sss/"+a;
		  
	  }
	  
  }
  if(e.data.hasOwnProperty('code9')){
	  if(e.origin === 'http://localhost:8911'){
		  var c9 = e.data.code9;
		  location.href= c9;
	  }
  }
  
}
	window.onload=function(){
	var c = sessionStorage.getItem("code2");
	if(!c){
		c = "";
		document.getElementById("a_id1").innerHTML= '로그인을 해주세요';
		document.getElementById("a_id2").innerHTML= '';
		document.getElementById("a_id1").style.display = "block";
		document.getElementById("a_id2").style.display = "none";
	}else{
		document.getElementById("a_id1").innerHTML= '';
		document.getElementById("a_id2").innerHTML= c + '님 반갑습니다';
		document.getElementById("a_id1").style.display = "none";
		document.getElementById("a_id2").style.display = "block";
		
		document.getElementById("r_1").style.display = "block";
		document.getElementById("r_1").setAttribute("onclick","logout()");
		document.getElementById("r_1").innerHTML = '로그아웃';
		}
	}
	window.addEventListener("message", receiveMessage, false);
	
</script>
<script type="text/javascript">
	function paypay() {
		var b = sessionStorage.getItem("code2");
		if(b==null)	{
			window.open('http://localhost:8911/login','','width =350 , height = 350, top = 150, left = 400, location = no');
		 } else { 
			/* 이곳에 결제버튼을 구현 현재는 로그아웃으로 설정*/
			/* pro 도 feignlcient 가 되어야할듯 id와 장바구니 내역을 모두보냄
			pro 에서 결제 진행 + cus를 초기화 시키는 값을 return? */
			//location.href="logout";
			var a = sessionStorage.getItem("code2");
			window.open('http://localhost:8911/paypay/'+a,'','width =450 , height = 600, top = 150, left = 400, location = no')
		}
	}
</script>

<script type="text/javascript">
	function loging() {
		window.open('http://localhost:8911/login','','width =350 , height = 350, top = 150, left = 400, location = no')
	}
</script>

<script type="text/javascript">
	function delall() {
		location.href="delall";
	}
	
</script>

<script type="text/javascript">
	function logout() {
		sessionStorage.removeItem("code2");
		//document.getElementById("r_1").style.display = "none";
		window.location.reload()
	}
</script>

<body>
	<div class="pop_bg"></div>
	<div class="login_pop">
		<div class="login_in">
			<h2>키오스크</h2>
			<form action="" method="post">
				<div class="id line">
					<span>아이디</span> <input type="text" name="" class="id">
				</div>

				<div class="pw line">
					<span>비밀번호</span> <input type="password" name="" class="pw">
				</div>

				<div class="hidden">
					<input type="hidden" name="">
				</div>

				<div class="btn">
					<input type="submit" value="로그인"> <input type="button"
						value="취소" class="login_close">
				</div>

				<div class="join">
					<a href="http://localhost:8911/join"><input type="button" value="회원가입"></a>
				</div>
			</form>
		</div>
	</div>
	<div id="wrap">
		<div class="main">

			<section class="left">

				<div class="left_tap">
					<ul id="tablist">
						<li><a href="#" class="current" onClick="return expandcontent('sc1', this)">메뉴 1</a></li>
						<li><a href="#" onClick="return expandcontent('sc2', this)" >메뉴 2</a></li>
						<li><a href="#" onClick="return expandcontent('sc3', this)" >메뉴 3</a></li>
						<li><a href="#" onClick="return expandcontent('sc4', this)" >메뉴 4</a></li>
					</ul>
				</div>

				<div class="left_con" id="tabcontentcontainer">
					<div class="left_list tabcontent" id="sc1">
						<div class="list_in">
							<div class="list_menu">
								<ul>
									<li>
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[0].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[0].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[0].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[0].price}" name="price" class="ippp">

													<h2>${menuList[0].menu}</h2>
													<p>${menuList[0].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>
									<li>
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[1].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[1].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[1].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[1].price}" name="price" class="ippp">

													<h2>${menuList[1].menu}</h2>
													<p>${menuList[1].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>
									<li>
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[2].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[2].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[2].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[2].price}" name="price" class="ippp">

													<h2>${menuList[2].menu}</h2>
													<p>${menuList[2].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>
									<li>
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[0].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[3].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[3].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[3].price}" name="price" class="ippp">

													<h2>${menuList[3].menu}</h2>
													<p>${menuList[3].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>
									<li>
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[4].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[4].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[4].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[4].price}" name="price" class="ippp">

													<h2>${menuList[4].menu}</h2>
													<p>${menuList[4].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>
									<li>
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[5].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[5].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[5].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[5].price}" name="price" class="ippp">

													<h2>${menuList[5].menu}</h2>
													<p>${menuList[5].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>

									<li id="btn">
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[6].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[6].menu}" name="menu" class="ippp">
														<input readonly type="text" value="${menuList[6].img}" name="img" class="ippp">
														<input readonly type="text" value="${menuList[6].price}" name="price" class="ippp">
													<h2>${menuList[6].menu}</h2>
													<p>${menuList[6].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>

									<li id="btn">
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[7].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[7].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[7].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[7].price}" name="price" class="ippp">
													<h2>${menuList[7].menu}</h2>
													<p>${menuList[7].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>

									<li id="btn">
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[8].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[8].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[8].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[8].price}" name="price" class="ippp">
													<h2>${menuList[8].menu}</h2>
													<p>${menuList[8].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="left_list tabcontent" id="sc2">
						<div class="list_in">
							<div class="list_menu">
								<ul>
									<li id="btn">
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[9].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[9].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[9].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[9].price}" name="price" class="ippp">
													<h2>${menuList[9].menu}</h2>
													<p>${menuList[9].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>
									<li id="btn">
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[10].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[10].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[10].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[10].price}" name="price" class="ippp">
													<h2>${menuList[10].menu}</h2>
													<p>${menuList[10].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>
									<li id="btn">
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[11].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[11].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[11].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[11].price}" name="price" class="ippp">
													<h2>${menuList[11].menu}</h2>
													<p>${menuList[11].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>
									<li id="btn">
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[12].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[12].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[12].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[12].price}" name="price" class="ippp">
													<h2>${menuList[12].menu}</h2>
													<p>${menuList[12].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>
									<li id="btn">
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[13].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[13].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[13].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[13].price}" name="price" class="ippp">
													<h2>${menuList[13].menu}</h2>
													<p>${menuList[13].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>
									<li id="btn">
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[14].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[14].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[14].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[14].price}" name="price" class="ippp">
													<h2>${menuList[14].menu}</h2>
													<p>${menuList[14].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>

									<li id="btn">
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[15].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[15].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[15].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[15].price}" name="price" class="ippp">
													<h2>${menuList[15].menu}</h2>
													<p>${menuList[15].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>

									<li id="btn">
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[16].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[16].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[16].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[16].price}" name="price" class="ippp">
													<h2>${menuList[16].menu}</h2>
													<p>${menuList[16].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>

									<li id="btn">
										<form name="s1" action="addCart" method="post">
											<div class="list_wrap">
												<div class="img"
													style="background: url(img/${menuList[17].img}.jpg)no-repeat 50% 50%;"></div>
												<div class="text">
													<input readonly type="text" value="${menuList[17].menu}"
														name="menu" class="ippp"> <input readonly
														type="text" value="${menuList[17].img}" name="img"
														class="ippp"> <input readonly type="text"
														value="${menuList[17].price}" name="price" class="ippp">
													<h2>${menuList[17].menu}</h2>
													<p>${menuList[17].price}원</p>
													<input type="submit" value="담기" class="subBtn">
												</div>
											</div>
										</form>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="left_list tabcontent" id="sc3">
						<div class="list_in">메뉴리스트3</div>
					</div>

					<div class="left_list tabcontent" id="sc4">
						<div class="list_in">메뉴리스트4</div>
					</div>
				</div>
			</section>

			<section class="right" >

				<div class="right_tap">
					<ul>
						<li id="a_id1" onclick="loging()"></li>
						<li id="a_id2"></li>
						<li id=r_1 style="display: none"></li>
					</ul>
				</div>

				<div class="right_con">
					<div class="right_list">
						<div class="right_in">
							<c:forEach var="cart" items="${cartList}">

								<div class="cart_list">
									<div class="cart_img">
										<img src="img/${cart.img}.jpg">
									</div>

									<div class="cart_text">
										<h3>${cart.menu}</h3>
										<p>${cart.price}원</p>
									</div>

									<form class="cart_btn" method="post">
										<input readonly type="hidden" value="${cart.menu}" name="menu">
										<input readonly type="hidden" value="${cart.img}" name="img">
										<input readonly type="hidden" value="${cart.price}"
											name="price">
										<button type="submit" name=""
											onclick="javascript: form.action='/delCart'">-</button>
										<span>${cart.count}</span>
										<button type="submit" name=""
											onclick="javascript: form.action='/addCart'">+</button>
									</form>
								</div>

							</c:forEach>
						</div>
					</div>
				</div>

				<div class="money">
					<div class="money_in">
						<h3>합계금액 :</h3>
						<p>${sum}원</p>
					</div>
				</div>

				<div class="right_btn">
					<div class="btn_in">
						<div class="no_btn btn" onclick="delall()">
							<h3>결제취소</h3>
						</div>

						<div class="ok_btn btn" onclick="paypay()">
							<h3>결제하기</h3>
						</div>
					</div>
				</div>
			</section>

		</div>
	</div>
</body>
</html>