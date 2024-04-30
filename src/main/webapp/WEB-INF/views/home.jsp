<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>뉴스 프로젝트</title>
</head>
<c:if test="${not empty msg}">
	<script>
		alert("${msg}")
	</script>
</c:if>
<body>
	<!-- top  -->
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<section class="banner-sec" id="home">
		<div class="container">
			<div class="row">
				<div class="jumbotron">
					<h1>QuickCatch News</h1>
					<h2>A News Summarization Program</h2>
					<form action='<c:url value='/newsView' />'>
						<div class="input-group mb-3">
							<input id='query' name="query" type="text" placeholder="search for" class="form-control">
							<span class="input-group-btn">
								<button type="submit" class="btn btn-search">Search</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- footer  -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
    
</body>
</html>
