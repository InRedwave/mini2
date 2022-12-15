<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Password</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
   font-weight: 300px;
}

/* https://www.w3schools.com/cssref/tryit.php?filename=trycss3_justify-content */
#cardbox {
   border: 1px solid black;
}

.wrapper {
   width: 1440px;
   margin: 0px auto;
}

.wrapper>* {
   width: 90%;
   margin: 0px auto;
}

#bg-gradient-primary>.container {
   width: 500px;
}

.modal-bg {
   display: none;
   width: 100%;
   height: 100%;
   position: fixed;
   top: 0;
   left: 0;
   right: 0;
   background: rgba(0, 0, 0, 0.6);
   z-index: 0;
}

.modal-wrap {
   display: none;
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   width: 400px;
   height: 150px;
   background: #fff;
   z-index: 1;
}
</style>

<script>
   function isEmpty(str){
      
      if(typeof str == "undefined" || str == null || str == "")
         return true;
      else
         return false ;
   }

   function checkID() {
      typeof 
      

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

   function checkPhone() {
      
      var loginPhone = $("#user_phone");
      var phoneValue = loginPhone.val();
      var phonePattern = /^010-\d{4}-\d{4}$/;
      var phoneTest = phonePattern.test(phoneValue);
      if (phoneTest) {
         loginPhone.removeClass("bg-danger");
         result = true;
      } else {
         loginPhone.addClass("bg-danger");
         result = false;
      }
   }

   function checkAll() {
      if (!checkID()) {
         return false;
      }
      if (!checkPhone()) {
         return false;
      }
      return true;
   }

   function findPassword() {
      
      if(checkAll()){
         $("#findpassword").submit();
      } else {
         
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
                        <b>비밀번호 찾기</b>
                     </div>
                  </div>

                  <!--card body------------------------------------------------------  -->
                  <div class="card-body col-sm-12 col-md-12">



                     <form method="post" id="findpassword">
                        <div id="userId" class="form-group">
                           <input type="text" class="form-control form-control-user" id="user_id" name="user_id" onfocusout="checkID()" placeholder="input your ID">
                        </div>
                        <div id="userId" class="form-group">
                           <input type="text" class="form-control form-control-user" id="user_phone" name="user_phone" onfocusout="checkPhone()" placeholder="input your phone number">
                        </div>
                        <button  class="btn btn-primary btn-user btn-block" onclick="findPassword()"> FindPassword </button>
                        <hr />
                        <a href="join" class="btn btn-danger btn-user btn-block">회원가입</a>
                        <hr />
                        <div id="pass"> 비밀번호는 : ${password.user_password} 입니다.</div>
                     </form>
                     
                     
                     
                     
                  </div>

               </div>
            </div>
         </div>
      </div>
   </div>

</body>



</html>