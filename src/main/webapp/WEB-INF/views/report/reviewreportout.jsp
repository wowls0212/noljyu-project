<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
  
  @font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
  
    body {
      margin: 0;
       font-family: 'CookieRun-Regular';
    }
    .container {
      max-width: 1200px;
      margin: 40px auto;
      padding: 0 20px;
    }
    .section-header {
      text-align: center;
      margin-bottom: 30px;
    }
    .section-header .paw {
      display: inline-block;
      width: 44px;
      height: 44px;
      vertical-align: middle;
    }
    .section-header h2 {
      display: inline-block;
      font-size: 2em;
      font-weight: bold;
      margin: 0 12px;
      vertical-align: middle;
    }
    .card {
      background: #fff;
      padding: 28px;
      border-radius: 10px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }
    table {
      width: 100%;
      border-collapse: collapse;
    }
    thead th {
      padding: 12px 8px;
      background: #fafafa;
      color: #666;
      font-weight: normal;
      border-bottom: 2px solid #FECB2F;
      text-align: center;
    }
    tbody td {
      padding: 12px 8px;
      border-bottom: 1px solid #eee;
      text-align: center;
    }
    tbody tr:nth-child(even) {
      background: #fafafa;
    }
    tbody tr:hover {
      background: #fff8e1;
    }
    .button-group {
      display: flex;
      justify-content: center;
      gap: 10px;
    }
    button {
      padding: 8px 16px;
      border: none;
      border-radius: 20px;
      font-size: 0.95em;
      cursor: pointer;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    .btn-red {
      background-color: #d9534f;
      color: #fff;
    }
    .btn-red:hover {
      background-color: #c9302c;
    }
    .btn-gray {
      background-color: #eee;
      color: #333;
    }
    .btn-gray:hover {
      background-color: #FECB2F;
      color: #000;
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
                    <img alt="배너이미지" src="./image/report.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>

<div class="container">

<div class="card">
      <form action="reviewreportdel" method="post">
        <table>
          <thead>
            <tr>
              <th>신고번호</th>
              <th>게시글번호</th>
              <th>댓글번호</th>
              <th>작성자</th>
              <th>신고유형</th>
              <th>신고자</th>
              <th>신고사유</th>
              <th colspan="2">처리</th>
            </tr>
          </thead>
          <tbody>
<c:forEach items="${list }" var="re">
<tr>
	<td>${re.reviewreportnum }</td>
	<td>${re.postnum }</td>
	<td>${re.reviewnum }</td>
	<td>${re.reviewid }</td>
	<td>${re.reportreason }</td>
	<td>${re.reportid}</td>
	<td>${re.reportdetail}</td>
	<td colspan="2">
	<button class="btn-red" type="button" onclick="location.href='reviewreportdel?reportreviewnum=${re.reviewreportnum}&postnum=${re.postnum}&reviewnum=${re.reviewnum}'">접수</button>
	<button class="btn-gray" type="button" onclick="location.href='main'">철회</button>
	</td>
</tr>
</c:forEach>
<tr style="border-left: none;border-right: none;border-bottom: none">
		<td colspan="8" style="text-align: center;">
		<c:if test="${paging.startPage!=1 }">
		   <a href="reviewreportout?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}"></a>
		</c:if>   
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p"> 
		   <c:choose>
		      <c:when test="${p == paging.nowPage }">
		         <b><span style="color: #8EBF7F;">${p}</span></b>
		      </c:when>   
		      <c:when test="${p != paging.nowPage}">
		         <a href="reviewreportout?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
		      </c:when>   
		   </c:choose>
		</c:forEach>      
		
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="reviewreportout?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">  </a>
		</c:if>   
	   </td>
	</tr>
</table>
</form>	
</div>
</div>

</body>
</html>