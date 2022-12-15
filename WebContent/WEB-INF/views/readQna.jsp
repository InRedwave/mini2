<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<script>
	function upQ() {
		$("#readForm").attr("action","UpdateQna").submit();
	}
	
	function delQ(){
		$("#readForm").attr("action","DeleteQna").submit();
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

.checked {
	color: orange;
}

.wrapper {
	width: 1440px;
	margin: 0px auto;
}

a {
	color: black;
}

#readQna>* {
	width: 95%;
	margin: 1px auto;
}

#QnaAnswer {
	margin: 2px;
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

	<div class="container-fluid mt-3" style="width: 1440px;">
		<div class="text-left container-fluid row">
			<span> <a onclick="window.location.href='home'"
				style="display: block"> <img
					src="/Project2_shopping/resources/images/house.png"
					class="houseImg" />
			</a>
			</span>
			<div class="ml-2">
				> <a onclick="window.location.href='QnABoardList'">QnA</a>
			</div>
		</div>
		<hr class="text-center"
			style="height: 0.1px; background-color: lightgrey">
	</div>

	<div class="d-flex justify-content-center mt-3"
		style="width: 1440px; margin: 0px auto;">
		<div id="sidebar"
			class="col-sm-2 col-md-2 d-none d-xl-block justify-content-center">
			<%@ include file="/WEB-INF/views/common/userInfo.jsp"%>

			<h3 class="text-left my-3">게시판 목록</h3>
			<div class="d-flex flex-column">
				<div class="d-flex flex-column my-2">
					<a class="text-left " data-toggle="collapse" href=".collapseOne"
						style="font-size: large;">QnA 게시판</a>
					<hr />
					<div class="d-flex flex-column">
						<div class="collapse collapseOne text-left"
							onclick="window.location.href='ReadQnABoardList'">게시판 목록보기</div>
						<div class="collapse collapseOne text-left"
							onclick="window.location.href='CreateQna'">문의글 작성하기</div>

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
		
		<div id="readQna" class="d-flex flex-column col-10 ml-0">
		<!-- get 방식으로 UpdateQnaController call-->
		<form id="readForm" method="get">
			<div>
				<div class="d-flex my-2">
					<h4 id="qNoId" class="text-left text-muted mr-3 mt-2">no.${readQna.qna_board_id}</h4>
					<input type="hidden" name="qna_category_id" value="${readQna.qna_category_id}"/>
					<input type="hidden" name="qna_board_content" value="${readQna.qna_board_content}"/>
					<input type="hidden" name="qna_board_title" value="${readQna.qna_board_title}"/>
					<input name="qna_board_id" value="${readQna.qna_board_id}" style="display:none"/>
					<h2>${readQna.qna_board_title}</h2>
				</div>
			</div>
			<hr style="height: 0.1px; background-color: grey" />
			<div class="d-flex my-2">
				<h5 class="mr-1">작성일 |</h5>
				<h5 class="ml-1 mr-2">${readQna.qna_board_date}</h5>
				<h5 class="mx-1">작성자 |</h5>
				<h5 class="mx-1">${readQna.users_id}</h5>
			</div>
			<div class="d-flex justify-content-end my-2 ">
				<c:if test="${readQna.users_id == userId}">
					<button type="button" class="btn btn-primary btn-sm mr-1"
						style="border-radius: 30px"
						onclick="upQ()" >수정</button>
					<button type="button" class="btn btn-primary btn-sm"
						style="border-radius: 30px"
						onclick="delQ()">삭제</button>
				</c:if>
			</div>
			<hr />
			<div class="d-flex mt-2">
				<h6 class="text-left text-muted">${readQna.qna_category_name}</h6>
			</div>
			<div class="d-flex flex-column py-10" style="height: 300px;">
				<h3 class="mt-2">${readQna.qna_board_content}</h3>
			</div>
			<hr style="height: 0.1px; background-color: grey" />

			<div class="d-flex flex-column mt-2">
				<h4>Answer</h4>
				<div id="QnaAnswer" class="d-flex text-muted align-self-end">
					<c:choose>
						<c:when test="${readQna.qna_board_answer != '답변이 등록되지 않았습니다.'}">
							<h6 class="mr-1">작성일 |</h6>
							<h6 class="ml-1 mr-2">${readQna.qna_board_date}</h6>
							<h6 class="mx-1">작성자 |</h6>
							<h6 class="mx-1">관리자</h6>
						</c:when>
						<c:otherwise>
							<h6 class="mr-1">작성일 |</h6>
							<h6 class="ml-1 mr-4"></h6>
							<h6 class="mx-1">작성자 |</h6>
							<h6 class="ml-1 mr-4"></h6>
						</c:otherwise>
					</c:choose>
				</div>
				<div id="QnaAnswer" class="d-flex flex-column">
					<h5>${readQna.qna_board_answer}</h5>
				</div>
			</div>
			</form> 
		</div>
		
	</div>
</body>
</html>


