<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MY전자</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
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

            .wrapper {
                width: 1440px;
                margin: 0px auto;
            }
			
			img {
				display: block;
				margin: 0px auto;
			}

			a {
				color : black;
			}
            
           	.carousel-inner img {
		    width: 1440px;
		    height: 600px;
		  	}
		  
		  	.checked {
			  color: orange;
			}
			
			div > .banner{
			  width: 80px;
			  height: 80px;
			  font-size:100%;
			  position: relative;
			  animation: mymove infinite;
			  animation-duration: 3s;
			}
			
			@keyframes mymove {
			  from {left: 0px;}
			  to {left: 350px;}
			}
		</style>
		
	</head>
	<body>
		<div class="text-center jumbotron-fluid bg-lightgrey my-0" style="height:350px;">
			<div class="row">
			<div class="banner justify-content-start d-flex">
				<div class="row d-flex">
				  	<h1 class="text-warning">Open</h1>
				   <h1 class="text-warning">Think</h1>
				   <h1 class="text-warning">Innovation</h1>
				</div>
		    </div>
		
			<div class="row d-flex justify-content-center col-sm-12">			
				<h1 class="text-dark grey" style="font-size:80px">MY 전자</h1>							
			</div>
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
		<br/>
	 
	 <div id="demo" class="carousel slide mb-4" data-ride="carousel">
		  <!-- Indicators -->
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active"></li>
		    <li data-target="#demo" data-slide-to="1"></li>
		    <li data-target="#demo" data-slide-to="2"></li>
		    <li data-target="#demo" data-slide-to="3"></li>
		  </ul>
  
		  <!-- The slideshow -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="/Project2_shopping/resources/images/${pathList0}" alt="TV" width="1100" height="500">
		    </div>
		    <div class="carousel-item">
		      <img src="/Project2_shopping/resources/images/${pathList1}" alt="Watch" width="1100" height="500">
		    </div>
		    <div class="carousel-item">
		      <img src="/Project2_shopping/resources/images/${pathList2}" alt="Refrigerator" width="1100" height="500">
		    </div><div class="carousel-item">
		      <img src="/Project2_shopping/resources/images/${pathList3}" alt="Mobile" width="1100" height="500">
		    </div>
		  </div>
		  
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#demo" data-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </a>
		  <a class="carousel-control-next" href="#demo" data-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </a>
		</div>
		
		<div id="contents" class="wrapper">
			<div class="row">
			<div class="d-flex col-sm-3">
			<div class="list-group d-flex border-secondary">
			  <div class="list-group-item border-dark bg-dark text-white">Notice</div>
			  <h6 class="list-group-item">[신제품 출시] MY flip 메종 마르지엘라 에디션</h6>
			  <h6 class="list-group-item">[매장 상담 예약] 맞춤 상담을 예약하고 MY전자가 제안하는 라이프스타일을 직접 체험해보세요.</h6>
			  <h6 class="list-group-item">[이벤트] OTI x MY전자 콜라보 상품 예약하고 다양한 이벤트에 참여해보세요.</h6>
			  <h6 class="list-group-item">[공지] 2022 누적 판매 1위 MY전자</h6>
			</div>				
			</div>
			
			<div class="card border-secondary d-flex mb-4 col-sm-5 px-0" style="max-width: 60rem;">				
			  <div class="card-header bg-dark text-white">오시는 길</div>
			  <div class="card-body">
			    <h4 class="card-title">MY전자</h4>
			    <a href="https://goo.gl/maps/EZCKLvqxrKsis2Dy8"><img src="/Project2_shopping/resources/images/${pathList4}" alt="map" style="width:550px; height:250px;"></a><br/>
			    <p class="card-text">서울시 종로구 창경궁로 254 4층 MY전자</p>
			  </div>
			</div>
			
			<div class="row col-sm-4 d-flex flex-column ml-1">
			<div class="card text-white bg-dark d-flex mb-3">		
			  <div class="card-body">
			    <h4 class="card-title">고객센터</h4>
			    <p class="card-text">운영시간 </p>
			    <p class="card-text ml-1">월-금 09:00-18:00</p>
			    <p class="card-text ml-1">토 09:00-14:00 / (일요일 휴무)</p>
			    <p class="card-text">TEL 02) 123-4567</p>			    
			  </div>
			</div>
			   
			   <div class="card border-secondary bg-lightgrey mb-4" >
					<div class="card-body">
					  	<h4 class="card-title">협력사</h4>
					  	<div class="row text-align: center"> 
						  	<img src="/Project2_shopping/resources/images/${pathList5}" style="width:100px; height:100px">
							<img src="/Project2_shopping/resources/images/${pathList6}" style="width:100px; height:120px;">
						</div>
					</div>				
			   </div>		 
			</div>
			</div>
		</div>
	</body>
</html>