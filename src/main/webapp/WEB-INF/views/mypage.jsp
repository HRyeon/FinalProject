<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css"
   href="resources/css/search_result.css">
<link rel="stylesheet" type="text/css" href="resources/css/mypage.css">
<link rel="stylesheet" type="text/css" href="resources/css/section.css">
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>
<style>
header a {
   color : #999;
}
</style>
<title>Tikita</title>
</head>

<body>
   <%@ include file="common/header.jsp"%>
   <%@ include file="common/playlist_select.jsp"%>
   <section>

      <div id="bbProfileBack">
         <span id="bbProfileImg"> <img src="${ member.mProfile}"
            height="200px">
         </span>

         <div id="bbProfile">
            <div id="bbProfileId">${member.mNick }
               <%-- <p>${sessionId },${member.mNum }</p> --%>
               <c:if test="${!(sessionId eq member.mNum)}">

                  <c:url var="follow" value="follow">
                     <c:param name="mNum" value="${member.mNum }" />
                  </c:url>
                  <button type="submit" class="follow" id="follow_btn">Follow</button>
                  <button type="submit" class="follow" id="unfollow_btn">Unfollow</button>

                  <script>
                  
                  var followCheckResult = ${followCheckResult};
                  console.log(followCheckResult);
                  
                  if(followCheckResult==1) {
                     
                     $("#follow_btn").css("display","none");
                     $("#unfollow_btn").css("display","block");
                     
                  } else {
                     $("#follow_btn").css("display","block");
                     $("#unfollow_btn").css("display","none");
                  }
                  
                  </script>
               </c:if>
            </div>
            <div id="bbProfileInfo">&nbsp</div>
            <div id="bbProfileInfo">${member.mId }</div>

         </div>

         <c:url var="boardform" value="boardform.me"></c:url>
         <span id="boardform" OnClick="location.href ='${boardform}'">
            글쓰기 </span>


      </div>

      <div id="bbTabs">
         <span class="bbTabList" id="bbTabList1">노래</span> <span
            class="bbTabList" id="bbTabList2">좋아요♡</span> <span
            class="bbTabList" id="bbTabList3">플레이리스트</span> <span
            class="bbTabList" id="bbTabList4">팔로잉</span> <span class="bbTabList"
            id="bbTabList5">팔로워</span> <span class="bbbbb"> <!--             <spanclass="bbTabList2"> edit(다른사람페이지면 메시지보내기)</span>  -->
            <span class="bbTabList2 follow"></span>
         </span>
      </div>


      <div id="all">

         <div class="bbcontent" id="content1">

            <c:forEach var="allMy" items="${ allMy }" varStatus="status">

               <div class="contentbb">
                  <!-- <a href="#"> -->
                  <div class="post">
                     <div class="post_header">
                        <c:url var="mypage" value="mypage">
                           <c:param name="mNum" value="${allMy.mNum }" />
                        </c:url>

                        <a href='${mypage}'><img src="${ allMy.mProfile}"
                           class="image" />${ allMy.mNick}</a>

                        <!-- <button type="submit" class="follow">Follow</button> -->
                     </div>

                     <div class="post_img">
                        <c:url var="detail" value="bDetail.bo">
                           <c:param name="bNum" value="${allMy.bNum }" />
                        </c:url>
                        <a class="bDetail-link-img" href="${detail}"> <input
                           type="hidden" class="hdbNum" value="${ allMy.bNum }"> <img
                           src="resources${allMy.bImgName }" />
                        </a>


                        <div class="song">
                        <input class="get1" type="hidden" value="${allMy.bNum }"/>
                                 <input class="get2" type="hidden" value="${allMy.bTitle }"/>
                                 <input class="get3" type="hidden" value="${allMy.bFileName }"/>
                           <div class="play_btn">
                              <img src="resources/images/play.png"
                                 onmouseover="post_btn(this,'play')"
                                 onmouseout="post_btn(this,'play')" />
                           </div>

                           <p class="song_Title">${allMy.bTitle }</p>
                           <p class="song_singer">${allMy.bArtist }</p>
                        </div>

                        <div class="all_btn">

                           <div class="post_btn1">
                              <%-- <img src="resources/images/like1.png" id= "like${ allMy.bNum }" class="like btn1"
                                 onmouseover="post_btn(this,'like2')"
                                 onmouseout="post_btn(this,'like1')" /> --%>

                              <c:choose>
                                 <c:when test="${ allMy.llike == true }">
                                    <img class="love-full-img like" id="like${allMy.bNum }"
                                       src="resources/images/like2.png"
                                       onclick="loveClick('${sessionId }','${allMy.bNum}')">
                                 </c:when>

                                 <c:otherwise>
                                    <img class="love-empty-img like" id="like${allMy.bNum }"
                                       src="resources/images/like1.png"
                                       onclick="loveClick('${sessionId }','${allMy.bNum}')">
                                 </c:otherwise>
                              </c:choose>

                              <p class="like_count count" id="lCount${allMy.bNum }">${allMyLikeCount[status.index]}</p>
                              <img src="resources/images/reply1.png" class="reply btn1"
                                 onmouseover="post_btn(this,'reply2')"
                                 onmouseout="post_btn(this,'reply1')" />
                              <p class="reply_count count">${allMyReplyCount[status.index]}</p>
                              <br>
                           </div>

                           <div class="post_btn2">
                              <img src="resources/images/download1.png" class="down btn2" />
                              <img src="resources/images/playlist1.png"
                                 class="list btn2 openMask" style="width: 26px;" />
                           </div>
                        </div>
                     </div>

                     <script>
                        function post_btn(me, post) {
                           me.src = "resources/images/" + post
                                 + ".png";
                        };
                     </script>

                     <p class="post_content">${ allMy.bContent }</p>

                     <div class="tag-wrapper" style="float:none;">
                        <!-- <a class="tag" href="#">#발라드</a> <a class="tag" href="#">#이유언니넘이뻐요</a>
                        <a class="tag" href="#">#만월이보고싶다</a> <a class="tag" href="#">#발라드</a> -->
                        <c:forEach var="t" items="${ allMy.tlist }">
                           <a class="tag" href="#">#${ t }</a>
                        </c:forEach>
                     </div>
                  </div>

               </div>

            </c:forEach>
