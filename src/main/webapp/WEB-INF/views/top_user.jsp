<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        display: flex;                /* 가로 레이아웃, flexbox */
        justify-content: space-between; /* 좌우 공간 분배 */
        align-items: center;          /* 수직 가운데 정렬 */
        padding: 8px 40px;            /* 위아래 8px, 좌우 40px 여백 */
        background: #fff;             /* 흰색 배경 */
        box-shadow: 0 2px 4px rgba(0,0,0,0.05); /* 헤더 그림자 */
        position: sticky; top: 0;     /* 스크롤 시 상단 고정 */
        z-index: 1000;                /* 다른 요소 위에 표시 */
    }
    .site-header .logo img {
        width: 160px;
        height: 80px;   /* 로고 이미지 크기 지정 */
    }

    /* ======== 네비게이션 ======== */
    .site-nav {
        display: flex;                /* 메뉴 가로 정렬 */
        list-style: none;             /* 기본 리스트 스타일 제거 */
        margin: 0; padding: 0;        /* 기본 여백 제거 */
        gap: 32px;                    /* 메뉴 항목 간격 */
        font-family: 'CookieRun-Regular', sans-serif; /* 메뉴 폰트 설정 */
        font-size: 18px;              /* 메뉴 폰트 크기 */
    }
    .site-nav li a {
        color: #333;                  /* 글자색 어두운 회색 */
        font-weight: 500;             /* 글자 두께 */
        text-decoration: none;        /* 밑줄 제거 */
        padding: 8px 12px;            /* 링크 내부 여백 */
        border-radius: 20px;          /* pill 모양 둥근 테두리 */
        transition: background-color 0.2s, color 0.2s; /* 부드러운 효과 */
    }
    /* hover 시 노란색 pill 효과 적용 */
     .site-nav li a:hover,
    .site-nav li .dropdown-toggle:hover {
        background-color: #FECB2F;       /* 배경 노란색 */
        color: #000;                     /* 글자 검정색 */
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
        background-color: #FECB2F;
        color: #000;
    }

    /* ======== 인증 버튼 ======== */
    .auth-buttons a {
        margin-left: 12px;            /* 버튼 간 좌측 여백 */
        padding: 8px 16px;            /* 버튼 내부 여백 */
        border-radius: 20px;          /* 둥근 테두리 */
        font-weight: 500;             /* 글자 두께 */
        text-decoration: none;        /* 밑줄 제거 */
    }
    .auth-login { background: #FECB2F; color: #000; }       /* 로그인 버튼 스타일 */
    .auth-signup { background: #7BB661; color: #fff; }      /* 회원가입 버튼 스타일 */

    /* ======== 메인 배너 ======== */
    .main-banner {
        position: relative;           /* 내부 절대 위치 요소 기준 */
        background: #E6F7FF url('./image/maintop2.jpg') center/cover no-repeat;
                                     /* 배경색 + 이미지 중앙/크기 맞춤 */
        height: 400px;                /* 배너 높이 */
        display: flex;                /* flexbox로 컨텐츠 배치 */
        align-items: center;          /* 수직 가운데 정렬 */
        overflow: hidden;             /* 넘침 숨김 */
    }
    .main-banner .text {
        position: absolute; left: 10%; color: #7BB661; /* 텍스트 블록 위치/색상 */
    }
    .main-banner .text h1 {
        font-size: 48px; margin: 0;   /* 제목 크기 및 여백 제거 */
    }
    .main-banner .text p {
        font-size: 20px; margin-top: 8px; color: #333; /* 부제 크기/색상 */
    }
    .main-banner .images {
        position: absolute; right: 10%; display: flex; gap: 16px;
                                     /* 배너 우측 이미지 그룹 */
    }
    .main-banner .images img {
        height: 200px;                /* 썸네일 높이 */
        border-radius: 8px;           /* 이미지 둥근 모서리 */
        box-shadow: 0 2px 8px rgba(0,0,0,0.1); /* 그림자 효과 */
    }
</style>

</head>
<body>

<header class="site-header">
        <div class="logo">
            <a href="main">
            	 <img src="./image/home.jpg" alt="놀쥬 로고">
            </a>    
  </div>
  <ul class="site-nav">
  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">마켓이쥬 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="productout">쇼핑하쥬</a></li>
          <li><a href="productsearch">찾아보쥬</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">놀아보쥬 <span class="caret"></span></a>
        <ul class="dropdown-menu" >
        	<li><a href="howout">공유하쥬</a></li>
        	<li><a href="comout">수다떨쥬</a></li>
        	<li><a href="fleaout">나눠쓰쥬</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">건강하쥬<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="hospital">병원알려쥬</a></li>
          <li><a href="remember">기억하쥬</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">입양하쥬<span class="caret"></span></a>
        <ul class="dropdown-menu" >
          <li><a href="adoption">입양하쥬</a></li>
        </ul>
      </li> 
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">산책하쥬 <span class="caret"></span></a>
        <ul class="dropdown-menu" >
          <li><a href="walkout">산책하쥬</a></li>
        </ul>
      </li>  
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">공지하쥬 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="noticedetail">공지하쥬</a></li>
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