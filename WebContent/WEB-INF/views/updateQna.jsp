<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Qna수정 페이지</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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

         .btn-lg {
            font-size: 14px;
         }
            
         .round {
            width: 150px;
            border-radius: 24px;
         }

            .wrapper {
                width: 1440px;
                margin: 0px auto;
            }

            .wrapperChild {
                width: 95%;
                margin: 0px auto;
            }
            
            #qna_content{
               width: 80%;
            }
         
         img {
            display: block;
            margin: 0px auto;
         }
         .checked {
              color: orange;
         }
         .card {
            border: none;
         }
         a:link {
              color: black;
         }
         a:visited {
              color: black;
         }
      </style>
   </head>
   <body>
      <%@ include file="/WEB-INF/views/common/banner.jsp" %>
   
      <hr style="0.7px solid lightgray"/>
      
<!-------------------------------    분류    --------------------------->
      <div id="qna_top" class="wrapper" style="width: 80%">
         <div class="wrapperCild py-2">
            <div class="text-left row container-fluid">
               <div style="width: 40px">
                  <a href="${pageContext.request.contextPath}/home" style="display: block"><img src="/Project2_shopping/resources/images/house.png" width="20px" height="20px"/></a>
               </div>
               <div>
                  > <a href="#">QNA 작성</a>
               </div>
            </div>
            
         </div>   
      </div>
      <hr style="0.7px solid lightgray"/>
      
      <div id="qna_content" class="wrapper">
         <div class="mt-4" style="border-bottom: 1px solid black">
            <h2>QNA 작성하기</h2>
         </div>
         
<!-------------------------------   작성하기  본문   --------------------------->
		<!-- post 방식으로 UpdateQnaController call-->
         <form method="post" action="UpdateQna" style="border: 0">
            <div class="wrapperChild">
               <div class="card cotainer-fluid column">
                     <div class="row my-4">
                        <div class="col-3">
                           <h5>글쓴이 </h5>
                        </div>
                        <div class="col-9">
                           <div id="qna_id">
                              <!-- DB에서 값 받아오기 -->
                              <h5>${userId}</h5>
                           </div>
                        </div>
                     </div>
                     <div class="row my-4">
                        <div class="col-3">
                           <h5>문의 유형</h5>
                        </div>
                        <div class="col-9">
                           <div id="qna_category">
                              <!-- DBd에서 값 얻어오기 -->
                                <select class="form-control" id="qna_category" name="qna_category_id">
                                   <option value="1">상품</option>
                                   <option value="2">주문</option>
                                   <option value="3">배송</option>
                                   <option value="4">기타</option>
                                </select>   
                           </div>
                        </div>
                     </div>
                     
                     <div id="qna_title_input" class="row my-4">
                        <div class="col-3">
                           <h5>제목 </h5>
                        </div>
                        <div class="col-9">
                           <input type="text" name="qna_board_title" value="${updatedQnABoard.qna_board_title}" placeholder="수정하실 제목을 입력하세요." style="width: 800px; border: 0; border-bottom: 2px solid gray;"/>
                        </div>
                     </div>
                     
                     <div class="row my-4">
                        <div class="col-3">
                           <h5>문의 내용 </h5>
                        </div>
                        <div class="col-9">
                           <input type="text" id="qna_content_box" name="qna_board_content" value="${updatedQnABoard.qna_board_content}"  placeholder="수정하실 내용을 입력하세요." style="width: 800px; height: 200px; "/>
                        </div>
                     </div>      
                  </div>
                           
                  <div style="background-color:#F0F0F0; border-radius: 24px" class="p-2 my-4">
                     <h6>ㆍ 게시판 성격에 맞지 않는 게시물은 사전 통보 없이 삭제 될 수 있는 점을 양해 부탁드립니다.</h6>
                     <h6>ㆍ 유사 내용이 반복 등록되는 것을 방지하고자 1시간 이내에는 추가 글쓰기를 하실 수 없습니다.</h6>
                     <h6>ㆍ 자동 로그아웃, 네트워크 장애 등으로 내용 저장이 안 될 수 있으니 메모장 등에서 작성하여 등록해 주시기 바랍니다.</h6>
                  </div>
         
               <div class="row container-fluid mt-3 col-sm-12 ">
                  <div class="col-6">
                     <div class="text-right">
                        <button class="btn btn-sm btn-primary round" onclick="window.location.href='ReadQnABoardList'">취소하기</button>
                     </div>
                  </div>
                  <div class="col-6">
                     <div class="text-left mb-5">
                     	<input type="hidden" name="qna_board_id" value="${updatedQnABoard.qna_board_id}"/>
                        <input type="submit" class="btn btn-sm btn-primary round" value="수정하기"/>
                     </div>
                  </div>
               </div>
            </div>
         </form>
      </div>   
   </body>
</html>