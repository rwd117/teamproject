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

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>������Ʈ</title>
<link href="../css/mypage.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script language="javascript">
        function showPopup() { window.open("${conPath}popup/memberdelete", "veiwimg", "width=500, height=300, left=300, top=800, toolbar=no,scrollbars=no,status=no,location=no"); }
</script>
</head>

<body>
	<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
	<!-- �߰��� �������κ� -->
	<div id="contents2">
        <div id="best">           
                <ul>
                   <li><a>MY PAGE</a></li> 
                </ul>                            
        </div>
		<div id="mypage">
            <div class="mypg">
                <ul>
                   <li><a href="${conpath }modify">��������</a></li>
                   <li><a href="${conpath }../wishlist/wish">���ø���Ʈ</a></li> 
                   <li>
                   	<form action="${conPath}orders/orderlist" method="get" >
						<a href="${conpath }../orders/orderlist">�ֹ�����</a>
					</form>	</li>
            </ul>  
            </div>
            <div class="mypg">
                <ul>
                	<c:if test="${loginUserBean.mlevel == 0 }">
                    <li> <a href="#">�������</a></li>
                    <li> <a href="#">���ǰ��� </a></li>
                    </c:if>
                    
                    <li> <a href="#" onclick="showPopup();">ȸ��Ż��</a></li>
            	</ul> 
            </div>

		</div>
	</div>


<c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</body>

</html>
</body>
</html>