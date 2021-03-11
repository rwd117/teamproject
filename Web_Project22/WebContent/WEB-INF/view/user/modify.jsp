<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!DOCTYPE html>
<html lang="en">

<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/member.css">
    
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="../js/7.js"></script>
 <script language="javascript">
        function showPopup() { window.open("${conPath}popup/popup2", "veiwimg", "width=500, height=600, left=300, top=500, toolbar=no,scrollbars=no,status=no,location=no"); }
</script>
</head>
<body>
	<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
	
    <div id="memberView_wrap">
        <div id="memberView">
            	
            <form:form modelAttribute="modifyUserBean" action="modify_pro" method="post">
                <table>
                    <tr>
                        <th>
                            �ʼ�����
                        </th>
                    </tr>
                    <tr>
                        <td>
                            ���̵� <form:input path="mid"  required="required" readonly="readonly"/>
                        </td>
                    </tr>
                    <tr>
                        <td	class="msg" id="mIdChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��й�ȣ<form:input path="mpw" required="required" placeholder="������ҹ���+����+Ư������ 9~12��" />
                        </td>
                    </tr>
                    <tr>
                        <td class="msg" id="mPwPatternChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                   <!--   <tr>
                        <td>
                            ��й�ȣ Ȯ��<input name="mPwChk" id="mPwChk" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td	class="msg" id="mPwChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>-->
                    <tr>
                        <td>
                            �̸� <form:input path="mname" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td	class="msg" id="mNameChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �̸���<form:input path="memail" required="required" placeholder="��) abcd@efgh.com"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="msg" id="mEmailChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �ڵ���<form:input path="mphone" required="required" placeholder="��) 010-1234-5678"/>
                        </td>
                    </tr>
                    <tr>
                        <td	class="msg" id="mPhoneChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �ּ�<form:input path="maddress"  required="required" placeholder="��) 03011 ����� ���α� ���Ϸ�18����"/>
                        </td>
                    </tr>
                    <tr>
                    	<td>
                    		�� �ּ�:<form:input path="maddress2"  required="required" />
                    	</td>
                    </tr>
                    <tr>
                        <td	class="msg" id="mAddressChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
                <br>
                <table>
                    <tr>
                        <th>
                            ��������
                        </th>
                    </tr>
                    <tr>
                        <td>
                            ����<form:input path="mbirth"  class="date" id="datepicker"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="msg" id="mBirthChk">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
                <form:button path="" class="btn" >ȸ������ ����</form:button>
                <form:button path="" class="btn" onclick="showPopup();">��й�ȣ ����</form:button>
                <form:button path="main" class="btn">main</form:button>
            </form:form>
        </div>
    </div>
<c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>

</body>
</html>