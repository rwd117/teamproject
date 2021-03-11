<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<body>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<link href="../css/view.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
</head>


<c:import url="/WEB-INF/view/include/top_menu.jsp"/>

        </div>
        <!-- 중간에 컨텐츠부분 -->
        <div id="contents2">
            <div id="contents3">
                <input type="button" value="Q & A">
        </div>
            <div id="contents4">
            <table border="1" class="table">
         <c:if test="${readQtableBean.q_file !=null}">
                <th>IMAGE</th>
                <td colspan="3"><img src="${conPath }upload/${readQtableBean.q_file  }" width="100%"/>	</td>	
            </c:if>
    
                
                </table>
            
        <table border="1" class="table">
        
            <tr>
                <th>글번호</th>
                <td colspan="3">${readQtableBean.q_idx }</td>  
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="3">${readQtableBean.q_title }</a></td>  
            </tr>
            <tr>
                <th>작성자</th>
                <td colspan="3" >${readQtableBean.q_name }</td>
                
            </tr>
         
             <tr>
                <th>등록일</th>
                <td>${readQtableBean.q_date }</td>  
            </tr>
            <tr>
                <th>조회수</th>
                <td>${readQtableBean.q_hit }</td> 
            </tr>
            <tr class="tr20">
                
                <td colspan="4">${readQtableBean.q_content}</td>
            <tr>
            <c:if test="${readQtableBean.q_file !=null}">
                <th>첨부파일</th>
                <td colspan="3"><img src="${conPath }upload/${readQtableBean.q_file  }" width="100%"/>	</td>	
            </c:if>
            </tr>
 
		
            
        </table>
        <div class="section3">
        <c:choose>
		<c:when test="${loginUserBean.mlevel < 0}">
          <a href="${conPath }qtable/notice"><img src="../img/btn_list.gif" alt="목록"></a>
            </c:when>
            
           <c:when test="${loginUserBean.mlevel > 0}">
            <a href="${conPath }qtable/edit?q_idx=${readQtableBean.q_idx}"><img src="../img/btn_modify.gif" alt="수정"></a>
			<a href="${conPath }qtable//delete?q_idx=${readQtableBean.q_idx}"><img src="../img/btn_delete.gif" alt="삭제"></a>
			</c:when>
			</c:choose>
			<a href="${conPath }qtable/notice"><img src="../img/btn_list.gif" alt="목록"></a>
            </div>     
       </div>
  <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>

</body>
</html>



</html>