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

<script src="${conPath }/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('sb_content', {
			filebrowserUploadUrl : '${conPath }/sbWriteFileupload.do'
		});
	});
</script>
<script>
	$(document).ready(function() {
			$('#bfile').change(function() {
				if (window.FileReader) {
					var filename = $(this)[0].files[0].name;
				} else {
					var filename = $(this).val().split('/').pop()
							.split('\\').pop();
				}
				$(this).siblings('.bfile').val(filename);
			});	

			$('form').submit(function(){
				 if($('.title').val()==''){
			           alert("제목입력 필수");
			           $('.sb_name').focus();
			           return false;
			       }
				 if(CKEDITOR.instances.sb_content.getData().length < 1){
						alert("본문입력 필수");
				        $('.sb_content').focus();
				         return false;
				 }
			});
		});
			
</script>

</head>
<body>

	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div id="content_wrap">
	<form action="${conPath }/sbWrite.do?sg_no=${param.sg_no}"  method="post" enctype="multipart/form-data">	
		<table class="table is-striped is-narrow is-hoverable">
			<caption>글쓰기</caption>
			<tbody>
				<tr>
					<th>글제목</th>
					<td><input type="text" name="sb_title" class="sb_name">
					<c:if test="${sg.u_id eq users.u_id }"><label>공지사항 </label><input type="checkbox" name="sb_notice" class="sb_name" value="1"></c:if>
					</td>
				</tr>
				<tr id="write_area">
					<th>본문</th>
					<td>
						<textarea rows="20" cols="30" name="sb_content" class="sb_content"></textarea>
						<input type="hidden" class="bfile" class="btn"> &nbsp;
						<input type="file" id="bfile" name="tempBfile" style="display: none;">
					</td>
				</tr>
			</tbody>
		</table>
		<table id="table_bottom">
			<tr>
				<td>
					<input type="submit" value="글등록" class="button is-link is-focused">
					<input type="button" value="목록" onclick="history.back()"
					class="button is-link is-focused"></td>
			</tr>
		</table>
	</form>
	</div>	
			
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />

</body>
</html>