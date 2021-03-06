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
* {
	text-align: center;
}

#content_wrap {
	height: 1000px;
}

.card {
	position: fixed;
	top: 240px;
	left: 30px;
	z-index: 99999;
	width:250px;
	border:1px solid lightgray;
}

caption {
	font-size: 1.8em;
	margin: 15px;
}

table {
	width: 1100px;
	margin: 10px auto;
}

table:not(#table_bottom) {
	border-bottom: 2px solid black;
	border-top: 2px solid black;
}

#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}

#table_bottom tr td {
	text-align: right;
}

#table_bottom tr {
	height: 70px;
}

#table_bottom tr td input {
	margin-right: 5px;
	height: 35px;
}

#table_bottom tr td nav a {
	height: 25px;
}

#table_bottom tr td nav {
	width: 620px;
	margin-left: 480px;
}

#select_div {
	margin-top: 20px;
}

#select_div select {
	height: 25px;
}

input[type='submit'] {
	height: 25px;
}
.card footer p a, tbody tr td a {
	color:#998675;
}
.pagination-list b{
	background-color: #998675;
	border-color: #c7b299;
}
#998675
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div id="content_wrap">
	<form action="${conPath }/askReply.do?a_id=${admin.a_id }" method="post">
	    <input type="hidden" name="ab_no" value="${ask_modifyView_replyView.ab_no }">
	    <input type="hidden" name="a_name" value="${a_name }">
    	<input type="hidden" name="u_id" value="${u_id }">
    	<input type="hidden" name="ab_group" value="${ask_modifyView_replyView.ab_group }">
	    <input type="hidden" name="ab_step" value="${ask_modifyView_replyView.ab_step }">
	    <input type="hidden" name="ab_indent" value="${ask_modifyView_replyView.ab_indent }">
		<table class="table is-striped is-narrow is-hoverable">
			<caption>답변하기</caption>
			<tbody>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="a_name" readonly="readonly" value="${admin.a_name }"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="ab_name" required="required" value="[답]${ask_modifyView_replyView.ab_name.substring(0,2) }"></td>
				</tr>
				<tr id="write_area">
					<th>문의내용</th>
					<td><textarea rows="5" cols="30" name="ab_content" required="required"></textarea>
				</tr>
				<tr>
					<th>그룹</th>
					<td>${ask_modifyView_replyView.ab_group }</td>
				</tr>
				<tr>
					<th>스텝</th>
					<td>${ask_modifyView_replyView.ab_step }</td>
				</tr>
				<tr>
					<th>인덴트</th>
					<td>${ask_modifyView_replyView.ab_indent }</td>
				</tr>
			</tbody>
		</table>
		<table id="table_bottom">
			<tr>
				<td><input type="submit" value="답변하기"
					class="button is-link is-focused">
					<input type="button"
					value="목록" onclick="location.href='${conPath}/askListView.do'"
					class="button is-link is-focused"></td>
			</tr>
		</table>
	</form>
	</div>	
			
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />

</body>
</html>