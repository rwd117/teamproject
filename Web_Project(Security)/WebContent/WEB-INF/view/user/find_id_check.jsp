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
        function showPopup() { window.open("${conPath}user/}/find_id_check", "veiwimg", "width=500, height=300, left=300, top=500, toolbar=no,scrollbars=no,status=no,location=no"); }
</script>
</head>
<body>

	<div id="join_wrap">
		<div id="join">
			<table>
				<tr>
					<th><a href="#"><h1>SSA DA GU</h1></a></th>
				</tr>
				<tr>
					<td>인증번호를 발송하였습니다!</td>
				</tr>
				<tr>
					<td><input type="button" class="btn" value="닫기"
						onclick="self.close();"></td>
				</tr>


			</table>
			<br>
		</div>
	</div>


</body>
</html>