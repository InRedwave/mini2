<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<script>
	//수량버튼 증감 
	function count(type, e) {
		var min = 1;
		var max = 10;

		//모든 문자열에서(/g) 숫자(\D)만 빼오는 메소드
		var id = e.getAttribute("id").replace(/\D/g, '');

		var name = 'num';
		name += id;

		var value = document.getElementById(name);

		if (type === 'm' && value.getAttribute('value') > min) {
			value.setAttribute('value',
					parseInt(value.getAttribute('value')) - 1);
		}

		if (type === 'p' && value.getAttribute('value') < max) {
			value.setAttribute('value',
					parseInt(value.getAttribute('value')) + 1);
		} 
		
		//최종 금액 구하기
		let result = parseInt(value.getAttribute('value')) * ${cart.product_price};
		document.getElementById('total_sum').innerText = result
				.toLocaleString('en-US');
	}
	
	function deleteCart(Item) {
		let id = Item.getAttribute("id").replace(/\D/g, '');
		let name = 'productId';
		name += id;
		let value = document.getElementById(name).getAttribute("class");
		
		$.ajax({
			url : "UpdateCart",
			type : "post",
			data : {
				productId : value,
				task : "deleteCart"
			},
			success : function(result) {
				if (result === "success") {
					deleteItem(Item);
				}
			}
		});
	}
	
	function updateCart(type, e) {
		var min = 1;
		var max = 10;
		var id = e.getAttribute("id").replace(/\D/g, '');
		
		var name = 'productId';
		name += id;
		var idValue = document.getElementById(name).getAttribute("class");

		var name = 'num';
		name += id;
		var countValue = document.getElementById(name);
		
		let isChanged = false;
		if (type === 'm' && countValue.getAttribute('value') > min) {
			countValue = parseInt(countValue.getAttribute('value')) - 1;
			isChanged = true;
		}
		if (type === 'p' && countValue.getAttribute('value') < max) {
			countValue = parseInt(countValue.getAttribute('value')) + 1;
			isChanged = true;
		}
		
		if (isChanged === true) {
			$.ajax({
				url : "UpdateCart",
				type : "post",
				data : {
					productId : idValue,
					cartItemCount : countValue,
					task : "updateCart"
				},
				success : function(result) {
					if (result === "success") {
						count(type, e);
					}
				}
			});
		}
	}

	//체크박스 선택 및 해제
	function selectAll() {
		var checkboxes = document.getElementsByClassName("select");

		if (document.getElementById("selectAll").checked === true) {
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = true;
			}
		} else {
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = false;
			}
		}
	}

	// 장바구니 상품 삭제(휴지통 아이콘)
	function deleteItem(deleteItem) {
		//document.getElementById().getElementById
		var id = deleteItem.getAttribute("id").replace(/\D/g, '');

		var name = 'cartItem';
		name += id;
		var divclass = document.getElementById(name);
		divclass.style.display = "none";
		//선택 상품 삭제

	}

	// 장바구니 상품 삭제(선택삭제)
	function deleteCheckedItem() {
		var checkboxes = document.getElementsByClassName("select");
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				//휴지통 삭제 function으로 
				deleteCart(checkboxes[i]);
			}
		}
	}
</script>

<style>
/* 글꼴 */
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
	font-family: 'LotteMartDream';
	padding: 0px;
	margin: 0px;
	/*border: 1px solid black;*/
}

img {
	display: block;
	margin: 0px auto;
	width: 150px;
	height: 250px;
}

a {
	color: black;
}

.wrapper {
	width: 1440px;
	margin: 0px auto;
}

.card {
	border: none;
}

.grey {
	background-color: #F5F5F5;
}

