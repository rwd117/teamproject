<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='conPath' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link href="../css/login.css" rel="stylesheet">
</head>
<body>
	<div class="content">
		<a href="${conPath }main"><h1>SSA DA GU</h1></a>
		<div class="login_wrap">
			<form:form method="POST" action="${conPath }user/login_pro"
				class="loginform" modelAttribute="afterUserBean">
				<fieldset>
					<legend>�α��� �Է���</legend>
					<div class="input">
						<c:if test="${logcheck == false }">
							<div class="alert alert-danger">
								<h3>�α��� ����</h3>
								<p>���̵� ��й�ȣ�� Ȯ�����ּ���</p>
							</div>
						</c:if>
						<p>
							<form:input path="mid" placeholder="���̵�" class="textform"></form:input>
						</p>
						<p>
							<form:password path="mpw" placeholder="��й�ȣ" class="textform"></form:password>
						</p>
							<p>
								<form:button class="btnlogin">LOGIN</form:button>
							</p>
					</div>
					<input type="checkbox" class="checklogin"> �ڵ� �α���
				</fieldset>
				<div class="find_info">
					<a target="_blank" id="idinquiry" href="">���̵� ã��</a> <span
						class="bar">|</span> <a target="_blank" id="pwdinquiry" href="">��й�ȣ
						ã��</a> <span class="bar">|</span> <a target="_blank" id="join"
						href="${conPath }user/join">ȸ������</a>
				</div>
			</form:form>
			>
		</div>
	</div>
</body>
</html>