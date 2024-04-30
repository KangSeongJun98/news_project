<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>실시간검색어</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="/resources/css/news.css" rel="stylesheet">
<link href="/resources/css/font.css" rel="stylesheet">

</head>
<body style="font-size: 25px">
	<div class="wrapper">
		<!-- 탑 -->
		<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
		<div class="container" style="text-align: center; padding-top: 100px;">
			<table class="table table-hover">
				<caption>
					<h4>기준일: ${realTimeList[0].referenceDate}</h4>
				</caption>
				<thead class="thead-light text-center">
					<tr>
						<th>No</th>
						<th>Title</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${realTimeList}" var="realTime">
						<tr>
							<td>${realTime.searchRank}</td>
							<td><a
								href="<c:url value='/newsView'>
                                     <c:param name='query' value='${realTime.searchContent}'/>
                                  </c:url>">${realTime.searchContent}</a></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	</div>
</body>
</html>