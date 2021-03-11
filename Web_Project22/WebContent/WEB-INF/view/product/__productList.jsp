<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
						"${conPath}popup/popup1",
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
			<span>T O P</span>
		</h2>
		<c:if test="${not empty admin }">
			<div class="right">
				<a class="btn" href="${conPath}/productInsertView.do"> 상품등록 </a>
			</div>
		</c:if>
		<c:choose>
			<c:when test="${empty productlist }">
								게시물이 없습니다!.
						</c:when>
			<c:otherwise>
				<c:forEach var="obj" items="${productlist }">
					<div id="best">
						<ul>
							<li><a>BEST</a></li>
						</ul>

					</div>
					<!-- 중앙박스  -->
					<div id="section">
						<div class="left">
							<div class="box">
								<div id="boximage">
									<a href="${conPath }productContent"><img
										src="${conPath }upload/${obj.pIMAGE1 }" class="img6"></a>
								</div>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><button
												class="popup1" onclick="showPopup()">
												<img id="span_gif" src="../img/v.gif">
											</button></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="box">
								<div id="boximage">
									<a href="${conPath }productContent"><img
										src="${conPath }upload/${obj.pIMAGE1 }" class="img7"></a>
								</div>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="box">
								<div id="boximage">
									<a href="${conPath }productContent"><img
										src="${conPath }upload/${obj.pIMAGE1 }" class="img8"></a>
								</div>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="box">
								<div id="boximage">
									<a href="${conPath }productContent"><img
										src="${conPath }upload/${obj.pIMAGE1 }" class="img9"></a>
								</div>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="box">
								<div id="boximage">
									<a href="${conPath }productContent"><img
										src="${conPath }upload/${obj.pIMAGE1 }" class="img10"></a>
								</div>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="box">
								<div id="boximage">
									<a href="${conPath }productContent"><img
										src="${conPath }upload/${obj.pIMAGE1 }" class="img11"></a>
								</div>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
						</div>
						
						
						<div class="right">
							<div id="boximage">
								<a href="${conPath }productContent"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img12"></a>
							</div>
							<p id="buttonp">
								<span class="span1"> <a href="#"><img id="span_icon"
										src="../img/z.png"></a> <a href="#"><img id="span_icon"
										src="../img/x.png"></a> <a href="#"><img id="span_icon"
										src="../img/c.png"></a> <a href="#"><img id="span_gif"
										src="../img/v.gif"></a>
								</span>
							</p>
							<a href="#">
								<h3>${obj.pNAME }</h3>
								<p>￦${obj.pPRICE }</p>
							</a>
						</div>
					</div>


					<!-- 가로로긴박스 -->
					<div>
						<article class="side3">
							<div class="middle">
								<ul>
									<a href="#"><li>-BL</li></a>
									<a href="#"><li>-SHIRT</li></a>
									<a href="#"><li>-TEE</li></a>
									<a href="#"><li>-KNIT</li></a>
									<a href="#"><li>-HOOD</li></a>
									<a href="#"><li>-MANTOMAN</li></a>
								</ul>
							</div>
						</article>
					</div>
					<!-- /* 박스 4개 부분  -->

					<div class="section1">
						<div class="container">
							<div class="quick">
								<a href="${conPath }productContent"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="quick">
								<a href="${conPath }productContent"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="quick">
								<a href="${conPath }productContent"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="quick">
								<a href="${conPath }productContent"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
						</div>
						<div class="container">
							<div class="quick">
								<a href="${conPath }productContent"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="quick">
								<a href="${conPath }productContent"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="quick">
								<a href="${conPath }productContent"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="quick">
								<a href="${conPath }productContent"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
						</div>
						<div class="container">
							<div class="quick">
								<a href="${conPath }productContent"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="quick">
								<a href="${conPath }productContent"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="quick">
								<a href="${conPath }productContent"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
									<h3>${obj.pNAME }</h3>
									<p>￦${obj.pPRICE }</p>
								</a>
							</div>
							<div class="quick">
								<a href="${conPath }productContent"><img
									src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1"> <a href="#"><img id="span_icon"
											src="../img/z.png"></a> <a href="#"><img id="span_icon"
											src="../img/x.png"></a> <a href="#"><img id="span_icon"
											src="../img/c.png"></a> <a href="#"><img id="span_gif"
											src="../img/v.gif"></a>
									</span>
								</p>
								<a href="#">
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