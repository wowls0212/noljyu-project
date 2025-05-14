<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원 탈퇴 확인</title>
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
    /* 전체 컨테이너 */
    .container {
      max-width: 600px;
      margin: 60px auto;
      padding: 0 20px;
      margin-bottom: 280px;
    }
    /* 섹션 헤더 */
    .section-header {
      text-align: center;
      margin-bottom: 40px;
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
      margin-bottom: 24px;
    }
    .card td {
      padding: 16px;
      text-align: center;
      font-size: 1.1em;
      color: #333;
    }
    /* 버튼 그룹 */
    .button-group {
      text-align: center;
      margin-top: 16px;
    }
    .button-group input {
      margin: 0 8px;
      padding: 10px 24px;
      border: none;
      border-radius: 20px;
      font-size: 1em;
      cursor: pointer;
    }
    .btn-confirm {
      background: #F44336; /* 붉은색으로 탈퇴 강조 */
      color: #fff;
    }
    .btn-cancel {
      background: #eee;
      color: #333;
    }
  </style>
</head>
<body>

  <div class="container">
    <!-- 섹션 헤더 -->
    <div class="section-header">
        <span class="paw"><img src="./image/foot.jpg" width="50px" height="50px"></span>
        <h2>회원탈퇴</h2>
        <span class="paw"><img src="./image/foot.jpg" width="50px" height="50px"></span>
    </div>


    <!-- 삭제 확인 카드 -->
    <div class="card">
      <form action="delete2" method="post">
        <table>
          <caption class="sr-only">회원 탈퇴 확인</caption>
          <tr>
            <td>정말로 탈퇴하시겠습니까?</td>
          </tr>
        </table>
        <div class="button-group">
          <input type="submit"
                 value="탈퇴하기"
                 class="btn-confirm"
                 onclick="return confirm('정말로 탈퇴하시겠습니까?');">
          <input type="button"
                 value="취소"
                 class="btn-cancel"
                 onclick="location.href='main';">
        </div>
      </form>
    </div>
  </div>

</body>
</html>
