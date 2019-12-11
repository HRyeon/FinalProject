<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>    <!-- <link rel="stylesheet" href="resources/css/loginheader.css"> -->
   <!-- <link rel="stylesheet" href="resources/css/footer.css"> -->
   <!-- <link rel="stylesheet" href="resources/css/login.css"> -->

<title>NAVER LOGIN TEST</title>
</head>
<body  style="background-color:#333;">

   <!-- <div class="fb-header-base">
   </div>
   <div class="fb-header">
      <div id="img1" class="fb-header"><img src="resources/images/tikita2.png" /></div> -->
   
   <!-- </div>
   </div> -->

   <div class="fb-body">
      <!-- <div id="intro1" class="fb-body">Tikita helps you connect and share with the <br>
         people in your life.</div>
      
      <div id="img2" class="fb-body"><img src="resources/images/world.png" /></div>
      <div id="intro3" class="fb-body"></div> -->
      <div id="form3" class="fb-body">

      <c:choose>
         <c:when test="${sessionId != null}">
                <jsp:forward page="temp.jsp" />
         </c:when>
         <c:otherwise>
   <!--          <form action="login.userdo" method="post" name="frm"
               style="width: 470px;">
               <h2>로그인</h2>
               <input type="text" name="id" id="id" class="w3-input w3-border"
                  placeholder="아이디" value="${id}"> <br> <input
                  type="password" id="pwd" name="pwd" class="w3-input w3-border"
                  placeholder="비밀번호"> <br> <input type="submit"
                  value="로그인" onclick="#"> <br>
            </form>  -->
            <!-- <br>
             
               <br>
                
             <br>
              <br>
               <br>
                <br>
                 <br>
                  <br> -->
                  
                  <div style="width:250px; height:250px;margin:150px auto 80px auto; border-radius:150px; border:4px solid #fff; text-align:center; background-color:#333;">
                  	
                  	<img src="resources/images/simbol.png" style="width:200px; margin-top:40px;"/>
                  	<!-- <span style="border-top:4px solid #fff; width:500px; display:inline-block; position:relative; top:125px; left:-125px;"></span> -->
                  	
                  	<p style="font-size:30px; color:#fff; margin-top:50px;">TIKITA LOGIN</p>
                  </div>
            <!-- 네이버 로그인 창으로 이동 -->
            <div id="naver_id_login" style="text-align: center; /* margin-top:80px; */">
               <a href="${url}"> <img width="223"
                  src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
                  
               <p id="intro4" style="color:#666; margin-top:20px;">By clicking Create an account, you agree to our Terms and that<br>
            you have read our Data Policy, including our Cookie Use.</p>
            </div>
            
      </div>

      <footer>
         <div id="foot">

         </div>
      </footer>


   </div>



            <br>
         </c:otherwise>
      </c:choose>
   
</body>
</html>
