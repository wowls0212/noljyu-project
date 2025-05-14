<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"> 
<link href="https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSans.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"> <!-- 아이콘용 -->
<meta charset="UTF-8">
<style>

@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body {
  background-color: white;
  font-family: 'CookieRun-Regular';
  margin-bottom: 200px;
}
.container {
  width: 500px;
  margin: 50px auto;
  background-color: white;
  border-radius: 10px;
  padding: 30px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}
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
.form-group {
  margin-bottom: 20px;
}
label {
  display: block;
  margin-bottom: 6px;
  font-weight: bold;
}
input[type="text"],
input[type="number"],
input[type="date"],
input[type="file"],
select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
}
textarea {
  width: 100%;
  height: 100px;
  padding: 10px;
  font-size: 14px;
  border-radius: 6px;
  border: 1px solid #ccc;
  resize: vertical;
}
/* --- 버튼 그룹 --- */
.button-group {
  text-align:center; margin-top:16px;
}
.button-group input {
  margin:0 8px;
  height:40px;
  padding:0 24px;
  border:none;
  border-radius:20px;
  font-size:1em;
  cursor:pointer;
}
.btn-confirm { background:#FECB2F; color:#000; }
.btn-cancel  { background:#eee;     color:#333; }

/* --- 에러 메시지 --- */
.error { color:#d9534f; text-align:center; margin-bottom:16px; }
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
<title>Insert title here</title>
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
<div class="container">
	<!-- 헤더 -->
    <div class="section-header">
      <img class="paw" src="./image/foot.jpg" alt="paw">
      <h2>상품 수정</h2>
      <img class="paw" src="./image/foot.jpg" alt="paw">
    </div>

	<!-- 에러 -->
    <c:if test="${not empty msg}">
      <div class="error">${msg}</div>
    </c:if>
    
    <!-- 폼 -->
    <div class="card">
  	  <form action="pmodifysave" method="post" enctype="multipart/form-data">
    	<table>
    	  <caption class="sr-only">상품수정 폼</caption>
    	  
    	  	<!-- productnum 추가 -->
			<input type="hidden" name="productnum" value="${dto.productnum}">
			
    	  	<div class="form-group">
				<label>아이디</label>
				<input type="text" name="id" value="${dto.id}" readonly="readonly">
			</div>
			<div class="form-group">
				<label>종류</label>
				<input type="text" name="animal" value="${dto.animal}" readonly="readonly">
			</div>	
			<div class="form-group">
				<label>상품목록</label>
				<input type="text" name="productlist" value="${dto.productlist}" readonly="readonly">
			</div>	
			<div class="form-group">
				<label>상품명</label>
				<input type="text" name="productname" value="${dto.productname}">
			</div>	
			<div class="form-group">
				<label>가격</label>
				<input type="number" name="price" value="${dto.price}">
			</div>	
			<div class="form-group">
				<label>상품이미지</label>
					<!-- 이미지 경로 수정 -->
					<img alt="" src="./image/${dto.productimg}" width="200px" height="150px">
					<input type="file" name="productimg">
					<input type="hidden" name="himage" value="${dto.productimg}">
			</div>
			<div class="form-group">
				<label>조회수</label>
				<input type="text" name="productcnt" value="${dto.productcnt}" readonly></td>
			</div>				
			<div class="form-group">
				<label>상품링크</label>
				<!-- productlink 수정 -->
				<input type="text" name="productlink" value="${dto.productlink}">
			</div>	
		</table>
			
		<!-- 버튼 -->
    	<div class="button-group">
          <input type="submit" value="수정"  class="btn-confirm">
          <input type="button" value="취소" class="btn-cancel" onclick="location.href='producttotal';">
    	</div>
	  </form>
	</div>
  </div>	
</body>
</html>