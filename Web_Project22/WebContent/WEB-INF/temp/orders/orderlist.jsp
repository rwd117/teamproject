<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
				<span>&nbsp; �ֹ� ����  &nbsp;</span>
			</div>
			<table>
			<c:forEach var="dto" items="${ordersList}">
			<tr>
				<td id="oDate">
					${dto.oDate }
				</td>
				<td id="oId">
					${dto.oId } <br>
					<a href="${conPath }/ordersContent.do?oId=${dto.oId}">				
						�󼼺��� >
					</a>
				</td>
				<td id="img">
					<a href="${conPath }/productContent.do?pId=${dto.pId}">										
						<img src="${conPath }/productImg/${dto.pImage1}" alt="��ǰ����">							
					</a>
				</td>
				<td id="pName" class="left">
					<a href="${conPath }/productContent.do?pId=${dto.pId}">			
						${dto.pName }
					</a>
				</td>
				<td id="pPrice">
					<fmt:formatNumber value="${dto.pPrice }" pattern="#,###,###" />��				
				</td>
				<td id="pAmount">
					${dto.odAmount }��
				</td>
				<td id="odTotsum">
					<fmt:formatNumber value="${dto.odTotsum }" pattern="#,###,###" />��						
				</td>
				<td	id="reviewWrite">
					<button class="btn" onclick="location.href='${conPath }/ordersContent.do?oId=${dto.oId}'">�󼼺���</button>
					<br>
					<button class="btn" onclick="location.href='${conPath }/productContent.do?pId=${dto.pId}'">�籸��</button>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8"></td>
			</tr>
		</table>
			<div class="paging">
				<c:if test="${startPage > BLOCKSIZE }">
					<a href="${conPath }/ordersList.do?pageNum=${startPage-1}"> ��  &nbsp; </a>
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
					<a href="${conPath }/ordersList.do?pageNum=${endPage+1}">  &nbsp; �� </a>
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