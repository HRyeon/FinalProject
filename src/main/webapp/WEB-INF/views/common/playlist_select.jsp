<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>
<title>Insert title here</title>
</head>

<style>
a {
	text-decoration: none !important;
}

/* 마스크 띄우기 */
#mask {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

/* 팝업으로 뜨는 윈도우 css  */
.window {
	display: none;
	position: absolute;
	left: 40%;
	top: 150px;
	/* margin-left: -175px; */
	/* margin-top: -300px; */
	width: 350px;
	height: 400px;
	background-color: #FFF;
	z-index: 10000;
	border-radius: 15px;
	margin: 0 auto;
}

.popup {
	width: 350px;
	height: 400px;
	vertical-align: middle;
}

.popup-header {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid gainsboro;
	text-align: center;
}

.popup-header .close {
	width: 50px;
	height: 100%;
	float: right;
}

.popup-header .head {
	width: 200px;
	padding-left: 65px;
	float: left;
}

.popup-header .head p {
	font-size: 15px;
	color: grey;
	margin-top: 15px;
}

/* popup-content */
.popup-content {
	width: 100%;
	/* height: 550px; */
	overflow: auto;
}

.popup-playlist {
	width: 100%;
	height: 60px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.plist-img-wrapper2 {
	float: left;
	width: 70px;
	height: 70px;
	margin-left: 20px;
}

/* .popup-playlist .img-wrapper img {
	width: 100%;
	height: 100%;
	border-radius: 30px;
} */
.pImg {
	width: 70px;
	height: 70px;
}

.popup-name-wrapper {
	float: left;
	margin-left: 15px;
	margin-top: 20px;
}

.popup-header .close {
	font-size: 30px;
	font-weight: 300;
	color: rgb(63, 61, 61);
}

.popup-right-wrapper {
	margin-left: 20px;
}

.select-btn-wrapper {
	width: 50px;
	height: 100%;
	float: right;
	margin-right: 30px;
	margin-top: 10px;
}

.select-btn, .add-playlist {
	height: 40px;
	background-color: rgb(248, 244, 244);
	border: 1px solid gainsboro;
	border-radius: 8px;
	cursor: pointer;
	padding: 2px 10px;
}

.select-btn:hover {
	background-color: gainsboro;
}

.add-btn-wrapper {
	text-align: center;
}

.add-btn-wrapper .add-playlist {
	margin: 0 auto;
	margin-top: 10px;
	display: inline-block;
	height: 30px;
	padding: 4px 10px;
}

.pInsert-div {
	margin-top: 10px;
	text-align:center;
}

.pName-input {
	display: inline-block;
}

</style>

<body>

	<!-- 플레이리스트 레이어팝업 -->
	<div id="mask"></div>
	<div class="window">
		<div class="popup">
			<div class="popup-header">
				<div class="head">
					<p>플레이리스트</p>
				</div>
				<a href="#" class="close">X</a>
				<!-- <div class="close-wrapper"><a href="#" class="close">X</a></div> -->
			</div>

			<div class="popup-add-playlist">
				<div class="add-btn-wrapper">
					<input type="button" class="add-playlist" value="새로 만들기">
				</div>
			</div>

			<div class="pInsert pInsert-div" style="display: none;">
				<input type="text" class="pName pName-input" /> <input type="submit" value="등록"
					class="pInsertbtn" />
			</div>

			<div class="popup-content">



<!-- 				<div class="popup-playlist"> -->
<!-- 					<div class="plist-img-wrapper2"> -->
<!-- 						<img class="pImg" src="resources/images/iu.jpg"> -->
<!-- 					</div> -->
<!-- 					<div class="popup-right-wrapper"> -->
<!-- 						<div class="popup-name-wrapper"> -->
<!-- 							<p>iu 노래모음</p> -->
<!-- 						</div> -->
<!-- 						<div class="select-btn-wrapper"> -->
<!-- 							<input type="button" class="select-btn" value="선택"> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

			</div>

		</div>
	</div>
</body>

<script type="text/javascript">
/* 레이어팝업 */
function wrapWindowByMask() {

	//화면의 높이와 너비를 구한다.
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();

	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	$("#mask").css({
		"width" : maskWidth,
		"height" : maskHeight
	});

	//애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

	$("#mask").fadeIn(0);
	$("#mask").fadeTo("slow", 0.6);

	//윈도우 같은 거 띄운다.
	$(".window").show();
}

$(document).ready(function() {

	$('.window').hide();
	
	//검은 막 띄우기
	$(".openMask").click(function(e) {
		e.preventDefault();
		wrapWindowByMask();
	});

	//닫기 버튼을 눌렀을 때
	$(".window .close").click(function(e) {
		//링크 기본동작은 작동하지 않도록 한다.
		e.preventDefault();
		$("#mask, .window").hide();
	});

	//검은 막을 눌렀을 때
	$("#mask").click(function() {
		$(this).hide();
		$(".window").hide();

	});

});

$(document).ready(function() {

	// 태그 클릭시 페이지 이동(공통 js)
	$('.openMask').click(function() {
		var bNum = $(this).parent().parent().parent().children().children(".hdbNum").val();
		console.log(bNum);
		$.ajax({
			url:"plistbyId.pl",
			data : {bNum : bNum},
			success : function(data) {
				
				console.log(bNum);
				console.log("select 성공!");

				var $start = $('.popup-content'); // review 테이블에 내용 추가

	            $('.popup-content *').remove();
				
				 for(var i in data.plistbyId) {
					 
					 
					 
					 
					var $div1 = $('<div class="popup-playlist">'+
									'<div class="plist-img-wrapper2">'+
									'<img class="pImg" src="resources' + data.plistbyId[i].pImg + '"></div>'+
									'<div class="popup-right-wrapper">'+
									'<div class="popup-name-wrapper">'+
									'<p class="p-name">' + data.plistbyId[i].pName + '</p>' +'</div>' +
									'<div class="select-btn-wrapper">' +
									'<input type="button" class="select-btn" value="선택">'+
									'<input type="hidden" class="hdbnum2" value="' + data.bNum + '">' +
									'<input type="hidden" class="hdpnum2" value="' + data.plistbyId[i].pNum + '">'
									);
					
					//$div0.append($div1);
					$start.append($div1);
					
					
				} 
				 $(".select-btn").on('click', function(){
						 
				 		var bNum = $(this).parent().children(".hdbnum2").val();
				 		var pNum = $(this).parent().children(".hdpnum2").val();
				 	 
				 		$.ajax({
				            url : "mInsert.pl",
				            data : {
				              bNum : bNum, pNum:pNum
				            },
				            type : "post",
				            success : function(data) {
				               location.reload(); 
				            }
				         });
				      });
				
			},
			
			error : function(data) {
				console.log("error");
				console.log(data);
			}
		});
	
	});
	
	
	
	
	$(".add-playlist").on('click', function() {
        $(".pInsert").toggle();
        /* $(this).parent().children(".pInsert").toggle(); */
     });
   
   
   $(".pInsertbtn").on('click', function() {
     var pName = $(".pName").val();

         $.ajax({
            url : "pInsert.pl",
            data : {
               pName : pName
            },
            type : "post",
            success : function(data) {
               location.reload(); 
            }
         });
      });

});




</script>

</html>