<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<!-- 스타일 -->
<style>
 @font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
  body { margin: 0;  font-family: 'CookieRun-Regular'; }
  .container { max-width: 900px; margin: 40px auto; padding: 0 20px; }
  .card { background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.08); margin-bottom: 30px; word-break: break-word; box-sizing: border-box; }
  .post-title { font-size: 1.8em; font-weight: bold; color: #222; margin-bottom: 5px; text-align: left; }
  .post-writer { font-size: 1.1em; color: #555; margin-bottom: 10px; text-align: left; }
  .post-divider { border-bottom: 2px solid #FECB2F; margin: 10px 0 20px; }
  .post-detail { font-size: 1.1em; line-height: 1.8em; color: #333; white-space: pre-wrap; margin-bottom: 30px; text-align: left; }
  .img-box { text-align: center; margin-top: 10px; }
  .img-box img { max-width: 100%; border-radius: 8px; }

  /* 추천 버튼 스타일 */
  .goodbtn { text-align: right; margin-bottom: 20px; }
  .btn-like {
    background-color: #FECB2F;
    color: #000;
    border: none;
    border-radius: 20px;
    padding: 8px 16px;
    font-size: 0.95em;
    display: inline-flex;
    align-items: center;
    cursor: pointer;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }
  .btn-like img { margin-right: 8px; display: inline-block; }
  .btn-like:hover { transform: scale(1.05); box-shadow: 0 4px 8px rgba(0,0,0,0.15); }

  .button-group { text-align: right; }
  .btn { padding: 10px 22px; font-size: 0.95em; border: none; border-radius: 20px; cursor: pointer; margin-left: 8px; transition: transform 0.2s ease; }
  .btn-edit { background-color: #FECB2F; color: #000; }
  .btn-delete { background-color: #F44336; color: #fff; }
  .btn-report { background-color: #F44336; color: #fff; }
  .btn:hover { transform: scale(1.05); }

  textarea { width: 100%; border: 1px solid #ccc; border-radius: 10px; padding: 12px; font-size: 1em; resize: vertical; }
  .comment-actions { margin-top: 10px; text-align: right; }
  .comment-actions button { background-color: #f0f0f0; color: #333; border: none; padding: 6px 14px; border-radius: 20px; font-size: 0.9em; margin-left: 6px; cursor: pointer; }
  .comment-actions button:hover { background-color: #FECB2F; color: #000; }
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
                    <img alt="배너이미지" src="./image/remember.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>
<div class="container">
  <!-- 게시글 상세 -->
  <div class="card">
    <input type="hidden" id="letternum" value="${dto.letternum}" />
    <div class="post-title">${dto.lettertitle}</div>
    <div class="post-writer">${dto.id}</div>
    <div class="post-divider"></div>
    <div class="post-detail">${dto.letterdetail}</div>
   	<div class="post-detail">작성일 : ${dto.writeday }</div>
    <div><a href="remember">뒤로가기</a></div>
</div>
</div>
</body>
</html>