<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	<sec:authentication property="principal" var="user"/> 
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
 <script>
$(document).ready(function(){
 $("#mpw3").keyup(function(){
 	var mPw = $("#mpw2").val(); // ����ڰ� mPw�� �Է��� ��
 	var mPwChk = $("#mpw3").val(); // ����ڰ� mPwChk�� �Է��� ��
 	if(mPw!=mPwChk){
 		$('#mpwChkMsg').html("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
 	}else{
 		$('#mpwChkMsg').html("");
 	}
 }); // mPwChk
 });
 </script>
</head>
<body>
    <div id="join_wrap">
		<div id="join">
		<form:form action="${conPath }user/pwupdate_ok" method='post' modelAttribute="pwupdateUserBean">
				<table>
				<tr>
						<th>
							<a href="#"><h1>SSA DA GU</h1></a>
						</th>
					</tr>
					<tr>
						<th>
							��й�ȣ����
						</th>
					</tr>
                    <br/>
					<tr>
						<td>
							�����й�ȣ <input type="password" id="mpw" name="mpw" required="required" placeholder="������ҹ���+����+Ư������ 9~12��">
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
							����й�ȣ<input type="password" id="mpw2" name="mpw2" required="required" placeholder="������ҹ���+����+Ư������ 9~12��">
						</td>
					</tr>
					<tr>
						<td class="msg" id="mpwPatternChkMsg">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							��й�ȣ Ȯ��<input type="password" id="mpw3" name="mpw3"  required="required" placeholder="������ҹ���+����+Ư������ 9~12��">
						</td>
					</tr>
					<tr>
						<td	class="msg" id="mpwChkMsg">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
                    

                    </table>
                    <form:button class="btn" >�����Ϸ�</form:button>
                    <input type="button"class="btn" value="���" onclick="self.close();">
                    </form:form>
</body>
</html>