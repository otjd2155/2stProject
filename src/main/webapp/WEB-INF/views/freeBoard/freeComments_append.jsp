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
	<c:if test="${empty noMore }">
		<c:forEach items="${appendList}" var="commentsList">
			<div id="${commentsList.c_no }" class="com_area">
			<span id="com1">${commentsList.u_nickname }</span> <span id="com2">${commentsList.c_rdate}</span><br>
			<span id="com3">${commentsList.c_content }</span>
			<br>
			<c:if test="${users.u_id eq commentsList.u_id }">					    											    				
			<button id="freeCommentsDelete" type="button" data-rno="${commentsList.c_no}">삭제</button>	
			</c:if>
			</div>
		</c:forEach>
		<input type="hidden" name="pageNum2" class="pageNum2" value="${param.pageNum2 }">
	</c:if>
</body>
</html>