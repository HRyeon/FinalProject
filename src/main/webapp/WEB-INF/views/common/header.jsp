<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/header.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>
<title>Insert title here</title>
</head>
<body>
	<header>
		<div id="head">
			<ul>
				<li style="position:relative; left:-115px;"><a href="blist.me" class="head_on"><img src="resources/images/logo.png" style="width:100px;"/></a></li>
				<li><a href="best" class="head_on">BEST</a></li>
				<li>
					<form action="bSearchList.bo" method="post">
						<input type="search" name="search" /> <input type="submit"
							value="검색" />
					</form>
				</li>
				
				
				<li><a href="#"><img src="resources/images/notice.png"
						onclick="alarmList()" id="onAlarm" class="onAlarm1" /></a></li>
				<!-- <li><a href="#"><img src="resources/images/message.png"
						style="width: 17px;" /></a></li> -->

				<c:url var="mypage" value="mypage">
					<c:param name="mNum" value="${sessionId}" />
				</c:url>
				<li><a href="${mypage}" class="head_on">MY PAGE</a></li>
				<li style="margin-right:15px;" class="head_on"><a href="logout">LOGOUT</a></li>
			</ul>

			<div id="alarm">
				<!-- 반복문은 이 다음부터 -->
			</div>

			<script>
				/* $.ajax({
				var mNum = ${sessionId};

				url : "alarm",
				type : "post",
				data : { mNum : mNum },
				success : function(data){
					for (var i in data.alarm)
					{
						var aStatus = data.alarm[i].aStatus
						
						if (aStatus == 'N')
						{
							$(".onAlarm1").append("<span>!</span>");
						}
					}
				}
				}); */

				// 알람 링크 클릭시 Alarm테이블에 aStatus 'Y'로 update
				function updateAlarm(aNum) {

					$.ajax({
						url : "updateAlarm",
						type : "get",
						data : {
							aNum : aNum
						},
						success : function(data) {
							console.log(aNum);
							console.log(aStatus);
						} // function
					}); // ajax
				} // updateAlarm()

				// 알람아이콘 클릭시 알람리스트 보여주기, 숨기기
				// 알람리스트 불러오기
				// 알람 클릭시 해당 디테일 페이지로 이동
				function alarmList() {

					var listDisplay = document.getElementById("alarm");
					var mNum = ${sessionId};

					if (listDisplay.style.display == "block")
					{
						listDisplay.style.display = "none";

						$("#alarm a").remove();
					} else
					{
						listDisplay.style.display = "block";

						$.ajax({
							url : "alarm",
							type : "post",
							data : {
								mNum : mNum
							},
							success : function(data) {
								console.log("성공");
								console.log(mNum);

								for ( var i in data.alarm) {
									var mNick = data.alarm[i].mNick;
									var aType = data.alarm[i].aType;
									var mProfile = data.alarm[i].mProfile;
									var aUrl = data.alarm[i].aUrl;
									var aStatus = data.alarm[i].aStatus;
									var aNum = data.alarm[i].aNum;
									var aContent;
									var classStyle = "alarmList";

									console.log(mNick);
									console.log(aType);
									console.log(mProfile);
									console.log(aUrl);
									console.log(aStatus);
									console.log(aNum);

									if (aType == "reply") {
										aContent = mNick
												+ "님이 댓글을 작성하였습니다.";
									} else if (aType == "love") {
										aContent = mNick
												+ "님이 회원님의 게시물을 좋아합니다.";
									} else if (aType == "follow") {
										aContent = mNick
												+ "님이 회원님을 팔로우합니다.";
									}

									console.log(aContent);

									if (aStatus == 'N') {
										classStyle = "alarmList2";
									} else if (aStatus == 'Y') {
										classStyle = "";
									}

									var $on = $('<a href="'
											+ aUrl
											+ '" onClick="updateAlarm('
											+ aNum
											+ ');">'
											+ '<div class="alarmList ' + classStyle + '">'
											+ '<img src="' + mProfile + '" class="alarm_pro"/>'
											+ '<p class="alarm_con">'
											+ aContent + '</p>'
											+ '</div>' + '</a>');

									$("#alarm").append($on);

								} // for
							} // function
						}); // ajax
					} // else
				} // alarmList()
			</script>
		</div>
	</header>
</body>

</html>