<script>
                              $(".play_btn").on('click', (function(){
                                       
                                 var bNum = $(this).parent().children(".get1").val();
                                 var bTitle = $(this).parent().children(".get2").val();
                                 var bFileName = $(this).parent().children(".get3").val();
                                  console.log(bTitle);
                                 
                                   $.ajax({
                                         type:"POST",
                                         url:"nlist.pl",
                                         data : {bNum:bNum,bTitle:bTitle,bFileName:bFileName},
                                        
                                         success: function(data){
                                            parent.frame2.location.reload(true);
                                         } 
                                     });
                              }));

                              
                              </script>
         </div>
         <div class="bbcontent" id="content2">

            <c:forEach var="allLike" items="${ allLike }" varStatus="status">

               <div class="contentbb">
                  <!-- <a href="#"> -->
                  <div class="post">
                     <div class="post_header">
                        <c:url var="mypage" value="mypage">
                           <c:param name="mNum" value="${allLike.mNum }" />
                        </c:url>

                        <a href='${mypage}'><img src="${ allLike.mProfile}"
                           class="image" />${ allLike.mNick}</a>

                        <!-- <button type="submit" class="follow">Follow</button> -->
                     </div>

                     <div class="post_img">
                        <c:url var="detail" value="bDetail.bo">
                           <c:param name="bNum" value="${allLike.bNum }" />
                        </c:url>
                        <a class="bDetail-link-img" href="${detail}"> <input
                           type="hidden" class="hdbNum" value="${ allLike.bNum }">
                           <img src="resources${allLike.bImgName }" />
                        </a>


                        <div class="song">
                           <div class="play_btn">
                              <img src="resources/images/play.png"
                                 onmouseover="post_btn(this,'play1')"
                                 onmouseout="post_btn(this,'play')" />
                           </div>

                           <p class="song_Title">${allLike.bTitle }</p>
                           <p class="song_singer">${allLike.bArtist }</p>
                        </div>

                        <div class="all_btn">

                           <div class="post_btn1">
                              <!-- <img src="resources/images/like1.png" class="like btn1"
                                 onmouseover="post_btn(this,'like2')"
                                 onmouseout="post_btn(this,'like1')" /> -->

                              <c:choose>
                                 <c:when test="${ allLike.llike == true }">
                                    <img class="love-full-img like" id="like${allLike.bNum }"
                                       src="resources/images/like2.png"
                                       onclick="loveClick('${sessionId }','${allLike.bNum}')">
                                 </c:when>

                                 <c:otherwise>
                                    <img class="love-empty-img like" id="like${allLike.bNum }"
                                       src="resources/images/like1.png"
                                       onclick="loveClick('${sessionId }','${allLike.bNum}')">
                                 </c:otherwise>
                              </c:choose>

                              <p class="like_count count" id="lCount${allLike.bNum }">${allLikeLikeCount[status.index]}</p>
                              <img src="resources/images/reply1.png" class="reply btn1"
                                 onmouseover="post_btn(this,'reply2')"
                                 onmouseout="post_btn(this,'reply1')" />
                              <p class="reply_count count">${allLikeReplyCount[status.index]}</p>
                              <br>
                           </div>

                           <div class="post_btn2">
                              <img src="resources/images/download1.png" class="down btn2" />
                              <img src="resources/images/playlist1.png"
                                 class="list btn2 openMask" style="width: 26px;" />
                           </div>
                        </div>
                     </div>

                     <script>
                        function post_btn(me, post) {
                           me.src = "resources/images/" + post
                                 + ".png";
                        };
                     </script>

                     <p class="post_content">${ allLike.bContent }</p>

                     <div class="tag-wrapper" style="float:none;">
                        <!-- <a class="tag" href="#">#발라드</a> <a class="tag" href="#">#이유언니넘이뻐요</a>
                        <a class="tag" href="#">#만월이보고싶다</a> <a class="tag" href="#">#발라드</a> -->
                        <c:forEach var="t" items="${ allLike.tlist }">
                           <a class="tag" href="#">#${ t }</a>
                        </c:forEach>
                     </div>
                  </div>

               </div>

            </c:forEach>
         </div>
         <div class="bbcontent" id="content3">

            <!------------------------------------플레이리스트 탭 부분 --------------------------------------------------------------->
            <c:if test="${ sessionId eq member.mNum}">
               <button class="add_playlist_btn" style="height:20px; border:0px;"><img src="resources/images/playList_plus.png" style="width:20px; background-color:#fff;"/></button>
            </c:if>

            <div class="post_playlist">

               <div class="pInsert" style="display: none;">
                  <input type="text" class="pName2" /> <input type="submit"
                     value="등록" class="pInsertbtn" />

               </div>


            </div>

            <%--   <div class="post_palylist2"> 
            <c:forEach var="Playlist" items="${Playlist}" varStatus="status">
               
               <div class="playlist"> 
                  <a href="#">
                      <img src="resources/images/testimg1.jpg"/>
                     <div class="playlist_Title">${Playlist.pName }</div> 
                  </a>
                  
                  <p class="palylist_delete">삭제</p> 
               </div>
               
            </c:forEach>
            
            
            </div> --%>



            <div>
               <c:forEach var="p" items="${ playlist }">

                  <c:url var="mypage" value="mypage">
                     <c:param name="mNum" value="${ p.mNum }" />
                  </c:url>

                  <div class="plist-wrapper" style="width: 700px">
                     <div class="plist-img-wrapper">
                        <c:if test="${p.blist[0] == null}">
                        <img src="resources/uploadFiles/imgs/default.jpg">
                        </c:if>
                        
                        <c:if test="${p.blist[0] != null}">
                        <img src="resources${ p.blist[0].bImgName }">
                        </c:if>
                        
                     </div>

                     <div class="plist-right-wrapper" style="width: 550px">

                        <div class="plist-info-wrapper">
                           <div class="plist-name-wrapper">

                              <c:url var="playlistdetail" value="playlistdetail.pl">
                                 <c:param name="pNum" value="${p.pNum }" />
                              </c:url>
                              <input type="hidden" class="hdpNum" value="${ p.pNum }">
                              <a href='${playlistdetail}'>${ p.pName }</a>
                           </div>

                           <div class="uploader-name-wrapper">
                              <a class="mypage-link-text" href="${ mypage }">${ p.mNick }</a>
                           </div>

                           <div class="mcount-wrapper">
                              <p>총 ${ fn:length(p.blist) } 곡</p>
                              <input type="hidden" class="pNum" value="${p.pNum}"></input>
                              <c:if test="${ sessionId eq p.mNum}">
                                 <p class="playlist_delete">삭제</p>
                              </c:if>
                           </div>


                        </div>

                        <div class="plist-top3-wrapper">
                           <ul>
                              <c:forEach var="bInp" items="${ p.blist }" begin="0" end="2">
                                 <li>
                                    <div class="plist-play-img">
                                       <img src="resources/images/play.png">
                                    </div>

                                    <div class="plist-music-name-wrapper">
                                       <a href="#">${ bInp.bTitle }</a>
                                    </div>

                                    <div class="plist-artist-wrapper">
                                       <a href="#">${ bInp.bArtist }</a>
                                    </div>
                                 </li>
                              </c:forEach>

                           </ul>

                           <div class="plist-playall-btn-wrapper">
                              <input type="button" value="전체듣기" class="plist-playall-btn">

                              
                           </div>







                        </div>

                     </div>

                  </div>
               </c:forEach>
            </div>








         </div>

         <div class="bbcontent" id="content4">

            <c:forEach var="FollowingList" items="${FollowingList}"
               varStatus="status">

               <c:url var="mypage" value="mypage">
                  <c:param name="mNum" value="${FollowingList.mNum}" />
               </c:url>


               <div OnClick="location.href ='${mypage}'"
                  style="cursor: pointer; width: 600px; height: 100px;">

                  &nbsp <span class="bbFollowingListImage"><img style="width: 50px; height: 50px"
                     src="${FollowingList.mProfile}" /></span> <span class="bbFollowingList">

                     <div class="bbFollowingId">${FollowingList.mNick}</div>

                     <div class="cccc">
                        <span>${followingFollowerCount[status.index] } Followers
                           &nbsp&nbsp&nbsp</span> <span class="bbTracks">${followingTrackCount[status.index]}
                           Tracks &nbsp&nbsp&nbsp ${followingLikedCount[status.index]}
                           Liked</span>
                     </div>

                  </span>

               </div>

            </c:forEach>
         </div>
         <div class="bbcontent" id="content5">


            <c:forEach var="FollowerList" items="${FollowerList}"
               varStatus="status">

               <c:url var="mypage" value="mypage">
                  <c:param name="mNum" value="${FollowerList.mNum}" />
               </c:url>

               <div OnClick="location.href ='${mypage}'"
                  style="cursor: pointer; width: 600px; height: 100px;">
                  &nbsp <span class="bbFollowingListImage"><img
                     src="${FollowerList.mProfile}" /></span> <span
                     class="bbFollowingList">



                     <div class="bbFollowingId">${FollowerList.mNick}</div>


                     <div class="cccc">
                        <span>${followerFollowerCount[status.index] } Followers
                           &nbsp&nbsp&nbsp</span> <span class="bbTracks">${followerTrackCount[status.index]}
                           Tracks &nbsp&nbsp&nbsp ${followerLikedCount[status.index]}
                           Liked</span>
                     </div>
                  </span>

               </div>
            </c:forEach>


         </div>



         <div class="side">

            <div class="first">
               <table class="bb__table">
                  <tr>

                     <td>
                        <h3 class="bbFirstDivFont">Followers</h3>
                        <div class="bbFirstDivNum">${followerC }</div>
                     </td>
                     <td>
                        <h3 class="bbFirstDivFont">Following</h3>
                        <div class="bbFirstDivNum">${followingC}</div>
                     </td>

                     <td>
                        <h3 class="bbFirstDivFont">Tracks</h3>
                        <div class="bbFirstDivNum">${trackC}</div>
                     </td>
                     <td>
                        <h3 class="bbFirstDivFont">Liked</h3>
                        <div class="bbFirstDivNum">${likedC}</div>
                     </td>

                  </tr>
               </table>
               <!--                <div class="bbForSpace1"></div> -->
            </div>


            <!-- 좋아요누른곡 수 & 리스트 -->
            <div class="bbSecond">
               <a class="" rel="nofollow">
                  <div class="listTitle">
                     <span class="heartIcon" style="padding-left: 4px;"><img
                        src="resources/images/like3.png" /></span> <span>${likeC} Likes</span>
                     <span class="bbViewAll" id="viewlikes">View all</span>
                  </div>
               </a>
            </div>

            <div class="bbSecond2">

               <c:forEach var="likeList" items="${likeList}" begin="0" end="2"
                  varStatus="status">
                  <%--                   <c:if test="${likeList != null}"> --%>
                  <div class="bbSecond23">


                     <span class="bbAlbumImage"> <img
                        src="resources${likeList.bImgName}"
                        style="width: 50px; height: 50px;" /></span> <span class="bbSongList"
                        style="width: 240px;">
                        <div class="bbSongId">&nbsp&nbsp&nbsp${likeList.mNick}</div>
                        <div class="bbSongTitle">&nbsp&nbsp&nbsp${likeList.bTitle}</div>
                        <div class="bbSongContent">
                           <span>&nbsp&nbsp&nbsp${likeListLikeCount[status.index]}
                              Likes &nbsp&nbsp&nbsp&nbsp</span> <span class=" ">${likeListReplyCount[status.index]}
                              Replies</span>
                        </div> <br>
                     </span>

                  </div>

                  <%--                         </c:if> --%>
               </c:forEach>

            </div>
            <!-- FOLLOWERS -->
            <div class="bbThird">
               <a class="" rel="nofollow">
                  <div class="listTitle">
                     <span class="followersIcon"> <img
                        src="resources/images/people1.png" /></span> <span>${followerC }
                        Followers</span> <span class="bbViewAll" id="viewfollowers">View
                        all</span>
                  </div>
               </a>
            </div>
            <div class="bbFollowersList">
               <!--                   최대 10명까지 있는 만큼 span으로 리스팅   -->
               <c:forEach var="FollowerList" items="${FollowerList}" begin="0"
                  end="9" varStatus="status">
                  <c:if test="${FollowerList != null}">
                     <c:url var="mypage" value="mypage">
                        <c:param name="mNum" value="${FollowerList.mNum}" />
                     </c:url>

                     <span OnClick="location.href ='${mypage}'"
                        style="cursor: pointer; width: 48px; height: 48px;"
                        class="bbFollowersIamge"> <img
                        src="${FollowerList.mProfile}"
                        style="width: 48px; height: 48px;" />
                     </span>
                  </c:if>
               </c:forEach>
            </div>

            <!-- FOLLoWINGS -->
            <div class="bbForth">
               <a class="" rel="nofollow">
                  <div class="listTitle">
                     <span class="followingIcon"><img
                        src="resources/images/people1.png" style="padding-left: 4px;" /></span>
                     <span>${followingC } Followings</span><span class="bbViewAll"
                        id="viewfollowings">View all</span>
                  </div>
               </a>
            </div>

            <div class="bbForth2">

               <!--                최대 3명까지 div 생성 리스팅 -->
               <c:forEach var="FollowingList" items="${FollowingList}" begin="0"
                  end="2" varStatus="status">

                  <c:if test="${FollowingList != null}">
                     <c:url var="mypage" value="mypage">
                        <c:param name="mNum" value="${FollowingList.mNum}" />
                     </c:url>

                     <div class="following" OnClick="location.href ='${mypage}'"
                        style="cursor: pointer; margin-top: 20px;">
                        <span class="bbFollowingListImage"><img
                           src="${FollowingList.mProfile}"
                           style="width: 50px; height: 50px;" /></span> <span
                           class="bbFollowingList">


                           <div class="bbFollowingId">${FollowingList.mNick}</div>

                           <div class="bbFollowingContent">
                              <span>${followingFollowerCount[status.index] }
                                 Followers</span> <span class="bbTracks">${followingTrackCount[status.index]}
                                 Tracks &nbsp&nbsp&nbsp ${followingLikedCount[status.index]}
                                 Liked </span><br>

                           </div>
                        </span>

                     </div>
                  </c:if>
               </c:forEach>
            </div>

         </div>
      </div>



   </section>
   <%@ include file="common/footer.jsp"%>
