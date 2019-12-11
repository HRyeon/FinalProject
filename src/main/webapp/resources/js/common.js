function post_btn(me,post) {
	me.src="resources/images/" + post + ".png";
}

$(document).ready( function() {

	// 태그 클릭시 페이지 이동(공통 js)
	$('.tag').click(function(){
		var v= $(this).text();
		console.log(v);
		var tName = v.substring(1);
		//console.log(tName);

		// 이동할 페이지의 링크 저장
		var tagLink = 'bSearchList.bo?search='+tName;

		$(this).prop('href',tagLink); // 링크 설정
	});       
});

//하트 이미지 클릭시 발생 이벤트
function loveClick(mNum,bNum) {

	//로그인한 회원의 아이디 저장
	//var mNum = ${sessionId};
	console.log(mNum);

	var id= "#like" + bNum;
	console.log(id);

	var lbCount = "#lCount" + bNum;
	var lCount = $(lbCount).text();
	//console.log(lbCount);
	console.log(lCount);

	// 색칠된 하트일때 delete
	if($(id).attr('src') == 'resources/images/like2.png') {

		$.ajax({
			url : "lDelete.lo",
			data : {
				mNum : mNum,
				bNum : bNum
			},
			success : function(data) {
				console.log(data);
				console.log("삭제 성공!");

				$(id).attr('src', 'resources/images/like1.png');
				$(lbCount).text(Number(lCount)-1);
			},
			error : function(data) {
				console.log("error");
				console.log(data);
			}
		});
	} else { // 빈 하트일때 insert
		$.ajax({
			url : "lInsert.lo",
			data : {
				mNum : mNum,
				bNum : bNum
			},
			success : function(data) {
				console.log(data);
				console.log("insert 성공!");

				$(id).attr('src', 'resources/images/like2.png');
				$(lbCount).text(Number(lCount)+1);
			},
			error : function(data) {
				console.log("error");
				console.log(data);
			}
		});
	}	
}

document.onkeydown = trapRefresh;
function trapRefresh() {
	
	if(event.keyCode == 116) {
		event.keyCode = 0;
		event.cancelBubble = true;
		event.returnValue = false;
		document.location.reload();
	}	
}

