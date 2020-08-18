<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<c:if test="${empty admin }">
	<script>
		alert('비정상적인 접근입니다.');
		history.back();
	</script>
</c:if>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer
	src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"
	integrity="sha384-GqVMZRt5Gn7tB9D9q7ONtcp4gtHIUEW/yG7h98J7IpE3kpi+srfFyyB/04OV6pG0"
	crossorigin="anonymous"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
<script>
	WebFont.load({
		google : {
			families : [ 'Montserrat:300,400,700',
					'Raleway:300,400,500,600,700,800' ]
		}
	});
</script>


		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://malsup.github.com/jquery.cycle2.js"></script>
		<script src="http://malsup.github.io/jquery.cycle2.carousel.js"></script>
		<script>$.fn.cycle.defaults.autoSelector = '.cycle-slideshow';</script>


		<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="${conPath }/css/main.css" />
<script src="${conPath }/js/script.js"></script>
<style>
.room_wrap {
	margin-top:100px;
}
	ul{
		list-style: none;
	}
	.room_enroll {
		width:160px;
		height:30px;
		line-height:30px;
		font-size:1.3em;
		padding:5px;
		text-align: center;
	}
	.room_enroll:hover {
		cursor:pointer;
	}
	.paging {
		text-align: center;
	}
	b{
		color:brown;
		font-weight: bold;
	}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<main class="content">

		<section class="latest_projects container">

			<div class="room_wrap">


				<ul class="project_list clearfix">
					<c:forEach items="${rooms }" var="room">
						<li class="one" >
							<div class="imgWarp">
								<img src="${conPath }/images/${room.r_image }" alt="${room.r_no }" />
								<div class="hover_contents">
									<a href="${conPath }/admin/studyroomDetail.do?r_no=${room.r_no }"><i class="fas fa-search"></i></a>
								</div>
							</div>
							<div class="contents">
								<h4>${room.r_name }</h4>
							</div>
						</li>		
					</c:forEach>
				</ul>
			</div>
			<div class="paging">
				<c:if test="${paging.currentPage > paging.startPage } ">
					<a>[이전]</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
					<c:if test="${i eq paging.currentPage }">
						[ <b>${i }</b> ]
					</c:if>
					<c:if test="${i ne paging.currentPage }">
						<a href="${conPath }/admin/listUser.do?pageNum=${i}">[ ${i } ]</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.endPage eq paging.pageCnt } ">
					<a>[다음]</a>
				</c:if>	
			</div>
			<div class="columns">
				  <div class="room_enroll" onclick="location.href='${conPath}/admin/studyroomInsertView.do'">☞ 등록하기</div>
			</div>
		</section>
		<!--//latest_projects -->
	</main>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>