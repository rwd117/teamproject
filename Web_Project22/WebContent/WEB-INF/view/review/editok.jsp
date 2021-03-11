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
	<script > alarm ("비번틀림");</script>
	
	<!--비번틀림  
	<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다.")
	history.go(-1);
	
	</script>-->
	

<% }else if(re==-1){ %>
<script > alarm ("수정실패");</script>
		<!--수정실패  
		<script type="text/javascript">
	alert("수정에 실패했습니다.")
	history.go(-1);
	
	</script>-->
<% }%>

</body>
</html>