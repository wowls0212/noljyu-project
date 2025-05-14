<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>산책코스 목록</title>
  <link href="https://fonts.googleapis.com/css2?family=Gmarket+Sans&display=swap" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <style>
  @font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }
  
    body {
      font-family: 'CookieRun-Regular', Sans', sans-serif;
      background: white;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 1200px;
      margin: 40px auto;
      padding: 0 20px;
    }

     /* --- 섹션 헤더 --- */
    .section-header { text-align:center; margin-bottom:40px; }
    
    .section-header .paw {
      display:inline-block;
      width:40px; height:40px;
      vertical-align:middle;
    }
    
    .section-header h2 {
      display:inline-block;
      font-size:1.8em; font-weight:bold;
      margin:0 12px; vertical-align:middle;
    }
    
    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      gap: 24px;
    }

    .card {
      background: white;
      border-radius: 16px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      overflow: hidden;
      transition: transform 0.2s;
    }

    .card:hover {
      transform: translateY(-4px);
    }

    .card img {
      width: 100%;
      height: 220px;
      object-fit: cover;
    }

    .card-content {
      padding: 16px;
    }

    .card-title {
      font-size: 1.8rem;
      font-weight: bold;
      margin-bottom: 8px;
    }

    .card-meta {
      font-size: 1.2rem;
      color: #666;
    }

    .btn-write {
      display: inline-block;
      margin: 20px 0;
      padding: 10px 20px;
      background: #FECB2F;
      color: black;
      border-radius: 20px;
      text-decoration: none;
      font-weight: bold;
    }
    
      .search-form {
    max-width: 600px;
    margin: 0 auto 40px;
    display: flex;
    justify-content: center;
    gap: 10px;
  }
  .search-form select, .search-form input[type="text"] {
    padding: 8px 10px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 1em;
  }
  .search-form input[type="submit"] {
    padding: 8px 20px;
    background: #FECB2F;
    border: none;
    border-radius: 20px;
    font-size: 1em;
    cursor: pointer;
  }
  .search-form input[type="submit"]:hover {
    transform: scale(1.05);
  }
  .main-banner {
	position: relative;
	height: 400px;
	display:inline;
	align-items: center;
	overflow: inherit;
	margin-bottom: 150px;
}

  </style>
</head>
<body>

    <section class="main-banner">
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="배너이미지" src="./image/walkbanner.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>
  <div class="container">


    <!-- 등록 버튼 -->
    <c:if test="${id=='admin'}">
    <div style="text-align: right;">
      <a href="walkinput" class="btn-write">
        <i class="fa-solid fa-pen"></i> 산책코스 등록
      </a>
    </div>
     </c:if>

    <!-- 카드 그리드 -->
    <div class="grid">
      <c:forEach var="walk" items="${list}">
        <div class="card">
          <a href="walkdetail?walknum=${walk.walknum}">
            <img src="./image/${walk.walkimg}" alt="산책 이미지">
          </a>
          <div class="card-content">
            <div class="card-title">${walk.walktitle}</div>
            <div class="card-meta">작성자: ${walk.id} | 조회수: ${walk.walkcnt}</div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
  
  <!-- 검색 폼 -->
    <div class="search-form">
        <form action="walksearch" method="post">
            <select name="walkkey">
                <option value="walktitle">산책로</option>
            </select>
            <input type="text" name="walkvalue" placeholder="검색어를 입력하세요">
            <input type="submit" value="검색">
        </form>
    </div>
</body>
</html>