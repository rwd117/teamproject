<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript">
$(document).ready(function(){<!-- �ε�Ǹ� �⺻������ list�� �ҷ���!-->
Invoicecheck();
});
function Invoicecheck(){
	var invoiceurl = "${conPath}orders/orderinvoice";
	var o_ID=${vieworderbean.o_ID};
	
	
	$.ajax({
		url : invoiceurl+'/'+o_ID,
		type : 'POST',
		dataType: 'json',
		success : function(result){
			
			
				paintInvoice(result.result);
			
		}, error : function(result){
		
			console.log(result.result);			
	
		}
	});
	
	
}

function paintInvoice(a){
	var mlevel = ${loginUserBean.mlevel}; 
	var paint="";
	
	if(a === 0){
		paint += '<td class="title"> ��� �غ� �� </td>';
		if(mlevel > 0){
			paint += '<td>';
			paint += '<input type="button" class="btn" value="��� �ϱ�" onclick="invoiceadd()">';
			paint += '</td>';
		}else {
			
		}
		
 		
	}else if(a > 0) {
		paint += '<td class="title"> ��� �� </td>';
		paint += '<td>';
		paint += '<input type="text" class="oInvoice" name="oInvoice" value="'+a+'" readonly>';
		
		if(mlevel > 0){
			paint += '<input type="button" class="btn" value="��� �Ϸ�" readonly>';
			paint += '</td>';
		
		}else {
			paint += '</td>';
			
		}
		
	}
	

	$("#invoiceinfodiv").html(paint);
	
};

function invoiceadd(){
	if(confirm("�ù踦 �����̽��ϱ�?")== true){
		var invoiceaddurl = "${conPath}orders/invoiceadd";
		var o_ID=${vieworderbean.o_ID};
	
		$.ajax({
			url : invoiceaddurl+'/'+o_ID,
			type : 'POST',
			dataType: 'json',
			success : function(result){
			
				Invoicecheck();
				
			}, error : function(result){
		
				console.log(result.result);			
	
			}
		});
	}else {
		return false;
	};
	
};


</script>
</head>
<body>
<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
    
    <div id="ordersResult_wrap">
		<div id="ordersResult">
			<div class="subject">
				<span>&nbsp; �ֹ� �� ����  &nbsp;</span>
			</div>
				<div class="subject">
					�ֹ���ȣ : ${vieworderbean.o_title }
				</div>	
		<table>
			<tr>
				<td colspan="2" class="firstrow">
					�ֹ� ��� ó�� ��Ȳ
				</td>
			</tr>
			<tr id="invoiceinfodiv">
						
			</tr>
		</table>
		<table>
			<tr>
				<td colspan="6" class="firstrow">
					�ֹ� ��ǰ ����	
				</td>
			</tr>
			<c:set var="sum" value="0"/>
			
			<c:forEach var="product" items="${vieworderproductlist }">
			
			<tr>
				<td id="img">
					<a href="${conPath }/productContent?pID=${product.op_pID}">										
						<img src="${conPath }upload/${product.op_pIMAGE1}" width="100px" height="100px" alt="��ǰ����">							
					</a>
				</td>
				<td id="name">
					<a href="${conPath }/productContent?pID=${product.op_pID}">			
						${product.op_pNAME }
					</a>
				</td>
				<td id="price">
					<fmt:formatNumber value="${product.op_pPRICE }" pattern="#,###,###" />��				
				</td>
				<td id="amount">
					${product.op_amount }��
				</td>
				<td id="totsum">
					<fmt:formatNumber value="${product.op_o_money }" pattern="#,###,###" />��						
				</td>
				
				<td	id="reviewWrite">
					<c:choose>
						<c:when test="${orders.oInvoice !=0 }">
							<button class="btn" onclick="location.href='${conPath}review/reviewwrite?o_ID=${vieworderbean.o_ID}&o_mIDx=${loginUserBean.midx}&pID=${product.op_pID}'">�����ۼ�</button>
							<button class="btn" onclick="location.href='${conPath}product/productContent?pID=${product.op_pID}'">�籸��</button>
						</c:when>
						<c:otherwise>
							��� �غ� ��
						</c:otherwise>
					</c:choose>						
				</td>
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
					${vieworderbean.o_mname }
				</td>
			</tr>
			<tr>
				<td class="title">
					�̸��� �ּ�
				</td>
				<td>
					${vieworderbean.o_memail }
				</td>
			</tr>
			<tr>
				<td class="title">
					�޴��� ��ȣ
				</td>
				<td>
					${vieworderbean.o_mphone }
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
					<fmt:formatNumber value="${vieworderbean.o_money }" pattern="#,###,###"/> ��
					
				</td>
			</tr>
			<tr>
				<td class="title">
					���� ����
				</td>
				<td>
					<c:set var="payment" value="${vieworderbean.o_PAYMENT }"/>
					<c:choose>
						<c:when test="${payment eq 'BankTransfer' }">
							������ü
						</c:when>
						<c:when test="${payment eq 'card' }">
							�ſ�ī��
						</c:when>
						<c:when test="${payment eq 'bankbook' }">
							�������Ա�
						</c:when>
						<c:when test="${payment eq 'phone' }">
							�ڵ�������
						</c:when>
					</c:choose>
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
					${vieworderbean.o_NAME }
				</td>
			</tr>
			<tr>
				<td class="title">
					�޴��� ��ȣ
				</td>
				<td>
					${vieworderbean.o_PHONE }
				</td>
			</tr>
			<tr>
				<td class="title">
					�ּ�
				</td>
				<td>
					${vieworderbean.o_post }
					${vieworderbean.o_ADDRESS }
					${vieworderbean.o_ADDRESS2 }
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="lastrow">
					<form action="${conPath}orders/orderlist" method="get" >
						<input type="hidden" name="o_mIDx" id="o_mIDx" value="${loginUserBean.midx }">				
						<input type="submit" class="btn" id="lastbtn" value="List">
					</form>		
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