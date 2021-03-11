<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>������Ʈ</title>
<link href="../css/top_main.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>

</head>

<body>
	<!-- <�����̵�, �α���,�޴��� ����κ�> -->
	<div id="contents1">
		<div class="topAreaout">
			<div class="topArea">
				<div class="menu1">
					<ul>
						<li><a href="#">�� FAVORITE</a></li>
						<li><a href="#">�� DESKTOP ICON</a></li>

					</ul>
				</div>
				<div class="menu2">
					<ul>
						<c:choose>
							<c:when test="${loginUserBean.userLogin == false }">
								<li><a href="${conPath }qtable/notice">NOTICE</a></li>
							<c:forEach var="obj" items="${qnaTopList}">
        	 					<li><a href="${conPath }board/main?board_info_idx=${obj.board_info_idx}"> ${obj.board_info_name }</a> </li>
         					</c:forEach>
								<li><a href="${conPath }user/login">LOGIN</a></li>
								<li><a href="${conPath }user/join">JOIN</a></li>

							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${loginUserBean.mlevel == 0}">
										<li><a href="${conPath }user/logout">LOGOUT</a></li>
										<li><a href="${conPath }qtable/notice">NOTICE</a></li>
									<c:forEach var="obj" items="${qnaTopList}">
        	 							<li><a href="${conPath }board/main?board_info_idx=${obj.board_info_idx}"> ${obj.board_info_name }</a> </li>
         							</c:forEach>
										<li><a href="${conPath }user/mypage">MYPAGE</a></li>
										<li><a>${loginUserBean.mid}�� �ݰ����ϴ�</a></li>
									</c:when>
									<c:when test="${loginUserBean.mlevel > 0}">
										<li><a href="${conPath }user/logout">LOGOUT</a></li>
										<li><a href="${conPath }review/edit">REVIEW</a></li>
										<li><a href="${conPath }qtable/notice">NOTICE</a></li>
									<c:forEach var="obj" items="${qnaTopList}">
        	 							<li><a href="${conPath }board/main?board_info_idx=${obj.board_info_idx}"> ${obj.board_info_name }</a> </li>
         							</c:forEach>
										<li><a href="${conPath}product/productInsert">PRODUCT</a></li>
										<li><a href="${conPath}orders/orderlist">ORDER</a></li>
										<li><a href="${conPath}members/memberlist">MEMBER</a></li>
										<li><a>${loginUserBean.mid}�� �ݰ����ϴ�</a></li>

									</c:when>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
		<div class="topAreaout2">
			<div class="topArea2">
				<div class="topArea3">
					<h1>
						<a href="${conPath }main">SSA DA GU</a>
					</h1>
				</div>

				<div class="topArea4">
					<li><a href="#"><img src="../img/insta.png"></a></li>
					<li><a href="#"><img src="../img/face.png"></a></li>
					<li><a href="#"><img src="../img/blog.png"></a></li>
					<li><a href="#"><img src="../img/kakao.png"></a></li>
				</div>
			</div>
		</div>
	</div>

	</div>
	<header>
		<div class="inner">

			<div class="inner1">
				<!-- ���ʻ��̵�޴���ư       -->
				<button class="btn1">
					<img src="../img/menu11.png" alt="menu-icon">
				</button>
				<!-- �˻�â  -->
				<li class="sideMenu3"><input type="text" title="�˻�">
					<button class="btn2" type="submit" value="�˻�">
						<img src="../img/search.png" alt="menu-icon">
					</button></li>

				<!-- <�α��κκ�> -->
				<div class="menu3">
					<ul>
							<c:forEach items="${topmenulist}" var="obj">
				<c:choose>
					<c:when test="${obj.top_idx < 4 }">
						<li class="mainMenu1"><a
							href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a></li>
					</c:when>
					<c:when test="${(3<obj.top_idx) && (obj.top_idx <8) }">
						<li class="mainMenu1"><a href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="mainMenu1"><a
							href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
					</ul>
				</div>
			</div>
		</div>

	</header>
	</div>
</body>
</html>