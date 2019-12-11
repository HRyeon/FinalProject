<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="com.finalproject.tikita.playlist.model.vo.Playlist" %>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="resources/css/header.css">
     <link rel="stylesheet" type="text/css" href="resources/css/playlist.css">
     <script src="//code.jquery.com/jquery.min.js"></script>
     
    
    <title>tikita</title>
</head>

<style>

#frame1 {
/*    height: 800px; */
   height: 90vh;    
 
   bottom: 0;
   display: block;
}

#frame2 {
   display: block;
   height: 10vh;
   position: fixed;
   bottom: 0;
  
   
}

</style>

<body>

<!-- <a href="./main" target="frame1"> -->
 
 

<iframe src="blist.me" frameborder ="0" width="100%" name="frame1" id="frame1">
 
</iframe>
 
<br>


<iframe src="PlayList.pl" frameborder ="0" width="100%"  name="frame2" id="frame2">
 
</iframe>
<%-- <input type="hidden" value="${sessionScope.nlist.bTitle }" id="bt"> --%>
<%-- <input type="hidden" value="${sessionScope.nlist.bNum }" id="bn"> --%>
<%-- <input type="hidden" value="${sessionScope.nlist.bFileName }" id="bf"> --%> 
         
  
</body>

<script>

document.onkeydown = trapRefresh;

function trapRefresh() {
   
   if(event.keyCode == 116) {
      event.keyCode = 0;
      event.cancelBubble = true;
      event.returnValue = false;
      document.frame1.location.reload();
   }   
}

</script>
</html>