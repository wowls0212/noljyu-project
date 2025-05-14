<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
// 댓글 수정(DB 저장)
function reviewRealUpdate(sindex){
    var reviewnum = $('#reviewnum'+sindex).val();
    var review = $("#reveiwUpdate-content"+sindex).val();

    $.ajax({
        url : "proreviewupdate",
        data : {'reviewnum' : reviewnum, 'review' : review},
        dataType :'text', 
        success : function(data){
            if(data == "1") {
                alert("댓글이 수정되었습니다");
                let url = 'productdetail?num=${dto.productnum}';
                location.replace(url);
            }
        }
    });
}

// 댓글 수정(댓글 입력 창으로 화면 바뀌기)
function proreupdate(sindex){
    $('#proreview2'+sindex).hide();
    $('#proreview3'+sindex).show();
    $('#proreupdate-btn'+sindex).hide();
}

//댓글 삭제
function proreviewdelete(sindex) {
    var reviewnum = $('#reviewnum'+sindex).val();
    var value = confirm("정말로 삭제하시겠습니까?");
    if (value == true) {
	    $.ajax({
	        type: "POST",
	        url: "proreviewdelete",
	        data: { "reviewnum": reviewnum },
	        async: true,
	        success: function(bigo) {
	            if (bigo == "success") { 
	                alert("삭제가 완료되었습니다");
	                let url = 'productdetail?num=${dto.productnum}';
	                location.replace(url);
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
}


</script>

<style>
/* 기본 스타일 */

@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body {
  margin: 0;
  font-family: 'CookieRun-Regular';
  background-color:white;
  color: #333;
}

/* 상품 상세 영역 */
.container {
  max-width: 1200px;
  margin: 50px auto;
  display: flex;
  gap: 50px;
  background: #fff;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.05);
}

.image-box img {
  width: 500px;
  max-width: 100%;
  height: auto;
  border-radius: 12px;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.details {
  flex: 1;
}

.details h3 {
  font-size: 18px;
  color: #888;
  margin-bottom: 5px;
}

.details h2 {
  font-size: 20px;
  margin-bottom: 10px;
  color: #555;
}

.details h1 {
  font-size: 26px;
  margin-bottom: 20px;
}

.price {
  font-size: 22px;
  font-weight: bold;
  color: #e60023;
}

.buttons {
  margin-top: 30px;
}

.buttons a {
  display: inline-block;
  padding: 12px 24px;
  margin-right: 10px;
  background-color: #e60023;
  color: #fff;
  text-decoration: none;
  border-radius: 8px;
  transition: background-color 0.3s;
}

.buttons a:hover {
  background-color: #b8001d;
}
  .card {
  	max-width: 1200px;
    background: #fff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    margin-bottom: 30px;
    margin-left: 360px;
  }
  .button-group {
    margin-top: 30px;
    text-align: right;
  }
  .btn {
    padding: 10px 22px;
    font-size: 0.95em;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    margin-left: 8px;
    transition: all 0.2s ease;
  }
  .btn-edit {
    background-color: #FECB2F;
    color: #000;
  }
  .btn-delete {
    background-color: #F44336;
    color: #fff;
  }
  .btn-report {
    background-color: #eee;
    color: #333;
  }
  .btn:hover {
    transform: scale(1.05);
  }
  textarea {
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 10px;
    padding: 12px;
    font-size: 1em;
    resize: vertical;
  }
  .comment-section-header {
    font-size: 1.3em;
    margin-bottom: 16px;
    border-bottom: 2px solid #FECB2F;
    padding-bottom: 8px;
  }
  .comment-actions {
    margin-top: 10px;
    text-align: right;
  }
  .comment-actions button {
    background-color: #f0f0f0;
    color: #333;
    border: none;
    padding: 6px 14px;
    border-radius: 20px;
    font-size: 0.9em;
    margin-left: 6px;
    cursor: pointer;
  }
  .comment-actions button:hover {
    background-color: #FECB2F;
    color: #000;
  }
  .btn-edit {
   background-color: #FECB2F;
    color: #000;
     }
     .btn-delete, .btn-report { 
  background-color: #F44336;
color: #fff;
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
<body>
	<!-- ================= 메인 배너 ================= -->
    <section class="main-banner">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="배너이미지" src="./image/3.jpg" width="1900px" height="300px">
                </div>
                <div class="item">
                    <img alt="배너이미지2" src="./image/2.png" width="1900px" height="300px">
                </div>
                <div class="item">
                    <img alt="배너이미지2" src="./image/1.png" width="1900px" height="300px">
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
<!-- 상품 상세 영역 -->
<div class="container">
  <!-- 이미지 영역 -->
  <div class="image-box">
    <img src="./image/${dto.productimg}" alt="상품 이미지">
  </div>

  <!-- 상품 정보 영역 -->
  <div class="details">
    <h3>${dto.animal}</h3>
    <h2>${dto.productlist}</h2>
    <h1>${dto.productname}</h1>
    <div>
      <span class="price">${dto.price}원</span>
      <!-- 필요 시, 할인 전 가격이나 할인율을 추가할 수 있음 -->
    </div>
    <div class="buttons">
      <a href="${dto.productlink}" target="_blank">쿠팡 구매하기</a>
    </div>
  </div>
</div>

<!-- 댓글 출력 -->
<div class="card">
<table width="1100px">
	<tbody>
<c:forEach items="${list}" var="rr" varStatus="status">
	<!-- 작성자, 수정/삭제/댓글 표시 -->
	<tr height="80px">
		<th>
		<c:forEach var="i" begin="0" end="${rr.proindent}">
			<c:choose>
				<c:when test="${i<rr.proindent}">
					&emsp;
				</c:when>
				<c:when test="${i==rr.proindent}">
					<img alt="" src="./image/foot.jpg" height="20px" style="vertical-align:middle;">
				</c:when>
			</c:choose>
		</c:forEach>
		${rr.id} 

		<input type="hidden" value="${rr.proreviewnum}" id="reviewnum${status.index}">
		</th>
		<td class="comment-actions">
		<c:choose>
			<c:when test="${id==rr.id or id=='admin'}">
		<button id="proreupdate-btn${status.index}" onclick="proreupdate(${status.index}); return false;">수정</button>
		<button id="proreviewdelete${status.index}" onclick="proreviewdelete(${status.index})">삭제</button>
			</c:when>
		</c:choose>
		<button onclick = "window.open('proreviewreport?proreviewnum=${rr.proreviewnum}&productnum=${rr.productnum }','_blank','width=800px height=700px resizable=no scrollbar=no location=no toolbars=no')">신고</button>
		</td>
	</tr>
	
	<!-- 댓글 보기창 -->
	<tr id="proreview2${status.index}">
		<td colspan="2" style="text-align: left;">
		<c:forEach var="i" begin="0" end="${rr.proindent}">
			<c:choose>
				<c:when test="${i<rr.proindent}">
					&emsp;
				</c:when>
				<c:when test="${i==rr.proindent}">
					<img alt="" src="./image/reviewicon.png" height="30px">
				</c:when>
			</c:choose>
		</c:forEach>
		${rr.proreview}
		</td>
	</tr>
	
	<!-- 댓글 수정창 -->
	<tr id="proreview3${status.index}" style="display: none;">		
    	<td colspan="2" style="text-align: left;">
    	<c:forEach var="i" begin="0" end="${rr.proindent}">
			<c:choose>
				<c:when test="${i<rr.proindent}">
					&emsp;
				</c:when>
				<c:when test="${i==rr.proindent}">
					<img alt="" src="./image/reviewicon.png" height="30px">
				</c:when>
			</c:choose>
		</c:forEach>
    	<textarea mexlength="300" id="reveiwUpdate-content${status.index}" class="form-control" rows="2" cols="100" placeholder="댓글을 입력해 주세요">${rr.proreview}</textarea>
        <a href="" onclick="reviewRealUpdate(${status.index}); return false;" class="btn btn-edit">등록</a>
        <a href="" class="btn btn-delete">취소</a>
        </td>
	</tr>
	
</c:forEach>

	<!-- 댓글 페이징 처리 -->
	<tr style="border-left: none;border-right: none;border-bottom: none">
		<td colspan="8" style="text-align: center;">
		<c:if test="${paging.startPage!=1 }">
		   <a href="productdetail?num=${dto.productnum}&nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}"></a>
		</c:if>   
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p"> 
		   <c:choose>
		      <c:when test="${p == paging.nowPage }">
		         <b><span style="color: #8EBF7F;">${p}</span></b>
		      </c:when>   
		      <c:when test="${p != paging.nowPage}">
		         <a href="productdetail?num=${dto.productnum}&nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
		      </c:when>   
		   </c:choose>
		</c:forEach>
		
		        <!-- 댓글이 하나도 없을 때 -->
        <c:if test="${empty list}">
          <tr><td colspan="2" style="text-align:center;padding:20px 0;color:#666;">댓글이 없습니다.</td></tr>
        </c:if>      
		
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="productdetail?num=${dto.productnum}&nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">  </a>
		</c:if>   
	   </td>
	</tr>
	</tbody>
</table>
</div>


<!-- 댓글 입력창 -->
<div class="card">
<form action="proreviewsave">
<input type="hidden" value="${dto.productnum}" name="productnum">
	<c:if test="${loginstate==true }">
		<input type="hidden" value="${id }" name="id">
	</c:if>
	<textarea rows="5" name="review" placeholder="댓글을 작성해주세요"></textarea>
      <div class="button-group" style="margin-top:10px;">
      <c:if test="${loginstate==true }">
       	<input type="submit" class="btn btn-edit" value="등록">
       </c:if>
      </div>
</form>
</div>

</body>
</html>