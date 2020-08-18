<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script src="http://malsup.github.io/jquery.cycle2.carousel.js"></script>
<script>
	$.fn.cycle.defaults.autoSelector = '.cycle-slideshow';
</script>

<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="${conPath }/css/main.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.min.css" />
<script src="${conPath }/js/script.js"></script>
<style>
#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}

.card {
	position: fixed;
	top: 240px;
	left: 50px;
	z-index: 99999;
	width: 250px;
	border: 1px solid lightgray;
}

.card footer p a, tbody tr td a {
	color: #998675;
}

table {
	width: 950px;
	border: 1px solid gray;
	margin: 50px auto;
}

table td {
	padding: 20px;
}

table ul {
	overflow: hidden;
}

table ul li {
	float: left;
	padding-right: 15px;
}

#line_div {
	border-bottom: 1px dashed gray;
	width: 970px;
	box-sizing: border;
	margin: 10px 0;
}

#bottom_div {
	width: 970px;
	margin: 0 auto;
}

#content_div {
	text-align: left;
	padding: 10px;
}

b {
	font-weight: bold;
}

#bottom_div {
	width: 970px;
	margin: 0 auto 50px auto;
	text-align: right;
}
#appendButton {
	border:none;
	background-color: white;
	outline:0;
	text-align: center;
}
#rv_coment {
	width: 1000px;
	margin: 0 auto;
	border-bottom: 1px solid lightgray;
	border-top: 1px solid lightgray;
	margin-bottom: 100px;
}
.coment_wrap{
	overflow: hidden;
}
#coment_img, #coment_content{
	float: left;
}
#coment_img{
	width: 80px;
	text-align: center;
   	height: 80px;
   	line-height: 80px;
}
#coment_content{
	width : 900px;
}
#profileimg{
	height: 50px;
	width: 50px;
	border-radius:75px;
   	line-height: 10px;
   	overflow: hidden;
}
#profileimg img{
	width: 100%;
	height: auto;
}
.paging{
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div id="content_wrap">
		
		<table>
			<tr>
				<td><b>${content.ab_name }</b> |	<b>Q&A 게시판</b>
					<div id="line_div"></div>
					<div>
						${writer }
					</div></td>
			</tr>
			<tr>
				<td><div id="content_div">${content.ab_content }</div></td>
			</tr>
			<tr>
				<td><div>
						<ul>
							<li>조회수</li>
							<li>${content.ab_hit }</li>
						</ul>
					</div></td>
			
			</tr>
			<c:if test="${empty admin && not empty users}">
			<tr>
				<td style="text-align: right;"><input type="button" value="수정하기"
					onclick="location.href='${conPath }/askModifyView.do?ab_no=${content.ab_no }'"
					class="button is-link is-focused">
					<input type="button" value="글 지우기"
					onclick="location.href='${conPath }/askDelete.do?ab_no=${content.ab_no }'"
					class="button is-link is-focused">
					<input type="button"
					value="목록" onclick="location.href='${conPath }/askListView.do'"
					class="button is-link is-focused"></td>
			</tr>
		 	</c:if>
		 	<c:if test="${not empty admin}">
		    <tr style="text-align: right;">
				<td><input type="button" value="답변하기"
					onclick="location.href='${conPath }/askReplyView.do?ab_no=${content.ab_no }'"
					class="button is-link is-focused">
					<input type="button" value="글 지우기"
					onclick="location.href='${conPath }/askDelete.do?ab_no=${content.ab_no }'"
					class="button is-link is-focused">
					<input type="button"
					value="목록" onclick="location.href='${conPath }/askListView.do'"
					class="button is-link is-focused"></td>
			</tr>
		 	</c:if>
		</table>
	</div>	
			
		
	
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />

</body>
</html>