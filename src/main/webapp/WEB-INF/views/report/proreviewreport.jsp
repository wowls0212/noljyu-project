<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나랑 같이 놀쥬 :: 상품 리뷰 신고창</title>
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
	max-width: 500px;
	margin: 100px auto;
	padding: 24px;
}

.card {
	background: #fff;
	padding: 28px;
	border-radius: 10px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 24px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 12px;
	vertical-align: top;
	text-align: left;
}

th {
	color: #555;
	font-weight: normal;
	width: 30%;
}

input[type="text"], select, textarea {
	width: 100%;
	padding: 10px;
	font-size: 1em;
	border: 1px solid #ccc;
	border-radius: 6px;
	box-sizing: border-box;
}

textarea {
	resize: vertical;
	height: 120px;
}

.button-group {
	text-align: center;
	margin-top: 20px;
}

button {
	padding: 10px 24px;
	border: none;
	border-radius: 20px;
	font-size: 1em;
	margin: 0 8px;
	cursor: pointer;
}

.btn-submit {
	background-color: #d9534f;
	color: #fff;
}

.btn-submit:hover {
	background-color: #c9302c;
}

.btn-cancel {
	background-color: #eee;
	color: #333;
}

.btn-cancel:hover {
	background-color: #FECB2F;
	color: #000;
}

.btn-submit:hover {
	background-color: #c9302c;
}

.card tbody tr:nth-child(even) {
	background: #fafafa;
}

.card tbody tr:hover {
	background: #fff8e1;
}

.card thead th {
	position: sticky;
	top: 0;
	background: #fff; /* header 배경 유지 */
	z-index: 1;
}
</style>

</head>
<body>
<div class="container">
		<div class="card">
			<h2>상품 리뷰 신고</h2>	
	<form action="proreviewreportsave">
	<input type="hidden" name="productnum" value="${dto.productnum }">
	<input type="hidden" name="proreviewnum" value="${dto.proreviewnum }">
		<table>
			<tr>
				<th>신고대상</th>
				<td><input type="text" value="${dto.id }" name="productid" readonly="readonly"></td>
			</tr>
			<tr>
				<th>신고사유</th>
				<td>
				<select name="proreportreason" id="category" required="required">
					<option value="정보통신망법에 의거한 청소년 유해 컨텐츠">정보통신망법에 의거한 청소년 유해 컨텐츠</option>
					<option value="정보통신망법에 의거한 명예훼손, 모욕, 비방">정보통신망법에 의거한 명예훼손, 모욕, 비방</option>
					<option value="정보통신망법에 의거한 불법촬영물">정보통신망법에 의거한 불법촬영물</option>
					<option value="정보통신망법에 의거한 광고성 게시글(스팸, 바이럴)">정보통신망법에 의거한 광고성 게시글(스팸, 바이럴)</option>
					<option value="개인정보보호법에 의거한 개인정보 노출게시물">개인정보보호법에 의거한 개인정보 노출게시물</option>
					<option value="불법행위,불법링크 등 불법정보 포함게시글">불법행위,불법링크 등 불법정보 포함게시글</option>
					<option value="그 외(아래 '문의 내용'에 게재)">그 외(아래 '문의 내용'에 게재)</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>신고내용</th>
				<td><textarea rows="10" cols="20" name="proreportdetail"></textarea>
			</tr>
			<tr>
			<c:choose>
				<c:when test="${loginstate==true }">
				<th>신고자</th>
				<td><input type="text" name="proreportid" value="${id }" readonly="readonly"></td>
				</c:when>
			</c:choose>
			</tr>
			</table>
			<div class="button-group">
			<button type="submit" class="btn-submit">신고하기</button>
			<button type="button" class="btn-cancel" onclick="window.close();">취소하기</button>
			</div>
	</form> 
</div>
</div>
</body>
</html>