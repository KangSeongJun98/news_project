<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/resources/css/login.css" rel="stylesheet">

<meta charset="UTF-8">
<title>로그인</title>
</head>
<c:if test="${not empty msg}">
	<script>
		alert("${msg}")
	</script>
</c:if>
<body style="background-color: rgba(31, 45, 60, 0.8)">
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<!-- Contact Section-->
	<div class="container">
		<div class="row" style="margin-top: 200px"></div>
		<form action='<c:url value="/updateDo" />'>
			<h2>
				<span class="entypo-login"><i class="fa fa-user-circle"></i></span>
				My Page
			</h2>
			<button class="submit" style="height: 200px;">
				<span class="entypo-lock"><i class="fa fa-pencil-square-o"></i></span>
			</button>
			<!-- 아이디  -->
			<input disabled type="text" value="${sessionScope.login.memId }"
			 placeholder="urserId" />
			<input type="hidden" name="memId" value="${sessionScope.login.memId }"/>
			<!-- 닉네임  -->
			<input type="text" name="memNm" value="${sessionScope.login.memNm }"
			placeholder="userNm" />
			<!-- 전화번호  -->
			<input type="text" name="memTel" value="${sessionScope.login.memTel}"
			placeholder="userTel" />
	
		</form>
	</div>
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

	<!-- 로그인 스크립트 -->
	<script>
		$(".user").focusin(function() {
			$(".inputUserIcon").css("color", "#e74c3c");
		}).focusout(function() {
			$(".inputUserIcon").css("color", "white");
		});

		$(".pass").focusin(function() {
			$(".inputPassIcon").css("color", "#e74c3c");
		}).focusout(function() {
			$(".inputPassIcon").css("color", "white");
		});
	</script>
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>
