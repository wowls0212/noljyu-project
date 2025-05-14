<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원정보 출력</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
    /* 섹션 헤더 */
    .section-header {
      text-align: center;
      margin-bottom: 30px;
    }
    .section-header .paw {
      display: inline-block;
      width: 40px;
      height: 40px;
      vertical-align: middle;
    }
    .section-header h2 {
      display: inline-block;
      font-size: 2em;
      font-weight: bold;
      margin: 0 12px;
      vertical-align: middle;
    }
    /* 카드 박스 */
    .card {
      background: #fff;
      padding: 24px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    .card table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 0;
    }
    .card th, .card td {
      padding: 12px 8px;
      text-align: center;
      border-bottom: 1px solid #eee;
    }
    .card thead th {
      background: #fafafa;
      color: #666;
      font-weight: normal;
      border-bottom: 2px solid #FECB2F;
    }
    .card img {
      max-width: 100px;
      max-height: 100px;
      border-radius: 4px;
      transition: transform .2s;
    }
    .card img:hover {
      transform: scale(2);
    }
    .btn-delete {
      padding: 6px 16px;
      background: #F44336;
      color: #fff;
      border: none;
      border-radius: 20px;
      cursor: pointer;
    }
    
    .card img:hover {
      transform: scale(2);
    }
    .card tbody tr:nth-child(even) {
       background: #fafafa;
    }
    .card tbody tr:hover {
       background: #fff8e1;
    }
    .card thead th {
       position: sticky;
       top: 0;
       background: #fff;  /* header 배경 유지 */
       z-index: 1;
    }
      .main-banner {
	position: relative;
	height: 400px;
	display:inline;
	align-items: center;
	overflow: inherit;
	margin-bottom: 200px;
	
}

  </style>
</head>
<body>

   <section class="main-banner">
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="배너이미지" src="./image/userlist.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>


  <div class="container">
    <!-- 알림 메시지 -->
    <c:if test="${not empty sessionScope.msg}">
      <script>alert("${sessionScope.msg}");</script>
      <c:remove var="msg" scope="session"/>
    </c:if>


    <!-- 회원정보 테이블 카드 -->
    <div class="card">
      <table>
        <thead>
          <tr>
            <th>이미지</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>주소</th>
            <th>연락처</th>
            <th>닉네임</th>
            <th>반려동물</th>
            <th>반려동물 이름</th>
            <th>회원등급</th>
            <th>비고</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${list}" var="my">
            <tr>
              <td>
                <c:choose>
                  <c:when test="${my.photo=='default.jpg'}">
                  <img src="./image/default.jpg" alt="기본프로필">	
                  </c:when>
                  <c:otherwise>
                     <img src="./image/${my.photo}" alt="프로필">
                  </c:otherwise>
                </c:choose>
              </td>
              <td>${my.id}</td>
              <td>******</td>
              <td>${my.name}</td>
              <td>${my.address}</td>
              <td>${my.phone}</td>
              <td>${my.nickname}</td>
              <td>${my.myanimal}</td>
              <td>${my.petName}</td>
              <td>${my.admin}</td>
              <td>
                <c:if test="${sessionScope.id ne my.id}">
                  <form action="admindelete" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="${my.id}"/>
                    <button type="submit" class="btn-delete"
                            onclick="return confirm('정말 삭제하시겠습니까?');">
                      회원삭제
                    </button>
                  </form>
                </c:if>
              </td>
            </tr>
          </c:forEach>
        </tbody>
        	<tr style="border-left: none;border-right: none;border-bottom: none">
		<td colspan="11" style="text-align: center;">
		<c:if test="${paging.startPage!=1 }">
		   <a href="userout?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}"></a>
		</c:if>   
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p"> 
		   <c:choose>
		      <c:when test="${p == paging.nowPage }">
		         <b><span style="color: #8EBF7F;">${p}</span></b>
		      </c:when>   
		      <c:when test="${p != paging.nowPage}">
		         <a href="userout?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
		      </c:when>   
		   </c:choose>
		</c:forEach>      
		
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="userout?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">  </a>
		</c:if>   
	   </td>
	</tr>
      </table>
    </div>
  </div>
  
</body>
</html>
