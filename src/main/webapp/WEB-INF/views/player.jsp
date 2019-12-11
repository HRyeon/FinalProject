<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.finalproject.tikita.playlist.model.vo.Playlist" %>

<% ArrayList<Playlist> nlist = (ArrayList)session.getAttribute("sessionList"); %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
     <link rel="stylesheet" type="text/css" href="resources/css/playlist.css">
     <script src="//code.jquery.com/jquery.min.js"></script>
     
    
    <title>tikita</title>
</head>
<body>

<!-- <a href="./main" target="frame1"> -->



<%-- <input type="hidden" value="${sessionScope.nlist.bTitle }" id="bt"> --%>
<%-- <input type="hidden" value="${sessionScope.nlist.bNum }" id="bn"> --%>
<%-- <input type="hidden" value="${sessionScope.nlist.bFileName }" id="bf"> --%>



			<div style="position: fixed; left:0px; top:0px; width:100%; height:100px; background:#f2f2f2; border-top:1px solid #dedede; margin: auto;">
			
			

			<button id='play-late' style="background-color:#f2f2f2; border:0px; margin:30px 0 0 110px; vertical-align:super; padding:0px; position:relative; top:2px;"><img src="resources/images/prePlay.png" style="width:15px;"/></button>
			
			<audio id="myaudio" preload="auto" onended="plfn();" controls autoplay style="width:500px;height:20px;">
				<source id="main">
		<% for(int i=0; i<nlist.size(); i++){
			nlist.get(i).setbFilename("resources"+(nlist.get(i).getbFilename()));
	 	%> 
	 	<source src="<%=nlist.get(i).getbFilename() %>">
	 	
	 	<% 
	     }
 		 %>

			</audio>
			<button id='play-next' style="background-color:#f2f2f2; border:0px; vertical-align:super; padding:0px; position:relative; top:2px;"><img src="resources/images/nextPlay.png" style="width:15px;"/></button>
		
<script>
<%-- <%=(int)session.getAttribute("pindex")%>; --%>
var index = 1;
function plfn() {
	index++;
// 	session.setAttribute("pindex", index);
	if(index > $('#myaudio source').length) index=2;
	console.log( index + '번째 소스 재생' );
	console.log($('#myaudio source#main').attr('src'));

	$('#myaudio source#main').attr('src',
		$('#myaudio source:nth-child('+index+')').attr('src'));
	$("#myaudio")[0].load();
	$("#myaudio")[0].play();
};

$('#play-next').click(function() {
// 	alert($('#myaudio source#main').attr('src'));
	index++;
	if(index > $('#myaudio source').length) index=2;
	console.log( index + '번째 소스 재생' );

	$('#myaudio source#main').attr('src',
		$('#myaudio source:nth-child('+index+')').attr('src'));
	$("#myaudio")[0].load();
	$("#myaudio")[0].play();
});

$('#play-late').click(function() {
	index--;
	if(index < 2) index=$('#myaudio source').length;
	console.log( index + '번째 소스 재생' );
	$('#myaudio source#main').attr('src',
		$('#myaudio source:nth-child('+index+')').attr('src'));
	$("#myaudio")[0].load();
	$("#myaudio")[0].play();
});
</script>



	
<%-- 	<% --%>
<!--  		String context = request.getContextPath(); -->
<%-- 	%> --%>
	<div style="position:absolute; right:50px;top:-10px;">
	<li class="nowlist" style="list-style: none; ">
	
	<a style="position:absolute; right: 480px; top:15px; /* width:100px;  */cursor:pointer; margin-top:25px;"><img src="resources/images/frame_list.png" style="width:20px;"/></a>                    
	
	<ul id="ull" class="hide" style="overflow:scroll;white-space:nowrap; margin-top:9px; margin-right:80px; border:1px solid #dedede;">
	 <% for(int i=0; i<nlist.size(); i++){
	 	%> 
	 	<li style="margin-bottom: 8px; font-size:14px; color:#666;"><%=i+1%>번 : <%=nlist.get(i).getbTitle() %><img src="resources\images\trash.png" class="rmbtn" style="float:right; width:12px; cursor:pointer; /* height:12px; */"/></li>
	 	<% 
	     }
 		 %>
	
	 
<%-- 	 <c:forEach var="nl" items="${sessionList.getbTitle }"> --%>
<%-- 	 <li>${ nl}</li> --%>
<%-- 	 </c:forEach> --%>
	
	
    </ul>
    </li>
    </div>
      <script>
		$(function(){
			 $(".rmbtn").click(function(){
		 			var wNum = $(this).parent().index();
		 			console.log(wNum);
		 			 
		 			
		 			  $.ajax({
		 			        type:"POST",
		 			        url:"nowpldelete",
		 			        data : {wNum:wNum},
		 			       
		 			        success: function(data){
		 			        	window.location.reload(true);
		 			        } 
		 			    });
		 		});
		});
	</script> 
        <script>

     $(document).ready(function () {
    	 
    	

         $(".nowlist>a").click(function () {
             var nolist = $(this).next("ul");
            
          

             nolist.slideToggle();  
            
     
             
            
         });
         
         
     });
     
//      $(".nowlist>a").click(function () {
    	 
//     	 var nowlist = "${ nlist.bTitle }";
        
//  		$("#ull").append("<li>" + nowlist + "</li>");
//      });
     </script>
<%--      <label><%= molist %></label> --%>
</div>
   
</body>
</html>