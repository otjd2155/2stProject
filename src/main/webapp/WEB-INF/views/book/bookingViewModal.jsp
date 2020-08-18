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
</head>
<body>
	<div style="margin: 0 90px;">
	<div style="padding-top: 30px;">
		<b style="font-weight: bold; color: #ffb400; font-size: 3em;">${roomdetail.r_name }</b>
		<span style="font-weight: bold; color: #ffb400;">시간당 가격 :</span> <span >${roomdetail.r_pph }원</span> 
		<span style="font-weight: bold; color: #ffb400;"> / 가능인원 : </span> <span>${roomdetail.r_ppr }인</span>
	</div>
	<div>
	</div>
	<div style="width: 100%;" >
		<img alt="" src="${conPath }/images/${roomdetail.r_image }"  style="border: 2px solid #ffb400;">
	</div>
	<div id="modal_icon" style="margin: 20px 0;">
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
		</div>
	</div>
</body>
</html>