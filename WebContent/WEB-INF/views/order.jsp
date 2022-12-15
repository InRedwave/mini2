<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<!-- jQuery library -->
		<script src=https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js></script>
		<!-- Popper JS -->
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<style>
			/* 글꼴 */
			@font-face {
			  font-family: 'LotteMartDream';
			  font-style: normal;
			  font-weight: 400;
			  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff');
			}
			
			* {
			 	font-family: 'LotteMartDream';
				padding: 0px;
				margin: 0px;
				/*border: 1px solid black;*/
			}
			
			.wrapper {
				width: 1440px;
				margin: 0px auto;
			}
			
			.wrapperChild {
				width: 90%;
				margin: 0px auto;
			}
			
			img {
				display: block;
				margin: 0px auto;
			}

			a {
				color : black;
			}
			
			input {
				background-color: #FCFCFC;
			}
			
			hr {
				height: 1px;
				background-color: black;
			}
			
			label {
				text-align: left;
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
			
		</style>
		<script>
			function createOrder() {
				let price = $(".price").text().substr(0, $(".price").text().length - 1);
				let address = $("#address").val();
				let count = $(".count").attr("id");
				let id =$(".productId").attr("id");
	    		let dataObject = { price : price, address : address, count : count, id : id};
	    		console.log(dataObject);
				$.ajax({
					url: "CreateOrder",
					type: "post",
					data: dataObject,
					success: function(result) {
						if (result === "success") {
							$('#orderResult').html = "주문에 성공했습니다.";
						}
						else {
							$('#orderResult').html = "주문에 실패했습니다.";
						}
						popOpen('order');
					}
				});
			}
			
			function popOpen(str) {
				if (str === 'order') {
					$('#orderWarning').show();
					$('.modal-bg').show();
				}
				
				else if (str === 'point') {
					$('#pointWarning').show();
					$('.modal-bg').show();
				}
				
			}

			function popClose(str) {
				$('.modal-wrap').hide();
				$('.modal-bg').hide();
			}
			
			function updatePoint() {
				let point = $('#point').val();
				let usable = ${user_point};
				let Price = ${price};
				if (point <= usable) {
					$('#usedPoint').text() = '-' + point + 'p';
					$('#${price}').text() = Price - point + '원';
					$('#bonus').text() = '+' + ((Price - point) / 10) + 'p';
				}
				else {
					popOpen('point');
				}
			}
		</script>
	</head>
	<body onLoad="popClose()">
		<%@ include file="/WEB-INF/views/common/banner.jsp" %>
		
		<!-- 상단 고정 메뉴 끝 -->
		
		<div class="wrapper" style="background-color: #F9F9F9">
			<div class="wrapperChild">
				<h1 class="text-left pt-3">주문/결제</h1>
			</div>
			<div class="wrapperChild row">
			
				<div class="col-8 d-flex flex-column">
					<div class="d-flex flex-column mt-3">
						<h3 class="text-left">주문상품</h3><hr/>
						<div class="row">
							<div class="col-3">
								<img src="${filePath}"/>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-3 d-flex flex-column">
								<h6>${productName}</h6>
							</div>
							<div class="col-4 d-flex flex-column">
								<div class="form-group d-flex flex-column">
					            	<label for="point">Membership Point</label>
					            	<div class="d-flex">
						            	<input type="text" class="form-control-sm text-muted" id="point" value="사용할 포인트를 입력해 주세요"/>
					            		<button onclick="updatePoint()" class="btn btn-primary btn-sm">확인</button>
					            	</div>
					            	<small id="pointHelp" class="form-text">남은 포인트: ${user_point}p</small>
					          	</div>
							</div>
							<div class="col-3">
								<h6 id="${productId}" class="productId">가격: ${price} 원</h6>
							</div>
						</div>
					</div>
					
					<div class="d-flex flex-column mt-5">
						<h3 class="text-left">배송정보</h3><hr/>
						<div class="row">
							<div class="col-3">
								<h5 class="text-left">주문자 정보</h5>
							</div>
							<div class="col-7 d-flex flex-column">
								<h5 class="text-left">이름: ${user.user_name}</h5>
								<h5 class="text-left">휴대폰 번호: ${user.user_phone}</h5>
								<h5 class="text-left">이메일: ${user.user_email}</h5>
							</div>
							<div class="col-2">
								<a href="">주문자 정보 변경</a>
							</div>
						</div><hr/>
						<div class="row">
							<div class="col-3">
								<h5 class="text-left">배송지 정보</h5>
							</div>
							<div class="col-7">
								<div class="form-group d-flex justify-content-around">
					            	<label for="receiver" class="col-4">수령인 이름</label>
					            	<input type="text" class="form-control-sm text-muted col-6 rounded-0 border-top-0 border-left-0 border-right-0" id="receiver" value="${user.user_name}"/>
					            	<div class="col-2"></div>
					          	</div>
								<div class="form-group d-flex justify-content-around">
					            	<label for="tel" class="col-4">연락처</label>
					            	<input type="text" class="form-control-sm text-muted col-6 rounded-0 border-top-0 border-left-0 border-right-0" id="tel" value="${user.user_phone}"/>
					            	<div class="col-2"></div>
					          	</div>
								<div class="form-group d-flex justify-content-around">
					            	<label for="address" class="col-4">주소</label>
					            	<input type="text" class="form-control-sm text-muted col-6 rounded-0 border-top-0 border-left-0 border-right-0" id="address" value="${user.user_address}"/>
					            	<div class="col-2"></div>
					          	</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4 d-flex flex-column">
					<div class="d-flex flex-column mt-3">
						<h3 class="text-left">결제정보</h3><hr/>
						<div class="row">
							<h5 class="text-left col-7">상품 수</h5>
							<h5 id="${countNum}" class="text-right col-5 count">${countNum}개</h5>
						</div>
						<div class="row">
							<h5 class="text-left col-7">주문 금액</h5>
							<h5 class="text-right col-5">+${price}원</h5>
						</div>
						<div class="row">
							<h5 class="text-left col-7">사용한 멤버쉽 포인트</h5>
							<h5 id="usedPoint" class="text-right col-5 text-success">0p</h5>
						</div>
						<div class="row">
							<h5 class="text-left col-7">결제 예정 금액</h5>
							<h5 id="${price}" class="text-right col-5 text-primary price">${price}원</h5>
						</div>
						<div class="row">
							<h5 class="text-left col-7">적립 예정 멤버쉽 포인트</h5>
							<h5 id="bonus" class="text-right col-5 text-info">+0p</h5>
						</div>
					</div>
					<div class="d-flex flex-column mt-5">
						<button onclick="createOrder()" type="button" class="btn bg-primary" style="color: #ffffff; border-radius: 36px">결제하기</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 팝업 창 -->
		<div class="modal-bg" onClick="popClose()"></div>
		<div id="orderWarning" class="modal-wrap container-fluid" style="border-radius: 20px;">
			<div style="height: 150px;" class="pt-5 text-center">
				<h6 id="orderResult">주문에 성공했습니다</h6>
			</div>
	
			<div class="d-flex justify-content-center my-1">
					<button class="btn btn-sm btn-dark round" onClick="popClose()">확인</button>
			</div>
		</div>
		<div id="pointWarning" class="modal-wrap container-fluid" style="border-radius: 20px;">
			<div style="height: 150px;" class="pt-5 text-center">
				<h6 id="orderResult">포인트가 부족합니다</h6>
			</div>
	
			<div class="d-flex justify-content-center my-1">
					<button class="btn btn-sm btn-dark round" onClick="popClose()">확인</button>
			</div>
		</div>
	</body>
</html>