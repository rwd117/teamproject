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
<script type="text/javascript">
	/*function dispList(selectList) {
		var obj1 = document.getElementById("sc1_list"); //  리스트1
		var obj2 = document.getElementById("sc2_list"); //  리스트2

		if (selectList == "0") { // 리스트1
			obj1.style.display = "block";
			obj2.style.display = "none";
			alert(obj.style.display);
		} else { // 리스트2
			obj1.style.display = "none";
			obj2.style.display = "block";
		}
	} //체크하면 보이기 */
</script>
<script language="javascript">
	/*function dataSend() {
		var mname = $("#mname").val();
		var memail = $("#memail").val();
		var param = {"mname":mname, "memail":memail}

		$.ajax({
			anyne:true,
			type:'POST',
			data: JSON.stringify(param),
			url:"/find_id_check",
			dataType: "text",
			success : function(data) {
			alert("비밀번호 변경이 완료되었습니다.");
			},
			error: function(jqXHR, textStatus, errorThrown) {
			alert("ERROR : " + textStatus + " : " + errorThrown);
			}

		});*/
	}
</script>
<script>
	function Send(){
		var mname = $("#mname").val();
		var memail = $("#memail").val();
		var param = {"mname":mname, "memail":memail}
		
		if(mname.length == 0) {
			alert("이름을 입력해주세요");
			return false;
		}
		if(memail.length == 0) {
			alert("이메일을 입력해주세요");
			return false;
		}
		$.ajax({
			url:"mailSend",
			type:"post",
			data: param,
			success : function(data) {
					if(data==true){
						alert("인증메일을 발송 했습니다.");
					}else{
						alert("해당하는 정보가 없습니다.");
					}
				
				},
				error: function(jqXHR, textStatus, errorThrown) {
				alert("ERROR : " + textStatus + " : " + errorThrown);
				}
		});
	}
</script>
</head>
<body>

	<div id="join_wrap">
		<div id="join">
			<form:form action="${conPath }/user/find_id_pro" method='post'
				modelAttribute="findidUserBean">
				<table>
					<tr>
						<th><a href="#"><h1>SSA DA GU</h1></a></th>
					</tr>

					<tr>
						<th>아이디 찾기</th>
					</tr>
					<tr>
						<td>
							<!-- 
						<input type="radio" name="choose" id="sc1"
						onclick="dispList('0');"> 휴대전화로 인증 <input type="radio"
						name="choose" id="sc2" onclick="dispList('1');">이메일로 인증 <br />
						<br />
						
						<div id="sc1_list" style="display: none">
							이름 <form:input path="mname" required="required" class='form-control'/><br><br>
							휴대전화 <form:input path="mphone" required="required" class='form-control'/><br><br>
							<form:button class="btn">인증하기</form:button>
						</div>
						
						 --> 이름 <form:input path="mname" name="mname" id="mname"
								class='form-control' required="required"/><br> <br> 이메일 <form:input
								path="memail" name="memail" id="memail" class='form-control' required="required" />
								<button type="button"  onclick="Send();" >인증번호 발송<button><br><br>
									
						</td>
					</tr>
					<tr>
						<td>
							인증번호 <form:input path="mpw2" class='form-control' required="required"/><br><br>
							<form:button class="btn">확인</form:button>
						</td>
					</tr>
					<tr>
						<td><input type="button" class="btn" value="닫기"
							onclick="self.close();"> <!-- <button class="btn" type="button" onclick="location.href='${conPath }/main'">main</button> -->

						</td>
					</tr>
					<!--
				<tr>
					<td>
						<button class="btn">휴대전화로 인증</button>
					</td>
				</tr>
				<tr>
					<td>
						<button class="btn">이메일로 인증</button>
					</td>
				</tr>  
				-->
					</form:form>

				</table>
				<br>
		</div>
	</div>


</body>
</html>