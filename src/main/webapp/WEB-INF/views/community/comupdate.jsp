<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    max-width: 800px;
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
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    margin-bottom: 40px;
  }
  table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
  }
  th, td {
    padding: 12px 10px;
    text-align: left;
    border-bottom: 1px solid #eee;
  }
  th {
    background: #fafafa;
    color: #666;
    font-weight: normal;
    width: 30%;
  }
  td {
    color: #333;
  }
  input[type="text"], textarea, input[type="file"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 1em;
    box-sizing: border-box;
  }
  textarea {
    resize: vertical;
    min-height: 150px;
  }
  .img-box img {
    max-width: 200px;
    height: auto;
    border-radius: 8px;
    margin-bottom: 10px;
  }
  .button-group {
    text-align: center;
    margin-top: 20px;
  }
  .button-group input {
    padding: 10px 24px;
    border: none;
    border-radius: 20px;
    font-size: 1em;
    cursor: pointer;
    margin: 0 8px;
    transition: transform 0.3s ease;
  }
  .button-group input[type="submit"] {
    background: #FECB2F;
    color: #000;
  }
  .button-group input[type="reset"] {
    background: #eee;
    color: #333;
  }
  .button-group input:hover {
    transform: scale(1.05);
  }



.card table {
  width: 100%;
  border-collapse: collapse;
}

.card thead th {
  position: sticky;
  top: 0;
  background: #fff; /* 헤더 배경 고정 */
  z-index: 1;
  padding: 12px 8px;
  font-weight: normal;
  color: #666;
  border-bottom: 2px solid #FECB2F;
}

.card tbody td {
  padding: 12px 8px;
  text-align: center;
  border-bottom: 1px solid #eee;
}

.card tbody tr:nth-child(even) {
  background: #fafafa;
}

.card tbody tr:hover {
  background: #fff8e1;
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
                    <img alt="배너이미지" src="./image/com.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>
<div class="container">
 <!-- 섹션 헤더 -->
  <div class="section-header">
    <span class="paw"><img src="./image/foot.jpg" width="50" height="50" alt="paw"></span>
    <h2>커뮤니티 수정</h2>
    <span class="paw"><img src="./image/foot.jpg" width="50" height="50" alt="paw"></span>
  </div>

<div class="card">

    <form action="comupdatesave" method="post" enctype="multipart/form-data">
      <input type="hidden" name="comnum" value="${dto.postnum}">
      <input type="hidden" name="comoldimg" value="${dto.postimg}">

      <table>
        <tr>
          <th>제목</th>
          <td><input type="text" name="comtitle" value="${dto.posttitle}" required></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea rows="10" name="comdetail" required>${dto.postdetail}</textarea></td>
        </tr>
        <tr>
          <th>현재 이미지</th>
          <td>
            <img src="./image/${dto.postimg}" alt="현재 이미지" class="img-preview">
          </td>
        </tr>
        <tr>
          <th>이미지 변경</th>
          <td><input type="file" name="comimg" accept="image/*"></td>
        </tr>
      </table>

      <div class="button-group">
        <input type="submit" class="btn btn-submit" value="수정">
        <input type="button" onclick="location.href='comout'" class="btn btn-cancel" value="취소">
      </div>

    </form>
</div>
</div>
</body>
</html>