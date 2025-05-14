<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나랑 같이 놀쥬 :: 나만의 노하우 게시판</title>

<!-- 스타일 통일 -->
<style>

@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

  body { margin: 0; font-family: 'CookieRun-Regular'; }

  .container {
   max-width: 1000px;
    margin: 40px auto; 
    padding: 0 20px;
     }
  .section-header { text-align: center; margin-bottom: 30px; }
  .section-header .paw { display: inline-block; width: 44px; height: 44px; vertical-align: middle; }
  .section-header h2 { display: inline-block; font-size: 2em; font-weight: bold; margin: 0 12px; vertical-align: middle; }
  
  .card {
    background: #fff;
    padding: 28px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    margin-bottom: 40px;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
  }

  th, td {
    padding: 12px 10px;
    text-align: center;
    border-bottom: 1px solid #eee;
  }

  th {
    background: #fafafa;
    color: #666;
    font-weight: normal;
  }

  td {
    color: #333;
  }

  a {
    color: #333;
    text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
  }

  .paging {
    text-align: center;
    margin-top: 20px;
  }

  .paging a, .paging span {
    display: inline-block;
    margin: 0 5px;
    padding: 6px 12px;
    font-size: 1em;
    color: #333;
  }

  .paging span {
    font-weight: bold;
    color: #8EBF7F;
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

  .card img:hover {
    transform: scale(2);
    transition: transform 0.3s ease;
  }

  .card thead th {
    position: sticky;
    top: 0;
    background: #fff;
    z-index: 1;
    padding: 12px 8px;
    font-weight: normal;
    color: #666;
    border-bottom: 2px solid #FECB2F;
  }

  .card tbody tr:nth-child(even) {
    background: #fafafa;
  }

  .card tbody tr:hover {
    background: #fff8e1;
  }

  .btn-yellow {
    background-color: #FECB2F;
    color: #333;
    padding: 10px 22px;
    font-size: 0.95em;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    transition: all 0.2s ease;
    text-decoration: none;
    display: inline-block;
    font-weight: bold;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  }

  .btn-yellow:hover {
    transform: scale(1.05);
    background-color: #ffd74f;
    color: #222;
    text-decoration: none;
  }

  .write-button {
    text-align: right;
    padding-right: 10px;
    margin-top: -10px;
    margin-bottom: 10px;
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

  <!-- 섹션 헤더 -->
    <section class="main-banner">
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="배너이미지" src="./image/knowhow.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>

<div class="container">
 <!-- 게시판 리스트 카드 -->
  <div class="card">
    <table>
      <thead>
        <tr>
          <th>글번호</th>
          <th>ID</th>
          <th>제목</th>
          <th>조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${list}" var="h">
          <tr>
            <td>${h.postnum}</td>
            <td>${h.id}</td>
            <td><a href="howdetail?postnum=${h.postnum}">${h.posttitle}</a></td>
            <td>${h.postcnt}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    
    

    <!-- 페이징 처리 -->
    <div class="paging">
      <c:if test="${paging.startPage != 1}">
        <a href="howout?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">이전</a>
      </c:if>

      <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
        <c:choose>
          <c:when test="${p == paging.nowPage}">
            <span>${p}</span>
          </c:when>
          <c:otherwise>
            <a href="howout?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
          </c:otherwise>
        </c:choose>
      </c:forEach>

      <c:if test="${paging.endPage != paging.lastPage}">
        <a href="howout?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">다음</a>
      </c:if>
    </div>
  </div>
  
  <!-- 새글 올리쥬 버튼 -->
	<c:if test="${loginstate == true}">
      <div class="write-button">
        <a href="howinput" class="btn-yellow">새글 올리쥬</a>
      </div>
    </c:if>

  <!-- 검색 폼 카드 -->
  <div class="card">
    <form action="howsearch" method="post" class="search-form">
      <select name="howkey">
        <option value="all">전체</option>
        <option value="posttitle">제목</option>
        <option value="postdetail">내용</option>
        <option value="id">작성자</option>
      </select>
      <input type="text" name="howvalue" placeholder="검색어 입력">
      <input type="submit" value="검색">
    </form>
  </div>

</div>

</body>
</html>
