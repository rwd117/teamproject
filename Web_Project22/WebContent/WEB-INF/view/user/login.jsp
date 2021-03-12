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
					<legend>로그인 입력폼</legend>
					<div class="input">
						<c:if test="${logcheck == false }">
							<div class="alert alert-danger">
								<h3>로그인 실패</h3>
								<p>아이디 비밀번호를 확인해주세요</p>
							</div>
						</c:if>
						<p>
							<form:input path="mid" placeholder="아이디" class="textform"></form:input>
						</p>
						<p>
							<form:password path="mpw" placeholder="비밀번호" class="textform"></form:password>
						</p>
							<p>
								<form:button class="btnlogin">LOGIN</form:button>
							</p>
					</div>
					<input type="checkbox" class="checklogin"> 자동 로그인
				</fieldset>
				<div class="find_info">
					<a target="_blank" id="idinquiry" href="">아이디 찾기</a> <span
						class="bar">|</span> <a target="_blank" id="pwdinquiry" href="">비밀번호
						찾기</a> <span class="bar">|</span> <a target="_blank" id="join"
						href="${conPath }user/join">회원가입</a>
				</div>
			</form:form>
			>
		</div>
	</div>
</body>
</html>