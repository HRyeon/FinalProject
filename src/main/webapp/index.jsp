<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>

	<jsp:forward page="login" /> 

	<h1 align="center">인덱스 페이지</h1>
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />

	<h1 align="center">
      <a href="login">login</a>
   </h1>

	<c:url var="main" value="blist.me">
      <c:param name="mNick" value="홍시" />
   </c:url>
	
	<c:url var="searchResult" value="bSearchList.bo">
      <c:param name="search" value="iu" />
   </c:url>
	
	<!-- 10.16 -->
	<c:url var="mypage" value="mypage">
      <c:param name="mNum" value="11864750" />
   </c:url>
    <h1 align="center">
      <a href="iframe">iframe</a>
   </h1>

</body>
</html>