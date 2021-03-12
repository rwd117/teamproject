<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='conPath' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product List</title>
<link href='../css/productList.css' rel='stylesheet'>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
</head>
<body>
<c:if test="${not empty productInsertMsg }">
	<script>
		alert('${productInsertMsg }');
	</script>
</c:if>
<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
	<div id="productList_wrap">
		<div id="productList">
			<div class="subject">
				<span>&nbsp; NEW IN &nbsp;</span>
			</div>
			<c:if test="${not empty admin }">
				<div class="right">
					<a class="btn" href="${conPath}/productInsertView.do">
						상품등록
					</a>
				</div>
			</c:if>
				<table id="product_wrap">
					<tr>
					<c:choose>
						<c:when test="${empty productlist }">
								게시물이 없습니다!.
						</c:when>
						<c:otherwise>
						<c:forEach var="obj" items="${productlist }">
							<td>
								<div class="productImg">
									<a href="${conPath}product/productContent?pID=${obj.pID}">
										<img src="${conPath }upload/${obj.pIMAGE1 }" width="100%"/>	
									</a>
								</div>
								<div class="productName">
									<a href="${conPath}product/productContent?pID=${obj.pID}">
									     ${obj.pNAME}
									</a>
								</div>
								<div class="productPrice">
									${obj.pPRICE }
								</div>
							</td>
						</c:forEach>
						</c:otherwise>
					</c:choose>
					</tr>
				</table>
				
				
				
			<div class="paging">
				<ul class="pagination">
						<c:if test="${pagemaker.prev }">
							<li>
								<a class="btn btn-outline-primary"
								href='${conPath}product/productList${pagemaker.makeQuery(pagemaker.startPage - 1)}'>이전</a>
							</li>
						</c:if>
						<c:forEach begin="${pagemaker.startPage }"
							end="${pagemaker.endPage }" var="pageNum">
							<li><a class="btn btn-outline-primary"
								href="${conPath}product/productList${pagemaker.makeQuery(pageNum)}">${pageNum }</a></li>
						</c:forEach>
						<c:if test="${pagemaker.next && pagemaker.endPage >0 }">
							<li><a class="btn btn-outline-primary"
								href='${conPath}product/productList${pagemaker.makeQuery(pagemaker.endPage + 1)}'>다음</a>
							</li>
						</c:if>
				</ul>
			</div>
			
			
			
			
		</div>
	</div>
<c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</body>
</html>