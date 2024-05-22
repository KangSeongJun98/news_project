# 뉴스 요약 사이트
<p align="center">
  <br>
 <img src="https://raw.githubusercontent.com/KangSeongJun98/KangSeongJun98.github.io/main/assets/img/portfolio/detail/%EB%89%B4%EC%8A%A4%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8/%EB%A9%94%EC%9D%B8.png">
  <br>
</p>

## 프로젝트 소개

<p align="justify">
<h5>바쁜 아침에 간결한 뉴스를 원했던 경험과 뉴스를 본 뒤 연관된 내용을 보고싶지만<br> 어떤 단어를 검색해야할 지 모른 경우가 종종 있었다.<br>
이에 뉴스의 내용을 간략하게 요약하고 요약된 본문과 관련된 키워드를 추천해주는 웹 사이트를 만들게됐다.</h5>
  <br>
</p>
<br>

## 페이지별 기능 설명
- ### 메인 화면 페이지
<img src="https://raw.githubusercontent.com/KangSeongJun98/KangSeongJun98.github.io/main/assets/img/portfolio/detail/%EB%89%B4%EC%8A%A4%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8/%EB%A9%94%EC%9D%B8.png">
<br>
1. 키워드별 뉴스 검색.<br>
2. 키워드를 입력하지 않으면 실시간 검색어 페이지로 이동된다.<br>
<hr>

- ### 실시간 검색어
<img src="https://raw.githubusercontent.com/KangSeongJun98/KangSeongJun98.github.io/main/assets/img/portfolio/detail/%EB%89%B4%EC%8A%A4%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8/%EC%8B%A4%EA%B2%80.png">
1. 크롤링한 값을 저장해 DB에 있는 실시간 검색어를 뷰페이지에 표시한다.
<hr>

- ### 뉴스 검색 결과 페이지
![그림2바꿈](https://raw.githubusercontent.com/KangSeongJun98/KangSeongJun98.github.io/main/assets/img/portfolio/detail/%EB%89%B4%EC%8A%A4%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8/%EB%89%B4%EC%8A%A4.png)
<br>
1. 네이버 검색 api를 활용해 검색어와 관련된 뉴스기사가 표시된다.
<hr>

- ### 본문 내용
![그림1바꿈](https://raw.githubusercontent.com/KangSeongJun98/KangSeongJun98.github.io/main/assets/img/portfolio/detail/%EB%89%B4%EC%8A%A4%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8/%EB%89%B4%EC%8A%A4%EC%83%81%EC%84%B8.png)
<br>
1. 제목을 선택하면 네이버 api에서 제공하는 간략한 본문 내용이 표시된다.
2. 기사 본문의 링크를 첨부했다.
<hr>
  
- ### 뉴스 요약

##### 로딩중
<img src ="https://raw.githubusercontent.com/KangSeongJun98/KangSeongJun98.github.io/main/assets/img/portfolio/detail/%EB%89%B4%EC%8A%A4%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8/%EB%89%B4%EC%8A%A4%EB%A1%9C%EB%94%A9.png">
<br>
1. 본문을 클릭하면 뉴스가 요약되고 그 과정을 로딩처리해 사용자에게 표시한다.

##### 로딩완료
<img src ="https://raw.githubusercontent.com/KangSeongJun98/KangSeongJun98.github.io/main/assets/img/portfolio/detail/%EB%89%B4%EC%8A%A4%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8/%EB%89%B4%EC%8A%A4%EC%9A%94%EC%95%BD.png">
<br>
1. chatGPT API를 활용해 본문 내용을 요약한다.<br>
2. 본문 내용과 연관된 키워드가 표시된다.<br>
3. 키워드를 클릭하면 바로 검색이 가능하다.
<hr>

- ### 회원가입/로그인
<img src ="https://raw.githubusercontent.com/KangSeongJun98/KangSeongJun98.github.io/main/assets/img/portfolio/detail/%EB%89%B4%EC%8A%A4%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8/%EB%A1%9C%EA%B7%B8%EC%9D%B8.png">
<br>
<img src ="https://raw.githubusercontent.com/KangSeongJun98/KangSeongJun98.github.io/main/assets/img/portfolio/detail/%EB%89%B4%EC%8A%A4%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85.png">
<hr>

- ### 뉴스 스크랩
<img src ="https://raw.githubusercontent.com/KangSeongJun98/KangSeongJun98.github.io/main/assets/img/portfolio/detail/%EB%89%B4%EC%8A%A4%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8/%EB%89%B4%EC%8A%A4%EC%8A%A4%ED%81%AC%EB%9E%A9.png">
1. 로그인을 했을 때만 스크랩 버튼이 표시된다.<br>
2. 스크랩된 뉴스의 스크랩 버튼을 한 번 더 누르면 스크랩이 취소된다.<br>

- ### 내 스크랩
<img src="https://raw.githubusercontent.com/KangSeongJun98/KangSeongJun98.github.io/main/assets/img/portfolio/detail/%EB%89%B4%EC%8A%A4%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8/%EB%82%B4%EC%8A%A4%ED%81%AC%EB%9E%A9.png">
1. 로그인 했을 때만 내 스크랩 페이지가 표시된다.<br>
2. 스크랩된 뉴스를 해당 페이지에서 취소할 수 있다.

## 배운 점 & 아쉬운 점

 1.  뉴스 데이터를 가져올 때 Naver API는 주소, 제목, 짧은 기사 내용만 제공돼 본문 전체는
  가져올 수 없으며<br> 이를 해결하기 위해 크롤링 방식을 선택함 하지만 신문사별로 사용하는 
  템플릿이 모두 달라서 일괄적으로 본문의 내용만 크롤링하는 코드를 작성하기 어려웠다.<br>
  최종적으로는 ‘네이버뉴스’라는 버튼을 똑같은 뉴스 기사를 네이버에서 제공하는
  템플릿으로 보는 방식이 있어서 이를 위해 Selenium을 활용해 동적 처리를 하고 본문을 가져오는 과정이 힘들었다.<br>

 2. Selenium을 활용해 동적인 처리를 진행하다보니<br> 본문의 내용을 크롤링하는 시간이
  길어졌고 결과적으로 본문의 내용을 요약해<br> 사용자에게 제공하기까지 많은 시간이
  소요됐다.<br>
<br>
</p>
<br>
