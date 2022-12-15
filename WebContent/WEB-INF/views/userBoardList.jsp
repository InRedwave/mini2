<%@ page contentType="text/html; charset=UTF-8" %>
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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
			
			.wrapper > * {
				width: 90%;
				margin: 0px auto;
			}
			
			.vl {
			  	border-left: 2px solid black;
			  	border-right: 2px solid black;
			}
			
			.shadowText {
				font-size: 400%;
				text-shadow: 3px 3px 3px #202020;
			}
			
			body {
				font-family: 'NanumBarunGothic';
			}
			
			img {
				display: block;
				margin: 0px auto;
			}

			a {
				color : black;
			}
			
			hr {
				height: 0.5px;
				background-color: grey;
			}
			
			label {
				text-align: left;
			}
			
			.checked {
				color: orange;
			}
		</style>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/common/banner.jsp" %>
	 
		<div id="bottomViewPort" class="wrapper d-flex mt-3">
			<div id="sidebar" class="col-sm-2 col-md-2 d-none d-xl-block">
				<%@ include file="/WEB-INF/views/common/userInfo.jsp" %>

				<h3 class="text-left my-3">게시판 목록</h3>

				<div class="d-flex flex-column">
					<div class="d-flex flex-column my-2">
						<a class="text-left" data-toggle="collapse" href=".collapseOne" style="font-size: x-large;">관리 목록</a>
						<hr/>
						<div class="d-flex flex-column">
							<div class="collapse collapseOne text-left">유저 목록</div>
							<div class="collapse collapseOne text-left">상품 목록</div>
							<div class="collapse collapseOne text-left">주문 목록</div>
							<div class="collapse collapseOne text-left">리뷰 게시판 목록</div>
							<div class="collapse collapseOne text-left">QnA 게시판 목록</div>
						</div>
					</div>
				</div>
			</div>
			<div class="d-flex flex-column col-sm-10 col-md-10">
				<div id="listType" class="mt-4">
					<h1>유저 목록</h1>
				</div><hr class="mb-4"/>
				<div id="notice">
					<h2>검색 조건을 선택하세요</h2>
				</div><hr class="mb-4"/>
				<div id="selectCondition" class="d-flex">
					<div class="conditionSet d-flex align-items-center col-4 flex-fill">
						<div>
							<nav class="navbar navbar-expand-sm nav-bar-gray">
								<ul class="navbar-nav">
									<li class="nav-item"><input type="text" class="form-control" value="검색할 내용 입력하기"></li>
							    	<li class="nav-item"><button type="button" class="btn btn-dark shadow">Search</button></li>
								</ul>
							</nav>
						</div>
						<select class="col-3 form-control align-self-center">
					    	<option>아이디</option>
					    	<option>등급</option>
					    	<option>상태</option>
					  	</select>
					</div>
					<div class="conditionSet d-flex justify-content-start align-items-center col-3 flex-fill">
						<h5 class="col-4 text-right">정렬순</h5>
						<select class="col-5 form-control">
					    	<option>등급</option>
					  	</select>
					</div>
					<div class="conditionSet d-flex justify-content-start align-items-center flex-fill">
						<h5 class="col-6 text-left">리스트 최대치</h5>
						<select class="col-3 form-control">
					    	<option>5</option>
					    	<option>10</option>
					    	<option>15</option>
					  	</select>
					</div>
					<div class="conditionSet d-flex justify-content-start align-items-center col-2 flex-fill">
						<button type="button" class="btn btn-warning shadow">탈퇴 처리</button>
					</div>
				</div><hr class="my-3"/>
				<div class="titleList d-flex flex-column">
					<div class="listInfo">
						<h3>총 ~개의 게시글이 있습니다</h3>
					</div><hr class="my-2"/>
					<div class="titleInfo">
						<div class="d-flex">
							<div class="titleIdInfo col-1">
								<h5>글번호</h5>
							</div>
							<div class="titleContentInfo col-11">
								<div class="d-flex">
									<h5 class="col-5">아이디</h5>
									<h5 class="col-2">등급</h5>
									<h5 class="col-2">상태</h5>
									<h5 class="col-3 text-center">선택</h5>
								</div>
							</div>
						</div>
					</div><hr class="my-2"/>
					<div class="titles d-flex flex-column">
						<div class="titleBlock d-flex">
							<div class="titleId col-1">
								<h5>1234</h5>
							</div>
							<div class="titleContent col-11">
								<div class="titleTop d-flex">
									<h5 class="col-5">asdf1234</h5>
									<h5 class="col-2">VIP</h5>
									<h5 class="col-2">탈퇴 요청</h5>
									<div class="col-3 d-flex justify-content-center">
										<input type="checkbox" class="form-check-input ml-1" value="">
									</div>
								</div>
							</div>
						</div><hr class="my-1"/>
						<div class="titleBlock d-flex">
							<div class="titleId col-1">
								<h5>1234</h5>
							</div>
							<div class="titleContent col-11">
								<div class="titleTop d-flex">
									<h5 class="col-5">asdf1234</h5>
									<h5 class="col-2">VVIP</h5>
									<h5 class="col-2">탈퇴 요청</h5>
									<div class="col-3 d-flex justify-content-center">
										<input type="checkbox" class="form-check-input ml-1" value="">
									</div>
								</div>
							</div>
						</div><hr class="my-1"/>
						<div class="titleBlock d-flex">
							<div class="titleId col-1">
								<h5>1234</h5>
							</div>
							<div class="titleContent col-11">
								<div class="titleTop d-flex">
									<h5 class="col-5">asdf1234</h5>
									<h5 class="col-2">VVVIP</h5>
									<h5 class="col-2">정상</h5>
									<div class="col-3 d-flex justify-content-center">
										<input type="checkbox" class="form-check-input ml-1" value="">
									</div>
								</div>
							</div>
						</div><hr class="my-1"/>
						<div class="titleBlock d-flex">
							<div class="titleId col-1">
								<h5>1234</h5>
							</div>
							<div class="titleContent col-11">
								<div class="titleTop d-flex">
									<h5 class="col-5">asdf1234</h5>
									<h5 class="col-2">ADMIN</h5>
									<h5 class="col-2">정상</h5>
									<div class="col-3 d-flex justify-content-center">
										<input type="checkbox" class="form-check-input ml-1" value="">
									</div>
								</div>
							</div>
						</div><hr class="my-1"/>
						<div class="titleBlock d-flex">
							<div class="titleId col-1">
								<h5>1234</h5>
							</div>
							<div class="titleContent col-11">
								<div class="titleTop d-flex">
									<h5 class="col-5">asdf1234</h5>
									<h5 class="col-2">VIP</h5>
									<h5 class="col-2">정상</h5>
									<div class="col-3 d-flex justify-content-center">
										<input type="checkbox" class="form-check-input ml-1" value="">
									</div>
								</div>
							</div>
						</div><hr class="my-1"/>
					</div>
				</div>
				<div class="pager d-flex justify-content-around my-3">
					<div class="flex-fulfill"></div>
					<div class="pagingButtonSet d-flex justify-content-around col-5">
						<button type="button" class="btn btn-muted shadow" onclick="window.location.href='login'">처음으로</button>
						<button type="button" class="btn btn-muted shadow" onclick="window.location.href='login'">앞으로</button>
						<button type="button" class="btn btn-dark shadow" onclick="window.location.href='login'">1</button>
						<button type="button" class="btn btn-dark shadow" onclick="window.location.href='login'">2</button>
						<button type="button" class="btn btn-dark shadow" onclick="window.location.href='login'">3</button>
						<button type="button" class="btn btn-muted shadow" onclick="window.location.href='login'">뒤로</button>
						<button type="button" class="btn btn-muted shadow" onclick="window.location.href='login'">마지막으로</button>							
					</div>
					<div class="flex-fulfill"></div>
				</div>
			</div>
		</div>
	</body>
</html>