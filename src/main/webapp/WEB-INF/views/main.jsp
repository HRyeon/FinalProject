<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" type="text/css" href="resources/css/section.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/mypage.css">
<link rel="stylesheet" type="text/css" href="resources/css/footer.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>
<title>TIKITA</title>
</head>


<body>
	<%@ include file="common/header.jsp"%>
	<%@ include file="common/playlist_select.jsp"%>
	<section>
		<div id="all">
			<div class="content">
				<c:forEach var="feed" items="${ feed }" varStatus="status">
					<div class="post">
						<div class="post_header">
							<c:url var="mypage" value="mypage">
								<c:param name="mNum" value="${feed.mNum }" />
							</c:url>

							<a href='${mypage}'><img src="${ feed.mProfile}"
								class="image" />${ feed.mNick}</a>

							<!-- <button type="submit" class="follow">Follow</button> -->
						</div>
						<div class="post_img">
							<c:url var="detail" value="bDetail.bo">
								<c:param name="bNum" value="${feed.bNum }" />
							</c:url>
							<a class="bDetail-link-img" href="${detail}"> <input
								type="hidden" class="hdbNum" value="${ feed.bNum }"> <img
								src="resources${feed.bImgName }" />
							</a>
							<div class="song">
							<input class="get1" type="hidden" value="${feed.bNum }"/>
            							<input class="get2" type="hidden" value="${feed.bTitle }"/>
            							<input class="get3" type="hidden" value="${feed.bFileName }"/>
								<div class="play_btn">
									<img src="resources/images/play.png"
										onmouseover="post_btn(this,'play')"
										onmouseout="post_btn(this,'play')" />
								</div>
								<p class="song_Title">${feed.bTitle }</p>
								<p class="song_singer">${feed.bArtist }</p>
							</div>
							<div class="all_btn">
								<%-- <div class="post_btn1">
									<img src="resources/images/like1.png" class="like btn1"
										onmouseover="post_btn(this,'like2')"
										onmouseout="post_btn(this,'like1')" />
									<p class="like_count count">${feedLikeCount[status.index]}</p>
									<img src="resources/images/reply1.png" class="reply btn1"
										onmouseover="post_btn(this,'reply2')"
										onmouseout="post_btn(this,'reply1')" />
									<p class="reply_count count">${feedReplyCount[status.index]}</p>
									<br>
								</div> --%>

								<div class="post_btn1">

									<c:choose>
										<c:when test="${ feed.llike == true }">
											<img class="love-full-img like" id="like${feed.bNum }"
												src="resources/images/like2.png"
												onclick="loveClick('${sessionId }','${feed.bNum}')">
										</c:when>

										<c:otherwise>
											<img class="love-empty-img like" id="like${feed.bNum }"
												src="resources/images/like1.png"
												onclick="loveClick('${sessionId }','${feed.bNum}')">
										</c:otherwise>
									</c:choose>

									<p class="like_count count" id="lCount${feed.bNum }">${feedLikeCount[status.index]}</p>
									<img src="resources/images/reply1.png" class="reply btn1"
										onmouseover="post_btn(this,'reply2')"
										onmouseout="post_btn(this,'reply1')" />
									<p class="reply_count count">${feedReplyCount[status.index]}</p>
									<br>
								</div>

								<div class="post_btn2">

									<a href="resources${ feed.bFileName }"
										download="${ feed.bTitle }/${ feed.bArtist }"> <img
										src="resources/images/download1.png" class="down btn2"
										style="width: 26px; height: 26px;" />
									</a> <img src="resources/images/playlist1.png"
										class="list btn2 openMask" style="width: 26px;" />
								</div>
							</div>
						</div>



						<script>
							function post_btn(me, post) {
								me.src = "resources/images/" + post + ".png";
							};
						</script>

						<p class="post_content">${ feed.bContent }</p>

						<div class="tag-wrapper">
							<!-- <a class="tag" href="#">#발라드</a> <a class="tag" href="#">#이유언니넘이뻐요</a>
							<a class="tag" href="#">#만월이보고싶다</a> <a class="tag" href="#">#발라드</a> -->
							<c:forEach var="t" items="${ feed.tlist }">
								<a class="tag" href="#">#${ t }</a>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
<script>
										$(".play_btn").on('click', (function(){
													
											var bNum = $(this).parent().children(".get1").val();
											var bTitle = $(this).parent().children(".get2").val();
											var bFileName = $(this).parent().children(".get3").val();
											 
											
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
					<!-- 					<div class="bbForSpace1"></div> -->
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




				<!-- 					최대 3곡까지 div 생성 리스팅 -->







				<div class="bbSecond2">

					<c:forEach var="likeList" items="${likeList}" begin="0" end="2"
						varStatus="status">
						<%-- 						<c:if test="${likeList != null}"> --%>
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

						<%-- 								</c:if> --%>
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
					<!-- 					최대 10명까지 있는 만큼 span으로 리스팅 -->
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

					<!-- 					최대 3명까지 div 생성 리스팅 -->
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
</html>