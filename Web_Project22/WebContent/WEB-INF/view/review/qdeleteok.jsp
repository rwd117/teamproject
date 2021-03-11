<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<body>
<script src="js/test.js"></script>
</head>
<body>
<jsp:useBean id="board" class="jula.qtableBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
String pageNum=request.getParameter("pageNum");
String q_id=request.getParameter("q_id");
String q_pwd=request.getParameter("q_pwd");
qtableDBBean db=qtableDBBean.getInstance();
int id=0;
try{
id=Integer.parseInt(request.getParameter("q_id"));
}catch (Exception e){	
}
int re=db.deleteBoard(id, q_pwd);
if(re==1) response.sendRedirect("qna.jsp?pageNum="+pageNum);
else if(re==0){%>
<!--비번틀림  -->
	<script > alarm ("비번틀림");</script>
<% }else if(re==-1){%>

  <script > alarm ("삭제실패");</script>
	<!--삭제실패  -->
	


<% }%>


</body>
</html>