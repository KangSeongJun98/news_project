<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>뉴스검색</title>
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

	  // btn-all-close
	  const btnAllClose = document.querySelector("#btn-all-close");
	  
	  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
	  for( let i=0; i < panelFaqContainer.length; i++ ) {
	    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
	      // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
	      panelFaqAnswer[i].classList.toggle('active');
	    });
	  };
	  
	  btnAllClose.addEventListener('click', function() {
	    // 버튼 클릭시 처리할 일  
	    for(let i=0; i < panelFaqAnswer.length; i++) {
	        panelFaqAnswer[i].classList.remove('active');
	    };
	  });
	}
</script>
<script>
let text="Fri, 15 Mar 2024 12:24:00 +0900";
console.log(str_to_date(text));
function str_to_date(str){

    // Date 객체 생성
    let date = new Date(str);

    // 원하는 형식으로 날짜를 표시 (예: '년-월-일 시:분:초')
    let formattedDate = date.toLocaleString('ko-KR', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hour12: false // 24시간 형식 사용
});
    return formattedDate;
}

</script>
</head>
<body>
	<!-- 탑 -->
	<div>
		<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	</div>
	<div class="container" style="text-align: center; padding-top: 100px;">
		<button id="btn-all-close">FAQ ALL Close</button>
		<table class="table table-hover">

			<h2 class="heading-section">실시간검색어 for문</h2>

			<caption>FAQ List of Articles</caption>
			<thead class="thead-light text-center">
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>본문</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody class="text-center">
				<c:forEach items="${newsList}" var="news" begin="1" end="100"
					step="1" varStatus="status">

					<tr>
						<td>${status.count}</td>
						<td>
							<div class="panel-faq-container">
								<p class="title">${news.title}</p>
								<div class="panel-faq-answer">
									<p>QUICKCATCH ... ↓</p>
									<p>본문 내용 마구마구 마구마구마구마구.</p>
								</div>
							</div>
						</td>
						<td><a href="${news.link}">${news.description}</a></td>
						<td>str_to_date(${news.pubDate})</td>

					</tr>
				</c:forEach>
				<tr>
					<td>2</td>
					<td class="text-left" width="50%">
						<div class="panel-faq-container">
							<p class="title">Where does it come from?</p>
							<div class="panel-faq-answer">
								<p>Answer (2) ... ↓</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua. Ut enim ad minim veniam, quis nostrud exercitation
									ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
									aute irure dolor in reprehenderit in voluptate velit esse
									cillum dolore eu fugiat nulla pariatur.</p>
								<p>Excepteur sint occaecat cupidatat non proident, sunt in
									culpa qui officia deserunt mollit anim id est laborum.</p>
							</div>
						</div>
					</td>
					<td>회원가입</td>
					<td>2032.02.02</td>
					<td>114</td>
				</tr>

			</tbody>
		</table>
	</div>
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<script>
	$(document).ready(function(){
	    $(".title").click(function(){
	    	alert($(this).html());
	        let title = $(this).html(); 
	        /* let subUrl = "http://127.0.0.1:5000/get_detail?title=" + title; */
	        let subUrl = "http://127.0.0.1:5000/";
	        $.ajax({
	            url: subUrl,
	            type: "POST",
	            data: {"title":title},
	            success: function(res){
	                console.log(res);
	                let json = res;
	            },
	            error: function(e){
	                console.log(e);
	            }
	        });
	    });
	});
	</script>
</body>
</html>