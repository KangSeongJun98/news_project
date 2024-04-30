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

<script>
window.onload = () => {
	  // panel-faq-container
	  const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
	  
	  // panel-faq-answer
	  let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

	  
	  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
	  for( let i=0; i < panelFaqContainer.length; i++ ) {
	    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
	      // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
	      panelFaqAnswer[i].classList.toggle('active');
	    });
	  };
	}
</script>
</head>
<body style="font-size: 25px">
	<!-- 탑 -->
	<div>
		<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	</div>
	<div class="container" style="text-align: center; padding-top: 100px;">
		<table class="table table-hover">
			<caption><h4>기준일: ${realTimeList[0].referenceDate }</h4></caption>

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
						<td>${realTime.searchContent}</td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
	</div>
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>