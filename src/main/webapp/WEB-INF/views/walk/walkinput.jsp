<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"> 
<link href="https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSans.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"> <!-- 아이콘용 -->
<meta charset="UTF-8">
<title>산책코스 등록</title>
<style>
  /* --- 기본 레이아웃 --- */
  
   @font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }
  
  body { margin:0; font-family:'CookieRun-Regular', sans-serif; }
  .container { max-width:600px; margin:60px auto; padding:0 20px; }

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

  /* --- 카드 박스 --- */
  .card {
    background:#fff;
    padding:24px;
    border-radius:8px;
    box-shadow:0 2px 8px rgba(0,0,0,0.1);
  }  
  .card table {
    width:100%;
    border-collapse:collapse;
    margin-bottom:24px;
  }
  .sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
  }
  .card textarea {
  width: 100%;
  padding: 12px;
  font-size: 1em;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
  box-sizing: border-box;
  }
  .card th, .card td {
    padding:12px 8px;
    vertical-align:middle;
  }
  .card th {
    width:35%;
    color:#666;
    font-weight:normal;
    text-align:left;
  }
  .card td {
    text-align:left;
    color:#333;
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
    <!-- 헤더 -->
    <div class="section-header">
      <img class="paw" src="./image/foot.jpg" alt="paw">
      <h2>나만의 산책코스 등록</h2>
      <img class="paw" src="./image/foot.jpg" alt="paw">
    </div>

	<!-- 에러 -->
    <c:if test="${not empty msg}">
      <div class="error">${msg}</div>
    </c:if>

	<!-- 폼 -->
    <div class="card">
	  <form action="walksave" method="post" enctype="multipart/form-data">  
    	<table>
    	  <caption class="sr-only">나만의 산책코스 등록 폼</caption>
    	
	      <!-- 아이디 -->  
	      <tr>
	          <th>아이디</th>
	          <td><input type="hidden" name="id" value="${id}">${id}</td>
	      </tr>
	      
	      <!-- 제목 -->
	      <tr>
	          <th>제목</th>
	          <td><input type="text" name="walktitle" required></td>
	      </tr>
	      
	      <!-- 이미지 -->
	      <tr>
	          <th>이미지</th>
	          <td><input type="file" name="walkimg" accept="image/*"></td>
	      </tr>
    	  </table>
	      
	      <!-- 내용 -->
	      <tr>
	          <th>내용</th>
	          <td>
	          	<textarea rows="8" name="walkdetail" required></textarea>	
	          </td>
	      </tr>
	       
	         
		  <!-- 버튼 -->
			  <div class="button-group">
			     <input type="submit" value="입력"  class="btn-confirm">
			     <input type="button" value="취소" class="btn-cancel" onclick="location.href='main';">
			  </div>
	  </form>
	</div>
   </div>	
</body>
</html>