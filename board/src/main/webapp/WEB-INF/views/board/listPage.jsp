<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
<div id="nav">
 <%@ include file="../include/nav.jsp" %>
</div>

	<table>
	 <thead>
	  <tr>
	   <th>번호</th>
	   <th>제목</th>
	   <th>작성일</th>
	   <th>작성자</th>
	   <th>조회수</th>
	  </tr>
	 </thead>
	 
	 <tbody>
	  <c:forEach items="${list}" var="list">
		 <tr>
		  <td>${list.bno}</td>
		  <td>
		  	<a href="/board/view?bno=${list.bno}">${list.title}</td></a> <!-- 게시물클릭시 무엇을 기준으로 보여줄것인가 -->
		  <td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
		  <td>${list.writer}</td>
		  <td>${list.viewCnt}</td>
		 </tr>
		</c:forEach>
	 </tbody>
	
</table>
	<div>
		<c:if test="${prev}">
			<span>[ <a href="/board/listPage?num=${startPageNum - 1}">이전</a>
				]
			</span>
		</c:if>

		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
			<span> 
			    <c:if test="${select != num}">
					<a href="/board/listPage?num=${num}">${num}</a>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>
			</span>
		</c:forEach>

		<c:if test="${next}">
			<span>[ <a href="/board/listPage?num=${endPageNum + 1}">다음</a>
				]
			</span>
		</c:if>
		<%-- 	<c:forEach begin="1" end="${pageNum}" var="num">
			<span> <a href="/board/listPage?num=${num}">${num}</a>
			</span>
		</c:forEach> --%>
	</div>

</body>
</html>