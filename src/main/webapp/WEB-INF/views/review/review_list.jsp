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
	left: 50px;
	z-index: 99999;
	width:250px;
	border:1px solid lightgray;
}

caption {
	font-size: 1.9em;
	margin: 50px 25px 25px 25px;
}

table {
	width: 950px;
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
	margin-right: 120px;
	height: 37px;
}

table tr:hover {
	cursor: pointer;
}
#table_bottom tr td nav a {
	height: 25px;
}

#table_bottom tr td nav {
	width: 620px;
	margin-left: 480px;
}

#search_area {
	text-align: left;
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
.pagination-list li:first-child a{
	background-color: #998675;
	border-color: #c7b299;
}
.paging {
	margin-right: 95px;
}
b {
	font-weight: bold;
}
#card_delete{
	cursor: pointer;
}
</style>
</head>
<body>
	<c:if test="${not empty reviewWriteResult }">
		<script>
		alert("${reviewWriteResult }");
		</script>
	</c:if>
	<c:if test="${not empty reviewModifyResult }">
		<script>
		alert("${reviewModifyResult }");
		</script>
	</c:if>
	<c:if test="${not empty reviewDeleteResult }">
		<script>
		alert("${reviewDeleteResult }");
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<script>
	$(document).ready(function(){
		$('#card_delete').click(function(){
			$('.card').attr('style','display:none');	
		});
	});
	</script>
	<div id="content_wrap">
		<div class="card">
			<div class="card-content">
				<p style="text-align: right; font-weight: bold;" id="card_delete">x</p>
				<p class="title">“토익스피킹, 오픽 스터디원 모집합니다 (~05/07)”</p>
				<p class="subtitle">* 팀장 닉네임</p>
			</div>
			<footer class="card-footer">
				<p class="card-footer-item">
					<span> Goto Profile <a href="#">닉네임</a>
					</span>
				</p>
				<p class="card-footer-item">
					<span> Share on <a href="#">Facebook</a>
					</span>
				</p>
			</footer>
		</div>
		<table class="table is-striped is-narrow is-hoverable">
			<caption>Review</caption>
			<thead>
				<tr>
					<th><abbr title="Position">No</abbr></th>
					<th>작성자</th>
					<th>글제목</th>
					<th>조회수</th>
					<th>좋아요</th>
					<th>작성일</th>
				</tr>
			</thead>
			<c:set var="iNum" value="${inversNum }"/>
			<tbody>
				<c:forEach items="${reviewList}" var="review">
					<tr>
						<td>
							${iNum }
						</td>
						<td>
							${review.u_nickname}
						</td>
						<td>
							<a href="${conPath }/reviewDetailView.do?rv_no=${review.rv_no}">
							${review.rv_name}
							</a>
						</td>
						<td>
							${review.rv_hit}
						</td>
						<td>
							${review.likecnt}
						</td>
						<td>
							${review.rv_date}
						</td>
					</tr>
					<c:set var="iNum" value="${iNum-1 }"/>
				</c:forEach>
			</tbody>
		</table>
		<table id="table_bottom">
			<tr>
				<td>
					<input type="button"value="목록" onclick="location.href='${conPath }/reviewListView.do'" class="button is-link is-focused">
				</td>
			</tr>
			<tr>
				<td>
					<div class="paging">
					<nav class="pagination" role="navigation" aria-label="pagination">
					<c:if test="${paging.startPage>paging.blockSize }">
						<a class="pagination-previous" title="This is the first page"
							 href="${conPath }/reviewListView.do?pageNum=${paging.startPage-1}&schItem=${param.schItem}&schWord=${param.schWord}">Previous</a>
					</c:if>
					<c:if test="${paging.endPage<paging.pageCnt }">
							 <a class="pagination-next" href="${conPath }/reviewListView.do?&pageNum=${paging.endPage+1}&schItem=${param.schItem}&schWord=${param.schWord}">Next page</a>
					</c:if>
					<ul class="pagination-list">				
					<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
						<c:if test="${paging.currentPage==i }">
							<a class="pagination-link is-current"
								aria-label="Page 1" aria-current="page">${i }</a>
						</c:if>
						<c:if test="${paging.currentPage!=i }">
							<a class="pagination-link" aria-label="Goto page 2" href="${conPath }/reviewListView.do?&pageNum=${i}&schItem=${param.schItem}&schWord=${param.schWord}">${i }</a>
						</c:if>
					</c:forEach>
					</ul>
					</nav>
					</div>
				</td>
			</tr>
		</table>
		
			
		
		<div id="select_div">
			<form action="${conPath }/reviewListView.do">
				<select name="schItem">
					<option value=""
						<c:if test="${param.schItem=='' }">selected="selected"</c:if>>검색조건</option>
					<option value="all"
						<c:if test="${param.schItem=='all' }">selected="selected"</c:if>>글제목+작성자</option>
					<option value="rv_name"
						<c:if test="${param.schItem=='rv_name' }">selected="selected"</c:if>>글제목</option>
					<option value="u_nickname"
						<c:if test="${param.schItem=='u_nickname' }">selected="selected"</c:if>>작성자</option>
				</select> <input type="text" name="schWord" value="${param.schWord }">
				<input type="submit" value="검색" class="button is-small">
			</form>
		</div>

	</div>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />

</body>
</html>