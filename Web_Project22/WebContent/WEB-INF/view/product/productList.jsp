<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<link href="../css/menu.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
	});
</script>
<script>
	function showPopup() {
		window
				.open(
						"${conPath}popup/popup1?${conPath}product/productContent?pID=${obj.pID}",
						"veiwimg",
						"width=1050, height=600, left=300, top=500, toolbar=no,scrollbars=no,status=no,location=no");
	}
</script>
</head>

<body>
	<c:if test="${not empty productInsertMsg }">
		<script>
			alert('${productInsertMsg }');
		</script>
	</c:if>
	<c:import url="/WEB-INF/view/include/top_menu.jsp" />
	</div>
	<!-- 중간에 컨텐츠부분 -->
	<div id="contents2">
		<h2>
			<span>
			<c:set value="${top_idx}" var="top"/>
			<c:forEach items="${topmenulist}" var="obj">
				<c:if test="${top eq obj.top_idx }">
					${obj.top_name}
				</c:if>
			</c:forEach>
			
			</span>
		</h2>
		<c:if test="${not empty admin }">
			<div class="right">
				<a class="btn" href="${conPath}/productInsertView.do"> 상품등록 </a>
			</div>
		</c:if>

					<div id="best">
						<ul>
							<li><a>BEST</a></li>
						</ul>

					</div>
					<!-- 중앙박스  -->
					<div id="section">
					<c:choose>
						<c:when test="${empty productlist }">
								게시물이 없습니다!.
						</c:when>
						<c:otherwise>
						<c:forEach var="obj" items="${productlist }">
						<div class="left">
							<div class="box">
								<div id="boximage">
									<a href="${conPath }upload/${readContentBean.content_file }"><img src="${conPath }upload/${obj.pIMAGE1 }" class="img6"></a>
								</div>
								<p id="buttonp">
									<span class="span1"> 
									<a href="#"><img id="span_icon" src="../img/z.png"></a>
									 <a href="#"><img id="span_icon" src="../img/x.png"></a> 
									 <a href="#"><img id="span_icon"	src="../img/c.png"></a> 
									 <a href="#"><button class="popup1" onclick="showPopup()"><img id="span_gif" src="../img/v.gif"></button></a>
									</span>
								</p>
								<a href="${conPath}product/productContent?pID=${obj.pID}">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
							
						<div class="right">
						<c:choose>
						<c:when test="${empty productlist }">
								게시물이 없습니다!.
						</c:when>
						<c:otherwise>
						<c:forEach var="obj" items="${productlist }">
							<div id="boximage">
								<a href="${conPath}product/productContent?pID=${obj.pID}
																		&page=${scri.page}
																		&perPageNum=${scri.perPageNum}
																		&keyword=${scri.keyword}">
							<img src="${conPath }upload/${obj.pIMAGE1 }" class="img12"></a>
							</div>
							<p id="buttonp">
								<span class="span1"> 
								<a href="#"><img id="span_icon"
										src="../img/z.png"></a> 
										<a href="#"><img id="span_icon"
										src="../img/x.png"></a> 
										<a href="#"><img id="span_icon"
										src="../img/c.png"></a> 
										<a href="#"><button class="popup1" onclick="showPopup()"><img id="span_gif" src="../img/v.gif"></button></a>
								</span>
							</p>
							<a href="#">
								<h3>${obj.pNAME }</h3>
								<p>￦${obj.pPRICE }</p>
							</a>
						
					
				</c:forEach>
						</c:otherwise>
			</c:choose>
			</div>
</div>
					<!-- 가로로긴박스 -->
					<div>
						<article class="side3">
							<div class="middle">
								
								<c:set value="${top_idx}" var="top"/>
								<c:forEach items="${topmenulist}" var="obj">
			<c:forEach items="${submenulist}" var="obj2">
				<c:if test="${top eq obj.top_idx}">
				<c:if test="${obj.top_idx eq obj2.sub_top_idx }">
				<ul class="subMenu1">
										<li>
				<a href="${conPath}product/productList?top_idx=${obj.top_idx}&sub_idx=${obj2.sub_idx}">${obj2.sub_name }</a></li>
				</ul>
				</c:if>
				</c:if>
			</c:forEach>
					</c:forEach>									
							</div>
						</article>
					</div>
					<!-- /* 박스 4개 부분  -->
					<div class="section1">
						<c:choose>
						<c:when test="${empty productlist }">
								게시물이 없습니다!.
						</c:when>
						<c:otherwise>
						<c:forEach var="obj" items="${productlist }">
					
						<div class="container">
							<div class="quick">
								<a href="${conPath}product/productContent?pID=${obj.pID}"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="${conPath}product/productContent?pID=${obj.pID}">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
						</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	
	
	<div class="paging">
		<c:if test="${startPage > BLOCKSIZE }">
			<a href="${conPath }/productList.do?pageNum=${startPage-1}"> 〈
				&nbsp; </a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i eq pageNum }">
				<b> &nbsp; ${i }</b>
			</c:if>
			<c:if test="${i != pageNum }">
				<a href="${conPath }/productList.do?pageNum=${i }">&nbsp; ${i }</a>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href="${conPath }/productList.do?pageNum=${endPage+1}"> &nbsp;
				〉 </a>
		</c:if>
	</div>

	</div>
	<c:import url="/WEB-INF/view/include/bottom_menu.jsp" />


</body>

</html>