<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Joinform</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
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

form {
	border: none;
}

#cardbox {
	border: none;
}

.container {
	width: 1200px;
}

.houseImg {
	display: block;
	width: 20px;
	height: 20px;
	margin: 0px auto;
}

.wrapper {
	width: 1440px;
	margin: 0px auto;
}
</style>
<script>
	// 정규 표현식 적용
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

	function checkEmail() {
		var loginEmail = $("#user_email");
		var emailValue = loginEmail.val();
		var emailPattern = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
		var emailTest = emailPattern.test(emailValue);
		//알파벳 대소문자, 숫자를 혼용해서 8자 이상 15자 이하
		if (emailTest) {
			loginEmail.removeClass("bg-danger");
			result = true;
		} else {
			loginEmail.addClass("bg-danger");
			result = false;
		}
	}
	function checkPhone() {
		var loginPhone = $("#user_phone");
		var phoneValue = loginPhone.val();
		var phonePattern = /^010-\d{4}-\d{4}$/;
		var phoneTest = phonePattern.test(phoneValue);
		//알파벳 대소문자, 숫자를 혼용해서 8자 이상 15자 이하
		if (phoneTest) {
			loginPhone.removeClass("bg-danger");
			result = true;
		} else {
			loginPhone.addClass("bg-danger");
			result = false;
		}
	}
	function findAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr1 = data.roadAddress; // 도로명 주소
				var addr3 = ''; // 상세 주소

				// 우편번호와 주소 정보 넣기
				document.getElementById("postcode").value = data.zonecode;
				document.getElementById("addr1").value = data.roadAddress;

				if (addr1 !== '') {
					document.getElementById("addr1").value = addr1;
				} else {
					document.getElementById("addr3").value = '';
				}
			}
		}).open();
	}

	//전체 form 입력 확인
	
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
		var mail = $("#user_email").val();
		var phone = $("#user_phone").val();
		var postcode = $("#postcode").val();

		if(id === null || pass === null || mail === null || phone === null || postcode === null) {
			console.log("실패");
			alert("입력란 확인");
		} else {
			console.log("성공");
			$("#idpass").submit();
		}
	}

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/banner.jsp"%>

	<div class="container-fluid mt-3" style="width: 1200px;">
		<div class="text-left container-fluid row">
			<span> <a onclick="window.location.href='home'" style="display: block"> <img src="/Project2_shopping/resources/images/house.png" class="houseImg" />
			</a>
			</span>
			<div class="ml-2">
				> <a onclick="window.location.href='reviewBoardList'">Join</a>
			</div>

		</div>
		<hr class="text-center" style="height: 0.1px; background-color: lightgrey">
	</div>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div id="cardbox" class="card">

					<!--card body------------------------------------------------------  -->
					<div class="card-body col-sm-12">
						<div class="card border-dark">
							<div class="card-header bg-dark py-2">
								<h3 class="text-white text-center">Join</h3>
							</div>

							<div class="card-body">
								<form id="idpass" method="post" novalidate>
									<div class="form-group">
										<label for="uname">Name</label> 
										<input type="text" class="form-control" id="user_name" name="user_name" placeholder="홍길동" />
									</div>

									<div class="form-group">
										<label for="uid">ID</label> 
										<input type="text" class="form-control" id="user_id" name="user_id" onfocusout="checkID()" placeholder="아이디를 입력해주세요." /> <small id="uidHelp" class="form-text text-muted">알파벳과 숫자 혼용, 6자 이상 10장 이하</small>
									</div>

									<div class="form-group">
										<label for="password">Password</label> 
										<input type="password" class="form-control" id="user_password" name="user_password" onfocusout="checkPWD()" placeholder="비밀번호를 입력해주세요." /> <small id="passwordHelp" class="form-text text-muted">알파벳과 숫자 혼용, 8자 이상 15장 이하</small>
									</div>

									<div class="form-group">
										<label for="email">Email</label> 
										<input type="email" class="form-control" id="user_email" name="user_email" onfocusout="checkEmail()" placeholder="이메일을 입력해주세요." /> <small id="emailHelp" class="form-text text-muted">예시) oti123@oticompany.com</small>
									</div>

									<div class="form-group">
										<label for="phone">Phone</label> 
										<input type="text" class="form-control" id="user_phone" name="user_phone" onfocusout="checkPhone()" placeholder="전화번호를 입력해주세요." /> <small id="phoneHelp" class="form-text text-muted">예시) 010-1234-5678</small>
									</div>

									<div class="form-group">
										<label for="birth">Birth</label> 
										<input type="date" class="form-control" id="user_birthday" name="user_birthday" />
									</div>

									<div class="form-group">
										<label for="address">Address</label><br /> 
										<input type="text" id="postcode" name="postcode" placeholder="우편번호">
										<button type="button" class="btn_address" id="address" name="address" onclick="findAddress()">우편번호</button>
										<br /> <input type="text" id="addr1" name="addr1" placeholder="도로명 주소" readonly> <input type="text" id="addr3" name="addr3" placeholder="상세 주소">
									</div>

									<div class="text-center">
										<input type="button" class="btn btn-primary" style="border-radius: 20px" value="Join" onclick="submitInfo()" /> <input type="reset" class="btn btn-primary" style="border-radius: 20px" value="Reset" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>