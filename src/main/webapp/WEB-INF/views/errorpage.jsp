<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/errorpage.css">

<meta charset="UTF-8">
<title>tikita</title>
</head>
<body>
	<br>
	  <div id="error"><img src="resources/images/error.png" /></div>
	<div id="errorpage">
		${msg} <br> <br> <br> 
	
	
		<input type="button" value="뒤로가기"
			onclick="history.back(-1);" 
			style=" border-radius:10px;">

	</div>
</body>
</html>




 