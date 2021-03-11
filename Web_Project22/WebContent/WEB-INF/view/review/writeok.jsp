<%@page import="java.sql.Timestamp"%>

<%@page import="jula.qtableDBBean"%>
<%@page import="jula.qtableBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="board" class="jula.qtableBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<!--<jsp:getProperty property="q_date" name="board"/>-->

<%

board.setQ_ip(request.getRemoteAddr());
board.setq_date(new Timestamp(System.currentTimeMillis()));

qtableDBBean db=qtableDBBean.getInstance();
int re=db.insertBoard(board);
if(re==1) response.sendRedirect("${conPath }qna");
else response.sendRedirect("${conPath }write");
%>
</body>
</html>