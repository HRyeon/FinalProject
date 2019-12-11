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
<link rel="stylesheet" type="text/css" href="resources/css/section.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/playlistDetail.css">

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>
<title>PlaylistDetail</title>
</head>
<body>
	<%@ include file="common/header.jsp"%>

	<section>
		<div class="songbox" id="songbox">
			<div class="song">

				<div class="all_song">

					<div class="play_btn">
						<img src="resources/images/play.png"
							onmouseover="post_btn(this,'play')"
							onmouseout="post_btn(this,'play')" />
					</div>

					<p class="song_Title">${p.pName }</p>
					<p class="song_singer">총 ${ fn:length(p.blist) } 곡</p>
				</div>

			</div>

			<span class="song_img"> <img
				src="resources${p.blist[0].bImgName }"
				style="width: 190px; height: 190px;" />
			</span>

		</div>

		<div id="all">
			<div class="content">
				<div class="pro_content">
					<!-- <a href="#"> -->

					<div class="pro_con_img">
						<c:url var="mypage" value="mypage">
							<c:param name="mNum" value="${p.mNum }" />
						</c:url>
						<a href='${mypage}'> <img style="width:130px; height:130px" src="${ p.mProfile}" />

						</a>
					</div>

					<p class="pro_con_id">${p.mNick }</p>

					<!-- </a> -->

					<div class="pro_con_foll">
						<img src="resources/images/people1.png" />
						<p class="pro_con_foll_num">${pfollowerCount }</p>
					</div>

					<div class="pro_con_track">
						<img src="resources/images/music.png" />
						<p class="pro_con_track_num">${ptrackCount }</p>
					</div>


				</div>

				<div class="con_content">
					<div class="post_content">


						<!-- <div class="all_playlist">
							<div class="all_song">
							<div class="playlist_img">
								<div class="play_btn">
								<img src="resources/images/testimg1.jpg" />
							</div>

							<p class="playlist_Title">노래제목</p>
							<p class="song_Title">
							<p class="playlist_singer">가수이름</p>
							<p class="song_singer">

							<div class="playlist_btn">
								<img src="resources/images/play.png" />
							</div>


						</div> -->

						<table>
							<c:forEach var="p" items="${p.blist}" varStatus="status">


								<tr>
									<td rowspan="2"><img src="resources${p.bImgName }"
										style="width: 50px" /></a></td>
									<td><p class="playlist_Title">${p.bTitle }</p></td>


								</tr>

								<tr>
									<td><p class="playlist_singer">${p.bArtist }</p></td>
									<td><input class="get1" type="hidden" value="${p.bNum }" />
										<input class="get2" type="hidden" value="${p.bTitle }" /> <input
										class="get3" type="hidden" value="${p.bFileName }" /> <img
										class="play_btn" src="resources/images/play.png"
										onmouseover="post_btn(this,'play1')"
										onmouseout="post_btn(this,'play')" style="width: 26px;" /></td>
								</tr>
							</c:forEach>

						</table>



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







					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br> <br> <br>
				</div>

				<div class="side"></div>
			</div>
	</section>
	<%@ include file="common/footer.jsp"%>
</body>
</html>