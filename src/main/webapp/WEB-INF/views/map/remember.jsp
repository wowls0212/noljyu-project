<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
     @font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
		body{
		font-family: 'CookieRun-Regular';
		}
    
        /* 전체 컨테이너 */
        .container {
            max-width: 700px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        /* 섹션 헤더 */
        .section-header {
            text-align: center;
            margin-bottom: 40px;
        }
        .section-header .paw {
            color: #FECB2F;
            font-size: 1.5em;
            margin: 0 8px;
        }
        .section-header h2 {
            display: inline-block;
            font-size: 2em;
            font-weight: bold;
        }

        /* 프로필 카드: 세로 방향 */
        .profile-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            margin-bottom: 60px;
        }
        .profile-card .photo img {
            width: 180px;
            height: 180px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 20px;
        }
        .profile-card .info {
            width: 100%;
        }
        .profile-card .info tr th {
            text-align: left;
            padding: 8px 0;
            color: #666;
            font-weight: normal;
        }
        .profile-card .info tr td {
            text-align: left;
            padding: 8px 0;
            font-weight: bold;
            color: #333;
        }

        /* 수정/탈퇴 버튼 스타일 */
        .profile-card .actions {
            text-align: center;
            padding-top: 20px;
        }
        .profile-card .actions a {
            display: inline-block;
            height: 40px;
            line-height: 40px;
            padding: 0 24px;
            margin: 0 8px;
            border-radius: 20px;
            text-decoration: none;
            font-size: 1em;
            cursor: pointer;
        }
        .profile-card .actions a.edit {
            background: #FECB2F;
            color: #000;
        }
        .profile-card .actions a.delete {
            background: #F44336;
            color: #fff;
        }

        /* 내가 쓴 글 리스트 */
        .post-list table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 40px;
        }
        .post-list caption {
            caption-side: top;
            text-align: left;
            font-size: 1.2em;
            font-weight: bold;
            padding-bottom: 10px;
        }
        .post-list thead {
            padding: 12px 8px;
            color: #666;
            font-weight: normal;
            border-bottom: 2px solid #FECB2F;
            text-align: left;
        }
        .post-list th {
            padding: 12px 8px;
            color: #666;
            font-weight: normal;
            border-bottom: 2px solid #FECB2F;
            text-align: center;
        }
        .post-list tbody td {
            padding: 12px 8px;
            border-bottom: 1px solid #eee;
        }
        .post-list tbody tr:last-child td {
            border-bottom: none;
        }
        .post-list a {
            color: #333;
            text-decoration: none;
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
                    <img alt="배너이미지" src="./image/remember.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>
<div class="container">

    <!-- 프로필 카드 (세로 레이아웃) -->
    <div class="profile-card">
        <div class="photo">
            <c:choose>
                <c:when test="${not empty dto.petimg}">
                    <img src="./image/${dto.petimg}" alt="프로필 사진">
                </c:when>
                <c:otherwise>
                    <img src="./image/default.jpg" alt="기본 프로필 사진">
                </c:otherwise>
            </c:choose>
        </div>
        <table class="info">
            <tr><th>아이디</th><td>${dto.id}</td></tr>
            <tr><th>이름</th><td>${dto.petname}</td></tr>
            <tr><th>떠나간 날</th><td>${dto.deadday}</td></tr>
        </table>
        <div class="actions">
            <a href="pet" class="edit">기억하기</a>
            <a href="letter" class="edit">편지쓰기</a>
        </div>
    </div>

    <!-- 내가 쓴 글 리스트 -->
    <div class="post-list">
        <table>
            <caption>편지</caption>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="letter" items="${list}">
                    <tr>
                      <td>${letter.letternum }</td>
                      <td>
                      <a href="letterdetail?letternum=${letter.letternum }">
                      ${letter.lettertitle }
                      </a>
                      </td>
                      <td>${letter.writeday }</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty myPosts}">
                    <tr><td colspan="3">편지를 써보세요!</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>

</div>
</body>
</html>
