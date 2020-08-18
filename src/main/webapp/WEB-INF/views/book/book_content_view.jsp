<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
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
<style >
*{
	margin: 0 ;
	padding: 0;
}
#content_wrap {
	width: 1200px;
	margin: 0 auto;
}
.book_table{
	margin: 0 auto;
	width: 1200px;
	padding-top: 50px;
}
.book_table table {
	border-top: 3px solid black;
	border-left:1px solid #dadada;
	border-right:1px solid #dadada;
	border-collapse:collapse;
	width: 100%;
}
.book_table table b{
	font-size: 14px;
	font-weight: bold;
}
.book_table h2{
	font-size: 23px;
	font-weight: bold;
	padding: 0 0 10px 0;
}
.book_table tr{	
	border-bottom:1px solid #dadada;
	height: 50px;
}
.book_table .td1{
	width: 283px;
	border-right:1px solid #dadada;
	background-color: #f7f7f7;
	padding: 20px;
	line-height: 2;
	text-align: center;
	font-weight: bold;
	font-size: 16px;
}
.book_table td{
	margin: 10px;
	padding: 20px;
	text-align: left;
}

#datepicker{
	padding: 0;
	margin: 0;
}
table button{
	background-color: white;
	border: none;
}
select {
	padding: 5px 20px;
    font-size: 14px;
}
.book_table #datepicker{
	padding: 5px 20px;
    font-size: 14px;
}
.btn_list{
	padding: 30px;
	text-align: center;
}
.sub_btn{
	background-color:black;
	color:#ffb400;
	font-size: 14px;
	border: none;
	padding: 10px 50px;
}
#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}
.book_step{
	width: 1200px;
	padding: 50px 0 40px 0;
}
.book_step ul {
    padding: 30px 0 0 0;
    list-style: none;
    overflow: hidden;
}
.book_step li {
	float: left;
	text-align: center;
    width: 5%;
    padding: 10px 0;
}
.book_step li b{
	font-weight: bold;
	font-size: 20px;
}
.book_step li span{
	font-size: 0.8em;
}
.book_step .step_off {
    background: #e2e2e2;
    color: #333;
    width: 30%;
}
.book_step .step_arrow {
    font-size: 20px;
    font-weight: bold;
    padding: 20px 0 0 0;
}
.book_step .step_ov {
    background: #ffb400;
    color: #333;
    width: 30%;
    border-style: dashed;
}
.book_noti01 {
    padding: 20px 0 0 0;
    clear: both;
}
.book_noti01 ul {
    padding: 0 0 20px 0;
}
element.style {
    background: #f7f7f7;
    padding: 15px;
}
ul {
    padding: 10px 0 0 0;
}

table input{
	border: none;
	width: 100px;
	font-weight: bold;
	font-size: 16px;
}
table td{
	font-weight: bold;
	font-size: 16px;
}
input[name="bk_stimeStr"], input[name="bk_etimeStr"], input[name="bk_tp"] {
	width: 45px;
}
input[name="bk_tt"]{
	width: 20px;
}
.td2 img{
	display: inline;
	width: 28px;
	height: 28px;
	margin: 0 10px;
	
}
.td2 div{
	margin: 10px 0;
}

