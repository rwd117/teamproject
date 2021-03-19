<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/join.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="../js/7.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>
	function Send(){
		var mid = $("#mid").val();
		var mname = $("#mname").val();
		var memail = $("#memail").val();
		var param = {"mname":mname, "memail":memail, "mid":mid}
		
		if(mid.length == 0) {
			alert("아이디를 입력해주세요");
			return false;
		}
		if(mname.length == 0) {
			alert("이름을 입력해주세요");
			return false;
		}
		if(memail.length == 0) {
			alert("이메일을 입력해주세요");
			return false;
		}
		/*$.ajax({
			url:"mailSend",
			type:"post",
			data: param,
			success : function(data) {
					if(data==true){
						alert("임시비밀번호를 발송 했습니다.");
					}else{
						alert("해당하는 정보가 없습니다.");
					}
				
				},
				error: function(jqXHR, textStatus, errorThrown) {
				alert("ERROR : " + textStatus + " : " + errorThrown);
				}
		});*/
	}
</script>
</head>
<body>

	<div id="join_wrap">
		<div id="join">
			<form:form action="${conPath }/user/find_pw_pro" method='post'
				modelAttribute="findidUserBean">
				<table>
					<tr>
						<th><a href="#"><h1>SSA DA GU</h1></a></th>
					</tr>

					<tr>
						<th>비밀번호 찾기</th>
					</tr>
					<tr>
						<td>
						 아이디 <form:input path="mid" name="mid" id="mid"
								class='form-control' required="required"/><br> <br>
						 이름 <form:input path="mname" name="mname" id="mname"
								class='form-control' required="required"/><br> <br> 이메일 <form:input
								path="memail" name="memail" id="memail" class='form-control' required="required" />
									
						</td>
					</tr>
					<tr>
						<td><form:button class="btn" onclick="Send();">확인</form:button>
							<input type="button" class="btn" value="닫기"onclick="self.close();"> 
							<!-- <button class="btn" type="button" onclick="location.href='${conPath }/main'">main</button> -->

						</td>
					</tr>
					</form:form>

				</table>
				<br>
		</div>
	</div>


</body>
</html>