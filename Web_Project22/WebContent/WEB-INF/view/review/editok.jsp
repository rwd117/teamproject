<%@page import="java.sql.Timestamp"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src="js/test.js"></script>
</head>
<body>
<jsp:useBean id="board" class="jula.qtableBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
String pageNum=request.getParameter("pageNum");
qtableDBBean db=qtableDBBean.getInstance();
int re=db.editBoard(board);
if(re==1) response.sendRedirect("qna.jsp?pageNum="+pageNum);
else if(re==0){%>
	<script > alarm ("���Ʋ��");</script>
	
	<!--���Ʋ��  
	<script type="text/javascript">
	alert("��й�ȣ�� ���� �ʽ��ϴ�.")
	history.go(-1);
	
	</script>-->
	

<% }else if(re==-1){ %>
<script > alarm ("��������");</script>
		<!--��������  
		<script type="text/javascript">
	alert("������ �����߽��ϴ�.")
	history.go(-1);
	
	</script>-->
<% }%>

</body>
</html>