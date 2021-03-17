<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script language="javascript">
        function showPopup() { window.open("${conPath}popup/pwupdate", "veiwimg", "width=500, height=600, left=300, top=500, toolbar=no,scrollbars=no,status=no,location=no"); }
</script>

</head>
<body>
	<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
	
    <div id="memberView_wrap">
        <div id="memberView">
            	
           <form:form action="${conPath }user/modify_pro" method='post' modelAttribute="modifyUserBean">
				
                <table>
                    <tr>
                        <th>
                            필수정보
                        </th>
                    </tr>
                    <tr>
                        <td>
                            아이디 <form:input path="mid"  required="required" readonly="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td	class="msg" id="mIdChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            비밀번호 <button type="button" class="btn" onclick="showPopup();">비밀번호 변경<button>
                        </td>
                    </tr>
                    <!-- 
                    
                    <tr>
                        <td class="msg" id="mPwPatternChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                   <tr>
						<td>
							비밀번호 확인<input type="password" id="mpw2" name="mpw2" required="required">
						</td>
					</tr>
					<tr>
						<td	class="msg" id="mpwChkMsg">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
                     -->
                    
                    <tr>
                        <td>
                           <!--  --> 이름 <form:input path="mname" required="required" class='form-control'/>
                        </td>
                    </tr>
                    <tr>
                        <td	class="msg" id="mNameChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            이메일<form:input path="memail" required="required" placeholder="예) abcd@efgh.com" class='form-control'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="msg" id="mEmailChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            핸드폰<form:input path="mphone" required="required" placeholder="예) 010-1234-5678" class='form-control'/>
                        </td>
                    </tr>
                    <tr>
                        <td	class="msg" id="mPhoneChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            주소<form:input path="maddress"  required="required" placeholder="예) 03011 서울시 종로구 통일로18나길" class='form-control'/>
                        </td>
                    </tr>
                    <tr>
                    	<td>
                    		상세 주소:<form:input path="maddress2"  required="required" />
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
                            선택정보
                        </th>
                    </tr>
                    <tr>
                        <td>
                            생일<form:input path="mbirth"  class="date" id="datepicker"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="msg" id="mBirthChk">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
                <form:button class="btn" >회원정보 수정</form:button>
               
                <button class="btn" type="button" onclick="location.href='${conPath }main'">main</button>
            </form:form>
           
        </div>
    </div>
<c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>

</body>
</html>