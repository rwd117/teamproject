<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var='conPath' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/orderlist.css">
    <!-- <link href="css/5.css" rel="stylesheet"> -->
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="../js/7.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
<body>
    <div id="ordersList_wrap">
		<div id="ordersList">
			<div class="subject">
				<span>&nbsp; 리뷰  &nbsp;</span>
			</div>
			<table>
			
					
			
			<c:forEach var="obj" items="${reviewlist}">
			<tr>
				<td id="oDate">
					${obj.r_DATE }
				</td>
				<td id="oId">
					${obj.r_ID } <br>
					<a href="${conPath}product/productContent?pID=${obj.r_pID}">				
						상세보기 >
					</a>
				</td>
				<td id="img">
					<a href="${conPath}product/productContent?pID=${obj.r_pID}">										
						<img src="${conPath }upload/${obj.pro_image1}" width="100px" height="100px" alt="상품사진">
						<br/>
						${obj.pro_name}							
					</a>
				</td>
				<td id="pName" class="left">
					<a href="${conPath}product/productContent?pID=${obj.r_pID}">		
						${obj.r_TITLE }	
					</a>
				</td>
				<td	id="reviewWrite">
					<button class="btn" onclick="location.href='${conPath}product/productContent?pID=${obj.r_pID}'">상품 상세보기</button>
					<br>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8"></td>
			</tr>
			
			
		</table>
			<div class="paging">
				<c:if test="${startPage > BLOCKSIZE }">
					<a href="${conPath }/ordersList.do?pageNum=${startPage-1}"> 〈  &nbsp; </a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i eq pageNum }">
						<b> &nbsp; ${i }</b>
					</c:if>
					<c:if test="${i != pageNum }">
						<a href="${conPath }/ordersList.do?pageNum=${i }">&nbsp; ${i }</a>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
					<a href="${conPath }/ordersList.do?pageNum=${endPage+1}">  &nbsp; 〉 </a>
				</c:if>
			</div>
		</div>
	</div>
    <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</body>
</html>
</body>
</html>
</body>
</html>