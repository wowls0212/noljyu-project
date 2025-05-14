<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body {
     font-family: 'CookieRun-Regular';
    background-color: white;
    margin: 0;
    padding: 0px 0;
    -webkit-font-smoothing: antialiased; /* Improved font rendering */
    -moz-osx-font-smoothing: grayscale;
}

.container {
    width: 900px;
    margin: 0 auto;
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    padding: 30px;
    margin-bottom: 20px;
}

.post-title {
    font-size: 28px;
    font-weight: 600;
    color: #333;
    margin-bottom: 15px;
    margin-left:100px;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
    text-align: left;
    
}

.post-author {
    font-size: 18px;
    margin-bottom: 20px;
    margin-left: 100px;
    text-align: left;
}

.post-cnt {
    font-size: 16px;
    margin-bottom: 20px;
    margin-left:100px;
    text-align: left;
    
}

.post-image {
    width: 80%;
    max-width: 800px;
    height: 500px;
    aspect-ratio: 1/1;
    border-radius: 20px;
    box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
    margin-bottom: 20px;
}

.post-item {
    margin-bottom: 40px;
    border-bottom: 1px solid white;
}

.post-content {
    font-size: 18px;
    line-height: 1.6;
    color: #555;
    margin-bottom: 30px;
    margin-left: 100px;
    text-align: left;
}

.btn-like:hover {
    background-color: #ff4757;
}

.pagination {
    text-align: center;
    margin-top: 0px; /* Removed extra margin-top */
}

.pagination a {
    margin: 0 5px;
    padding: 5px 10px;
    text-decoration: none;
    color: #333;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.pagination a:hover {
    background-color: #6c5ce7;
    color: white;
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
    text-align: center;
    padding-right: 10px;
    margin-top: 50px;
    margin-bottom: 10px;
    margin-left: 700px;
  }

.title {
    padding-top: 50px;
    padding-bottom: 50px;
    font-weight: 700;
    font-size: 2.5em;
    text-align: center;
    color: #333;
}

.title img {
    vertical-align: middle;
    margin: 0 10px;
}
hr{
background-color: #FECB2F;
height: 1.5px;
width: 700px;
align-content: center;
}

  .main-banner {
	position: relative;
	height: 400px;
	display:inline;
	align-items: center;
	overflow: inherit;
	margin-bottom: 200px;
	
}
  .container {
   max-width: 1000px;
    margin: 40px auto; 
    padding: 0 20px;
     }

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

   <section class="main-banner">
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="배너이미지" src="./image/com.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>

<c:if test="${not empty id}">
        <div class="write-button">
           <a href="cominput" class="btn-yellow">새글 올리쥬</a>
        </div>
    </c:if>

<!-- 게시글 목록 -->
	
    <c:forEach items="${list}" var="com">
    <div class="container">
        <div class="post-item">
        	<p class="post-author"><img src="./image/foot.jpg" width="18px" height="18px">${com.id}</p>
        	<hr>
        	<a href="comdetail?postnum=${com.postnum}">
            	<img src="./image/${com.postimg}" class="post-image" alt="게시글 이미지">
        	</a>
        	
        	<p class="post-cnt">조회수: ${com.postcnt}  <img alt="" src="./image/foot.jpg" width="25px" height="25px"> ${com.good }</p> <!-- 조회수 눈 이미지로 수정 추천수 발자국 이미지로 수정 -->
            <h2 class="post-title"><a href="comdetail?postnum=${com.postnum}">${com.posttitle}</a></h2>
            <p class="post-content">${com.postdetail}</p>
            <hr>
        </div>
        </div>
    </c:forEach>
    

    <!-- 페이징 -->
    <div class="pagination">
        <c:if test="${paging.startPage != 1}">
            <a href="comout?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">이전</a>
        </c:if>

        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
            <c:choose>
                <c:when test="${p == paging.nowPage}">
                    <b><span style="color: #8EBF7F;">${p}</span></b>
                </c:when>
                <c:otherwise>
                    <a href="comout?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${paging.endPage != paging.lastPage}">
            <a href="comout?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">다음</a>
        </c:if>
    </div>

    <!-- 검색 폼 -->
    <div class="search-form">
        <form action="comsearch" method="post">
            <select name="comkey">
                <option value="all">전체</option>
                <option value="posttitle">제목</option>
                <option value="postdetail">내용</option>
                <option value="id">작성자</option>
            </select>
            <input type="text" name="comvalue" placeholder="검색어를 입력하세요">
            <input type="submit" value="검색">
        </form>
    </div>
	
</body>
</html>