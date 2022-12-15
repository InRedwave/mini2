<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>리뷰 자세히 보기</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">			
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>	
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
			
			.checked {
			  color: orange;
			}
			
			.wrapper {
				width: 1440px;
				margin: 0px auto;
			}
			
			a {
				color:black;
			}
			
			#readReview > * {
				width: 95%;
				margin: 1px auto;
			}
			
			#reviewComment {
				margin: 2px;
			}
			
		    .houseImg {
		         	display: block;
		         	width : 20px;
					height : 20px;
					margin: 0px auto;
		    }	         
		</style>
		<script>
		function goUpdate(){
			location.href = "${pageContext.request.contextPath}/UpdateReview?reviewNo=" + ${reviewBoard.review_board_id};
		}
		
		function goDelete(){
			$('#review_content').attr("method","get")
			$('#review_content').attr("action","DeleteReview").submit();
		}
		
		</script>
	</head>
	<body>	
		<%@ include file="/WEB-INF/views/common/banner.jsp" %>
		
		<div class="container-fluid mt-3" style="width: 1440px;">
			<div class="text-left container-fluid row">
				<span>
					<a onclick="window.location.href='home'" style="display:block">
					<img src="/Project2_shopping/resources/images/house.png" class="houseImg"/>
					</a>
					</span>
				<div class="ml-2">
					> <a onclick="window.location.href='reviewBoardList'">Review</a>
				</div>			
			</div>
			<hr class="text-center" style="height: 0.1px; background-color: lightgrey">
		</div>				
		
		<div class="d-flex justify-content-center mt-3" style="width:1440px; margin:0px auto;">
			<div id="sidebar" class="col-sm-2 col-md-2 d-none d-xl-block justify-content-center">
				<%@ include file="/WEB-INF/views/common/userInfo.jsp" %>	
	           
				<h3 class="text-left mt-4 mb-4">게시판 목록</h3>	
				<hr style="height: 0.1px; background-color: grey"/>	
					<div class="d-flex flex-column">
						<div class="d-flex flex-column my-1">
							<a class="text-left ml-1" onclick="window.location.href='QnABoardList'" style="font-size: large;">QnA</a>												
					</div>					
						<div class="d-flex flex-column my-1">
							<a class="text-left ml-1" onclick="window.location.href='reviewBoardList'" style="font-size: large;">Review</a>						
						</div>	
					</div>
			</div>			
			
				<div id="readReview" class="d-flex flex-column col-10 ml-0">
				<form method="post" id="review_content">			
					<div>
						<div class="d-flex my-2">
							<h4 class="text-left text-muted mr-3 mt-2">no.${reviewBoard.review_board_id }</h4>
							<input name="review_no" value="${reviewBoard.review_board_id }" style="display: none" />
							<h2 >${reviewBoard.review_board_title}</h2>					
						</div>
			 		</div>	
				 	<hr style="height: 0.1px; background-color: grey"/>		
						<div class="d-flex my-2">
							<h5 class="mr-1">작성일 |</h5>
							<h5 class="ml-1 mr-2">${reviewBoard.review_board_date}</h5>					
							<h5 class="mx-1">작성자 |</h5>					
							<h5 class="mx-1">${reviewBoard.users_id}</h5>								
						</div>	
						<c:if test="${reviewBoard.users_id == user_id}">
						<div class="d-flex justify-content-end my-2 ">
							<button type="button"  class="btn btn-primary btn-sm mr-1" onclick="goUpdate()" style="border-radius:30px">수정</button>	
							<button type="button" class="btn btn-primary btn-sm" onclick="goDelete()" style="border-radius:30px">삭제</button>	
						</div>
						</c:if>
						<hr/>	
						<h6>${reviewBoard.product_id}</h6>
					 	<!--  	
						<div class="d-flex mt-2">
							
						
							<h6 class="text-left text-muted mr-1">냉장고</h6>
							<h6 class="text-left text-muted mr-1">></h6>
							<h6 class="text-left text-muted">양문형 냉장고</h6>
							
						</div>	-->
						<div class="d-flex justify-content-end">					
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<h5 class="text-left ml-1">${reviewBoard.review_board_reviewpoint}</h5>
						</div>					
					<div class="d-flex flex-column py-10" style="height:300px;">
						<h3 class="mt-1"> ${reviewBoard.review_board_content} </h3>			
					</div>
					<hr style="height: 0.1px; background-color: grey"/>
					</form>
					
					<div id=commentList class="d-flex flex-column mt-2">
						<h4 class="mb-3">Comment</h4>
						<!-- 
						<c:if test="${review.review_board_id}">
							<form method="post" action="ReadReview?id=${review.review_board_id}">
								<div class="form-group">
									<input type="text" class="form-control" id="comment" name="comment">
								</div>
							</form>
						</c:if>
						 -->
						<form method="post" action="ReadReview?id=${review.review_board_id}">
							<div class="form-group">
								<input type="text" class="form-control" id="comment" name="comment">
							</div>
						</form>
						<c:forEach var="comment" items="${commentList}">
						<div id="reviewComment" class="d-flex jutify-content-between">
							<div class="d-flex col-9">
								<h5>${comment.comment}</h5>
							</div>
							<div class="d-flex text-muted jutify-content-end">
								<h6 class="mx-1">작성일 |</h6>
								<h6 class="mx-1">${comment.date}</h6>					
								<h6 class="mx-1">작성자 |</h6>					
								<h6 class="mx-1">${comment.user}</h6>		
							</div>						
						</div>	
						</c:forEach>
					</div>		
				</div>
		
		</div>		
	</body>
</html>


