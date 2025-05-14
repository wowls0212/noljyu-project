<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
  body { margin: 0; font-family: 'CookieRun-Regular';}
  .container { max-width: 900px; margin: 40px auto; padding: 0 20px; }
  .card {
    background: #fff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    margin-bottom: 30px;
    overflow-wrap: break-word;
    word-break: break-word;
    box-sizing: border-box;
    max-width: 100%;
  }
  .post-title {
    font-size: 1.8em;
    font-weight: bold;
    color: #222;
    text-align: left;
    margin-bottom: 5px;
    word-break: break-word;
  }
  .post-writer {
    font-size: 1.1em;
    color: #555;
    text-align: left;
    margin-bottom: 10px;
  }
  .post-divider {
    border-bottom: 2px solid #FECB2F;
    margin: 10px 0 20px 0;
  }
  .post-detail {
    font-size: 1.1em;
    line-height: 1.8em;
    color: #333;
    white-space: pre-wrap;
    text-align: left;
    margin-bottom: 30px;
    word-break: break-word;
  }
  .img-box {
    text-align: center;
    margin-top: 10px;
  }
  .img-box img {
    max-width: 100%;
    border-radius: 8px;
  }

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
  .btn-like img {
    margin-right: 8px;
    display: inline-block;
  }
  .btn-like:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
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
  .btn-edit   { background-color: #FECB2F; color: #000; }
  .btn-delete { background-color: #F44336; color: #fff; }
  .btn-report { background-color: #eee; color: #333; }
  .btn:hover  { transform: scale(1.05); }

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
    $("#postdelete").click(function(){
        if(confirm("정말로 삭제하시겠습니까?")){
            $.post("postdelete", { postnum: $("#postnum").val() }, function(res){
                if(res === "success"){
                    alert("삭제가 완료되었습니다");
                    location.replace("fleaout");
                } else {
                    alert("정상적으로 처리되지 않았습니다");
                    location.href="main";
                }
            });
        }
    });
});

function reviewRealUpdate(sindex){
    $.post("reviewupdate",
      { reviewnum: $("#reviewnum"+sindex).val(), review: $("#reveiwUpdate-content"+sindex).val() },
      function(data){
        if(data === "1") location.replace("fleadetail?postnum=${dto.postnum}");
      }
    );
}

function reupdate(sindex){
    $("#review2"+sindex).hide();
    $("#review3"+sindex).show();
    $("#reupdate-btn"+sindex).hide();
}

function reviewdelete(sindex){
    if(confirm("정말로 삭제하시겠습니까?")){
        $.post("reviewdelete",
          { reviewnum: $("#reviewnum"+sindex).val() },
          function(res){
            if(res === "success") location.replace("fleadetail?postnum=${dto.postnum}");
            else alert("정상적으로 처리되지 않았습니다");
          }
        );
    }
}

function rere(sindex){
    $("#rere2"+sindex).show();
    $("#rere-btn"+sindex).hide();
}

function rereRealUpdate(sindex){
    $.post("reresave",
      {
        reviewnum: $("#reviewnum"+sindex).val(),
        review: $("#rere-content"+sindex).val(),
        id: $("#id"+sindex).val()
      },
      function(data){
        if(data === "1") location.replace("fleadetail?postnum=${dto.postnum}");
      }
    );
}
</script>
</head>
<body>
   <section class="main-banner">
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="배너이미지" src="./image/flea.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>
<div class="container">

  <!-- 게시글 상세페이지 출력 -->
  <div class="card">
    <input type="hidden" id="postnum" value="${dto.postnum}" />
    <div class="post-title">${dto.posttitle}</div>
    <div class="post-writer">${dto.id}</div>
    <div class="post-divider"></div>
    <div class="post-detail">${dto.postdetail}</div>
    <div class="img-box"><img src="./image/${dto.postimg}" alt=""></div>

    <!-- 추천 버튼 -->
    <div class="goodbtn">
      <form action="good2" style="display:inline;">
        <input type="hidden" name="goodnum" value="${dto.postnum}" />
        <button type="submit" class="btn-like">
          <img src="./image/foot.jpg" width="20" height="20" alt="발자국" />
          <span>${dto.good}</span>
        </button>
      </form>
    </div>

    <!-- 수정/삭제/신고 -->
    <div class="button-group">
    <c:if test="${loginstate==true }">
      <c:if test="${id==dto.id or id=='admin'}">
        <button class="btn btn-edit" onclick="location.href='fleaupdate?fleanum=${dto.postnum}'">수정</button>
        <button class="btn btn-delete" id="postdelete">삭제</button>
      </c:if>
      <button class="btn btn-report" onclick="window.open('postreport1?postnum=${dto.postnum}&id=${dto.id}','_blank','width=800,height=700')">신고</button>
       </c:if>
    </div>
  </div>

  <!-- 댓글 출력 -->
  <div class="card">
    <table width="800px">
      <tbody>
        <c:forEach items="${list}" var="rr" varStatus="status">
          <tr height="80px">
            <th>
              <c:forEach var="i" begin="0" end="${rr.postindent}">
                <c:choose>
                  <c:when test="${i<rr.postindent}">&emsp;</c:when>
                  <c:when test="${i==rr.postindent}"><img src="./image/foot.jpg" height="20px" style="vertical-align:middle;"></c:when>
                </c:choose>
              </c:forEach>
              ${rr.id}
              <input type="hidden" id="reviewnum${status.index}" value="${rr.postreviewnum}" />
            </th>
            <td class="comment-actions">
            <c:if test="${loginstate==true }">
              <c:if test="${id==rr.id or id=='admin'}">
                <button id="reupdate-btn${status.index}" onclick="reupdate(${status.index});return false;">수정</button>
                <button onclick="reviewdelete(${status.index})">삭제</button>
              </c:if>
              <button id="rere-btn${status.index}" onclick="rere(${status.index});return false;">댓글</button>
              <button onclick="window.open('reviewreport?reviewnum=${rr.postreviewnum}&postnum=${rr.postnum}','_blank','width=600,height=500')">신고</button>
            </c:if>
            </td>
          </tr>
          <tr id="review2${status.index}">
            <td colspan="2" style="text-align:left;">
            <c:forEach var="i" begin="0" end="${rr.postindent}">
                <c:choose>
                  <c:when test="${i<rr.postindent}">&emsp;</c:when>
                </c:choose>
              </c:forEach>
            ${rr.postreview}</td>
          </tr>
          <tr id="review3${status.index}" style="display:none;">
            <td colspan="2">
              <textarea id="reveiwUpdate-content${status.index}" rows="2" cols="100">${rr.postreview}</textarea>
              <a href="#" onclick="reviewRealUpdate(${status.index});return false;" class="btn btn-edit">등록</a>
              <a href="#" class="btn btn-delete">취소</a>
            </td>
          </tr>
          <tr id="rere2${status.index}" style="display:none;">
            <td colspan="2">
              <input type="hidden" id="id${status.index}" value="${id}" />
              <textarea id="rere-content${status.index}" rows="2" cols="100" placeholder="댓글을 입력해 주세요"></textarea>
              <a href="#" onclick="rereRealUpdate(${status.index});return false;" class="btn btn-edit">등록</a>
              <a href="#" class="btn btn-delete">취소</a>
            </td>
          </tr>
        </c:forEach>

        <!-- 댓글이 없을 때 -->
        <c:if test="${empty list}">
          <tr>
            <td colspan="2" style="text-align:center; padding:20px 0; color:#666;">댓글이 없습니다.</td>
          </tr>
        </c:if>

        <!-- 댓글 페이징 처리 -->
        <tr style="border:none;">
          <td colspan="2" style="text-align:center;">
            <c:if test="${paging.startPage>1}">
              <a href="fleadetail?postnum=${dto.postnum}&nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">이전</a>
            </c:if>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
              <c:choose>
                <c:when test="${p==paging.nowPage}"><b><span style="color:#8EBF7F;">${p}</span></b></c:when>
                <c:otherwise><a href="fleadetail?postnum=${dto.postnum}&nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a></c:otherwise>
              </c:choose>
            </c:forEach>
            <c:if test="${paging.endPage<paging.lastPage}">
              <a href="fleadetail?postnum=${dto.postnum}&nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">다음</a>
            </c:if>
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <!-- 댓글 입력창 -->
  <div class="card">
    <form action="fleareviewsave">
      <input type="hidden" name="fleanum" value="${dto.postnum}" />
      <input type="hidden" name="posttype" value="${dto.posttype}" />
      <c:if test="${loginstate==true }">
      <input type="hidden" name="id" value="${id}" /></c:if>
      <textarea rows="5" name="review" placeholder="댓글을 작성해주세요"></textarea>
      <div class="button-group" style="margin-top:10px;">
      <c:if test="${loginstate==true }">
        <input type="submit" class="btn btn-edit" value="등록" />
       </c:if>
      </div>
    </form>
  </div>

</div>
</body>
</html>