</body>





<script>

   $(document).ready(function() {
      $("#bbTabList1").css("color", "#ff6f61");
      function first() {
         $(".bbcontent").hide();
         $("#content1").show();
         $(".bbTabList").css("color", "#999");
         $("#bbTabList1").css("color", "#ff6f61");
      }
      ;
      function second() {
         $(".bbcontent").hide();
         $("#content2").show();
         $(".bbTabList").css("color", "#999");
         $("#bbTabList2").css("color", "#ff6f61");
      }
      ;
      function third() {
         $(".bbcontent").hide();
         $("#content3").show();
         $(".bbTabList").css("color", "#999");
         $("#bbTabList3").css("color", "#ff6f61");
      }
      ;
      function forth() {
         $(".bbcontent").hide();
         $("#content4").show();
         $(".bbTabList").css("color", "#999");
         $("#bbTabList4").css("color", "#ff6f61");
      }
      ;
      function fifth() {
         $(".bbcontent").hide();
         $("#content5").show();
         $(".bbTabList").css("color", "#999");
         $("#bbTabList5").css("color", "#ff6f61");
      }
      ;

      $("#bbTabList1").click(function() {
         first();
      });
      $("#bbTabList2").click(function() {
         second();
      });
      $("#viewlikes").click(function() {
         second();
      });
      $("#bbTabList3").click(function() {
         third();
      });
      $("#bbTabList4").click(function() {
         forth();
      });
      $("#viewfollowers").click(function() {
         fifth();
      });
      $("#bbTabList5").click(function() {
         fifth();
      });
      $("#viewfollowings").click(function() {
         forth();
      });

   });
   
   $("#follow_btn").on('click', function(){      
      
      $("#follow_btn").css("display","none");
      $("#unfollow_btn").css("display","block");      
      var followed = ${member.mNum};
      
      $.ajax({
         url:"follow",
         data: {
             followed:followed
          },
         type:"post"
      });
   });
   
   
   $("#unfollow_btn").on('click', function(){
      
      $("#follow_btn").css("display","block");
      $("#unfollow_btn").css("display","none");
      
      var followed = ${member.mNum};
      
      $.ajax({
         url:"unfollow",
         data: {
            followed:followed
         },
         type:"post"
      });
   });
   
   
   $(".add_playlist_btn").on('click', function() {
        $(".pInsert").toggle();
        /* $(this).parent().children(".pInsert").toggle(); */
     });
   
   
   $(".pInsertbtn").on('click', function() {
     var pName2 = $(".pName2").val();

         $.ajax({
            url : "pInsert.pl",
            data : {
               pName : pName2
               },
            type : "post",
            success : function(data) {
               if (data=="success"){location.reload(); 
            }else{
            alert("중복된 플레이 리스트 이름입니다.");}
            }
         });
      });
   
   $(".playlist_delete").on('click', function() {
       var pNum = $(this).parent().children(".pNum").val();
      console.log(pNum);
       
       $.ajax({
          url : "pdelete",
          data : {
             pNum:pNum
          },
          type : "post",
          success : function(data) {
             location.reload();
          }
       });
    });
   
   
   
</script>

</html>