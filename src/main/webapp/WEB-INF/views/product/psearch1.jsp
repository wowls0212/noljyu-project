<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품자료 검색</title>
  <style>
  @font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
  
    body { margin:0; font-family: 'CookieRun-Regular'; }
    .container { max-width:800px; margin:60px auto; padding:0 20px;
    margin-bottom: 200px; }

    /* 섹션 헤더 */
    .section-header { text-align:center; margin-bottom:40px; }
    .section-header .paw { display:inline-block; width:40px; vertical-align:middle; }
    .section-header h2 {
      display:inline-block; font-size:2em; font-weight:bold;
      margin:0 12px; vertical-align:middle;
    }

    /* 카드 박스 */
    .card {
      background:#fff; padding:24px; border-radius:8px;
      box-shadow:0 2px 8px rgba(0,0,0,0.1);
    }
    .card table { width:100%; border-collapse:collapse; }
    .card th, .card td {
      padding:12px 8px; text-align:left; vertical-align:middle;
    }
    .card th { width:30%; color:#666; font-weight:normal; }
    .card td { color:#333; }

    /* 토글 버튼 형태의 라디오 그룹: 한 줄 고정 */
    .toggle-group {
      display: flex;
      flex-wrap: nowrap;      /* 한 줄로 강제 */
      overflow-x: auto;       /* 넘칠 시 스크롤 */
      gap: 8px;
      padding-bottom: 8px;
    }
    .toggle-group input[type="radio"] { display:none; }
    .toggle-group label {
      flex: 0 0 auto;
      padding:8px 16px;
      border:1px solid #ccc;
      border-radius:20px;
      cursor:pointer;
      white-space:nowrap;
      transition:background .2s, color .2s, border-color .2s;
    }
    .toggle-group input:checked + label {
      background:#FECB2F; color:#000; border-color:#FECB2F;
    }

    /* 검색어 입력 */
    .card input[type="text"] {
      width:100%; padding:8px;
      border:1px solid #ccc; border-radius:4px;
    }

    /* 버튼 그룹 */
    .button-group {
      text-align:center; margin-top:16px;
    }
    .button-group input {
      margin:0 8px; padding:10px 24px;
      border:none; border-radius:20px; font-size:1em;
      cursor:pointer; background:#FECB2F; color:#000;
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
                    <img alt="배너이미지" src="./image/prosearch.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>

<div class="container">
    
    <div class="card">
    <form action="psearch2">
    <table>
        <caption class="sr-only">상품 검색 폼</caption>
            <tr>
            <th>동물구분</th>
            <td>
            	<div class="toggle-group">
                <input type="radio" name="scname" value="dog" id="dog">
                <label for="dog">개</label>
                <input type="radio" name="scname" value="cat" id="cat">
                <label for="cat">고양이</label>
              	<input type="radio" name="scname" value="bird" id="bird">
              	<label for="bird">새</label>
                <input type="radio" name="scname" value="fish" id="fish">
                <label for="fish">물고기</label>
                <input type="radio" name="scname" value="creep" id="creep">
                <label for="creep">파충류</label>
       		</div>
       		</td>
       		</tr>
       		 
       		 <tr>
       			<th>상품구분</th>
       			<td>
       			<div class="toggle-group">
                <input type="radio" name="scval" value="foodsnack" id="foodsnack">
                <label for="foodsnack">사료&간식</label>
                <input type="radio" name="scval" value="toyliving" id="toyliving">
                <label for="toyliving">장난감&리빙</label>
                <input type="radio" name="scval" value="healthtoilet" id="healthtoilet">
                <label for="healthtoilet">건강&배변</label>
                <input type="radio" name="scval" value="beautyfashion" id="beautyfashion">
                <label for="beautyfashion">미용&패션</label>
            </div>
            </td>
            </tr>
            <tr>
            <th>검색어</th>
            <td>
              <input type="text" name="scvalue" placeholder="검색어를 입력하세요">
            </td>
          </tr>
        </table>
        <div class="button-group">
          <input type="submit" value="검색">
        </div>
      </form>
    </div>
  </div>
</body>
</html>