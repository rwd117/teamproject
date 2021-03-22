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

 <script >
        opener.parent.location="${conPath}main"; //부모창 이동
</script>
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
					<h2>성공적으로 탈퇴되었습니다.</h2><br>
					이용해주셔서 감사합니다.<br>
                    <input type="button"class="btn" value="확인" onclick="self.close();">
</body>
</html>