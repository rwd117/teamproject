<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='conPath' value="${pageContext.request.contextPath }/" />
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link href="../css/login.css" rel="stylesheet">
 <script language="javascript">
        function showfind_id() { window.open("${conPath}user/find_id", "veiwimg", "width=500, height=600, left=300, top=500, toolbar=no,scrollbars=no,status=no,location=no"); }
</script>
 <script language="javascript">
        function showfind_pw() { window.open("${conPath}user/find_pw", "veiwimg", "width=500, height=600, left=300, top=500, toolbar=no,scrollbars=no,status=no,location=no"); }
</script>
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
					<a id="idinquiry" onclick="showfind_id();">���̵� ã��</a> <span
						class="bar">|</span> <a id="pwdinquiry" onclick="showfind_pw();">��й�ȣ
						ã��</a> <span class="bar">|</span> <a target="_blank" id="join"
						href="${conPath }user/join">ȸ������</a>
				</div>
			</form:form>
			
		</div>
	</div>
</body>
</html>