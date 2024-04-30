<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!--Bootstrap core CSS-->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!--Custom Fonts-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
	
<link href="/resources/css/custom.css" rel="stylesheet">
<link href="/resources/css/font.css" rel="stylesheet">

<link rel="stylesheet" href="/resources/css/contact-input-style.css">
<link rel="stylesheet" href="/resources/css/hover-effect.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/font-awesome.min.css" />
<nav class="navbar navbar-default top-bar affix" data-spy="affix"
	data-offset-top="250" style="background-color: rgba(31, 45, 60);">
	<div class="container">
		<div class="row">
			<div class="navbar-header page-scroll">
				<button data-target="#bs-example-navbar-collapse-1"
					data-toggle="collapse" class="navbar-toggle" type="button">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="<c:url value="/" />" class="navbar-brand">Home</a>
			</div>
			<div id="bs-example-navbar-collapse-1"
				class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value="/realTimeView" />">실시간 검색어</a></li>
					<!-- 로그인 안했을 때  -->
					<c:if test="${sessionScope.login == null}">
					<li><a href="<c:url value="/loginView" />" >로그인</a></li>
					<li><a href="<c:url value="/registView" />" >회원가입</a></li>
					</c:if>
					
					<!-- 로그인 했을 때  -->
					<c:if test="${sessionScope.login != null}">
					<li><a href="<c:url value="/getClipping" />" >스크랩</a></li>
					<li><a href="<c:url value="/myPageView" />" >마이페이지</a></li>
					<li><a href="<c:url value="/logoutDo" />" >로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</nav>