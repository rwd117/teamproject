<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='conPath' value="${pageContext.request.contextPath }/"/>
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
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/orderresult.css">
    <!-- <link href="css/5.css" rel="stylesheet"> -->
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="../js/7.js"></script>
</head>
<body>
<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
    
    <div id="ordersResult_wrap">
		<div id="ordersResult">
			<div class="subject">
				<span>&nbsp; �ֹ� �� ����  &nbsp;</span>
			</div>
			<c:if test="${empty admin }">
				<div class="subject">
					�����մϴ�. �ֹ��� �Ϸ�Ǿ����ϴ�. (�ֹ���ȣ : ${orders.oId } )
				</div>	
			</c:if>			
		<c:if test="${not empty admin }">
		<table>
			<tr>
				<td colspan="2" class="firstrow">
					�ֹ� ��� ó�� ��Ȳ
				</td>
			</tr>
			<tr>
				<td class="title">
					�����ȣ 
				</td>
				<td>
					<form action="${conPath }/ordersUpdate.do">
						<input type="hidden" name="oId" value="${orders.oId }">
						<c:if test="${orders.oInvoice eq 0 }">
							<input type="text" class="oInvoice" name="oInvoice" value="">
						</c:if>
						<c:if test="${orders.oInvoice != 0 }">
							<input type="text" class="oInvoice" name="oInvoice" value="${orders.oInvoice}">
						</c:if>
						<input type="submit" class="btn" value="���ó���Ϸ�">	
					</form>
				</td>
			</tr>
		</table>
		</c:if>
		<table>
			<tr>
				<td colspan="6" class="firstrow">
					�ֹ� ��ǰ ����	
				</td>
			</tr>
			<c:set var="sum" value="0"/>
			<c:forEach var="dto" items="${ordersDetail }">
			<tr>
				<td id="img">
					<a href="${conPath }/productContent.do?pId=${dto.pId}">										
						<img src="${conPath }/productImg/${dto.pImage1}" alt="��ǰ����">							
					</a>
				</td>
				<td id="name">
					<a href="${conPath }/productContent.do?pId=${dto.pId}">			
						${dto.pName }
					</a>
				</td>
				<td id="price">
					<fmt:formatNumber value="${dto.pPrice }" pattern="#,###,###" />��				
				</td>
				<td id="amount">
					${dto.odAmount }��
				</td>
				<td id="totsum">
					<fmt:formatNumber value="${dto.odTotsum }" pattern="#,###,###" />��						
					<c:set var="sum" value="${sum+dto.odTotsum }"/>
				</td>
				<c:if test="${empty admin  }">
					<td	id="reviewWrite">						
						<c:if test="${orders.oInvoice !=0 }">
							<button class="btn" onclick="location.href='${conPath}/reviewWriteView.do?oId=${dto.oId }&pId=${dto.pId }'">�����ۼ�</button>
						</c:if>
						<br>
						<button class="btn" onclick="location.href='${conPath }/productContent.do?pId=${dto.pId}'">�籸��</button>
					</td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
		<table>
			<tr>
				<td colspan="2" class="firstrow">
					������ ����
				</td>
			</tr>
			<tr>
				<td class="title">
					�ֹ���
				</td>
				<td>
					${member.mName }
				</td>
			</tr>
			<tr>
				<td class="title">
					�̸��� �ּ�
				</td>
				<td>
					${member.mEmail }
				</td>
			</tr>
			<tr>
				<td class="title">
					�޴��� ��ȣ
				</td>
				<td>
					${member.mPhone }
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td colspan="2" class="firstrow">
					���� ����
				</td>
			</tr>
			<tr>
				<td class="title">
					���� �ݾ�
				</td>
				<td>
					<fmt:formatNumber value="${sum }" pattern="#,###,###"/> ��
				</td>
			</tr>
			<tr>
				<td class="title">
					���� ����
				</td>
				<td>
					${orders.oPayment }
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td colspan="2" class="firstrow">
					����� ����
				</td>
			</tr>
			<tr>
				<td class="title">
					�޴� ���
				</td>
				<td>
					${orders.oName }
				</td>
			</tr>
			<tr>
				<td class="title">
					�޴��� ��ȣ
				</td>
				<td>
					${orders.oPhone }
				</td>
			</tr>
			<tr>
				<td class="title">
					�ּ�
				</td>
				<td>
					${orders.oAddress }
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="lastrow">				
					<button class="btn" id="lastbtn" onclick="location.href='${conPath}/ordersList.do'">List</button>		
				</td>
			</tr>
		</table>
		</div>
	</div>

<c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>

</body>
</html>
</body>
</html>