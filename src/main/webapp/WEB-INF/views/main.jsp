<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>놀쥬 플랫폼</title>
    <!-- 반응형, 부트스트랩 불러오기 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <style type="text/css">
        @font-face {
            font-family: 'CookieRun-Regular';
            src:
                url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff')
                format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body {
            font-family: 'CookieRun-Regular', sans-serif;
            font-optical-sizing: auto;
            font-weight: normal;
            font-style: normal;
        }

        .main-banner {
    position: relative;
    height: 500px;
    display: flex; /* 혹은 block */
    align-items: center;
    overflow: inherit; /* 필요하면 추가 */
    margin-bottom: 50px;
}

        /* ======== 카테고리 아이콘 ======== */
        .category-list {
            display: flex;
            justify-content: center;
            gap: 48px;
            padding: 40px 0;
            background: #FFFFFF;
        }

        .category-item {
            text-align: center;
        }

        .category-item .icon {
            width: 200px;
            height: 200px;
            background: #FFF9E6;
            border-radius: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 36px;
        }
        .icon img:hover {
            transform: translateY(-4px);
        }

        .category-item p {
            margin-top: 8px;
            margin-bottom: 50px;
            font-weight: 500;
            color: #333;
        }

        /* 인기 게시판 타이틀 */
        .goodpost {
            margin-bottom: 150px;
        }

        .goodtitle {
            display: flex;
            align-items: center;
            margin-left: 350px;
            margin-bottom: 24px;
        }

        .goodtitle img {
            margin-right: 8px;
        }

        .goodtitle span {
            font-size: 20px;
            font-weight: bold;
            color: #222;
        }

        .goodtitle::after {
           content: "";
            flex: none;
            width: 66%;               
            height: 4px;
            margin-left: 16px;
            background-color: #FECB2F;
            border-radius: 2px;
        }

        .best-btn {
            display: flex;
            flex-direction: column; /* 세트 전체를 세로 정렬 */
            gap: 16px; /* 세트 간 간격 */
            padding-left: 50px;
            margin-left: 300px;
        }

        .best-set {
            display: flex; /* 세트 내 가로 정렬 */
            align-items: center; /* 세트 내 중앙 정렬 */
            gap: 12px; /* 아이콘과 링크 간 간격 */
        }

        .bestposticon {
            font-size: 12px; /* 텍스트 크기 축소 */
            padding: 4px 8px; /* 내부 여백 줄이기 */
            border-radius: 10px; /* 둥근 모서리 */
            background: #FECB2F; /* 배경색 */
            color: #000; /* 텍스트 색상 */
            text-decoration: none; /* 밑줄 제거 */
        }

        .best-set a {
            text-decoration: none; /* 밑줄 제거 */
            font-size: 14px; /* 링크 텍스트 크기 */
            color: #333; /* 텍스트 색상 */
        }

        /* ================= 인기 게시판 ================= */
        .popular-list {
            display: flex;
            gap: 30px;
            justify-content: center;
            margin-top: 30px;
        }

        .popular-item {
            width: 280px;
            border: 1px solid #eee;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            text-decoration: none;
            color: inherit;
        }

        .popular-item .thumb img {
            width: 100%;
            height: 160px;
            object-fit: cover;
        }

        .popular-item .info {
            padding: 12px;
        }

        .popular-item .meta {
            font-size: 0.85em;
            color: #999;
            margin-bottom: 8px;
        }

        .popular-item .title {
            font-size: 1.1em;
            font-weight: bold;
            margin-bottom: 8px;
            color: #222;
        }

        .popular-item .summary {
            font-size: 0.95em;
            line-height: 1.4em;
            color: #555;
        }

        /* 인기 게시판 아래 노란색 구분선 */
        .popular-divider {
            width: 90%; /* 화면 너비의 90% */
            height: 2px; /* 두께 */
            background: #FECB2F; /* 노란색 */
            margin: 50px auto; /* 위아래 여백, 가운데 정렬 */
        }

        /* 산책 타이틀 */
        .walktitle {
            display: flex;
            align-items: center;
            margin-left: 350px;
            margin-bottom: 24px;
        }

        .walktitle span {
            font-size: 20px;
            font-weight: bold;
            color: #222;
        }

        .walktitle::after {
            content: "";
            flex: none;
            width: 66%;                 
            height: 4px;
            margin-left: 16px;
            background-color: #FECB2F;
            border-radius: 2px;
        }

        /* 산책코스 배너 스타일 */
        .walk-banner img {
            width: 90%; /* 화면 너비의 90% */
            max-width: 1200px; /* 최대 너비 */
            display: block;
            margin: 0 auto 60px; /* 밑에 여백 더 크게 */
            border-radius: 12px; /* 모서리 둥글게 */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: transform .2s;
        }

        .walk-banner img:hover {
            transform: translateY(-4px);
        }
/* ===== 사이드 배너  ===== */
.side-banner {
    position: fixed;
    bottom: 80px;   
    right: 20px;
    width: 180px;
    z-index: 1000;
}
.side-banner2 {
    position: absolute; /* 특정 위치를 기준으로 배치 */
    top: 700px; /* 상단에서 10px 떨어진 위치 */
    left: 10px; /* 왼쪽에서 10px 떨어진 위치 */
    width: 250px; /* 배너 너비 */
    height: 1600px; /* 높이를 자동으로 조정 */
    background-color: #f3f3f3; /* 배경색 추가 */
    z-index: 1000; /* 다른 요소 위에 배치 */
}

.side-banner img {
    width: 100%;
    height: auto;
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    cursor: pointer;
    transition: transform .2s;
}
.side-banner img:hover {
    transform: translateY(-4px);
}
        .side-banner img {
            width: 100%;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
            cursor: pointer;
            transition: transform .2s;
        }
        .side-banner img:hover {
            transform: translateY(-4px);
        }

        
        .title {
            padding-top: 50px;
            font-weight: 700;
            font-size: 2.5em;
            text-align: center;
        }
        hr {
            width: 70%; height: 3px;
            background-color: #FECB2F; border: 0;
            margin: 20px auto;
        }
        .category-buttons {
            display: flex; justify-content: center; gap: 20px; margin-top: 30px;
        }
        .category-buttons a {
            display: flex; align-items: center; gap: 10px;
            background-color: #fff8e1; border: 2px solid #ffe082;
            border-radius: 30px; padding: 10px 20px;
            font-size: 16px; font-weight: 600; color: #ff9800;
            text-decoration: none; box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
            transition: all .3s;
        }
        .category-buttons a:hover {
            background-color: #ffecb3; transform: translateY(-2px);
            box-shadow: 2px 4px 12px rgba(0,0,0,0.2);
        }
        .category-buttons i {
            font-size: 18px;
        }
        #aa {
            padding-top: 10px; font-size: 1.5em; text-align: center;
        }
        .flex-container {
            display: grid; grid-template-columns: repeat(4, 1fr);
            gap: 40px; padding: 50px 300px 50px;
            justify-items: center;
        }
        .product {
            width: 220px; text-align: center;
        }
        .product img {
            width: 100%; aspect-ratio: 1/1;
            object-fit: cover; border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .product .name {
            font-size: 16px; font-weight: 700; margin-top: 10px;
        }
        .product .price {
            font-size: 16px; font-weight: bold; margin-top: 8px;
        }
        .search-container {
            display: flex; justify-content: flex-end; margin: 20px 300px 0;
        }
        .search-box {
            display: flex; align-items: center; width: 300px;
            border: 1px solid #ccc; border-radius: 8px;
            padding: 5px 10px; background-color: #fff;
        }
        .search-box input { border: none; outline: none; flex: 1; font-size: 16px; }
        .search-box button { background: none; border: none; cursor: pointer; padding: 0; }
        .search-box button img { width: 25px; height: 25px; }
        .propage {
            display: flex; justify-content: center; margin-bottom: 20px; gap: 10px;
        }
    </style>

</head>
<body>

    <!-- ================= 메인 배너 ================= -->
    <section class="main-banner">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="배너이미지" src="./image/main4.jpg" width="1900px" height="400px">
                </div>
                <div class="item">
                    <img alt="배너이미지2" src="./image/main2.jpg" width="1900px" height="500px">
                </div>
                <div class="item">
                    <img alt="배너이미지3" src="./image/main3.png" width="1900px" height="400px">
                </div>
                <div class="item">
                    <img alt="배너이미지4" src="./image/main1.jpg" width="1900px" height="400px">
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </section>

    <!-- ================= 카테고리 아이콘 ================= -->
    <section class="category-list">
        <div class="category-item">
            <div class="icon">
                <a href="dogproductmain"><img alt="강아지" src="./image/dogci.png" width="150" height="150"></a>
            </div>
        </div>
        <div class="category-item">
            <div class="icon">
                <a href="catproductmain"><img alt="고양이" src="./image/catci.png" width="150" height="150"></a>
            </div>
        </div>
        <div class="category-item">
            <div class="icon">
                <a href="birdproductmain"><img alt="새" src="./image/birdci.png" width="150" height="150"></a>
            </div>
        </div>
        <div class="category-item">
            <div class="icon">
                <a href="fishproductmain"><img alt="물고기" src="./image/fishci.png" width="150" height="150"></a>
            </div>
        </div>
        <div class="category-item">
            <div class="icon">
                <a href="creepproductmain"><img alt="파충류" src="./image/creepci.png" width="150" height="150"></a>
            </div>
        </div>
    </section>

    <!-- ================= 인기 게시판 ================= -->
    <section class="goodpost">
        <div class="goodtitle">
            <img src="./image/foot.jpg" alt="인기글" width="50" height="50">
            <span>인기있쥬</span>
        </div>
        <div class="popular-list">
            <!-- 나만의 노하우 -->
            <a href="howdetail?postnum=${dto.postnum}" class="popular-item">
                <div class="thumb">
                    <img src="./image/${dto.postimg}" alt="노하우 썸네일">
                </div>
                <div class="info">
                    <div class="meta">#나만의노하우 · ${dto.id} · ${dto.postdate}</div>
                    <div class="title">${dto.posttitle}</div>
                    <div class="summary">
                        ${fn:substring(dto.postdetail,0,80)}...
                    </div>
                </div>
            </a>
            <!-- 커뮤니티 -->
            <a href="comdetail?postnum=${cdto.postnum}" class="popular-item">
                <div class="thumb">
                    <img src="./image/${cdto.postimg}" alt="커뮤니티 썸네일">
                </div>
                <div class="info">
                    <div class="meta">#커뮤니티 · ${cdto.id} · ${cdto.postdate}</div>
                    <div class="title">${cdto.posttitle}</div>
                    <div class="summary">
                        ${fn:substring(cdto.postdetail,0,80)}...
                    </div>
                </div>
            </a>
            <!-- 플리마켓 -->
            <a href="fleadetail?postnum=${fdto.postnum}" class="popular-item">
                <div class="thumb">
                    <img src="./image/${fdto.postimg}" alt="플리마켓 썸네일">
                </div>
                <div class="info">
                    <div class="meta">#플리마켓 · ${fdto.id} · ${fdto.postdate}</div>
                    <div class="title">${fdto.posttitle}</div>
                    <div class="summary">
                        ${fn:substring(fdto.postdetail,0,80)}...
                    </div>
                </div>
            </a>
        </div>
    </section>

    <!-- ================= 산책가쥬 타이틀 ================= -->
    <div class="walktitle">
    <img src="./image/foot.jpg" alt="산책" width="50" height="50">
        <span>나랑 산책가쥬</span>
    </div>

    <!-- ================= 산책코스 배너 ================= -->
    <div class="walk-banner">
        <a href="walkout?nowPage=1&cntPerPage=6">
            <img src="./image/walk_banner.jpg" alt="산책코스 배너">
        </a>
    </div>
    
        <!-- ================= 병원가쥬 타이틀 ================= -->
    <div class="walktitle">
    <img src="./image/foot.jpg" alt="병원" width="50" height="50">
        <span>나랑 병원가쥬</span>
    </div>
    
       <!-- ================= 병원가쥬 배너 (산책코스 밑에 동일 스타일) ================= -->
    <div class="walk-banner">
        <a href="hospital">
            <img src="./image/hospital_banner.jpg" alt="병원가쥬 배너">
        </a>
    </div>
    
    
    <!-- ================= 사이드 배너 ================= -->
    <div class="side-banner">
        <a href="productout">
            <img src="./image/sidebar_banner.gif" alt="놀쥬 마켓 바로가기">
        </a>
    </div>
    
        <div class="side-banner2">
        <a href="comout">
            <img src="./image/sidebanner1.gif" alt="놀쥬 마켓 바로가기">
        </a>
       <a href="howout">
            <img src="./image/sidebanner2.gif" alt="놀쥬 마켓 바로가기">
        </a>
    </div>


</body>
</html>