</style>
<script>
	$(document).ready(function(){
		var stime = Number(($('input[name="bk_stimeStr"]').val()).substring(0,2));
		var etime = Number(($('input[name="bk_etimeStr"]').val()).substring(0,2));
		var tt = etime - stime;
		var pph = ${roomdetail.r_pph };
		$('input[name="bk_tt"]').val(tt);
		var tp = pph*tt;
		$('input[name="bk_tp"]').val(tp);
		
	});
		</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div id="content_wrap">
	<div class="book_step">
				<ul>
					<li class="step_off"><b>STEP1</b> <br><span>이용인원 및 날짜선택</span></li>
					<li class="step_arrow"> &gt; </li>
					<li class="step_ov"><b>STEP2</b> <br><span>선택사항 확인 및 예약</span></li>
					<li class="step_arrow"> &gt; </li>
					<li class="step_off"><b>예약완료</b> <br><span></span></li>
				</ul>
	</div>
		<form action="${conPath}/bookingfinal.do" method="post">
		<input type="hidden" name="u_id" value="${users.u_id }">
		<input type="hidden" name="u_name" value="${users.u_name }">
		<input type="hidden" name="r_no" value="${roomdetail.r_no }">	
		<input type="hidden" name="tempbk_stime" value="${bookList.bk_stime }">
		<input type="hidden" name="tempbk_etime" value="${bookList.bk_etime }">	
		
	<div class="book_table">
	<h2 style="border:none">STEP2.예약확인</h2>
	<input type="hidden" value="bk_no">
	<table>
		<tbody>
		    
		    <tr>
		    	<td class="td1">
		    		예약자
		    	</td>
		    	<td>
		    	<input type="text" value="${users.u_name }" name="u_name" readonly="readonly">
		    	</td>
		    </tr>
			<tr>
				<td class="td1">
					스터디룸
				</td>
				<td>
					<input type="text" value="${roomdetail.r_name }" name="r_name" readonly="readonly">
					<br>
					<div>
					<img alt="" src="${conPath }/images/${roomdetail.r_image }" >
					</div>
				</td>
			</tr>
			<tr>
				<td class="td1">
					방옵션
				</td>
				<td class="td2">
					<div>
					<c:if test="${roomdetail.ro_air eq 1 }">
						<b>에어컨</b><img src="${conPath }/optionImages/aircon.png" >
					</c:if>
					<c:if test="${roomdetail.ro_chair eq 1 }">
						<b>회의테이블</b><img src="${conPath }/optionImages/lib_table.png" >
					</c:if>
					<c:if test="${roomdetail.ro_chair eq 2 }">
						<b>소파</b><img src="${conPath }/optionImages/sofa.png" >
					</c:if>
					<c:if test="${roomdetail.ro_chair eq 3 }">
						<b>도서관</b><img src="${conPath }/optionImages/lib_table.png" >
					</c:if>
					<c:if test="${roomdetail.ro_print eq 1 }">
						<b>프린트/흑백</b><img src="${conPath }/optionImages/printer.png" >
					</c:if>
					<c:if test="${roomdetail.ro_print eq 2 }">
						<b>프린트/컬러</b><img src="${conPath }/optionImages/printer.png" >
					</c:if>
					
					<c:if test="${roomdetail.ro_smoke eq 0 }">
						<b>금연</b><img src="${conPath }/optionImages/no_smoke.png" >
					</c:if>
					<c:if test="${roomdetail.ro_print eq 1 }">
						<b>흡연가능</b><img src="${conPath }/optionImages/smoke.png" >
					</c:if>
					</div>
					<div>
					<c:if test="${roomdetail.ro_pc eq 1 }">
						<b>PC/노트북</b><img src="${conPath }/optionImages/pc.png" >
					</c:if>
					<c:if test="${roomdetail.ro_tv eq 1 || room.ro_tv eq 2 || room.ro_tv eq 3}">
						<b>TV/프로젝터</b><img src="${conPath }/optionImages/projector.png" >
					</c:if>
					
					<c:if test="${roomdetail.ro_wifi eq 1 }">
						<b>WI-FI</b><img src="${conPath }/optionImages/wifi.png" >
					</c:if>
					<c:if test="${roomdetail.ro_wifi eq 2 }">
						<b>100M 유선/WI-FI</b><img src="${conPath }/optionImages/wifi.png" >
					</c:if>
					<c:if test="${roomdetail.ro_wifi eq 3 }">
						<b>1G 광랜</b><img src="${conPath }/optionImages/wifi.png" >
					</c:if>
					
					<c:if test="${roomdetail.ro_board eq 1 }">
						<b>화이트보드</b><img src="${conPath }/optionImages/white_board.png" >
					</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<td class="td1">
					이용날짜
				</td>
				<td>
					<input type="text" value="${bookList.bk_date }" name="bk_date" readonly="readonly">
					&nbsp; 
					<input type="text" value="<fmt:formatDate value='${bookList.bk_stime }' pattern='HH:mm'/>" id="bk_stimeStr" name="bk_stimeStr"  readonly="readonly"> ~
					<input type="text" value="<fmt:formatDate value='${bookList.bk_etime }' pattern='HH:mm'/>" id="bk_etimeStr" name="bk_etimeStr" readonly="readonly">
					
				</td>
			</tr>
			<tr id="book_table_list">
				<td class="td1">
					총사용 예정시간
				</td>
				<td>
					<input type="text" name="bk_tt" id="bk_tt" readonly="readonly">시간
				</td>
			</tr>
			<tr class="time_table">
				<td class="td1">
					총결제금액
				</td>
				<td>
					 <input type="text" name="bk_tp" id="bk_tp" readonly="readonly"> 원
				</td>
			</tr>
		</tbody>
	</table>
	<div class="btn_list">
			<input type="submit" value="예약확인" class="sub_btn">
			<input type="button" value="다시 예약하기" class="sub_btn" onclick="location.href='${conPath}/bookingView.do'">
	</div>	
	</div>
	</form>
	</div>
			
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />

</body>
</html>