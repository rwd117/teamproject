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
    <link rel="stylesheet" href="../css/order.css">
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
    <!-- �߰��� �������κ� -->
	<div id="contents2">
        <div id="contents3">
            <div class="section">
            <div class="cart">
                <ul><a href="#"><li>ORDER</li></a></ul>
                
            </div>
            <table border="1" class="table1">
            <tr>
                <th rowspan="2"><h4>��������</h4></th>
                <td><p>�質�� ����, [�Ϲ�ȸ��] ȸ���̽ʴϴ�.</p></td>
            </tr>
            <tr>
                <td> 
                    <ul>
                    <li><a href="">���������� : 2,000��</a></li>
                    <li><a href="">��ġ�� : </a></li>
                    <li><a href="">���� : 1��</li>
                </ul>
            </td>
            </tr>
            </table>
        </div>
             <!-- �� -->
             <ul class="section1">
             <div class="tabArea">
                <ul class="tabList">
                    <li ><a href="#" class="tabBtn">������ۻ�ǰ (1)</a>
                    <!--  -->
                    <div class="tabCon notice">
                        <table class="table table-striped">
                            <thead>
                                <tr class="tr2">
                                    <th scope="cols"><input class="th1" type="checkbox" onclick=""></th>
                                    <th scope="cols">�̹���</th>
                                    <th scope="cols">��ǰ����</th>
                                    <th scope="cols">�ǸŰ�</th>
                                    <th scope="cols">����</th>
                                    <th scope="cols">������</th>
                                    <th scope="cols">��۱���</th>
                                    <th scope="cols">��ۺ�</th>
                                    <th scope="cols">�հ�</th>
                                    <th scope="cols">����</th>
                                </tr>
                            </thead>
                            <tbody>    
                                <tr class="tr12">
                                    <td scope="row"><a href=""><input type="checkbox" onclick=""></a></td>
                                    <td><img src="" alt=""></td>
                                    <td><a href=""><img src="" alt="">��ǰ�ɼ�
                                        <select size="" id="">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select></a><br/>
                                        <input type="submit" value="�߰�">
                                        <input type="submit" value="����">
                                        <input type="reset" value="����">
                                    </td>
                                    <td scope="row">��</td>
                                    <td><input type="number" value="" min="0" max="100" step="1"></td>
                                    <td>��</td>
                                    <td>�⺻���<br/>(�ؿܹ�۰���)</td>
                                    <td>��<br/>���ǹ��</td>
                                    <td>��</td>
                                    <td><a href="" onclick=""><input type="button" value="�ֹ��ϱ�"><br/><input type="button" value="�����ϱ�"></a></td>
                                </tr>
                                <tr class="tr13">
                                    <th colspan="10" scope="row">
                                        <p>[�⺻���]</p>                    
                                        <a>��ǰ���űݾ� + ��ۺ� = �հ� : ��</a>
                                    </th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </li>
            
                
                <li>
                    <a href="#" class="tabBtn">�ؿܹ�ۻ�ǰ (0)</a>
                    <div class="tabCon notice">
                        <table class="table table-striped">
                            <thead>
                                <tr class="tr2">
                                    <th scope="cols"><input class="th1" type="checkbox" onclick=""></th>
                                    <th scope="cols">�̹���</th>
                                    <th scope="cols">��ǰ����</th>
                                    <th scope="cols">�ǸŰ�</th>
                                    <th scope="cols">����</th>
                                    <th scope="cols">������</th>
                                    <th scope="cols">��۱���</th>
                                    <th scope="cols">��ۺ�</th>
                                    <th scope="cols">�հ�</th>
                                    <th scope="cols">����</th>
                                </tr>
                            </thead>
                            <tbody>    
                                <tr class="tr12">
                                    <td scope="row"><a href=""><input type="checkbox" onclick=""></a></td>
                                    <td><img src="" alt=""></td>
                                    <td><a href=""><img src="" alt="">��ǰ�ɼ�
                                        <select size="" id="">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select></a><br/>
                                        <input type="submit" value="�߰�">
                                        <input type="submit" value="����">
                                        <input type="reset" value="����">
                                    </td>
                                    <td scope="row">��</td>
                                    <td><input type="number" value="" min="0" max="100" step="1"></td>
                                    <td>��</td>
                                    <td>�ؿܹ��</td>
                                    <td>��<br/>�ؿܹ��</td>
                                    <td>��</td>
                                    <td><a href="" onclick=""><input type="button" value="�ֹ��ϱ�"><br/><input type="button" value="�����ϱ�"></a></td>
                                </tr>
                                <tr class="tr13">
                                    <th colspan="10" scope="row">
                                        <p>[�⺻���]</p>                    
                                        <a>��ǰ���űݾ� + ��ۺ� = �հ� : ��</a>
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </li>
                </ul>
             </div>
        </ul>
     
        <table border="1" class="table1">
            <h2>�ֹ�����</h2>
            <tr>
                <th><h5>�ֹ��Ͻôº�</h5></th>
                <td><input type="text" ></td>
            </tr>
            <tr>
                <th><h5>�޴���</h5></th>
                <td><input type="text" ></td>
            </tr>
            <tr>
                <th rowspan="2"><h5>�ּ�</h5></th>
                <td><input type="text" >&nbsp;<input type="button" value="�ּҰ˻�"></td>
            </tr>
                <td><input type="text" ></td>
            </table>
            <table border="1" class="table1">
                <h2>���������</h2> 
                <br/><input type="checkbox"> �� �ֹ��ڿ� �ּ� ����
                <tr>
                    <th><h5>��۹޴º�</h5></th>
                <td><input type="text" ></td>
                </tr>
                <tr>
                    <th><h5>�޴���</h5></th>
                    <td><input type="text" ></td>
                </tr>
                <tr>
                    <th rowspan="2"><h5>�ּ�</h5></th>
                    <td><input type="text" >&nbsp;<input type="button" value="�ּҰ˻�"></td>
                </tr>
                    <td><input type="text" ></td>
                </table>
                <table border="1" class="table1">
                    <h2>�������</h2>
                    <tr>
                        <th><h5>������ü</h5></th>
                        <td><input type="checkbox"></td>
                        <th><h5>�ſ�ī��</h5></th>
                        <td><input type="checkbox"></td>
                        <th><h5>�������Ա�</h5></th>
                        <td><input type="checkbox"></td>
                        <th><h5>�ڵ�������</h5></th>
                        <td><input type="checkbox"></td>
                    </tr>
                    </table>


            <div class="section3">    
            <table border="1" class="table3">
                <h2>�ֹ��ݾ� Ȯ�� �� ����</h2>
                <tr>
                <th>�ѻ�ǰ�ݾ�</th>
                <th>�� ��ۺ�</th>
                <th>�� ���αݾ�</th>
                <th>���������ݾ�</th>
            </tr>
            <tr>
                <td> [] ��</td>
                <td> + [] ��</td>
                <td> - [] ��</td>
                <td> = [] ��</td>
            </tr>       
            </table><br/> 
            </div>
        <div class="section4">
            <a><input  type="submit" value="��ü��ǰ����"></a>
           <a><input  type="submit" value="���û�ǰ����"></a>
            <a><input  type="submit" value="���ΰ���ϱ�"></a><br/>
    <br/>
    </div>
    <div class="section5">
            <table border="1" class="table4">
                <tr>
                    <th>�̿�ȳ�</th>
    
                </tr>
                <tr>
                    <td>
                        <ul>
                            <li><h2>���ݰ�꼭 ���� �ȳ�</h2></li>
                        <li>�� �ΰ���ġ���� �� 54���� �ǰ��Ͽ� ���ݰ�꼭�� ��ۿϷ��Ϸκ��� ������ 10�ϱ����� ��û�Ͻ� �� �ֽ��ϴ�.
                            ���ݰ�꼭�� ����ڸ� ��û�Ͻ� �� �ֽ��ϴ�.</li><br/>
                        <li>�� ���ݰ�꼭�� ����ڸ� ��û�Ͻ� �� �ֽ��ϴ�.</li><br/>
                        <li>�� ����� �Ϸ�� �ֹ��� ���Ͽ� ���ݰ�꼭 �����û�� �����մϴ�.</li><br/>
                        <li>�� [���ݰ�꼭 ��û]��ư�� ���� ���ݰ�꼭 ��û����� �ۼ��� �� �ѽ��� ����ڵ�����纻�� �����ž� ���ݰ�꼭 �߻��� �����մϴ�.</li><br/>
                        <li>�� [���ݰ�꼭 �μ�]��ư�� ������ ����� ���ݰ�꼭�� �μ��Ͻ� �� �ֽ��ϴ�.</li><br/>
                        <li><h2>�������Һ� �̿�ȳ�</h2></li>
                        <li>�� ��ǰ�� �������Һ� ������ �����÷��� �������Һ� ��ǰ�� �����Ͽ� [�ֹ��ϱ�] ��ư�� ���� �ֹ�/���� �Ͻø� �˴ϴ�.</li><br/>
                        <li>�� [��ü ��ǰ �ֹ�] ��ư�� �����ø� ��ٱ����� ���о��� ���õ� ��� ��ǰ�� ���� �ֹ�/������ �̷�����ϴ�.</li><br/>
                        <li>�� ��, ��ü ��ǰ�� �ֹ�/�����Ͻ� ���, ��ǰ�� �������Һ� ������ ������ �� �����ϴ�.</li><br/>
                    </td>
                </ul>
    
                </tr>
            </table>
        </div>
    </div>
    </div>
    <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</body>
</html>