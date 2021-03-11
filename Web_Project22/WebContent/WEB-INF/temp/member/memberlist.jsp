<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/memberList.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){

});
</script>
</head>
<body>
<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
	<div id="memberList_wrap">
		<div id="memberList">
			<div class="subject">
				<span>&nbsp; ȸ�� ����Ʈ  &nbsp;</span>
			</div>
			<table>
				<tr>
					<td class="title">
						���̵�
					</td>
					<td class="title">
						�̸�
					</td>
					<td class="title">
						�̸���
					</td>
					<td class="title">
						�ڵ���
					</td>
					<td class="title">
						�ּ�
					</td>
					<td class="title">
						����
					</td>
					<td class="title">
						������
					</td>
					<td class="title">
						Ż�𿩺�
					</td>
					<td class="title">
						*
					</td>
				</tr>
				<c:if test="${memberList.size() eq 0 }">
				<tr>
					<td colspan="8">
						������ ȸ���� �����ϴ�.
					</td>
				</tr>
				</c:if>
				<c:if test="${memberList.size() != 0 }">
					<c:forEach items="${memberList }" var="dto">
						<tr>
							<td>
								${dto.mId }
							</td>
							<td>
								${dto.mName }
							</td>
							<td>
								${dto.mEmail }
							</td>
							<td>
								${dto.mPhone }
							</td>
							<td>
								${dto.mAddress }
							</td>
							<td>
								${dto.mBirth }
							</td>
							<td>
								<fmt:formatDate value="${dto.mDate }" pattern="yy/MM/dd(E)"/>
							</td>
							<td>
								${dto.mDrop }
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="paging">
					<c:if test="${startPage > BLOCKSIZE }">
						<a href="${conPath }/memberList.do?pageNum=${startPage-1}"> ��  &nbsp; </a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:if test="${i eq pageNum }">
							<b> &nbsp; ${i }</b>
						</c:if>
						<c:if test="${i != pageNum }">
							<a href="${conPath }/memberList.do?pageNum=${i }">&nbsp; ${i }</a>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCnt }">
						<a href="${conPath }/memberList.do?pageNum=${endPage+1}">  &nbsp; �� </a>
					</c:if>
				</div>
		</div>
	</div>
<c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</body>
</html>