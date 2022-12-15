<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="d-flex flex-column rounded-lg" style="background-color: #F5F5F5;">
	<div class="mx-3 mt-3">
		<c:if test="${user_id != null}">
	    	<h4>${user_id}</h4>
	    </c:if>
	    <c:if test="${user_id == null}">
	    	<h4>비회원</h4>
	    </c:if>
	</div>
	<div class="d-flex justify-content-start ml-3">
	    <h6>
	    	<c:if test="${user_id != null}">
	    		<span class="align-self-start badge badge-primary">${user_level}</span>
	    	</c:if>
	    	<c:if test="${user_id == null}">
	    		<span class="align-self-start badge badge-primary">비회원</span>
	    	</c:if>
		</h6>
		<h6>
			<c:if test="${user_id != null}">
	    		<span class="align-self-start badge badge-info">${user_point}P</span>
	    	</c:if>
	    </h6>
	</div>
	<div class="d-flex flex-column mx-3 my-3">
		<c:if test="${user_id != null}">
    	<a href="ReadOrderList">최근주문내역</a>
    	<a href="ReadCart">장바구니</a>
    	<a href="ReadReviewBoardList">내가 쓴 리뷰</a>
    	<a href="ReadQnABoardList">내 문의내역</a>
	    </c:if>
	</div>
</div>