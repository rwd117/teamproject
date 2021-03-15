<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
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
    </div>
    <div id="memberView_wrap">
        <div id="memberView">
            
                <table>
                    <tr>
                        <th>
                            �ʼ�����
                        </th>
                    </tr>
                    <tr>
                        <td>
                            ���̵� <input type="text" id="mId" name="mId" value="${member.mId }" required="required" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <td	class="msg" id="mIdChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��й�ȣ<input type="password" id="mPw" name="mPw" required="required" placeholder="������ҹ���+����+Ư������ 9~12��">
                        </td>
                    </tr>
                    <tr>
                        <td class="msg" id="mPwPatternChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��й�ȣ Ȯ��<input type="password" id="mPwChk" name="mPwChk" required="required">
                        </td>
                    </tr>
                    <tr>
                        <td	class="msg" id="mPwChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �̸� <input type="text" id="mName" name="mName" value="${member.mName }" required="required">
                        </td>
                    </tr>
                    <tr>
                        <td	class="msg" id="mNameChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �̸���<input type="email" id="mEmail" name="mEmail" value="${member.mEmail }" required="required" placeholder="��) abcd@efgh.com">
                        </td>
                    </tr>
                    <tr>
                        <td class="msg" id="mEmailChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �ڵ���<input type="text" id="mPhone" name="mPhone" value="${member.mPhone }" required="required" placeholder="��) 010-1234-5678">
                        </td>
                    </tr>
                    <tr>
                        <td	class="msg" id="mPhoneChkMsg">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �ּ�<input type="text" id="mAddress" name="mAddress" value="${member.mAddress }" required="required" placeholder="��) 03011 ����� ���α� ���Ϸ�18����">
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
                            ����<input type="text" name="mBirth" value="${member.mBirth }" class="date" id="datepicker">
                        </td>
                    </tr>
                    <tr>
                        <td class="msg" id="mBirthChk">
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
                <input type="submit" id="submit" value="ȸ������ ����" class="btn">
            
        </div>
    </div>
<c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</body>
</html>