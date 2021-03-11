<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='conPath' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/notice.css">
    <!-- <link href="css/5.css" rel="stylesheet"> -->
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="../js/7.js"></script>
</head>
<body>
<body>
	<c:import url="/WEB-INF/view/include/top_menu.jsp"/>

<div id="contents2">
        <div id="contents3">
            <div class="section">
            <div class="cart">
                <ul><a href="#"><li>NOTICE</li></a></ul>
 
            </div>
            <table border="1" class="table1">
       
            <tr>
                <th style="width: 80px;"><h4>번호</h4></th>
                <th style="width: 500px;"><h4>제목</h4></th>
                <th style="width: 100px;"><h4>작성자</h4></th>
                <th style="width: 100px;"><h4>작성일</h4></th>
                <th style="width: 80px;"><h4>조회</h4></th>
            </tr>
            <c:forEach var="obj" items="${list }">
            <tr>
       
            <td>${obj.q_idx }</td>
            <td><a href="${conPath}qtable/view?q_idx=${obj.q_idx}">${obj.q_title }</a></td>
            <td>${obj.q_name }</td>
            <td>${obj.q_date }</td>
            <td>${obj.q_hit } </td>
            </tr>
            </c:forEach> 
            </table>
           
        </div>
        <div class="content2">
        <c:choose>
		<c:when test="${loginUserBean.mlevel < 0}">
            <a href="${conPath }qtable/notice"><img src="../img/btn_list.gif" alt="목록"></a>
        </c:when>
            
           <c:when test="${loginUserBean.mlevel > 0}">
        
			<a href="${conPath }qtable/write"><img src="../img/btn_write.gif" alt="글쓰기"></a>
			   </c:when>
			</c:choose>
        </div>
        <div class="content3">
            <ul>
                <li><a href="#"><img src="../img/btn_page_prev.gif" alt="이전"></a></li>
                <li class="page"><a href="#" >1</a></li>
                <li class="page"><a href="#" >2</a></li>
                <li class="page"><a href="#" >3</a></li>
                <li class="page"><a href="#" >4</a></li>
                <li class="page"><a href="#" >5</a></li>
                <li><a href="#"><img src="../img/btn_page_next.gif" alt="다음"></a></li>
            </ul>
        </div>
        <div class="content4">
            <ul>
                검색어 <select>
                <a><option value="1">일주일</option>
                <option value="2">한달</option>
                <option value="3">세달</option>
                <option value="4">전체</option></select></a>
                <a><select>
                    <option value="1">제목</option>
                    <option value="2">내용</option>
                    <option value="3">글쓴이</option>
                    <option value="2">아이디</option>
                    <option value="3">별명</option>
                    <option value="4">상품정보</option></select></a>
                <a><input placeholder value type="search"> </a>	
                <a><a href="" onclick=""><img src="../img/btn_find.gif"></a></a>
                </ul>
             
        </div> 
    </div>
     
    </div>
   <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</html>
</body>
</html>
