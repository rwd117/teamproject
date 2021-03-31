<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='../css/memberList.css' rel='stylesheet'>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
</head>
<body>
<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
	<div id="memberList_wrap">
		<div id="memberList">
			<div class="subject">
				<span>&nbsp; REVIEW &nbsp;</span>
			</div>
			
			<div class="reviewList">
				<table>
				<tr>
					<td class="title">제목</td>
					<td class="title">내용</td>
					<td class="title">사진</td>
					<td class="title">상품</td>
					<td class="title">작성날짜</td>
					<td class="title">작성자</td>
					<td class="title">작성자 이메일</td>
				</tr>
				<c:if test="${reviewlist.size() eq 0 }">
					<tr>
						<td colspan="8">등록한 리뷰가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${reviewlist.size() != 0 }">
				<c:forEach items="${reviewlist}" var="list">
				
					
						<tr>
							<td>${list.r_TITLE }</td>
							<td>${list.r_CONTENT}</td>
							<td><img src="${conPath}/upload/${list.r_FILE1}" width="20%">
							<c:if test="${not empty list.r_FILE2 }">
								<img src="${conPath}/upload/${list.r_FILE2}">
							</c:if>	
							</td>
							
							<td><a href="${conPath}/product/productContent?pID=${list.r_pID}">리뷰바로가기</a></td>
							<td>${list.r_DATE }</td>
							<td>${list.r_mname}</td>
							<td>${list.r_memail}</td>
						</tr>
						
					</c:forEach>
			</c:if>
			</table>
				<div class="paging">
				<ul class="pagination">
						<c:if test="${pagemaker.prev }">
							<li>
								<a class="btn btn-outline-primary"
								href='${conPath}/review/reviewlist${pagemaker.makeQuery(pagemaker.startPage - 1)}'>이전</a>
							</li>
						</c:if>
						<c:forEach begin="${pagemaker.startPage }"
							end="${pagemaker.endPage }" var="pageNum">
							<li><a class="btn btn-outline-primary"
								href="${conPath}/review/reviewlist${pagemaker.makeQuery(pageNum)}">${pageNum }</a></li>
						</c:forEach>
						<c:if test="${pagemaker.next && pagemaker.endPage >0 }">
							<li><a class="btn btn-outline-primary"
								href='${conPath}/review/reviewlist${pagemaker.makeQuery(pagemaker.endPage + 1)}'>다음</a>
							</li>
						</c:if>
				</ul>
				</div>
				
				
				
				
			</div>
		</div>
	</div>
<c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>    
</body>
</html>