.houseImg {
	display: block;
	width: 20px;
	height: 20px;
	margin: 0px auto;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/banner.jsp"%>

	<div id="cart" class="container-fluid mt-3" style="width: 1440px">
		<div class="text-left container-fluid row">
			<span> <a href="/Project2_shopping/home"
				style="display: block"> <img
					src="/Project2_shopping/resources/images/house.png"
					class="houseImg" />
			</a>
			</span>
			<div class="ml-2">
				> <a href="#">장바구니</a>
			</div>
		</div>
		<hr style="height: 0.1px; background-color: lightgrey" />

		<div class="row">
			<div id="sidebar"
				class="col-sm-2 col-md-2 d-none d-xl-block justify-content-center">
				<%@ include file="/WEB-INF/views/common/userInfo.jsp" %>

				<div class="d-flex flex-column rounded-lg pt-3">
					<img src="/Project2_shopping/resources/images/adlong.png"
						style="width: 97%; height: 97%">
				</div>
			</div>

			<div id="cartProduct" class="col-sm-7 container-fluid">
				<div class="card container fluid py-2 grey"
					style="background-color: #F5F5F5">
					<div class="row">
						<div class="col-sm-9 mt-1">
							<input type="checkbox" id="selectAll" value="selectAll"
								onclick="selectAll()" /> 전체선택
						</div>
						<div class="col-sm-3 d-flex justify-content-end">
							<button type="button" class="btn btn-outline-dark btn-sm"
								style="border-radius: 20px" onclick="deleteCheckedItem()">선택삭제</button>
						</div>
					</div>
				</div>
				<c:set var="sum" value="0" />
				<c:forEach var="cart" items="${cartList}" varStatus="i">
					
					<div id="cartItem${i.count}"
						class="card container-fluid grey my-2 py-1">
						<div id="productId${i.count}" class="${cart.product_id}"></div>
						<div class="card container-fluid grey">
							<div class="row">
								<div class="col-sm-9">
									<input type="checkbox" id="c${i.count}" class="select" multiple />
								</div>
								<div class="col-sm-3 d-flex justify-content-end">
									<button type="button" id="${i.count}"
										class="btn btn-outline-dark btn-sm" style="font-size: 17px;"
										onclick="deleteCart(this)">
										<i class='far fa-trash-alt'></i>
									</button>
								</div>
							</div>
						</div>

						<div class="card container-fluid py-3 grey">
							<div class="row">
								<div class="col-sm-3">
									<img
										src="/Project2_shopping/resources/images/refrigerator1.png" />
								</div>
								<div class="col-sm-6 container-fluid d-flex flex-column">
									<div class="status" style="color: DodgerBlue">
										<h6>설치상품</h6>
									</div>
									<br />
									<div class="name">
										<h3>${cart.product_name}</h3>

									</div>
									<br />
									<div class="color">
										<h5>새틴 베이지+새틴 화이트</h5>
									</div>
								</div>

								<div
									class="col-sm-3 card container-fluid d-flex flex-column py-3 mt-5 grey align-center">
									<div class="text-right text-muted"
										style="text-decoration: line-through">

										<c:set var="price" value="${cart.product_price}" />
										<h5>
											<fmt:formatNumber type="number" maxFractionDigits="0"
												value="${price}" />
										</h5>

									</div>
									<div class="text-right pb-2" style="color: DodgerBlue">
										<h4>
											<fmt:formatNumber type="number" maxFractionDigits="0"
												value="${price*0.9}" />
										</h4>
										<c:set var="sum" value="${sum+(price*0.9)}" />
									</div>

									<div class="btn-group btn-group-sm pl-5 ml-5"
										style="width: 50%">
										<button type="button" class="btn btn-outline-dark btn-sm"
											id="minus${i.count}" onclick="updateCart('m', this)">-</button>

										<input type="button"
											class="btn btn-outline-dark btn-sm disabled"
											id="num${i.count}" value="1" />

										<c:set var="totalCount" value="${totalCount.i.count}" />

										<button type="button" class="btn btn-outline-dark btn-sm"
											id="plus${i.count}" onclick="updateCart('p', this)">+</button>
									</div>
								</div>
							</div>
						</div>

						<div class="card container-fluid grey">
							<h6 class="text-left text-muted">*장바구니 상품은 30일간 보관됩니다.</h6>
						</div>
					</div>

				</c:forEach>
			</div>

			<div id="cartPrice" class="col-sm-3 container-fluid">
				<div>
					<img src="/Project2_shopping/resources/images/change.png"
						style="width: 100%; height: 110%">
				</div>

				<div class="card container fluid d-flex flex-column py-3">
					<div class="row justify-content-between">
						<div class="d-flex mx-3">
							<h5>전체 상품</h5>
						</div>
						<div class="d-flex mx-3">
							<h5>${UpdateCart.cartcartItemCount}개</h5>
						</div>
					</div>
					<div class="row justify-content-between">
						<div class="d-flex mx-3">
							<h5>주문 금액</h5>
						</div>
						<div class="d-flex mx-3">
							<h5 id="total_sum">
								<%-- <fmt:formatNumber type="number" maxFractionDigits="0" value="${total_sum}"/> --%>
							</h5>
							<h5>원</h5>
						</div>
					</div>
					<div class="row justify-content-between">
						<div class="d-flex mx-3">
							<h5>할인 금액</h5>
						</div>
						<div class="d-flex mx-3" style="color: DodgerBlue">
							<h5>
								<fmt:formatNumber type="number" maxFractionDigits="0"
									value="${price*0.1}" />
								원
							</h5>
						</div>
					</div>
					<br />
					<div class="row justify-content-between">
						<div class="d-flex mx-3">
							<h4>결제 예정 금액</h4>
						</div>
						<div class="d-flex mx-3">
							<h4>
								<fmt:formatNumber type="number" maxFractionDigits="0"
									value="${sum}" />

								원
							</h4>
						</div>
					</div>
				</div>

				<div class="card container fluid d-flex flex-column py-3">
					<button type="button" class="btn btn-primary"
						style="border-radius: 20px" onclick="">주문하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>