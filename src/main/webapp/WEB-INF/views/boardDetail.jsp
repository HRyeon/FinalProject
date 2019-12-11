<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css" href="resources/css/section.css">
<link rel="stylesheet" type="text/css"
   href="resources/css/boardDetail.css">
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>
<title>TIKITA</title>
</head>

<body>
   <%@ include file="common/header.jsp"%>
   <%@ include file="common/playlist_select.jsp"%>

   <section>

      <div class="songbox" id="songbox">
         <div class="song">
            <div class="all_song">
               <div class="play_btn">
                  <img src="resources/images/play.png"
                     onmouseover="post_btn(this,'play1')"
                     onmouseout="post_btn(this,'play')" />
               </div>

               <p class="song_Title">${b.bTitle }</p>
               <p class="song_singer">${b.bArtist }</p>
            </div>

            <div class="like_btn">
               <!-- <img src="resources/images/like1.png"
                  onmouseover="post_btn(this,'like2')"
                  onmouseout="post_btn(this,'like1')" /> -->

               <c:choose>
                  <c:when test="${ b.llike == true }">
                     <img class="love-full-img like" id="like${b.bNum }"
                        src="resources/images/like2.png"
                        onclick="loveClick('${sessionId }','${b.bNum}')">
                  </c:when>

                  <c:otherwise>
                     <img class="love-empty-img like" id="like${b.bNum }"
                        src="resources/images/like1.png"
                        onclick="loveClick('${sessionId }','${b.bNum}')">
                  </c:otherwise>
               </c:choose>

               <p class="like_count count" id="lCount${b.bNum }">${likeCount }</p>
            </div>

            <div class="song_btn">

               <a href="resources${ b.bFileName }"
                  download="${ b.bTitle }/${ b.bArtist }"> <img
                  src="resources/images/download1.png" />
               </a>

               <!-- <img src="../resources/images/now_playlist.png"/> -->
               <img src="resources/images/playlist1.png" class="openMask"
                  style="width: 26px; height: 22px;" />
            </div>


         </div>

         <span class="song_img"> <img src="resources${ b.bImgName}"
            style="width: 140px; height: 140px;" />

         </span>



      </div>

      <div id="all">
         <div class="content">
            <div class="pro_content">
               <!-- 프로필부분 -->
               <a href="#">
                  <div class="pro_con_img" style="width:130px; height:130px">
                     <c:url var="mypage" value="mypage">
                        <c:param name="mNum" value="${b.mNum }" />
                     </c:url>
                     <a href='${mypage}'> <img style="width:130px; height:130px" src="${ b.mProfile}" />
                     </a>
                  </div>

                  <p class="pro_con_id">${b.mNick }</p>

               </a>

               <div class="pro_con_foll">
                  <img src="resources/images/people1.png" />
                  <p class="pro_con_foll_num" id="fCount${ b.mNum }">${followerCount }</p>
               </div>

               <div class="pro_con_track">
                  <img src="resources/images/music.png" />
                  <p class="pro_con_track_num">${trackCount }</p>
               </div>


               <c:if test="${ sessionId eq b.mNum}">
                  <c:url var="boardDelete" value="boardDelete">
                     <c:param name="bNum" value="${b.bNum}" />
                  </c:url>

                  <a href='${boardDelete}' style="margin-left: 40px;">삭제</a>
               </c:if>
               
               <c:url var="follow" value="follow">
                  <c:param name="mNum" value="${b.mNum }" />
               </c:url>
               <c:if test="${ !(sessionId eq b.mNum)}">

                  <p class="pro_follow">
                     <span>Follow</span>
                  </p>
                  <p class="pro_unfollow" style="width: 120px;
    height: 15px;
    text-align: center;
    margin-top: 7px;">
                     <span style=" border: 0.5px solid #999;
    border-radius: 5px;
    padding: 2px 5px;
    cursor: pointer;
    font-size: 12px;">Unfollow</span>
                  </p>
               </c:if>
               
               <script>
                     var followCheckResult = ${followCheckResult};
                     console.log(followCheckResult);
                     
                     if(followCheckResult==1) {
                        
                        $(".pro_follow").css("display","none");
                        $(".pro_unfollow").css("display","block");
                        
                     } else {
                        $(".pro_follow").css("display","block");
                        $(".pro_unfollow").css("display","none");
                     }
            
                  </script>


            </div>

            <div class="con_content">
               <!-- 댓글포함 게시글 부분 -->
               <div class="post_content">
                  <!-- 댓글제외 게시글 부분  -->
                  <p class="post_comment">${b.bContent }</p>

                  <div class="all_tag">
                     <!-- <a class="tag" href="#">#발라드</a> <a class="tag" href="#">#이유언니넘이뻐요</a>
                     <a class="tag" href="#">#만월이보고싶다</a> <a class="tag" href="#">#노래</a>
                     <a class="tag" href="#">#가수</a> <a class="tag" href="#">#날씬해</a>
                     <a class="tag" href="#">#부러워</a> <a class="tag" href="#">#이렇게</a>
                     <a class="tag" href="#">#내</a> <a class="tag" href="#">#이야기는</a>
                     <a class="tag" href="#">#결국</a> <a class="tag" href="#">#다이어트로</a>
                     <a class="tag" href="#">#...</a> <a class="tag" href="#">#빠진다</a> -->
                     <c:forEach var="t" items="${ b.tlist }">
                        <a class="tag" href="#">#${ t }</a>
                     </c:forEach>
                  </div>
               </div>

               <div class="post_reply">
                  <!-- 해당 게시물의 댓글부분  -->

                  <input type="text" id="rContent" /> <input type="submit"
                     value="등록" id="rInsertBtn" />


                  <div class="post_reply2">
                     <img src="resources/images//reply1.png" />
                     <p class="post_reply2_num">${replyCount}개의댓글</p>
                  </div>

                  <div class="post_reply3">

                     <c:forEach var="Reply" items="${Reply}" varStatus="status">

                        <div class="reply">

                           <c:if test="${Reply.rLevel==2}">
                              <img src="resources/images/arrow.png" class="ripple_arrow" />
                              <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                           </c:if>

                           <a href="#"> <img src="${Reply.mProfile}" />
                              <div class="reply_id">${ Reply.mNick }</div>
                           </a>

                           <c:if test="${Reply.rLevel==1}">
                              <p class="reply_ripple">답글</p>
                           </c:if>

                           <c:if test="${ sessionId eq Reply.mNum}">
                              <p class="reply_delete">삭제</p>
                           </c:if>

                           <input type="hidden" class="temp3" value="${Reply.rNum}"></input>

                           <div class="reply_comment">${ Reply.rContent }</div>
                           <div class="rInsert2" style="display: none;">
                              <input type="text" class="rContent2" /> <input type="submit"
                                 value="등록" class="rInsertBtn2" /> <input type="hidden"
                                 class="temp4" value="${Reply.rNum}"></input>
                           </div>
                        </div>


                     </c:forEach>





                     <%--                      <c:forEach var="Reply" items="${Reply}" varStatus="status"> --%>
                     <!--                         <div> -->

                     <%--                            <c:if test="${Reply.rLevel==1}"> --%>
                     <!--                               <div class="reply"> -->
                     <%--                                  <a href="#"> <img src="${Reply.mProfile}" /> --%>
                     <%--                                     <div class="reply_id">${ Reply.mNick }</div> --%>
                     <!--                                  </a> -->
                     <!--                                  <p class="reply_ripple">답글</p> -->

                     <!--                                  <p class="reply_delete">삭제</p> -->
                     <%--                                           <input type="hidden" class="temp3" value="${Reply.rNum}"></input> --%>

                     <%--                                  <div class="reply_comment">${ Reply.rContent }</div> --%>
                     <!--                                  <div class="rInsert2" style="display: none;"> -->
                     <!--                                              <input type="text" class="rContent2" /> -->
                     <!--                                             <input type="submit" value="등록" class="rInsertBtn2" /> -->
                     <%--                                             <input type="hidden" class="temp4" value="${Reply.rNum}"></input> --%>
                     <!--                                           </div> -->
                     <!--                               </div> -->
                     <%--                            </c:if> --%>
                     <%--                            <c:if test="${ Reply.rLevel ==2 }"> --%>
                     <!--                               <div class="ripple"> -->
                     <!--                                  <img src="resources/images/arrow.png" class="ripple_arrow" /> -->
                     <%--                                  <a href="#"> <img src="${ Reply.mProfile }" /> --%>
                     <%--                                     <div class="reply_id">${ Reply.mNick }</div> --%>
                     <!--                                  </a> -->
                     <!--                                     <p class="reply_delete">삭제</p> -->
                     <%--                                           <input type="hidden" class="temp3" value="${Reply.rNum}"></input> --%>

                     <%--                                  <div class="ripple_comment">${ Reply.rContent }</div> --%>

                     <!--                               </div> -->
                     <%--                            </c:if> --%>
                     <!--                          </div> -->
                     <%--                      </c:forEach> --%>

                  </div>
               </div>
            </div>


            <br> <br> <br> <br> <br> <br> <br>
            <br> <br> <br> <br> <br> <br> <br>
            <br> <br> <br> <br> <br> <br> <br>
            <br> <br> <br> <br> <br>
         </div>

         <div class="side"></div>
      </div>
   </section>

   <%@ include file="common/footer.jsp"%>

   <script>
   
      $("#rInsertBtn").on('click', function() {
         var bNum = ${b.bNum};
         var rContent = $("#rContent").val();

         $.ajax({
            url : "rInsert",
            data : {
               rContent : rContent,
               bNum : bNum
            },
            type : "post",
            success : function(data) {
               location.reload();
            }
         });
      });

      $(".reply_ripple").on('click', function() {
         $(this).parent().children(".rInsert2").toggle();
      });

      $(".rInsertBtn2").on('click', function() {
         var bNum = ${b.bNum};
         var rContent = $(this).parent().children(".rContent2").val();
         var rNum = $(this).parent().children(".temp4").val();

         $.ajax({
            url : "rInsert2",
            data : {
               rContent : rContent,
               bNum : bNum,
               rNum : rNum
            },
            type : "post",
            success : function(data) {
               location.reload();
            }
         });
      });

      $(".reply_delete").on('click', function() {
         var rNum = $(this).parent().children(".temp3").val();
         var bNum = ${b.bNum};
         
         $.ajax({
            url : "rdelete",
            data : {
               rNum : rNum,
               bNum : bNum
            },
            type : "post",
            success : function(data) {
               location.reload();
            }
         });
      });
      
    $(".pro_follow").on('click', function(){      
          
          $(".pro_follow").css("display","none");
          $(".pro_unfollow").css("display","block");      
          
          var followed = ${b.mNum};
          
          var fbCount = "#fCount"+${b.mNum};
          var fCount=$(fbCount).text();
          $(fbCount).text(Number(fCount)+1);
          console.log(fCount);
          $.ajax({
             url:"follow",
             data: {
                 followed:followed
              },
             type:"post"
          });
       });
       
       
       $(".pro_unfollow").on('click', function(){
          
          $(".pro_follow").css("display","block");
          $(".pro_unfollow").css("display","none");
          
          var followed = ${b.mNum};
          
          var fbCount = "#fCount"+${b.mNum};
          var fCount=$(fbCount).text();
          $(fbCount).text(Number(fCount)-1);
          console.log(fCount);
          
          $.ajax({
             url:"unfollow",
             data: {
                followed:followed
             },
             type:"post"
          });
       });
       
       
       
      
       
     
      
     

   </script>
</body>

</html>