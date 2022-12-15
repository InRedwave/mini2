<%@ page contentType="text/html; charset=UTF-8"%>
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

#cardbox {
	text-align: center;
	border: 1px solid black;
}

#bg-gradient-primary>.container {
	width: 500px;
}
</style>
<script>
	function checkID() {

		var loginId = $("#user_id");
		var idValue = loginId.val();
		var idPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,10}$/;
		var idTest = idPattern.test(idValue);
		//알파벳 대소문자, 숫자를 혼용해서 6자 이상 10자 이하
		if (idTest) {
			loginId.removeClass("bg-danger");
			result = true;
		} else {
			loginId.addClass("bg-danger");
			result = false;
		}
	}

	function checkPWD() {
		var loginPwd = $("#user_password");
		var pwdValue = loginPwd.val();
		var pwdPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
		var pwdTest = pwdPattern.test(pwdValue);
		//알파벳 대소문자, 숫자를 혼용해서 8자 이상 15자 이하
		if (pwdTest) {
			loginPwd.removeClass("bg-danger");
			result = true;
		} else {
			loginPwd.addClass("bg-danger");
			result = false;
		}
	}

	function isEmpty(str){
		
		if(typeof str == "undefined" || str == null || str == "")
			return true;
		else
			return false ;
	}
	
	//데이터 전송
	 function submitInfo() {
		var id = $("#user_id").val();
		var pass = $("#user_password").val();

		if(isEmpty(id) || isEmpty(pass)  ){
			console.log("실패");
			alert("입력란 확인");
		} else {
			console.log("성공");
			$("#idpass").submit();
		}
	} 
	
	
	
</script>


</head>
<body>
	<%@ include file="/WEB-INF/views/common/banner.jsp"%>

	<div id="bg-gradient-primary" class="mt-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10 col-lg-12 col-md-9">
					<div id="cardbox" class="card">
						<div class="card-header">
							<div class="text-center">
								<b>로그인</b>
							</div>
						</div>

						<!--card body------------------------------------------------------  -->
						<div class="card-body col-sm-12 col-md-12">


							<form id="idpass" method="post" novalidate>

								<div id="userId" class="form-group">
									<input type="text" class="form-control form-control-user" id="user_id" name="user_id" onfocusout="checkID()" placeholder="ID...">
								</div>

								<div id="userPassword" class="form-group">
									<input type="text" class="form-control form-control-password" id="user_password" name="user_password" onfocusout="checkPWD()" placeholder="Password...">
								</div>

								<div class="form-group">
									<input type="checkbox" class="checkbox" id="customcheck" placeholder="Password..." id="check"> <label class="control-laber" for="check"> ID/PWD 저장 </label>

								</div>
								<button type="button" class="btn btn-primary btn-user btn-block" onclick = "submitInfo()">Login</button>

								<hr />
								
								<a href="FindId" class="btn btn-danger btn-user btn-block"> ID 찾기</a> 

								
								<a href="FindPassword" class="btn btn-primary btn-user btn-block"> Find Password</a>

								<hr />

								<div id="userinfo">
									<div class="text-left">
										<a href="FindPassword"> </a>
									</div>

									<div class="text-left">
										<a href="Join"> 회원가입 </a>
									</div>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>