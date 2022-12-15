<%@ page contentType="text/html; charset=UTF-8"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

.wrapper>* {
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
	color: black;
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
<script>
	var chk_arr = [];
	
	function refreshList(){
		window.location.reload();
	}
	
	
	function deleteUser() {
		 $("input[name='userCheck']:checked").each(function(){
			 var checkval = $(this).val();
			 chk_arr.push(checkval)
		 })
		 console.log(chk_arr.length);
		 
		 
		$.ajax({
			url : "DeleteUser",
			type : "post",
			traditional: true,
			async : false,
			data : {chk_arr : JSON.stringify(chk_arr)},
			success : function() {
				//document.querySelector("#title").innerHTML = "총 ${pager.totalRows}명의 유저가 있습니다";
				location.href="Admin"
			}
		});
		//refreshList();
	}
	function checkAll(){
		if( $('#checkAll').is(':checked')){
			$("input[name=userCheck]").prop("checked", true);
		} else {
			$("input[name=userCheck]").prop("checked", false);
		}
	}
	
	
	
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/banner.jsp"%>

	<div id="bottomViewPort" class="wrapper d-flex mt-3">
		<div id="sidebar" class="col-sm-2 col-md-2 d-none d-xl-block">
			<%@ include file="/WEB-INF/views/common/userInfo.jsp" %>

			<h3 class="text-left my-3">게시판 목록</h3>

			<div class="d-flex flex-column">
				<div class="d-flex flex-column my-2">
					<a class="text-left" data-toggle="collapse" href=".collapseOne" style="font-size: x-large;">관리 목록</a>
					<hr />
					<div class="d-flex flex-column">
						<div class="collapse collapseOne text-left" onclick="window.location.href='Admin'" style="cursor:pointer">
																	유저 목록</div>
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
			</div>
			<hr class="mb-4" />
			<div id="notice">
				<h2>검색 조건을 선택하세요</h2>
			</div>
			<hr class="mb-4" />
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
					<button name = "checkbox" type="button" class="btn btn-warning shadow" onclick = "deleteUser()">탈퇴 처리</button>
				</div>
			</div>
			<hr class="my-3" />
			<div class="titleList d-flex flex-column">
				<div class="listInfo">
					<div class = "row">
						<div class ="col-10">
							<h3 id = title>총 ${pager.totalRows}명의 유저가 있습니다</h3>
						</div>
						 <div class = "col-2" id = "selectAll">
							<h5>전체 선택<input id="checkAll" name ="checkAll" type="checkbox" class="form-check-input ml-1" onclick="checkAll()" value=""></h5>
						</div> 
					</div>
				</div>

				<hr class="my-2" />
				<div class="titleInfo">
					<div class="d-flex">
						<div class="titleIdInfo col-1">
							<h5>No.</h5>
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
				</div>
				
				
				<div class="titles d-flex flex-column">

					<c:forEach var="userList" items="${userList}" varStatus = "status">
						<hr class="my-1" />
						<div class="titleBlock d-flex">
							<div class="titleId col-1">
								<!--DTO birthday에 rownum 넣음-->
								<h5>${userList.user_birthday}</h5>
							</div>
							<div class="titleContent col-11">
								<div class="titleTop d-flex">
									<h5 class="col-5">${userList.user_id}</h5>
									<h5 class="col-2">
									
									
									<c:choose>
										<c:when test="${userList.user_level == '1'}">VIP</c:when>
										<c:when test="${userList.user_level == '2'}">VVIP</c:when>
										<c:when test="${userList.user_level == '99'}">ADMIN</c:when>
									</c:choose>
									</h5>
									<h5 class="col-2">정상</h5>
									<div class="col-3 d-flex justify-content-center">
										<input id="userCheck" name = "userCheck" type="checkbox" class="form-check-input ml-1" value="${userList.user_id}">
									</div>
								</div>
							</div>
						</div>
						
					</c:forEach>

				</div>
			</div>
			
			
			<div class="pager d-flex justify-content-center my-3">
				<div class="flex-fulfill"></div>
				<div class="pagingButtonSet d-flex justify-content-center col-5">
					<c:if test="${pager.pageNo > 1}">
						<a href="Admin?pageNo=1" type="button" class="btn btn-muted shadow">처음으로</a>
					</c:if>
					
					<c:if test = "${pager.groupNo > 1}">
						<a href="Admin?pageNo=${pager.startPageNo-1}" type="button" class="btn btn-muted shadow">앞으로</a>
					</c:if>
					
					<c:forEach var="i" begin="${pager.startPageNo}" end ="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a href="Admin?pageNo=${i}" type="button" class="btn btn-dark shadow">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a href="Admin?pageNo=${i}" type="button" class="btn btn-white shadow">${i}</a>
						</c:if>
					</c:forEach>
					
					<c:if test = "${pager.groupNo < pager.totalGroupNo }">
						<a href="Admin?pageNo=${pager.endPageNo+1}" type="button" class="btn btn-muted shadow">뒤로</a>
					</c:if>
					<a href="Admin?pageNo=${pager.totalPageNo}"type="button" class="btn btn-muted shadow">마지막으로</a>
				</div>
				<div class="flex-fulfill"></div>
			</div>
			
			
			
		</div>
	</div>
</body>
</html>