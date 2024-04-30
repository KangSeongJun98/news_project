<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/resources/css/login.css" rel="stylesheet">

<meta charset="UTF-8">
<title>회원가입</title>
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
		<form action='<c:url value="/registDo" />'>
			<h2>
				<span class="entypo-login"><i class="fa fa-user-plus"></i></span>
				Regist
			</h2>
			<button class="submit" style="height: 335px;">
				<span class="entypo-lock"><i class="fa fa-registered"></i></span>
			</button>
			<!-- 아이디  -->
			<input type="text" name="memId" required pattern="[a-zA-Z가-힣0-9]{4,15}" placeholder="아이디(4~15글자)" /> 
			<!-- 비밀번호  -->
			<input type="password" name="memPw" required pattern="[a-zA-Z0-9]{4,15}" placeholder="비밀번호" />
			<!-- 비밀번호 확인  -->
			<input type="password" name="pwCheck" required placeholder="비밀번호 확인" />
			<!-- 닉네임  -->
			<input type="text" name="memNm" placeholder="이름" />
			<!-- 전화번호  -->
			<input type="text" name="memTel" required pattern="[0-9]{11}" placeholder="연락처(숫자만 입력)" />
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