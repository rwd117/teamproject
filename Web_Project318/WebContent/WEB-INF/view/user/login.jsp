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
			<form method="POST" action="${conPath }user/login_pro"
				class="loginform" >
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
							<input name="mid" id="mid" placeholder="아이디" class="textform"></input>
						</p>
						<p>
							<input name="mpw" id="mpw" placeholder="비밀번호" class="textform"></input>
						</p>
							<p>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<input type="submit" class="btnlogin" value="login"/>
							</p>
					</div>
					<input type="checkbox" class="checklogin"> 자동 로그인
				</fieldset>
				<div class="find_info">
					<a id="idinquiry" onclick="showfind_id();">아이디 찾기</a> <span
						class="bar">|</span> <a id="pwdinquiry" onclick="showfind_pw();">비밀번호
						찾기</a> <span class="bar">|</span> <a target="_blank" id="join"
						href="${conPath }user/join">회원가입</a>
				</div>
			</form>
			
		</div>
	</div>
</body>
</html>