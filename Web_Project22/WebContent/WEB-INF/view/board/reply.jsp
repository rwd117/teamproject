<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<link href="../css/writeetc.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="../ckeditor/ckeditor.js"></script>
<script>
window.onload = function(){
   ck = CKEDITOR.replace("editor");
};
</script>
</head>

<c:import url="/WEB-INF/view/include/top_menu.jsp" />

<!-- 중간에 컨텐츠부분 -->
<div id="contents2">
	<div id="contents3">
		<input type="button" value="Q & A">
	</div>
	<div id="contents4">
	<% 
String temp ="\r\n\n----------------------------------------------\r\n\n";
		temp+="[re]\r\n";%>
		<form:form action="${conPath }board/reply_pro" method="post" modelAttribute="replyContentBean" enctype=" multipart/form-data">
			<input type="hidden" name="content_level" value="${replyContentBean.content_level}" />
				<input type="hidden" name="content_step" value="${replyContentBean.content_step}" />
				<input type="hidden" name="content_bno" value="${replyContentBean.content_bno}" />
				<input type="hidden" name="board_info_idx" value="${board_info_idx }" />
					<input type="hidden" name="page" value="${page }" />
			<table border="1" class="table">
				<th>IMAGE</th>
				<td><c:if test="${replyContentBean.content_file != null }">
						<img src="${conPath }upload/${replyContentBean.content_file}"
							width="20%" />
						<input type="hidden" value="${content_file}" />
						<!--유효성검사시 전달이 안되는 현상때문에 파일명을 숨겨서 전달하도록함-->
					</c:if>
					</td>
			</table>
			<table border="1" class="table">


				<tr>
					<th>글번호</th>
					<td colspan="3">${content_idx }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="1"><input type="text" value="[re]:${replyContentBean.content_subject }" /></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" value="${replyContentBean.content_write_name}"  /></td>

				</tr>

				<tr>
					<th>등록일</th>
					<td>${replyContentBean.content_date }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td></td>
				</tr>
				<tr class="tr20">
					<td colspan="2"><form:textarea path="content_text" style="resize:none" id="editor"></form:textarea></td>
				
				<tr>
					<th>비밀번호</th>
					<td colspan="1"><input type="password" name="mpw">수정하려면 비밀번호를 입력하세요.</td>
				</tr>

			</table>
			<div class="section3">
				<c:if test="${replyContentBean.content_writer_idx > 0}">
 					<form:button><a><img src="../img/btn_reply.gif" alt="답변"></a></form:button>
					<a href="${conPath }board/delete?board_info_idx=${board_info_idx}&content_idx=${content_idx}"><img src="../img/btn_delete.gif" alt="삭제"></a>
				</c:if>
				<a href="${conPath }board/main?board_info_idx=${board_info_idx}"><img src="../img/btn_list.gif" alt="목록"></a>
			</div>
		</form:form>
	</div>
	<c:import url="/WEB-INF/view/include/bottom_menu.jsp" />
	</body>
</html>