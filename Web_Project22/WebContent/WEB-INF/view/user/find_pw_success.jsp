<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상세보기</title>
    <link href="../css/popup2.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/6.js"></script>

</head>
<body>
    <div id="join_wrap">
		<div id="join">
		<table>
				<tr>
						<th>
							<a href="#"><h1>SSA DA GU</h1></a>
						</th>
				</tr>
		</table><br>
					<h2>발송된 임시 비밀번호로 변경되었습니다.</h2><br>
					임시 비밀번호로 로그인 후 비밀번호를 변경해주세요.<br>
                    <input type="button"class="btn" value="확인" onclick="self.close();">
</body>
</html>