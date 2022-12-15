<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- 별 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>
	//data보내기
	function sendData() {
		let xhttp = new XMLHttpRequest();
		//data를 getElementedByID해서 얻은 값은 json형태로 만든다.
		let pid = document.getElementById('${Product.product_id}');
		let qty = document.getElementById("countNum");
		let data = {
			'id' : pid.getAttribute("id"),
			'qty' : qty.getAttribute("value")
		};
		console.log(data);
		xhttp.open('post', 'order'); //post방식 
		xhttp.send(JSON.stringify(data));
	}

	//OrderController로 값 보내기
	function goOrder() {
		sendData();
		location.href = "/Project2_shopping/order";
	}

	//팝업창 열기
	function popOpen() {
		sendData();
		//json을 문자열로 바꿔서 바디에 실어서 요청을 보낸다.
		var modalPop = $('.modal-wrap');
		var modalBg = $('.modal-bg');
		$(modalPop).show();
		$(modalBg).show();
	}

	//팝업창 닫기
	function popClose() {
		var modalPop = $('.modal-wrap');
		var modalBg = $('.modal-bg');
		$(modalPop).hide();
		$(modalBg).hide();
	}

	//버튼 수량 조작
	function counting(type) {

		var min = 1;
		var max = 10;
		var num = document.getElementById('countNum');
		var qty = document.getElementById('qty');
		if (type === 'm' && num.getAttribute('value') > min) {
			num.setAttribute('value', parseInt(num.getAttribute('value')) - 1);
			qty.setAttribute('value', parseInt(num.getAttribute('value')));
		}

		if (type === 'p' && num.getAttribute('value') < max) {
			num.setAttribute('value', parseInt(num.getAttribute('value')) + 1);
			qty.setAttribute('value', parseInt(num.getAttribute('value')));
		}
		//최종 금액 구하기
		let result = parseInt(num.getAttribute('value')) * ${Product.product_price};
		document.getElementById('total_sum').innerText = result.toLocaleString('en-US');
	}

	//별점 칠하기
	function init() {
		var r_score = document.getElementById("point").innerHTML;
		r_score = Math.round(r_score);
		$('.fa-star:nth-child(-n' + r_score + ')').addClass("starchecked");
	};
</script>
<style>
@font-face {
	font-family: 'LotteMartDream';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2')
		format('woff2'),
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff')
		format('woff');
}

* {
	/*   border: 1px solid black;  */
	font-family: 'LotteMartDream';
	margin: 0px;
	padding: 0px;
}

#wrapper {
	margin: 0px auto;
	width: 1440px;
}

img {
	display: block;
	margin: 0px auto;
}

.v_center {
	vertical-align: middle;
}

.btn-lg {
	font-size: 14px;
}

.round {
	width: 150px;
	border-radius: 24px;
}

.btn:focus {
	border: 2px dashed #0054FF;
	box-shadow: none;
}

#pd_category {
	font-color: #BDBDBD;
}

#pd_content {
	border-radius: 24px;
	background-color: #F0F0F0;
}

.card {
	border: none;
	background-color: #F0F0F0;
}

#pd_detail_option {
	width: 94%;
	padding-top: 30px;
	padding-bottom: 30px;
}

input[name=rf_color]:checked {
	width: 25px;
	height: 25px;
	background-color: red;
	display: inline-block;
}

.modal-bg {
	display: none;
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.6);
	z-index: 0;
}

.modal-wrap {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 400px;
	height: 150px;
	background: #fff;
	z-index: 1;
}

a:link {
	color: black;
}

a:visited {
	color: black;
}

li {
	float: left;
	border-left: 1px solid black;
	padding: 0px 5px 0px 5px;
}

li:first-child {
	border-left: none;
}

