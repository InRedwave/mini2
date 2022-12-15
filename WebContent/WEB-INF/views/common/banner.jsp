<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<%@ include file="/WEB-INF/views/common/banner.jsp" %>
--%>


<div class="text-center jumbotron-fluid bg-lightgrey py-5">
   <div class="container bg-dark rounded-lg text-white mx-auto my-0">
      <h1 class="text-white">MY 전자</h1>
   </div>
</div>

<div id="topNavi" class="bg-dark">
   <nav class="navbar navbar-expand-lg navbar-dark wrapper">
      <div class="container-fluid">
         <a class="navbar-brand" href="#">MY 전자</a>
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarColor02">
            <ul class="navbar-nav me-auto">
               <li class="nav-item"><a class="nav-link active" onclick="window.location.href='Home'">Home</a></li>
               <li class="nav-item"><a class="nav-link" onclick="window.location.href='ReadProductList'">Products</a></li>
               <li class="nav-item"><a class="nav-link" onclick="window.location.href='ReadQnABoardList'">QnA</a></li>
               <li class="nav-item"><a class="nav-link" onclick="window.location.href='ReadReviewBoardList'">Review</a></li>
               <li class="nav-item"><a class="nav-link" onclick="window.location.href='UserInfo'">MyPage</a></li>
            </ul>
         </div>
         <form class="d-flex">
            <input class="form-control me-sm-2" type="text" placeholder="Search">
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
         </form>
         <div class="d-flex justify-content-end">
         
            <c:if test="${user_id == null}">
               <button type="button" class="btn btn-dark my-2 my-sm-0" onclick="window.location.href='Login'">Login</button>
            </c:if>
            <c:if test="${user_id != null}">
               <button type="button" class="btn btn-dark my-2 my-sm-0" onclick="window.location.href='Logout'">Logout</button>
            </c:if>
            
            <c:if test="${user_id != null}">
               <button type="submit" class="btn btn-danger my-2 my-sm-0" onclick="window.location.href='UserInfo'">${user_id}</button>
            </c:if>
            <c:if test="${user_id == null}">
               <button type="button" class="btn btn-dark my-2 my-sm-0" onclick="window.location.href='Join'">Join</button>
            </c:if>
            
            
         </div>
      </div>
   </nav>
</div>