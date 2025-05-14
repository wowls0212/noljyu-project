<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"> 
<link href="https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSans.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"> <!-- 아이콘용 -->
<style>

@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#aa
{
	padding-top: 10px;
	font-size: 1.5em;
}
body {
     font-family: 'CookieRun-Regular';
    background-color: white;
    margin: 0;
    margin-bottom: 250px;
    padding: 0;
}

/* 상단 이미지는 일관성 있고 부드럽게 배치 */
.menu-images {
    text-align: center;
    margin-top: 20px;
}

.menu-images a {
    margin: 0 10px;
}

.menu-images img {
    width: 180px;
    height: 140px;
    transition: transform 0.3s ease, opacity 0.3s ease;
}

.menu-images img:hover {
    transform: scale(1.1);
    opacity: 0.8;
}

table {
    margin: 50px auto;
    width: 90%;
    max-width: 1100px;
    border-collapse: collapse;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.title
{
	padding-top: 50px;
  	font-weight: 700; /* Bold */
	font-size: 2.5em;
	text-align: center;
}

caption {
    font-size: 24px;
    font-weight: bold;
    margin: 20px 0;
    color: #333;
}

th, td {
    padding: 12px;
    text-align: center;
    border: 1px solid #ddd;
    font-size: 1em;
}

th {
    background-color: #f4f4f4;
    color: #333;
    font-weight: 600;
}

td {
    background-color: #fff;
}

tr:nth-child(even) td {
    background-color: #f9f9f9;
}

tr:hover td {
    background-color: #fff8e1;
}

.proimg {
    max-width: 150px;
    height: auto;
    border-radius: 6px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

a.proimg {
    transform: scale(1.05);
}
.btn-edit { 
      background-color: #eee;
      color: #333; 
	}
.btn-edit:hover {
      background-color: #FECB2F;
      color: #000;
    }	
 .btn-delete {
      background-color: #d9534f;
      color: #fff;
 }	
 .btn-delete:hover {
      background-color: #c9302c;
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
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>	

    <section class="main-banner">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="배너이미지" src="./image/3.jpg" width="1900px" height="300px">
                </div>
                <div class="item">
                    <img alt="배너이미지2" src="./image/2.png" width="1900px" height="300px">
                </div>
                <div class="item">
                    <img alt="배너이미지2" src="./image/1.png" width="1900px" height="300px">
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

<table>
<colgroup>
<col width="10%"><col width="10%"><col width="10%"><col width="25%"><col width="5%"><col width="10%"><col width="10%"><col width="10%">
</colgroup>
	<div class="title">
		<img src="./image/foot.jpg" width="70px" height="70px">  상품 전체 리스트   <img src="./image/foot.jpg" width="70px" height="70px">
	</div>
<br>
<thead>
    <tr>
        <th>상품번호</th>
        <th>동물구분</th>
        <th>상품목록</th>
        <th>상품명</th>
        <th>가격</th>
        <th>상품이미지</th>
        <th>조회수</th>
        <th>비고</th>
    </tr>
</thead>
<tbody>
    <c:forEach items="${list}" var="pro">
        <tr>
            <td>${pro.productnum}</td>
            <td>${pro.animal}</td>
            <td>${pro.productlist}</td>
            <td>${pro.productname}</td>
            <td>
                <fmt:formatNumber value="${pro.price}" pattern="#,##0"/>
            </td>
            <td>
                <a href="productdetail?num=${pro.productnum}">
                    <img alt="${pro.productname}" src="./image/${pro.productimg}"  class=proimg>
                </a>
            </td>
            <td>${pro.productcnt}</td>
            <td>
           		<a href="pmodify1?num=${pro.productnum}" class="btn btn-edit">수정</a>
                <a href="pdelete2?num=${pro.productnum}&himage${pro.productimg}" onclick="return confirm('정말로 삭제하시겠습니까?');" class="btn btn-delete">삭제</a>
            </td>               
        </tr>
    </c:forEach>
    <tr style="border:none;">
        	<td colspan="8" style="text-align:center;">
        		<c:if test="${paging.startPage>1}">
        			<a href="producttotal?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">이전</a>
        		</c:if>
        	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
        		<c:choose>
        			<c:when test="${p==paging.nowPage}">
        			<b><span style="color:#8EBF7F;">${p}</span></b>
        			</c:when>
        		<c:otherwise>
        			<a href="producttotal?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
        		</c:otherwise>
        		</c:choose>
        	</c:forEach>
        <c:if test="${paging.endPage<paging.lastPage}">
        	<a href="producttotal?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">다음</a>
        </c:if>
        </td>
       </tr>
</tbody>
</table>
</body>
</html>