<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="resources/css/boardform.css">
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="resources/css/footer.css">
<style>
.maincontent {
	padding:0px;
	margin:0 auto;
	border:0px;
	width:383px;
}
</style>
<title>Tikita</title>
</head>

<body>
	<%@ include file="common/header.jsp"%>

	<section>
		<div id="all">
			<div class="maincontent">
				<div style="display: inline-block;">

					<br>
					<form method="post" enctype="multipart/form-data" action="boardwrite.me">
						
					<td>Title</td> <br>

					<textarea name="Title" cols="52" rows="2"
						style="border-radius: 10px;"></textarea>
					&nbsp &nbsp &nbsp &nbsp &nbsp

					<div style="display: inline-block; float: right;">
		 
<!-- 						<img src="resources/images/world.png" width="300px" height="150px"> -->
					<input type="file" name="upup" style="margin-top:13px;"/>
 
						
					</div>

					<br> <br>
					<td>Artist</td> <br>
					
					<textarea name="Artist" cols="52" rows="2"
						style="border-radius: 10px;"></textarea>
					
					&nbsp &nbsp &nbsp &nbsp &nbsp <br><br>
					<td>Content</td> <br>

					<textarea name="Content" cols="52" rows="15"
						style="border-radius: 10px;"></textarea>

					<br> <br>
					
					 <td>Tag</td> <br>
					
					<textarea name="tagArea" class="tagArea" 
						placeholder="#내용#내용..."
						cols="52" rows="2"
						style="border-radius: 10px;"></textarea>
					
					&nbsp &nbsp &nbsp &nbsp &nbsp <br><br>
 
					<div align="center">
						<input type="submit" value="확인"> <input type="reset" value="취소">
					</div>
					</form>
				</div>

			</div>
			 
	</section>

	<%@ include file="common/footer.jsp"%>
</body>
</html>