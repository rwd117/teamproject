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
							<h2>정말로 탈퇴 하시겠습니까?</h2>
						</th>
				</tr>
				<tr>
						<th>
							※삭제된 계정 정보는 복구 할 수 없습니다.
						</th>
				</tr>
				<tr>
						<td>
							<form:input type="password" id="mpw" name="mpw" path="mpw" required="required" placeholder="계정을 삭제하시려면 비밀번호를 입력해주세요" class='form-control' /><br>
						</td>
				</tr>
				</table><br>
					<br>
					<br><br>
					
                    <!--<input type="button" class="btn" value="탈퇴"  onclick="showPopup();" >  -->  
                    <form:button class="btn" >탈퇴</form:button>
                    <input type="button"class="btn" value="취소" onclick="self.close();">
                    </form:form>
</body>
</html>