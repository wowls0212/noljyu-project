<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    /* --- 기본 레이아웃 --- */
    
    @font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
    body { margin:0;  font-family: 'CookieRun-Regular'; }
    .container { max-width:600px; margin:60px auto; padding:0 20px; }

    /* --- 섹션 헤더 --- */
    .section-header { text-align:center; margin-bottom:40px; }
    .section-header .paw {
      display:inline-block;
      width:40px; height:40px;
      vertical-align:middle;
    }
    .section-header h2 {
      display:inline-block;
      font-size:1.8em; font-weight:bold;
      margin:0 12px; vertical-align:middle;
    }

    /* --- 카드 박스 --- */
    .card {
      background:#fff;
      padding:24px;
      border-radius:8px;
      box-shadow:0 2px 8px rgba(0,0,0,0.1);
    }
    .card table {
      width:100%;
      border-collapse:collapse;
      margin-bottom:24px;
    }
    .card th, .card td {
      padding:12px 8px;
      vertical-align:middle;
    }
    .card th {
      width:35%;
      color:#666;
      font-weight:normal;
      text-align:left;
    }
    .card td {
      text-align:left;
      color:#333;
    }

    /* --- 회원유형 토글 버튼 --- */
    .toggle-group {
      display:flex; gap:8px; margin-bottom:16px;
    }
    .toggle-group input[type="radio"] { display:none; }
    .toggle-group label {
      flex:0 0 auto;
      padding:8px 16px;
      height:40px;
      line-height:24px;
      border:1px solid #ccc;
      border-radius:20px;
      cursor:pointer;
      white-space:nowrap;
      display:flex;
      align-items:center;
      justify-content:center;
      transition:background .2s, color .2s, border-color .2s;
      font-size:1em;
    }
    .toggle-group input:checked + label {
      background: #FECB2F;
      color: #000;
      border-color: #FECB2F;
    }
     #admin-admin:checked + label {
      background: #9CC384 !important;
      color: #fff !important;
      border-color: #9CC384 !important;
    }
    

    /* --- 입력+버튼 그룹 --- */
    .input-group {
      display:flex;
      align-items:center;
    }
    .input-group input[type="text"],
    .input-group input[type="password"],
    .input-group input[type="file"] {
      flex:1;
      height:40px;
      padding:0 12px;
      border:1px solid #ccc;
      border-radius:4px;
      box-sizing:border-box;
      font-size:1em;
    }
    /* 중복확인 버튼 스타일 */
    .input-group input[type="button"] {
      background: #eee;
      color: #333;
      border: none;
      border-radius: 20px;
      padding: 0 16px;
      height: 40px;
      cursor: pointer;
      font-size: 0.95em;
      transition: background 0.2s, color 0.2s;
    }
    /* hover 시 노란색으로 변경 */
    .input-group input[type="button"]:hover {
      background: #FECB2F;
      color: #000;
     }

    /* --- 버튼 그룹 --- */
    .button-group {
      text-align:center; margin-top:16px;
    }
    .button-group input {
      margin:0 8px;
      height:40px;
      padding:0 24px;
      border:none;
      border-radius:20px;
      font-size:1em;
      cursor:pointer;
    }
    .btn-confirm { background:#FECB2F; color:#000; }
    .btn-cancel  { background:#eee;     color:#333; }

    /* --- 프로필 사진 호버 확대 --- */
    .card img { transition:transform .2s; cursor:pointer; }
    .card img:hover { transform:scale(2); }

    /* --- 에러 메시지 --- */
    .error { color:#d9534f; text-align:center; margin-bottom:16px; }

    /* --- SNS 아이콘 섹션 --- */
    .sns-section {
      text-align: center;
      margin-top: 32px;
      padding-top: 24px;
      border-top: 2px dashed #FECB2F;
    }
    
    .sns-section { text-align:center; margin-top:24px; }
    .sns-icons {
      display:inline-flex;
      gap:16px;
      justify-content:center;
      align-items:center;
      margin-top:12px;
    }
    .sns-icons img {
      width:160px;
      height:40px;
      object-fit:contain;
      cursor:pointer;
      transition:transform .2s;
    }
    .sns-icons img:hover { transform:scale(1.05); }
    .main-banner {
	position: relative;
	height: 400px;
	display:inline;
	align-items: center;
	overflow: inherit;
	margin-bottom: 150px;
}
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
    $(function(){
      $("input[name='admin']").change(function(){
        $("#admin-admin").is(":checked")
          ? $("#adminPwRow").show()
          : $("#adminPwRow").hide().find("input").val("");
      });
      $("#idcheck").click(function(){
        var id=$("#id").val();
        $.post("idcheck2",{id},function(res){
          alert(res==="ok"?"사용가능 ID입니다.":"이미 사용중인 ID입니다.");
        });
      });
      $("#nicknameCheck").click(function(){
        var nick=$("#nickname").val();
        $.post("nicknamecheck",{nickname:nick},function(res){
          alert(res==="ok"?"사용 가능한 닉네임입니다.":"이미 사용 중인 닉네임입니다.");
        });
      });
    });
  </script>
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
    <!-- 헤더 -->
    <div class="section-header">
      <img class="paw" src="./image/foot.jpg" alt="paw">
      <h2>회원가입</h2>
      <img class="paw" src="./image/foot.jpg" alt="paw">
    </div>

    <!-- 에러 -->
    <c:if test="${not empty msg}">
      <div class="error">${msg}</div>
    </c:if>

    <!-- 폼 -->
    <div class="card">
      <form action="usersave" method="post" enctype="multipart/form-data">
        <table>
          <caption class="sr-only">회원가입 폼</caption>

          <!-- 회원유형 -->
          <tr>
            <th>회원 유형</th>
            <td>
              <div class="toggle-group">
                <input type="radio" id="admin-user"  name="admin" value="user"  checked>
                <label for="admin-user">일반 사용자</label>
                <input type="radio" id="admin-admin" name="admin" value="admin">
                <label for="admin-admin">관리자</label>
              </div>
            </td>
          </tr>
          <tr id="adminPwRow" style="display:none;">
            <th>관리자용 비밀번호</th>
            <td><input type="password" name="adminPass" placeholder="관리자용 비밀번호"></td>
          </tr>

          <!-- 프로필 -->
          <tr>
            <th>프로필 사진</th>
            <td><input type="file" name="uploadfile" accept="image/*"></td>
          </tr>

          <!-- 아이디 -->
          <tr>
            <th>아이디</th>
            <td>
              <div class="input-group">
                <input type="text" name="id" id="id" placeholder="아이디 입력">
                <input type="button" id="idcheck" value="중복확인">
              </div>
            </td>
          </tr>

          <!-- 비밀번호 -->
          <tr>
            <th>패스워드</th>
            <td><input type="password" name="pw" placeholder="비밀번호 입력"></td>
          </tr>

          <!-- 이름, 주소, 연락처 -->
          <tr>
            <th>이름</th>
            <td><input type="text" name="name" placeholder="이름 입력"></td>
          </tr>
          <tr>
            <th>주소</th>
            <td><input type="text" name="address" placeholder="주소 입력"></td>
          </tr>
          <tr>
            <th>연락처</th>
            <td><input type="text" name="phone" placeholder="010-1234-5678"
                       pattern="\d{3}-\d{3,4}-\d{4}" required></td>
          </tr>

          <!-- 닉네임 -->
          <tr>
            <th>닉네임</th>
            <td>
              <div class="input-group">
                <input type="text" name="nickname" id="nickname" placeholder="닉네임 입력">
                <input type="button" id="nicknameCheck" value="중복확인">
              </div>
            </td>
          </tr>

          <!-- 반려동물 -->
          <tr>
            <th>반려동물 종류</th>
            <td><input type="text" name="myanimal" placeholder="예: 강아지, 고양이" required></td>
          </tr>
          <tr>
            <th>반려동물 이름</th>
            <td>
              <input type="text" name="petName" placeholder="반려동물 이름" required>
              <div style="font-size:0.8em;color:#555;">
                (비밀번호 찾기 시 본인 확인용)
              </div>
            </td>
          </tr>
        </table>

        <!-- 버튼 -->
        <div class="button-group">
          <input type="submit"  value="입력"  class="btn-confirm">
          <input type="button" value="취소" class="btn-cancel" onclick="location.href='main';">
        </div>
      </form>

      <!-- SNS -->
      <div class="sns-section">
        <p><strong>SNS 계정으로 회원가입</strong></p>
        <div class="sns-icons">
          <a href="https://kauth.kakao.com/...">
            <img src="./image/kakao.png" alt="카카오">
          </a>
          <a href="https://nid.naver.com/...">
            <img src="./image/naver.png" alt="네이버">
          </a>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
