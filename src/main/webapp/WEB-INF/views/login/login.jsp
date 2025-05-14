<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    /* 전체 레이아웃 */
    
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
      max-width: 420px;
      margin: 120px auto 0;
      padding: 0 16px;
       margin-bottom: 150px;
    }

    /* 섹션 헤더 */
    .section-header {
      text-align: center;
      margin-bottom: 32px;
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
      margin: 0 8px;
      vertical-align: middle;
    }

    /* 카드 박스 */
    .card {
      background: #fff;
      padding: 28px;
      border-radius: 10px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    .card table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }
    .card th, .card td {
      padding: 14px 8px;
      vertical-align: middle;
    }
    .card th {
      width: 30%;
      color: #666;
      font-weight: normal;
      text-align: left;
    }
    .card td input {
      width: 100%;
      height: 44px;
      padding: 0 12px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 1em;
      box-sizing: border-box;
    }

    /* 버튼 그룹 */
    .button-group {
      text-align: center;
    }
    .button-group input {
      margin: 0 8px;
      height: 44px;
      padding: 0 24px;
      border: none;
      border-radius: 22px;
      font-size: 1em;
      cursor: pointer;
      vertical-align: middle;
    }
    .btn-login {
      background: #FECB2F;
      color: #000;
    }
    .btn-cancel {
      background: #eee;
      color: #333;
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

    <section class="main-banner">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="배너이미지" src="./image/main1.jpg" width="1900px" height="400px">
                </div>
                <div class="item">
                    <img alt="배너이미지2" src="./image/main2.jpg" width="1900px" height="500px">
                </div>
                <div class="item">
                    <img alt="배너이미지3" src="./image/main3.png" width="1900px" height="400px">
                </div>
                <div class="item">
                    <img alt="배너이미지4" src="./image/main4.jpg" width="1900px" height="400px">
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
    <!-- 섹션 헤더 -->
    <div class="section-header">
      <img class="paw" src="./image/foot.jpg" alt="paw">
      <h2>로그인</h2>
      <img class="paw" src="./image/foot.jpg" alt="paw">
    </div>

    <!-- 로그인 카드 -->
    <div class="card">
      <form action="logincheck" method="post">
        <table>
          <caption class="sr-only">로그인 폼</caption>
          <tr>
            <th>아이디</th>
            <td><input type="text" name="id" placeholder="아이디 입력"></td>
          </tr>
          <tr>
            <th>패스워드</th>
            <td><input type="password" name="pw" placeholder="패스워드 입력"></td>
          </tr>
        </table>
        <div class="button-group">
          <input type="submit" value="로그인" class="btn-login">
          <input type="button" value="비밀번호 찾기" class="btn-cancel"
                 onclick="location.href='passwordfind';">     <!--취소 x 비밀번호 찾기로 다른분들 수정해야될곳 -->
        </div>
      </form>
    </div>
  </div>
</body>
</html>
