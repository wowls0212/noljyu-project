<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>놀쥬 플랫폼</title>
    <!-- 반응형, 부트스트랩 불러오기 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
    /* ======== 상단 헤더 ======== */
    @font-face {
        font-family: 'CookieRun-Regular';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    .site-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 8px 40px;
        background: #fff;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        position: sticky;  top: 0; 
        top: 0; z-index: 1000;
    }
    .site-header .logo img {
        width: 160px;
        height: 80px;
    }

    /* ======== 네비게이션 ======== */
    .site-nav {
        display: flex;
        list-style: none;
        margin: 0; padding: 0;
        gap: 32px;
        font-family: 'CookieRun-Regular', sans-serif;
        font-size: 18px;
    }
    .site-nav li a {
        color: #333;
        font-weight: 500;
        text-decoration: none;
        padding: 8px 12px;
        border-radius: 20px;
        transition: background-color 0.2s, color 0.2s;
    }
    /* hover 시 연두색 pill 효과 */
    .site-nav li a:hover,
    .site-nav li .dropdown-toggle:hover {
        background-color: #8EBF7F;
        color: #000;
    }
    /* active 메뉴는 직사각형 */
    .site-nav li.active a {
      background-color: #FECB2F;
      color: #000;
      border-radius: 0;    /* 모서리 각지게 */
      padding: 8px 12px;   /* pill padding 유지 */
    }
    /* dropdown-menu 내부 링크 hover */
    .site-nav .dropdown-menu li a:hover {
        background-color: #8EBF7F;
        color: #000;
    }

    /* ======== 인증 버튼 ======== */
    .auth-buttons a {
        margin-left: 12px;
        padding: 8px 16px;
        border-radius: 20px;
        font-weight: 500;
        text-decoration: none;
    }
    .auth-login { background: #FECB2F; color: #000; }
    .auth-signup { background: #7BB661; color: #fff; }

    /* ======== 메인 배너 ======== */
    .main-banner {
        position: relative;
        background: #E6F7FF url('./image/maintop2.jpg') center/cover no-repeat;
        height: 400px;
        display: flex;
        align-items: center;
        overflow: hidden;
    }
    .main-banner .text {
        position: absolute;
        left: 10%;
        color: #7BB661;
    }
    .main-banner .text h1 {
        font-size: 48px; margin: 0;
    }
    .main-banner .text p {
        font-size: 20px; margin-top: 8px; color: #333;
    }
    .main-banner .images {
        position: absolute;
        right: 10%;
        display: flex; gap: 16px;
    }
    .main-banner .images img {
        height: 200px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    </style>
</head>
<body>

    <!-- ================= 헤더 ================= -->
    <header class="site-header">
        <div class="logo">
            <a href="main">
                <img src="./image/home.jpg" alt="놀쥬 로고">
            </a>
        </div>
        <ul class="site-nav">
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원이쥬 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="userout">회원둘러보쥬</a></li>
          <li><a href="usersearch">회원찾아보쥬</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">마켓이쥬 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="productinput">판매하쥬</a></li>
          <li><a href="productout">쇼핑하쥬</a></li>
          <li><a href="productsearch">찾아보쥬</a></li>
          <li><a href="producttotal">한눈에보쥬</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">놀아보쥬<span class="caret"></span></a>
        <ul class="dropdown-menu" >
       		<li><a href="howout">공유하쥬</a></li>
        	<li><a href="comout">수다떨쥬</a></li>
        	<li><a href="fleaout">나눠쓰쥬</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">신고하쥬 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="postreportout">게시물 신고하쥬</a></li>
          <li><a href="reviewreportout">리뷰 신고하쥬</a></li>
          <li><a href="productreportout">상품리뷰 신고하쥬</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">건강하쥬 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="hospital">병원알려쥬</a></li>
          <li><a href="remember">기억하쥬</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">산책하쥬 <span class="caret"></span></a>
        <ul class="dropdown-menu" >
          <li><a href="walkinput"><span>코스등록 하쥬</span></a></li>
          <li><a href="walkout">산책하쥬</a></li>
          <li><a href="walklist">코스추천 받쥬</a></li>
        </ul>
      </li>  
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">공지하쥬 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="noticedetail">공지하쥬</a></li>
          <li><a href="noticewrite">공지올리쥬</a>
        </ul>
      </li>
        </ul>
        <div class="auth-buttons">
            <c:choose>
                <c:when test="${loginstate==true}">
                	<a href="mypage?id=${id }" class="auth-signup">${id}님 마이페이지</a>
                    <a class="auth-login" href="logout">로그아웃</a>
                </c:when>
                <c:otherwise>
                    <a class="auth-login" href="login">로그인</a>
                    <a class="auth-signup" href="userinput">회원가입</a>
                </c:otherwise>
            </c:choose>
        </div>
    </header>

</body>
</html>
