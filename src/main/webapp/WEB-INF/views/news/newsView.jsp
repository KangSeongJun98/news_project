<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>뉴스검색</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="/resources/css/news.css" rel="stylesheet">
<link href="/resources/css/font.css" rel="stylesheet">
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
</head>
<body>
	<!-- 탑 -->
	<div>
		<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	</div>
	<div class="container" style="text-align: center; padding-top: 100px;">
		<button id="btn-all-close">ALL Close</button>
		<table class="table table-hover">
			<caption>${query}의 검색결과</caption>
			<thead class="thead-light text-center">
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>날짜</th>
					<c:if test="${sessionScope.login != null}">
						<th></th>
					</c:if>
				</tr>
			</thead>
			<tbody class="text-center">
				<c:forEach items="${newsList}" var="news" begin="0" end="100"
					step="1" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>
							<div class="panel-faq-container">
								<p class="title" style="cursor: pointer">
									<strong>${news.title}</strong>
								</p>
								<div class="panel-faq-answer">
									<p>QUICKCATCH ... ↓</p>
									<p>${news.description}</p>
									<a class='newslink'href="${news.link}" target="_blank">${news.link}</a>
								</div>
							</div>
						</td>
						<td>${news.pubDate}</td>

						<!-- 로그인 됐을 때 스크랩 페이지가 나옴  -->
						<c:if test="${sessionScope.login != null}">
							<td>
								<!-- 스크랩 여부를 확인하여 별 아이콘 표시 --> <!-- 스크랩된 뉴스인 경우 --> 
								<c:if test="${fn:contains(scrapedNews, news.link)}">
									<i style="cursor: pointer" class="dle_clipping fa fa-star"></i>
								</c:if> 
								<!-- 스크랩되지 않은 뉴스인 경우 --> 
								<c:if test="${!fn:contains(scrapedNews, news.link)}">
									<i style="cursor: pointer" class="get_clipping fa fa-star-o"></i>
								</c:if>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<script>
	$(document).ready(function () {
		// 뉴스 요약
		$(".title").click(function () {
			let el = $(this).parent();
			console.log("el=============");
			console.log(el);
			let title = $(this).html();
			let newsLink = el.find('.panel-faq-answer .newslink').attr('href');
			let subUrl = "http://192.168.0.31:5000/";
			$.ajax({
				url: subUrl,
				type: "POST",
				data: { "title": title },
				success: function (res) {
					$(el).find('.panel-faq-answer').eq(0).empty()
					$(el).find('.panel-faq-answer').eq(0).append("<p>QUICKCATCH ... ↓</p>");
					$(el).find('.panel-faq-answer').eq(0).append("\n<p>" + res.split("관련키워드:")[0] + "</p>");
					let keywords = res.split("관련키워드:")[1].split(",");
					
					// 관련 키워드로 뉴스 다시 검색
					let keywordLinks = '';
					for (let index in keywords) {
					    // URL을 직접 구성하여 변수에 추가
					    let keywordLink = "<a href='/newsView?query=" + encodeURIComponent(keywords[index].trim()) + "'>" + keywords[index].trim() + "</a>";
					    
					    // 변수에 추가
					    if (index ==0) {
					        keywordLinks += keywordLink;
					    } else {
					        keywordLinks += ", " + keywordLink;
					    }
					}
					// 모든 키워드를 추가한 후 <p> 태그 안에 넣기
					$(el).find('.panel-faq-answer').eq(0).append("\n<p> 관련 키워드: " + keywordLinks + "</p>");

					$(el).find('.panel-faq-answer').eq(0).append("\n<a class='newslink' href='" + newsLink + "' target='_blank'>본문 링크: " + newsLink + "</a>");
				},
				error: function (e) {
					console.log(e);
				}, beforeSend: function () {
					var width = 0;
					var height = 0;
					var left = 0; var top = 0;
					width = 50; height = 50;
					top = ($(window).height() - height) / 2 + $(window).scrollTop(); left = ($(window).width() - width) / 2 + $(window).scrollLeft();

					if ($("#div_ajax_load_image").length != 0) { $("#div_ajax_load_image").css({ "top": top + "px", "left": left + "px" }); $("#div_ajax_load_image").show(); } else { $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="/resources/img/loding.gif" style="width:50px; height:50px;"></div>'); }
				}, complete: function () { $("#div_ajax_load_image").hide(); }
			});
		});
		
		
		 // 뉴스 스크랩 클릭
        $(".get_clipping").click(function () {            
        	let el = $(this).closest('tr'); // 클릭된 클리핑 아이콘이 포함된 행(tr)을 가져옴
            let newsTitle = el.find('.panel-faq-container strong').text().trim(); // 해당 행의 제목 정보를 가져옴
            let newsLink = el.find('.panel-faq-answer .newslink').attr('href'); // 해당 행의 링크 정보를 가져옴
            let newsContent = el.find('.panel-faq-answer p').eq(1).html(); // 해당 행의 내용 정보를 가져옴
            newsContent +=  el.find('.panel-faq-answer p').eq(2).text().trim();
            $.ajax({
                url: '<c:url value="/clippingDo" />',
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({ 
                    memId: "${sessionScope.login.memId}",
                    newsTitle: newsTitle,
                    newsContent: newsContent,
                    newsLink: newsLink
                }),
                success: function (res) {
                	if(res == 'Y'){
                		el.find('.get_clipping').removeClass('fa-star-o').
                		removeClass('get_clipping').addClass('del_clipping').addClass('fa-star'); 
                		location.reload();
                		alert("스크랩됐습니다.");
                	}else if(res =='N'){
                		alert("이미 스크랩된 뉴스입니다.")
                	}
                   
                },
                error: function (e) {
                    console.log(e);
				}
			});
		});
		 
		 
     // 스크랩 삭제 클릭
        $(".dle_clipping").click(function () {         
        	if(confirm("삭제하시겠습니까?")){
        		 let el = $(this).closest('tr'); // 클릭된 클리핑 아이콘이 포함된 행(tr)을 가져옴
        		 let newsLink = el.find('.panel-faq-answer .newslink').attr('href'); // 해당 행의 링크 정보를 가져옴
            
            $.ajax({
                url: '<c:url value="/clippingDel" />',
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({ 
                    memId: "${sessionScope.login.memId}",
                    newsLink: newsLink
                }),
                success: function (res) {
                	if(res == 'Y'){
                		el.find('.dle_clipping').removeClass('fa-star').
                		removeClass('dle_clipping').addClass('get_clipping').addClass('fa-star-o'); 
                		location.reload();
                		alert("삭제하였습니다.");
                	}else if(res =='N'){
                		alert("스크랩되지 않은 뉴스입니다.")
                	}
                   
                },
                error: function (e) {
                    console.log(e);
				}
			});
        	}
        });
	});
</script>
</body>
</html>