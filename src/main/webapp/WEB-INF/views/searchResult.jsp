<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/search_result.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>
<style>
header a {
	color : #999;
}
</style>
<title>Document</title>
</head>



<script>
	// 탭 클릭 이벤트
	$(document).ready(function() {
		var $items = $('ul.tab-menu li');

		$items.click(function() {
			var tab_id = $(this).attr('data-tab');
			console.log(tab_id);

			$items.removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');

		});
	});


	
</script>


<body>
	<%@ include file="common/header.jsp"%>
	<%@ include file="common/playlist_select.jsp"%>
	
	<section>

		<input type="hidden" class="tag_hidden">
		<%-- <input type="hidden" class="hdSessionId" value= ${ sessionId }> --%>

		<div class="search-result">
			<div id="search-text">
				<p>"${ search }" 검색결과</p>
			</div>
		</div>

		<div class="total-wrapper">

			<div class="tab-wrapper">
				<ul class="tab-menu" id="tab-menu">
					<li data-tab="tab1" class="tab-item current"><img
						src="resources/images/track.png"
						style="width:15px; margin-top:11px;">
						<p>트랙</p></li>
					<li data-tab="tab2" class="tab-item"><img
						src="resources/images/people.png"
						style="width:17px; margin-top:12px;">
						<p>사람</p></li>
					<li data-tab="tab3" class="tab-item"><img
						src="resources/images/tag.png"
						style="width:16px; margin-top:11px;">
						<p>태그</p></li>
					<li data-tab="tab4" class="tab-item"><img
						src="resources/images/playlist.png"
						style="width:15px; margin-top:12px;">
						<p>플레이리스트</p></li>
				</ul>

			</div>

			<div class="content-wrapper">

				<div id="tab1" class="tab-content current">

					<c:forEach var="b" items="${ bSearchList }" varStatus="status">

						<c:url var="detail" value="bDetail.bo">
							<c:param name="bNum" value="${b.bNum }" />
						</c:url>

						<div class="track-wrapper">
							<div class="img-wrapper">
								<a href="${ detail }"> <img src="resources${ b.bImgName }">
								</a>
							</div>
							<div class="sound-content">
								<div class="sound-wrapper">
									<div class="title-wrapper">
										<div class="play-wrapper">
											<img src="resources/images/play.png" style="width:40px; height:40px;">
										</div>
										<div class="user-wrapper">
											<p>${ b.bDate }</p>
											<a href="#">${ b.bTitle }</a><br> <a href="#">${ b.bArtist }</a>
										</div>
									</div>

								</div>

								<div class="uploader-name">
									<a class="mypage-link-text" href="#">${ b.mNick }</a>
								</div>

								<div class="tag-wrapper">
									<c:forEach var="t" items="${ b.tlist }">
										<a class="tag" href="#">#${ t }</a>
									</c:forEach>
								</div>

								<div class="track-footer">

									<div class="track-footer-left" style="margin-top:10px;">

										<c:choose>
											<c:when test="${ b.llike == true }">
												<img class="love-full-img like" id="like${b.bNum }"
													src="resources/images/like2.png"
													onclick="loveClick('${sessionId }','${b.bNum}')"
													style="width:25px;">
											</c:when>

											<c:otherwise>
												<img class="love-empty-img like" id="like${b.bNum }"
													src="resources/images/like1.png"
													onclick="loveClick('${sessionId }','${b.bNum}')"
													style="width:25px;">
											</c:otherwise>
										</c:choose>
										<a href="resources${ b.bFileName }"
											download="${ b.bTitle }/${ b.bArtist }"> <img
											id="download" src="resources/images/download1.png"
											style="width:20px;">
										</a> <img id="add_playlist" class="openMask"
											src="resources/images/playlist1.png"
											style="width:24px; height:22px;">

									</div>

									<div class="track-footer-right" style="margin-top:20px;">
										<ul class="track-status">
											<!-- <a href="#"> -->
												<li class="like-li li-mini"><img
													id="like-mini mini-item"
													src="resources/images/like3.png"
													style="width:14px;"> <span
													class="like-num" id="lCount${b.bNum }">${feedLikeCount[status.index]}</span></li>
											<!-- </a>
											<a href="#"> -->
												<li class="comment-li li-mini"><img
													id="comment-mini mini-item"
													src="resources/images/reply1.png"
													style="width:15px;"> <span
													class="comment-num">${feedReplyCount[status.index]}</span></li>
											<!-- </a> -->
										</ul>
									</div>
								</div>
							</div>

						</div>
					</c:forEach>

				</div>
				<div id="tab2" class="tab-content">

					<c:forEach var="m" items="${ mSearchList }" varStatus="status">

						<c:url var="mypage" value="mypage">
							<c:param name="mNum" value="${ m.mNum }" />
						</c:url>

						<div class=people-wrapper>
							<div class="people-img-wrapper">
								<a class="mypage-link-img" href="${ mypage }"> <%-- <input type="hidden" class="hdmNum" value="${ m.mNum }"> --%>
									<img src="${ m.mProfile }">
								</a>
							</div>

							<div class="people-info-wrapper">
								<div class="user-name">
									<p>${ m.mNick }</p>
								</div>

								<div class="people-mini-li">
									<ul class="people-status">
										<a href="#" class="openMask">
											<li class="follower-li li-mini"><img
												id="follower-mini mini-item"
												src="resources/images/people1.png"
												style="width:13px;"> <span
												class="follower-num" id="fCount${ m.mNum }">${followerCount[status.index] }</span></li>
										</a>
										<li class="tracks-li li-mini"><img
											id="tracks-mini mini-item" src="resources/images/reply1.png"
											style="width:15px;">
											<span class="tracks-num">${trackCount[status.index] }</span></li>
									</ul>
								</div>

								<div class="follow-btn-wrapper">

									<c:url var="follow" value="follow">
										<c:param name="mNum" value="${m.mNum }" />
									</c:url>

									<c:if test="${ !(sessionId eq m.mNum)}">

										<c:if test="${ followcheckresult[status.index] == 0}">

											<input type="button" value="Follow"
												class="follow-btn follow_check" style="display: block">
											<input type="button" value="Unfollow"
												class="follow-btn unfollow_check" style="display: none">
										</c:if>
										<c:if test="${ followcheckresult[status.index] == 1}">
											<input type="button" value="Follow"
												class="follow-btn follow_check" style="display: none">
											<input type="button" value="Unfollow"
												class="follow-btn unfollow_check" style="display: block">

										</c:if>
									</c:if>


								</div>






								<script>
                  						
					                 /*  var followCheckResult = ${followCheckResult};
					                  console.log(followCheckResult);
					                  
					                  if(followCheckResult==1) {
					                     
					                     $("#follow_btn").css("display","none");
					                     $("#unfollow_btn").css("display","block");
					                     
					                  } else {
					                     $("#follow_btn").css("display","block");
					                     $("#unfollow_btn").css("display","none");
					                  } */
					                  
					                  $(".follow_check").on('click', function(){      
					                      
					                      $(this).css("display","none");
					                      $(this).parent().children(".unfollow_check").css("display","block");      
 					                      var followed = ${m.mNum};
					                      console.log(followed);
					                      
					                      var fbCount = "#fCount"+${m.mNum};
					                      var fCount=$(fbCount).text();
					                      $(fbCount).text(Number(fCount)+1);
					                      
					                      $.ajax({
 					                         url:"follow",
 					                         data: {
					                             followed:followed
 					                          },
 					                         type:"post",
 					                         
 					                        
 					                      });
					                   });
					                   
					                   
					                   $(".unfollow_check").on('click', function(){
					                      
					                	   $(this).parent().children(".follow_check").css("display","block");
					                      $(this).css("display","none");
					                      
					                      var followed = ${m.mNum};
					                      console.log(followed);
					                      
					                      var fbCount = "#fCount"+${m.mNum};
					                      var fCount=$(fbCount).text();
					                      $(fbCount).text(Number(fCount)-1);
					                      
					                      $.ajax({
					                         url:"unfollow",
					                         data: {
					                            followed:followed
					                         },
					                         type:"post",
					                       		
					                      });
					                   });
				                  
					                  
					                  
					                  
				                 </script>

							</div>
						</div>
					</c:forEach>

				</div>

				<div id="tab3" class="tab-content">

					<div class="tab3-tag-wrapper">

						<div class="tag-wrapper-title">
							<p>관련 태그</p>
						</div>

						<div class="tag-wrapper">
							<c:forEach var="t" items="${ tSearchList }" varStatus="status">
								<a class="tag tab3-tag">#${ t }</a>
							</c:forEach>
						</div>
					</div>

					<c:forEach var="b" items="${ blistInTag }">

						<c:url var="mypage" value="mypage">
							<c:param name="mNum" value="${ b.mNum }" />
						</c:url>

						<c:url var="detail" value="bDetail.bo">
							<c:param name="bNum" value="${b.bNum }" />
						</c:url>

						<div class="track-wrapper">
							<div class="img-wrapper">
								<a href="${ detail }"> <img
									src="resources${ b.bImgName }">
								</a>
							</div>
							<div class="sound-content">
								<div class="sound-wrapper">
									<div class="title-wrapper">
										<div class="play-wrapper">
											<img src="resources/images/play.png">
										</div>
										<div class="user-wrapper">
											<p>${ b.bDate }</p>
											<a href="#">${ b.bTitle }</a><br> <a href="#">${ b.bArtist }</a>
										</div>
									</div>

								</div>

								<div class="uploader-name">
									<a class="mypage-link-text" href="${ mypage }">${ b.mNick }</a>
								</div>

								<div class="tag-wrapper">

									<c:forEach var="t" items="${ b.tlist }">
										<a class="tag" href="#">#${ t }</a>
									</c:forEach>
								</div>

								<div class="track-footer">

									<div class="track-footer-left" style="margin-top:10px;">

										<!-- <img id="like" src="resources/images/like.png"> -->

										<c:choose>
											<c:when test="${ b.llike == true }">
												<img class="love-full-img like" id="like${b.bNum }"
													src="resources/images/like2.png"
													onclick="loveClick('${sessionId }','${b.bNum}')"
													style="width:25px;">
											</c:when>

											<c:otherwise>
												<img class="love-empty-img like" id="like${b.bNum }"
													src="resources/images/like1.png"
													onclick="loveClick('${sessionId }','${b.bNum}')"
													style="width:25px;">
											</c:otherwise>
										</c:choose>

										<a href="resources${ b.bFileName }"
											download="${ b.bTitle }/${ b.bArtist }"> <img
											id="download" src="resources/images/download1.png"
											style="width:20px;">
										</a>
										<!-- <img id="comment" src="../resource/image/comment.png"> -->
										<img id="add_playlist" src="resources/images/playlist1.png"
										style="width:24px; height:22px;">
									</div>

									<div class="track-footer-right" style="margin-top:25px;">
										<ul class="track-status">
											<a href="#">
												<li class="like-li li-mini"><img
													id="like-mini mini-item"
													src="resources/images/like3.png"
													style="width:15px;"> <span
													class="like-num" id="lCount${b.bNum }">${feedLikeCount2[status.index]}</span></li>
											</a>
											<a href="#">
												<li class="comment-li li-mini"><img
													id="comment-mini mini-item"
													src="resources/images/reply1.png"
													style="width:14px;"> <span
													class="comment-num">${feedReplyCount2[status.index]}</span></li>
											</a>
										</ul>
									</div>
								</div>
							</div>

						</div>
					</c:forEach>


				</div>

				<div id="tab4" class="tab-content">

					<c:forEach var="p" items="${ pSearchList }">

						<c:url var="mypage" value="mypage">
							<c:param name="mNum" value="${ p.mNum }" />
						</c:url>

						<c:url var="playlistdetail" value="playlistdetail.pl">
							<c:param name="pNum" value="${ p.pNum }" />
						</c:url>

						<div class="plist-wrapper">
							<div class="plist-img-wrapper">
								<a href="${ playlistdetail }">
									<c:if test="${p.blist[0] == null}">
								<img src="resources/uploadFiles/imgs/default.jpg">
								</c:if>
								
								<c:if test="${p.blist[0] != null}">
								<img src="resources${ p.blist[0].bImgName }">
								</c:if>
								</a>
							</div>

							<div class="plist-right-wrapper">

								<div class="plist-info-wrapper">
									<div class="plist-name-wrapper">
										<a href="#">${ p.pName }</a>
									</div>

									<div class="uploader-name-wrapper">
										<a class="mypage-link-text" href="${ mypage }">${ p.mNick }</a>
									</div>

									<div class="mcount-wrapper">
										<p>총 ${ fn:length(p.blist) } 곡</p>
									</div>
								</div>

								<div class="plist-top3-wrapper">
									<ul>
										<c:forEach var="bInp" items="${ p.blist }">
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

			<!-- 페이징 -->
			<%-- <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="red" size="4"><b>[${ p }]</b></font>
				</c:if>

				<c:if test="${ p ne pi.currentPage }">
					<c:url var="pagination" value="bSearchList.bo">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
			</c:forEach>

			<!-- [다음] -->
			<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="after" value="bSearchList.bo">
					<c:param name="page" value="${ pi.currentPage + 1 }" />
				</c:url>
				<a href="${ after }">[다음]</a>
			</c:if> --%>
		</div>
	</section>

	<%@ include file="common/footer.jsp"%>

</body>
</html>