.starchecked {
	color: orange;
}
</style>
</head>
<body onload="init()">
	<%@ include file="/WEB-INF/views/common/banner.jsp"%>
	<div id="${Product.product_id}" class="deliver_pid"></div>
	<div class="pb-5 pt-2">
	<!--  
		<h6>
			HOME > 주방가전 > <a href="${pageContext.request.contextPath}/productList">냉장고 모두 보기</a> > BESPOKE 냉장고 4도어 키친핏 604 L
		</h6>
	-->
	</div>
	<div id="wrapper">
		<div id="pd_detail" class="container-fluid row">
			<div class="col-sm-12 col-md-6 col-lg-8">
				<div class="py-3 text-center">
					<img class="mt-5" src="${filePath}" />
				</div>
			</div>

			<div id="pd_content" class="col-sm-0 col-md-6 col-lg-4 container-fluid mt-3" style="border-radius: 24px">
				<div class="card p-3 mt-3 mb-4" style="width: 97%;">
					<div id="company" class="card-header pt-2 text-primary" style="background-color: #F0F0F0; border: none">${Product.product_company}</div>
					<div class="card_body container-fluid">
						<h3 class="my-4">${Product.product_name}</h3>
						<div class="pd_score container-fluid d-flex justify-content-between px-0 my-5">
							<div class="d-flex">
								<span id="starList"> 
									<span class="fa fa-star"></span> 
									<span class="fa fa-star"></span> 
									<span class="fa fa-star"></span> 
									<span class="fa fa-star"></span> 
									<span class="fa fa-star"></span>
								</span>

								<h6 id="point" class="mt-1 ml-2">${Product.product_totalpoint}</h6>
							</div>
							<div class=" d-flex justify-content-end">
								<span class="d-flex justify-content-start"> <img src="${pageContext.request.contextPath}/resources/images/pencil.png" height="20px" />
								</span>

								<h6 class="flex-fulfill" style="text-decoration-line: underline;">
									<a href="${pageContext.request.contextPath}/reviewBoardList">상품평 쓰기</a>
								</h6>
							</div>
						</div>

						<div id="pd_detail_price" class="my-5">
							<div class="column">
								<div class="row">
									<div class="col-6 text-left v_center">
										<h6>판매가</h6>
									</div>

									<div class="col-6 text-right v_center">
										<h5>
											<del>${Product.product_price+1000000}</del>
										</h5>
									</div>
								</div>
								<div class="d-flex justify-content-between">
									<div class="text-primary">
										<h6>아울렛 특가</h6>
									</div>
									<div id="money" class="text-primary">
										<h3>${Product.product_price}원</h3>
									</div>
								</div>
							</div>
						</div>
						<form method="POST" action="ReadOrder">
							<input style="display: none" name="productid" value="${Product.product_id}" />
							<div class="d-flex justify-content-center my-4">
								<div id="pd_detail_option" style="background-color: #EAEAEA; border-radius: 24px">
									<div class="column">
										<div class="d-flex justify-content-around">
											<div>
												<h6>수량</h6>
											</div>
											<div class="ml-3">
												<span class="btn-group btn-group-sm pl-5 ml-5" style="width: 50%">
													<button type="button" class="btn btn-outline-dark btn-sm" onclick="counting('m')">-</button>
													<input type="button" class="btn btn-outline-dark btn-sm disabled" id="countNum" name="countNum" value="1" />
													<input type="hidden" id="qty" name="qty" value="0"/>
													<button type="button" class="btn btn-outline-dark btn-sm" onclick="counting('p')">+</button>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<h6 class="mb-3">※최대 구매 가능 개수는 10개입니다. 그 이상의 대량 구매는 유선문의 바랍니다.</h6>

							<!-- 설명 -->
							<div id=pd_content class="mb-4 text-primary">${Product.product_content}</div>

							<!-- 실제 계산해서 띄우는 곳 -->
							<div class="my-3">
								<div class="d-flex justify-content-between">
									<h3>총 금액:</h3>
									<div class="d-flex justify-content-end">
										<h4 id="total_sum">${Product.product_price}</h4>
										<h4>원</h4>
									</div>
								</div>
							</div>
							<div id="rf_button">
								<div class="row" style="text-align: center">
								<c:if test="${user_id != null}">
									<div class="text-right col-6 my-1">
										<button type="button" onClick="javascript:popOpen();" class="btn btn-dark btn-lg round" name="choice" data-color="white" value="cart">장바구니</button>
									</div>

									<div class="text-left col-6 my-1">
										<input name="price" value="${Product.product_price}" style="display: none" />
										<button class="form-control btn btn-dark btn-lg round" value="구매하기" type="submit">구매하기</button>
									</div>
								</c:if>
								<c:if test="${user_id == null}">
									<div class="text-right col-6 my-1">
									<a href="Login" class="btn btn-dark btn-lg round" data-color="white">로그인하기</a>
									</div>
									<div class="text-right col-6 my-1">
									<a href="Join" class="btn btn-dark btn-lg round" data-color="white">회원가입하기</a>
									</div>
								</c:if>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 팝업 창 -->
	<div class="modal-bg" onClick="javascript:popClose();"></div>
	<div class="modal-wrap container-fluid" style="border-radius: 20px;">
		<div style="height: 150px;" class="pt-5 text-center">
			<h6>제품이 장바구니에 추가되었습니다.</h6>
			<h6>(현재 총 1개의 상품이 저장되었습니다.)</h6>
		</div>

		<div>
			<div>
				<div class="row my-1 ">
					<div class="col-6 d-flex justify-content-end my-1">
						<form method="get" action="cart">
							<button class="btn btn-sm btn-dark round" onclick="window.location.href='cart';">장바구니로 가기</button>
						</form>
					</div>
					<div class="col-6 d-flex justify-content-start my-1">
						<button class="btn btn-sm btn-dark round" onClick="javascript:popClose();">쇼핑 계속하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>