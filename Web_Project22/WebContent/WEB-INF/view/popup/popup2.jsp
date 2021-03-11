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
 <script language="javascript">
        function moveClose() {
          opener.location.href="${conPath}user/modify";
          self.close();
        }
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
							비밀번호변경
						</th>
					</tr>
                    <br/>
					<tr>
						<td>
							현재비밀번호 <input type="password" id="mpw" name="mpw" required="required" placeholder="영문대소문자+숫자+특수문자 9~12자">
					<form:errors path="mpw"></form:errors>
						</td>
					</tr>
					<tr>
						<td	class="msg" id="mIdChkMsg">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							새비밀번호<input type="password" id="mpw" name="mpw" required="required" placeholder="영문대소문자+숫자+특수문자 9~12자">
						</td>
					</tr>
					<tr>
						<td class="msg" id="mpwPatternChkMsg">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							비밀번호 확인<input type="password" id="mpw2" name="mpw2" placeholder="영문대소문자+숫자+특수문자 9~12자">
						</td>
					</tr>
					<tr>
						<td	class="msg" id="mpwChkMsg">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
                    

                    </table>
                    <input type="button" class="btn" value="수정완료">
                    <input type="button"class="btn" value="닫기">
</body>
</html>