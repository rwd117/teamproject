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
 <script language="javascript">
        function moveClose() {
          opener.location.href="${conPath}user/mypage";
          self.close();
        }
        </script>
        <script language="javascript">
        function showPopup() { window.open("${conPath}popup/memberdelete_ok", "veiwimg", "width=500, height=300, left=300, top=500, toolbar=no,scrollbars=no,status=no,location=no"); }
		</script>
</head>
<body>
    <div id="join_wrap">
		<div id="join">
		<form:form action="${conPath }popup/memberdelete_ok" method='post' modelAttribute="deleteUserBean">
		<table>
				<tr>
						<th>
							<a href="#"><h1>SSA DA GU</h1></a>
						</th>
				</tr>
				<tr>
						<th>
							<h2>������ Ż�� �Ͻðڽ��ϱ�?</h2>
						</th>
				</tr>
				<tr>
						<th>
							�ػ����� ���� ������ ���� �� �� �����ϴ�.
						</th>
				</tr>
				<tr>
						<td>
							<form:input type="password" id="mpw" name="mpw" path="mpw" required="required" placeholder="������ �����Ͻ÷��� ��й�ȣ�� �Է����ּ���" class='form-control' /><br>
						</td>
				</tr>
				</table><br>
					<br>
					<br><br>
					
                    <!--<input type="button" class="btn" value="Ż��"  onclick="showPopup();" >  -->  
                    <form:button class="btn" >Ż��</form:button>
                    <input type="button"class="btn" value="���" onclick="self.close();">
                    </form:form>
</body>
</html>