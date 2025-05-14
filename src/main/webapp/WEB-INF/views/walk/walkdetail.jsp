<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"> 
<link href="https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSans.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"> <!-- 아이콘용 -->
<meta charset="UTF-8">
<style>


@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }
  body {
    margin: 0;
    font-family: 'CookieRun-Regular', 'Noto Sans KR', sans-serif;
    background-color: #f6f8fa;
  }

  .container {
    max-width: 700px;
    margin: 80px auto;
    padding: 30px;
    background: #ffffff;
    border-radius: 20px;
    box-shadow: 0 8px 24px rgba(0,0,0,0.08);
    animation: fadeIn 0.6s ease-in-out;
  }

  @keyframes fadeIn {
    0% {opacity: 0; transform: translateY(20px);}
    100% {opacity: 1; transform: translateY(0);}
  }

  .section-header {
    text-align: center;
    margin-bottom: 40px;
  }

  .section-header h2 {
    font-size: 2em;
    font-weight: bold;
    margin: 0 12px;
    display: inline-block;
    vertical-align: middle;
  }
  .section-header .paw {
    width: 44px;
    height: 44px;
    vertical-align: middle;
  }

  .card table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 12px;
  }

  .card th, .card td {
    padding: 14px 16px;
    text-align: left;
    background-color: #f9fafb;
    border-radius: 12px;
  }

  .card th {
    color: #555;
    font-weight: 500;
    width: 25%;
    background-color: #f1f3f5;
  }

  .card td {
    color: #222;
  }

  .card img {
    max-width: 100%;
    border-radius: 12px;
    border: 1px solid #ddd;
  }
  .walk-title {
    font-size: 1.8em;
    font-weight: bold;
    margin-bottom: 10px;
    color: #222;
    text-align: left;
    border-bottom: 2px solid #FECB2F;
    word-break: break-word;
  }
  .walk-meta {
    color: #999;
    font-size: 0.95em;
    text-align: left;    
    padding-bottom: 10px;
    margin-bottom: 20px;
  }
  .walk-detail {
    font-size: 1.1em;
    line-height: 1.6em;
    color: #333;
    margin-bottom: 30px;
    white-space: pre-line;
    text-align: left;    
    vertical-align: top;   /* 글이 위에서부터 시작하도록 설정 */
    padding-top: 0;        /* 필요 시 패딩 조정 */
  }
 .img-box {
    margin-top: 10px;
  }
  .img-box img {
    max-width: 100%;
    border-radius: 8px;
    margin: 0 auto; 
  }
  .button-group {
    text-align: center;
    margin-top: 30px;
  }

  .button-group button {
    padding: 12px 26px;
    margin: 0 10px;
    border: none;
    border-radius: 25px;
    font-size: 1em;
    cursor: pointer;
    
    transition: all 0.3s ease;
  }

  .btn-confirm {
    background-color: #ffd43b;
    color: #212529;
  }

  .btn-confirm:hover {
    background-color: #fab005;
  }

  .btn-cancel {
    background-color: #e9ecef;
    color: #495057;
  }

  .btn-cancel:hover {
    background-color: #ced4da;
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#walkdelete").click(function() {
        var walknum = $("#walknum").val();
        var value = confirm("정말로 삭제하시겠습니까?");
        if (value == true) {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/walkdelete",
                data: { "walknum": walknum },
                async: true,
                success: function(bigo) {
                    if (bigo == "success") { 
                        alert("삭제가 완료되었습니다");
                        location.href='main';
                    } else {
                        alert("정상적으로 처리되지 않았습니다");
                        location.href="main";
                    }
                },
                error: function() {
                    alert("에러가 발생했습니다. 다시 시도해주세요");
                }
            });
        }
    });
});


</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <section class="main-banner">
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="배너이미지" src="./image/walkbanner.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>
  <div class="container">
    <!-- 헤더 -->
    <div class="section-header">
      <img class="paw" src="./image/foot.jpg" alt="paw">
      <h2>나만의 산책코스 </h2>
      <img class="paw" src="./image/foot.jpg" alt="paw">
    </div>
	
	<!-- 폼 -->
	<div class="card">		
 			<input type="hidden" name="walknum" value="${dto.walknum}" id="walknum">		
		<table>
				<caption class="sr-only">나만의 산책코스 상세 폼</caption>
			<colgroup>
			<col width=""><col width="">	
			<tr>
	  			
	  			<td class="walk-title">${dto.walktitle}</td>
			</tr>
			<tr>
	  			
	  			<td class="walk-meta">${dto.id}</td>
			</tr>
			<tr>		
				<c:if test="${not empty dto.walkimg}">
   				<td class="img-box">
        			<img src="${pageContext.request.contextPath}/image/${dto.walkimg}" width="800px" height="350px">
    			</td>
				</c:if>
			</tr>
			<tr>  			
	  			<td class="walk-detail">
			    <c:out value="${dto.walkdetail}" escapeXml="false"/>
	  			</td>
			</tr>		
		</table>
		
		<!-- 버튼 -->
	    <div class="button-group">
		  <c:choose>
		    <c:when test="${id == dto.id}">
		      <button class="btn-confirm" onclick="location.href='walkupdate?walknum=${dto.walknum}'">수정</button>
		      <button class="btn-cancel" id="walkdelete">삭제</button>
		    </c:when>
		  </c:choose>
		</div>
      </div>
    </div>    
</body>
</html>