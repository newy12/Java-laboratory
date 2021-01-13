<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>19시(관리자) :: 서비스 작업내역</title>
</head>
<body>
	<table border=1>
		<tr>
			<th>사용자아이디</th>
			<th>진행상태</th>
			<th>가격</th>
			<th>시작일</th>
			<th>종료일</th>
		</tr>
		<c:forEach items="${history }" var="h">
			<tr>
				<td>${h.MId }</td>
				<td>
				<c:if test="${h.TStatus eq 0}">결제전</c:if>
				<c:if test="${h.TStatus eq 1}">진행중</c:if>
				<c:if test="${h.TStatus eq 2}">진행완료</c:if></td>
				<td>${h.TPrice}</td>
				<td>${h.startDate}</td>
				<td>${h.endDate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>