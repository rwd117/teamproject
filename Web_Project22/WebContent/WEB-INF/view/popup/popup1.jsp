<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='conPath' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title style="color:green;">�󼼺���</title>
    <link href="../css/popup.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/6.js"></script>
<script src="../js/cart.js"></script>
<script src="../js/wish.js"></script>
<script language="javascript">
    function moveClose() {
      opener.location.href="${conPath}product/productContent?pID="+${pID};
      self.close();
    }
    
    function moveCart() {
      opener.location.href="${conPath}cart/cart?midx="+${loginUserBean.midx};
      self.close();
    }
    </script>
    
</head>
<body>
    <div id="contents2">
        <div id="contents3">
        <div id="top">
            <div class="left">
                <ul>
                    <li><img src="${conPath}upload/${productbean.pIMAGE1}" class="img1"></li>
                    <li><img src="${conPath}upload/${productbean.pIMAGE1}" class="img2"></li>
                    <li><img src="${conPath}upload/${productbean.pIMAGE1}" class="img3"></li>
                </ul>

                <p class="nex"><img src="../img/btn_next.png" alt="��������"></p>
                <p class="pre"><img src="../img/btn_prev.png" alt="��������"></p>
            </div>
        </div>
            <div class="right">
                <div id="productPrice">
                <form name="readform" method="post">
						<input type="hidden" id="pID" name="pID" value="${pID}">
						<input type="hidden" id="page" name="page" value="${scri.page}">
						<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
						<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
						</form>
                <table>
							<tr>
								<th>�ǸŰ���</th>
								<td><fmt:formatNumber value="${productbean.pPRICE}" pattern="#,###,###" />��</td>
							</tr>
							
								<tr>
									<th>���ΰ���</th>
									<td>
									<c:set var="discountedPrice" value="${productbean.pPRICE*(1-(productbean.pdiscount/100)) }" />
										<fmt:formatNumber value="${discountedPrice }" pattern="#,###,###" />�� 
										<span>(${productbean.pdiscount }%����) </span></td>
								</tr>
							
							<tr>
								<th>����</th>
								<td><select name="cAmount" id="cAmount">
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										<option value='�����Է�'>�����Է�</option>
								</select> ��</td>
							</tr>
							<tr>
								<th>�ɼ�</th>
								<td><select name="size" id="">
								<option value='�����Է�'>FREE</option>
										<option value='1'>S</option>
										<option value='2'>M</option>
										<option value='3'>L</option>
								<option value='�����Է�'>����</option>		
								</select> ��</td>
							</tr>
							<tr>
							<tr>
								<th>������</th>
								<td><c:set var="discountedPrice" value="${productbean.pPRICE*(1-(productbean.pdiscount*0.01)) }" />
										<fmt:formatNumber value="${discountedPrice }" pattern="#,###,###"/>�� 
										<span>${(productbean.pPRICE*0.01)} (��)</span></td>
							</tr>
							<tr>
								<th>��ۺ�</th>
								<td>2,500��(50,000�� �̻� ���Ž� ����)</td>
							</tr>
							<tr>
								<td colspan="2">
								<c:choose>
										<c:when test="${loginUserBean.userLogin == true }">

											<c:if test="${loginUserBean.mlevel == 0 }">
												<input type="button" class="btn" value="addCart"
													onClick="addCart(${loginUserBean.midx},${pID});">
												<input type="button" value="go to Cart" class="btn"
													onclick="moveCart()">
												<input type="button" class="heartbtn"  onclick="WISH(${loginUserBean.midx},${pID});">
												<input type="button" class="btn" value="�󼼺���" onclick="moveClose(${pID});" >
													
											</c:if>
											<c:if test="${loginUserBean.mlevel > 0 }">
												<input type="button" value="��ǰ ���� ����" class="guestBtn" id="modifybtn">
												<input type="button" value="��ǰ ����" class="guestBtn" id="deletebtn">
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${loginUserBean.userLogin == false }">
												<input type="button" value="��ǰ ���Ŵ� �α��� �� �����մϴ�."
													class="guestBtn"
													onclick="location.href='${conPath}user/login'">
													<input type="button" class="btn" value="�󼼺���" onclick="moveClose(${pID});" >
											</c:if>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</table>
                    
                
                </div>
                </div>
            </div>
        </div>
        
</body>
</html>