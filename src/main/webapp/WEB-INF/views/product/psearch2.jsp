<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
    
    @font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
        body {
            font-family: 'CookieRun-Regular';
            background-color:white;
            margin: 0;
            padding: 0;
        }
        table {
            margin-top: 50px;
            margin-bottom: 50px;
            width: 90%;
            max-width: 1000px;
            margin-left: auto;
            margin-right: auto;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            border-collapse: collapse;
        }
        caption {
            text-align: center;
            font-size: 1.6em;
            padding: 20px;
            background-color: #f8f9fa;
            color: #333;
        }
        th, td {
            text-align: center;
            padding: 15px;
            font-size: 1.1em;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f3f5;
            color: #555;
        }
        td {
            color: #666;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #fff8e1;
        }
        img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
        #aa {
            text-align: center;
            margin-top: 30px;
        }
        #aa a {
            text-decoration: none;
            font-size: 1.1em;
            color: #007bff;
            padding: 10px 20px;
            background-color: #f1f1f1;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        #aa a:hover {
            background-color: #007bff;
            color: white;
            transform: translateY(-2px);
        }
        @media (max-width: 768px) {
            table {
                width: 95%;
            }
            th, td {
                font-size: 1em;
                padding: 12px;
            }
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
    <title>상품 자료 검색</title>
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
        <caption>상품자료검색 출력</caption>
        <tr>
            <th>상품번호</th>
            <th>상품명</th>
            <th>동물구분</th>
            <th>상품목록</th>
            <th>가격</th>
            <th>상품이미지</th>
            <th>조회수</th>     
        </tr>  
        <c:forEach items="${list}" var="pro">
            <tr>
                <td>${pro.productnum}</td>
                <td>${pro.productname}</td>
                <td>${pro.animal}</td>
                <td>${pro.productlist}</td>        
                <td><fmt:formatNumber value="${pro.price}" pattern="#,##0" /></td>
                <td>
                    <a href="productdetail?num=${pro.productnum}">    
                        <img src="./image/${pro.productimg}" alt="상품 이미지" width="70px" height="100px">
                    </a>
                </td>
                <td>${pro.productcnt}</td>    
            </tr>
        </c:forEach>
    </table>

</body>
</html>