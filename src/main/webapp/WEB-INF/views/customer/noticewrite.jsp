<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나랑 같이 놀쥬 :: 공지사항 등록</title>

<!-- 스타일 -->
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
  th, td { padding: 16px 12px; text-align: left; border-bottom: 1px solid #eee; }
  th { background: #fafafa; color: #666; font-weight: normal; width: 30%; }
  td { color: #333; }
  input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    font-size: 1em;
    border: 1px solid #ccc;
    border-radius: 6px;
    box-sizing: border-box;
  }
  textarea { resize: vertical; }
  /* 버튼 그룹 */
  .button-group {
    text-align: center;
    margin-top: 20px;
  }
  .btn {
    display: inline-block;
    padding: 10px 24px;
    border: none;
    border-radius: 20px;
    font-size: 1em;
    cursor: pointer;
    margin: 0 8px;
    transition: transform 0.3s ease;
  }
  .btn-submit {
    background: #FECB2F;
    color: #000;
  }
  .btn-cancel {
    background: #eee;
    color: #333;
  }
  .btn:hover {
    transform: scale(1.05);
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
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="배너이미지" src="./image/noticebanner.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>
<div class="container">

  <!-- 섹션 헤더 -->
  <div class="section-header">
    <span class="paw"><img src="./image/foot.jpg" width="50" height="50" alt="paw"></span>
    <h2>공지사항 등록</h2>
    <span class="paw"><img src="./image/foot.jpg" width="50" height="50" alt="paw"></span>
  </div>

  <!-- 등록 폼 카드 -->
  <div class="card">
    <form action="noticesave" method="post">
      <table>
        <tr>
          <th>제목</th>
          <td><input type="text" name="ntitle" required></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea name="ndetail" rows="8" required></textarea></td>
        </tr>
      </table>

      <div class="button-group">
        <button type="submit" class="btn btn-submit">저장</button>
        <button type="button" class="btn btn-cancel" onclick="location.href='main'">취소</button>
      </div>
    </form>
  </div>

</div>

</body>
</html>
