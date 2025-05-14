<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원정보 수정</title>
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
    .card th, .card td {
      padding: 12px 8px;
      text-align: left;
      vertical-align: middle;
    }
    .card th {
      width: 35%;
      color: #666;
      font-weight: normal;
    }
    .card td {
      color: #333;
    }
    .card input[type="text"],
    .card input[type="password"],
    .card input[type="file"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }
    .card img {
      border-radius: 4px;
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
    .btn-save {
      background: #FECB2F;
      color: #000;
    }
    .btn-cancel {
      background: #eee;
      color: #333;
    }
    /* 이미지 호버 확대 */
    .card img:hover {
      transform: scale(2);
      transition: transform .3s;
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
                    <img alt="배너이미지" src="./image/userup.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>

  <div class="container">

    <!-- 수정 폼 카드 -->
    <div class="card">
      <form action="modifysave" method="post" enctype="multipart/form-data">
        <table>
          <caption class="sr-only">회원정보 수정 폼</caption>
          <tr>
            <th>아이디</th>
            <td>
              <input type="text" name="id" value="${dto.id}" readonly>
            </td>
          </tr>
          <tr>
            <th>새 비밀번호</th>
            <td>
              <input type="password" name="pw" placeholder="변경 시 입력, 미입력 시 유지">
            </td>
          </tr>
          <tr>
            <th>이름</th>
            <td>
              <input type="text" name="name" value="${dto.name}" required>
            </td>
          </tr>
          <tr>
            <th>주소</th>
            <td>
              <input type="text" name="address" value="${dto.address}" required>
            </td>
          </tr>
          <tr>
            <th>연락처</th>
            <td>
              <input type="text" name="phone" value="${dto.phone}" required>
            </td>
          </tr>
          <tr>
            <th>닉네임</th>
            <td>
              <input type="text" name="nickname" value="${dto.nickname}" required>
            </td>
          </tr>
          <tr>
            <th>반려동물 종류</th>
            <td>
              <input type="text" name="myanimal" value="${dto.myanimal}" required>
            </td>
          </tr>
          <tr>
            <th>반려동물 이름</th>
            <td>
              <input type="text" name="petName" value="${dto.petName}" required>
            </td>
          </tr>
          <tr>
            <th>현재 프로필 사진</th>
            <td>
              <img src="./image/${dto.photo}"
                   alt="프로필 사진" width="100" height="100">
            </td>
          </tr>
          <tr>
            <th>프로필 사진 변경</th>
            <td>
              <input type="file" name="uploadfile">
            </td>
          </tr>
        </table>

        <div class="button-group">
          <input type="submit" value="수정" class="btn-save">
          <input type="button" value="취소" class="btn-cancel"
                 onclick="location.href='main';">
        </div>
      </form>
    </div>
  </div>

</body>
</html>
