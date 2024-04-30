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
<body> <!-- style="font-size: 25px" -->
	<!-- 탑 -->
	<div>
		<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	</div>
	<div class="container" style="text-align: center; padding-top: 100px;">
		<table class="table table-hover">
			<caption><h4 style="">${sessionScope.login.memId} 님의 스크랩 뉴스</h4></caption>

			<thead class="thead-light text-center">
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>내용</th>
					<th>날짜</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${clippingList}" var="clipping" 
				begin="0" end="100" step="1" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td><a href="${clipping.newsLink}">${clipping.newsTitle}</a></td>
						<td>${clipping.newsContent}</td>
						<td>${clipping.clippingDate}</td>
						<td><i style="cursor: pointer" class="dle_clipping fa fa-times" aria-hidden="true"></i></td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
	</div>
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<script>
	// 스크랩 삭제 클릭
	$(document).ready(function () {
		$(".dle_clipping").click(function () {
			if (confirm("삭제하시겠습니까?")) {
				let el = $(this).closest('tr'); // 클릭된 클리핑 아이콘이 포함된 행(tr)을 가져옴
				let newsLink = el.find('td:eq(1) a').attr('href').trim(); // 해당 행의 링크 정보를 가져옴
				$.ajax({
					url: '<c:url value="/clippingDel" />',
					type: "POST",
					contentType: "application/json",
					data: JSON.stringify({
						memId: "${sessionScope.login.memId}",
						newsLink: newsLink
					}),
					success: function (res) {
						if (res == 'Y') {
							el.find('.dle_clipping').removeClass('fa-star').
								removeClass('dle_clipping').addClass('get_clipping').addClass('fa-star-o');
							location.reload();
							alert("삭제하였습니다.");
						} else if (res == 'N') {
							alert("스크랩되지 않은 뉴스입니다.")
						}

					},
					error: function (e) {
						console.log(e);
					}
				});
			}
		})
	});
	
	</script>
</body>
</html>