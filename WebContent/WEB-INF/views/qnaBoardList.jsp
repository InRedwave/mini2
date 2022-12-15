<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src=https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js></script>
<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script>

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
</head>
<body>
	<%@ include file="/WEB-INF/views/common/banner.jsp"%>

	<div id="bottomViewPort" class="wrapper d-flex mt-3">
		<div id="sidebar" class="col-sm-2 col-md-2 d-none d-xl-block">
			<%@ include file="/WEB-INF/views/common/userInfo.jsp" %>

			<h3 class="text-left my-3">게시판 목록</h3>
			<div class="d-flex flex-column">
				<div class="d-flex flex-column my-2">
					<a class="text-left " data-toggle="collapse" href=".collapseOne"
						style="font-size: large;">QnA 게시판</a>
					<hr />
					<div class="d-flex flex-column">
						<div class="collapse collapseOne text-left"
							onclick="window.location.href='ReadQnABoardList'">게시판 목록보기</div>
						<c:choose>
							<c:when test="${user_id!=null}">
								<div class="collapse collapseOne text-left"
									onclick="window.location.href='CreateQna'">문의글 작성하기</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>

				</div>
				<div class="d-flex flex-column my-2">
					<a class="text-left" data-toggle="collapse" href=".collapseOne"
						style="font-size: large;">Review 게시판</a>
					<hr />
					<div class="d-flex flex-column">
						<div class="collapse collapseOne text-left"
							onclick="window.location.href='ReadReviewBoardList'">게시판
							목록보기</div>
						<div class="collapse collapseOne text-left"
							onclick="window.location.href='CreateReview'">리뷰 작성하기</div>
					</div>
				</div>

			</div>
		</div>
		<div class="d-flex flex-column col-sm-10 col-md-10">
			<div id="listType" class="mt-4">
				<h1>문의 목록</h1>
			</div>
			<hr class="mb-4" />
			<div id="notice">
				<h2>검색 조건을 선택하세요</h2>
			</div>
			<hr class="mb-4" />
			<div id="selectCondition" class="d-flex">
				<div
					class="conditionSet d-flex justify-content-start align-items-center flex-fill">
					<h5 class="col-5 text-center">문의 유형</h5>
					<select class="col-6 form-control">
						<option value="1">상품</option>
						<option value="2">주문</option>
						<option value="3">배송</option>
						<option value="4">기타</option>
					</select>
				</div>
				<div
					class="conditionSet d-flex justify-content-start align-items-center flex-fill">
					<h5 class="col-8 text-center">리스트 최대치</h5>
					<select class="col-3 form-control">
						<option>5</option>
						<option>10</option>
						<option>15</option>
					</select>
				</div>
				<div class="conditionSet d-flex align-items-center col-3 flex-fill">
					<div>
						<nav class="navbar navbar-expand-sm nav-bar-gray">
							<ul class="navbar-nav">
								<li class="nav-item"><input type="text"
									class="form-control" value="검색할 내용 입력하기 "></li>
								<li class="nav-item"><button type="button"
										class="btn btn-dark shadow">Search</button></li>
							</ul>
						</nav>
					</div>

				</div>
				<div
					class="conditionSet d-flex justify-content-start align-items-center flex-fill">
					<h5 class="col-6 text-center">답변 상태</h5>
					<select class="col-5 form-control">
						<option>답변 대기</option>
						<option>답변 완료</option>
					</select>
				</div>
			</div>
			<hr class="my-3" />
			<div class="titleList d-flex flex-column">
				<div class="listInfo my-1">
					<h3>총 ${pager.totalRows}개의 게시글이 있습니다</h3>
				</div>
				<hr class="my-2" />
				<div class="titleInfo">
					<div class="d-flex">
						<div class="titleIdInfo col-1">
							<h5>글번호</h5>
						</div>
						<div class="titleContentInfo col-11">
							<div class="d-flex">
								<h5 class="col-4">제목</h5>
								<h5 class="col-2">글쓴이</h5>
								<h5 class="col-2">날짜</h5>
								<h5 class="col-2">문의 유형</h5>
								<h5 class="col-2">답변 상태</h5>
							</div>
						</div>
					</div>
				</div>
				<hr class="my-2" />
				<div class="titles d-flex flex-column">

					<c:forEach var="qnaBoardList" items="${qnaBoardList}"
						varStatus="status">
						<div class="titleBlock d-flex">
							<div class="titleId col-1">
								<h5>${qnaBoardList.qna_board_id}</h5>
							</div>
							<div class="titleContent col-11 py-1">
								<div class="titleTop d-flex">
									<h5 class="col-4">
										<a href="ReadQna?id=${qnaBoardList.qna_board_id}">${qnaBoardList.qna_board_title}</a>
									</h5>
									<h5 class="col-2">${qnaBoardList.users_id}</h5>
									<h5 class="col-2">${qnaBoardList.qna_board_date}</h5>
									<h5 class="col-2">${qnaBoardList.qna_category_name}</h5>
									<h5 class="col-2">${qnaBoardList.qna_board_answer}</h5>
								</div>
							</div>
						</div>
						<hr class="my-1" />
					</c:forEach>

				</div>
			</div>
			<c:choose>
				<c:when test="${user_id!=null}">
					<div class="d-flex justify-content-end mt-2">
						<a href="CreateQna" class="btn btn-warning">문의글 작성</a>
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<div class="pager d-flex justify-content-around my-3">
				<div class="flex-fulfill"></div>
				<div class="pagingButtonSet d-flex justify-content-center col-5">

					<a href="ReadQnABoardList?pageNo=1" class="btn btn-muted shadow">처음</a>
					<c:if test="${pager.groupNo > 1 }">
						<a href="ReadQnABoardList?pageNo=${pager.startPageNo - 1}"
							class="btn btn-muted shadow">이전</a>
					</c:if>

					<c:forEach var="i" begin="${pager.startPageNo}"
						end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a href="ReadQnABoardList?pageNo=${i}"
								class="btn btn-dark shadow">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a href="ReadQnABoardList?pageNo=${i}"
								class="btn btn-warning shadowm">${i}</a>
						</c:if>
					</c:forEach>

					<c:if test="${pager.groupNo < pager.totalGroupNo}">
						<a href="ReadQnABoardList?pageNo=${pager.endPageNo + 1}"
							class="btn btn-muted shadow">다음</a>
					</c:if>
					<a href="ReadQnABoardList?pageNo=${pager.totalPageNo}"
						class="btn btn-muted shadow">맨끝</a>

				</div>
				<div class="flex-fulfill"></div>
			</div>
		</div>
	</div>
</body>
</html>