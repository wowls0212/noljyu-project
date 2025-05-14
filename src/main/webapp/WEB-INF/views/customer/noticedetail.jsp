<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나랑 같이 놀쥬 :: 공지사항 상세</title>

<!-- 통일된 스타일 -->
<style>
@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

  body { margin: 0; font-family: 'CookieRun-Regular'; }
  .container { max-width: 800px; margin: 40px auto; padding: 0 20px; }
  .section-header { text-align: center; margin-bottom: 30px; }
  .section-header .paw { display: inline-block; width: 44px; height: 44px; vertical-align: middle; }
  .section-header h2 { display: inline-block; font-size: 2em; font-weight: bold; margin: 0 12px; vertical-align: middle; }
  .card { background: #fff; padding: 28px; border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); margin-bottom: 40px; }
  table { width: 100%; border-collapse: collapse; }
  th, td { padding: 16px 12px; text-align: center; border-bottom: 1px solid #eee; }
  td { color: #333; font-size: 1.1em; }
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
                    <img alt="배너이미지" src="./image/noticebanner.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>
<div class="container">

  <!-- 공지사항 상세 카드 -->
  <div class="card">
    <table>
      <tr>
        <td><strong>${dto.ntitle}</strong></td>
      </tr>
      <tr>
        <td style="white-space: pre-line;">${dto.ndetail}</td>
      </tr>
    </table>
  </div>

</div>

</body>
</html>
