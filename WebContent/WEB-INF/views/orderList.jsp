<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>컴퓨터 쇼핑몰</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<!-- mason -->
		<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
		<!-- icon -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
			
		
		
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

.wrapper {
	width: 1440px;
	margin: 0px auto;
}

.wrapperChild {
	width: 95%;
	margin: 0px auto;
}

img {
	display: block;
	margin: 0px auto;
}

a {
	color: black;
}

hr {
	height: 1px;
	background-color: black;
}

#columns {
	column-width: 300px;
	column-gap: 100px;
}

#columns figure {
	display: inline-block;
	margin: 15px;
	border: 1px solid rgb(0, 0, 0, 0.2);
	padding: 10px;
	box-shadow: 2px 2px 5px rgb(0, 0, 0, 0.5);
	width: 300px;
}

#columns figure img {
	width: 70%;
	height: 250px;
}

#columns #bottomfugure {
	border-top: 1px solid rgb(0, 0, 0, 0.2);
	padding: 20px;
	margin-top: 20px;
	display: block;
}

.productmouse:hover {
	color: #fff;
	background: #ccc;
}

.checked {
	color: orange;
}

.wrapper {
	margin-top: 3rem;
}

.card {
	border: none;
}

.p-1 {
	width: 9rem;
	margin: auto 0px;
}

.p-2 {
	width: 30rem;
	margin: auto 0px;
	justify-content: center;
}
[title~=delivery] {
	width : 100px;
	height : 100px;
	border-radius: 3rem;
	text-align: center;
	background-color: #d3d3d3;
}




</style>
		
	</head>
	<body>
		<%@ include file="/WEB-INF/views/common/banner.jsp" %>
		<div id="contents" class="wrapper">
			<div class="row">
			
				<!-- 사이드바 -->
				<div id="sidebar" class="col-sm-2 col-md-2 d-none d-xl-block">
					<%@ include file="/WEB-INF/views/common/userInfo.jsp" %>
				
					<h3 class="text-left my-3">My page</h3>
					
					<div class="d-flex flex-column">
						<div class="d-flex flex-column my-2">
							<a class="text-left" data-toggle="collapse" href=".collapseOne" style="font-size:large ;">회원정보 관리</a>
							<hr/>
							<div class="d-flex flex-column">
								<div class="collapse collapseOne text-left">개인정보 확인</div>
								<div class="collapse collapseOne text-left">개인정보 수정</div>
							</div>
						</div>

						<div class="d-flex flex-column my-2">
							<a class="text-left " data-toggle="collapse" href=".collapseTwo" style="font-size: arge;">구매 정보</a>
							<hr/>
							<div class="d-flex flex-column">
								<div class="collapse collapseTwo text-left">주문 내역 조회</div>
								<div class="collapse collapseTwo text-left">장바구니 조회</div>
							</div>
						</div>
						
						<div class="d-flex flex-column my-2">
							<a class="text-left " data-toggle="collapse" href=".collapseThree" style="font-size: large;">고객센터</a>
							<hr/>
							<div class="d-flex flex-column">
								<div class="collapse collapseThree text-left">상품평</div>
								<div class="collapse collapseThree text-left">Q & A</div>
								<div class="collapse collapseThree text-left">내 게시글</div>
							</div>
						</div>
					</div>
				</div>
				<div id="product" class="col-sm-9 col-md-9 container-fluid text-center">

					<div class="card container-fluid">
						<div class="column">
							<div id="card1">
								<div class="card-header"></div>
								<div class="card-body text-left">
								<b>주문/배송 조회</b>
								</div>
							</div>
							
							<div id = "card2" class ="card">
								<div class = "card-body" >
									<div class = "row" >
										<div  class = "card col-sm-3" style = "align-items: center;">
											<table title="delivery" >
												<tr><td >1</td></tr>
												<tr><td>주문 접수</td></tr>
											</table>
										</div>
										
										
										<div  class = "card col-sm-3" style = "align-items: center;">
											<table title="delivery">
												<tr><td>1</td></tr>
												<tr><td>상품 준비</td></tr>
											</table>
										</div>
										
										
										<div  class = "card col-sm-3" style = "align-items: center;">
											<table title="delivery">
												<tr><td>1</td></tr>
												<tr><td>배송 중</td></tr>
											</table>
										</div>
										
										
										<div  class = "card col-sm-3" style = "align-items: center;">
											<table title="delivery">
												<tr><td>1</td></tr>
												<tr><td>배송 완료</td></tr>
											</table>
										</div>
										
										
									</div>
								</div>
							</div>
							
							<div id="card3">
								<div class="card-header"></div>
								<div class="card-body text-left">
								<b>주문 내역</b>
									<table id = "orderlist"class="table table-striped" style = "text-align : center;">
										<thead>
											<tr>
												<th>주문자</th>
												<th>주문 상품</th>
												<th>가격</th>
												<th>배송상태</th>
											</tr>
										</thead>
										<tbody >
										<c:forEach var="order" items="${pageList}">
											<tr >
												<th>${order.users_id}</th>
												<th>${order.product_name}</th>
												<th>${order.orders_price}</th>
												<th>${order.orders_status}</th>
											</tr>
										</c:forEach>
										</tbody>
									</table>
	
								</div>
								<div class ="d-flex">
					               <div id = "pagination " class = "container" >
					                  <div class = "pagination justify-content-center" >
					                  
					                     <a href="ReadOrderList?pageNo=1" class="btn btn-muted btn-sm">처음</a>
					                     
					                     <c:if test="${pager.groupNo > 1 }">
						                 	<a href="ReadOrderList?pageNo=${pager.startPageNo - 1}" class="btn btn-muted btn-sm">이전</a>
					                     </c:if>
					                     
					                     <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					                     	<c:if test="${pager.pageNo != i}">
						                     	<a href="ReadOrderList?pageNo=${i}" class="btn btn-dark btn-sm">${i}</a>
					                     	</c:if>
					                     	<c:if test="${pager.pageNo == i}">
						                     	<a href="ReadOrderList?pageNo=${i}" class="btn btn-warning btn-sm">${i}</a>
					                     	</c:if>
					                     </c:forEach>
					                     
					                     <c:if test="${pager.groupNo < pager.totalGroupNo}">
						                 	<a href="ReadOrderList?pageNo=${pager.endPageNo + 1}" class="btn btn-muted btn-sm">다음</a>
					                     </c:if>
					                     
					                     <a href="ReadOrderList?pageNo=${pager.totalPageNo}" class="btn btn-muted btn-sm">맨끝</a>
					                  </div>
					               
					               </div>
					            </div>
							</div>
							
							<div id="card4">
								<div class="card-header"></div>
								<div class="card-body text-left">
								<b>쇼핑몰 주문 공통</b>
								<hr/>
									<ul>
										<li class="list-group-item">- 주문하신 상품마다 배송 및 도착 날짜가 서로 다를 수 있습니다.</li>
										<li class="list-group-item">- 일요일 및 공휴일에는 배송이 되지 않습니다.</li>
										<li class="list-group-item">- 주문 취소/반품은 '주문 취소’, ‘반품 신청’ 버튼을 클릭하여 직접 신청하거나, 고객센터를 통해 취소/반품 해주시기 바랍니다.</li>
										<li class="list-group-item">- 주문 취소/반품은 처리가 가능한 단계에서만 버튼이 표시됩니다.</li>
																	
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</body>
</html>