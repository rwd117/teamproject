<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
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
					<tr>
						<th>
							<h2>�Է��Ͻ� ������ �ش��ϴ� ���̵� �Դϴ�.</h2>
						</th>
					</tr>
					<c:forEach items="${list}" var="list">
					<tr>
						<td>
							<c:out value="${list.mid }"/>
						</td>
					</tr>
					</c:forEach>
                    </table>
                    <input type="button"class="btn" value="Ȯ��" onclick="self.close();">
</body>
</html>