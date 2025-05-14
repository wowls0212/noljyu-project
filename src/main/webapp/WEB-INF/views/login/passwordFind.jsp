<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <!-- 한글 깨짐 방지를 위한 추가 meta -->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>비밀번호 찾기</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    /* 전체 레이아웃 */
    @font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
    body { margin: 0;  font-family: 'CookieRun-Regular'; }
    .container { max-width: 420px; margin: 100px auto 0; padding: 0 16px; }

    /* 섹션 헤더 */
    .section-header { text-align: center; margin-bottom: 32px; }
    .section-header .paw { display: inline-block; width: 44px; height: 44px; vertical-align: middle; }
    .section-header h2 {
      display: inline-block; font-size: 2em; font-weight: bold;
      margin: 0 8px; vertical-align: middle;
    }

    /* 카드 박스 */
    .card {
      background: #fff; padding: 28px; border-radius: 10px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
       margin-bottom: 150px;
    }
    .card table {
      width: 100%; border-collapse: collapse; margin-bottom: 20px;
    }
    .card th, .card td {
      padding: 14px 8px; vertical-align: middle;
    }
    .card th {
      width: 40%; color: #666; font-weight: normal; text-align: left;
    }
    .card td input {
      width: 100%; height: 44px; padding: 0 12px;
      border: 1px solid #ccc; border-radius: 4px;
      font-size: 1em; box-sizing: border-box;
    }

    /* 버튼 그룹 */
    .button-group { text-align: center; }
    .button-group input {
      margin: 0 8px; height: 44px; padding: 0 24px;
      border: none; border-radius: 22px; font-size: 1em;
      cursor: pointer; vertical-align: middle;
    }
    .btn-confirm { background: #FECB2F; color: #000; }
    .btn-cancel  { background: #eee;     color: #333; }

    /* 에러 메시지 */
    .alert {
      padding: 16px;
      margin-bottom: 20px;
      border-radius: 8px;
      background-color: #f8d7da;
      color: #721c24;
      border: 1px solid #f5c6cb;
      font-size: 0.95em;
      animation: fadeIn 0.6s ease-in-out;
     }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-10px); }
      to   { opacity: 1; transform: translateY(0); }
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
                    <img alt="배너이미지" src="./image/pass.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>
  <div class="container">

    <!-- 에러 메시지 -->
   <c:if test="${not empty msg}">
   <div class="alert">${msg}</div>
   </c:if>

    <!-- 폼 카드 -->
    <div class="card">
      <form action="passwordfindProcess" method="post">
        <table>
          <caption class="sr-only">ID 및 반려동물 이름 확인</caption>
          <tr>
            <th>ID</th>
            <td>
              <input type="text" name="id" required placeholder="아이디 입력">
            </td>
          </tr>
          <tr>
            <th>반려동물 이름</th>
            <td>
              <input type="text" name="petName" required placeholder="반려동물 이름 입력">
            </td>
          </tr>
        </table>
        <div class="button-group">
          <input type="submit" value="확인" class="btn-confirm">
          <input type="button" value="취소" class="btn-cancel"
                 onclick="location.href='main';">
        </div>
      </form>
    </div>
  </div>
</body>
</html>
