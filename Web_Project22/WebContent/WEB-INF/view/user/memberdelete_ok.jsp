<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�󼼺���</title>
    <link href="../css/popup2.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/6.js"></script>

 <script >
        opener.parent.location="${conPath}main"; //�θ�â �̵�
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
					<h2>���������� Ż��Ǿ����ϴ�.</h2><br>
					�̿����ּż� �����մϴ�.<br>
                    <input type="button"class="btn" value="Ȯ��" onclick="self.close();">
</body>
</html>