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
	<c:forEach items="${insert_list}" var="coment_list">
			<div id="${coment_list.c_no }" class="coment_wrap" style=" padding-bottom: 20px;">
			   <div id="coment_img">
			   <div id="profileimg">
			   <img src="${conPath }/usersImgFileUp/${coment_list.u_image}">
			   </div>
			   </div>
			   <div id="coment_content">
			   <div>
				<b>${coment_list.u_nickname }님</b> <fmt:formatDate value="${coment_list.c_rdate}" pattern="yy-MM-dd"/>
				<c:if test="${users.u_id eq coment_list.u_id }">		    											    				
				<button class="reviewcoment_delete" type="button" data-rno="${coment_list.c_no}">삭제</button>	
				</c:if>
				</div>
				<div style="padding-top: 10px;"><pre>${coment_list.c_content }</pre></div>
				</div>
			 </div>
		</c:forEach>
		<input type="hidden" name="pageNum" class="pageNum" value="${param.pageNum }">
</body>
</html>