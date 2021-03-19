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

    
        <!-- 중간에 컨텐츠부분 -->
        <div id="contents2">
            <div id="contents3">
                <input type="button" value="Q & A">
        </div>
       
            <div id="contents4">
           
           <form action="${conPath}board/read" method="get" >
            <table border="1" class="table">
             
             
         <c:if test="${board.content_file !=null}">
                <th>IMAGE</th>
                <td colspan="3"><img src="${conPath}upload/${board.content_file }" width="15%"/>		</td>	
            </c:if>               
                </table>
            
        <table border="1" class="table">
        
            <tr>
                <th>글번호</th>
                <td colspan="3"><input type="text" id="content_idx" value="${board.content_idx }" readonly></td>  
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="3">${board.content_subject }</td>  
            </tr>
            <tr>
                <th>작성자</th>
                <td colspan="3" >${board.content_write_name}</td>
                
            </tr>
         
             <tr>
                <th>등록일</th>
                <td>${content_date }</td>  
            </tr>
            <tr>
                <th>조회수</th>
                <td>${content_hit}</td> 
            </tr>
            <tr class="tr20">
                
                <td colspan="4">${content_text }</td>
          
 
		
            
        </table>
        
        
        </form>
        <div class="section3">
       
        
		<c:if test="${readContentBean.content_writer_idx  >= 0}">
		
		<input type="hidden" name="page" value="${map.content_idx }" />
	<input type="hidden" name="content_bno" value="${content_bno }" />
	<input type="hidden" name="page" value="${page }" />
		
          <a href="${conPath }board/main?board_info_idx=${board_info_idx}"><img src="../img/btn_list.gif" alt="목록"></a>
            </c:if>
           
             <c:choose>
			<c:when test="${loginUserBean.mlevel > 0}">
			<a href="${conPath }board/delete?board_info_idx=${board_info_idx}&content_idx=${content_idx}"><img src="../img/btn_delete.gif" alt="삭제"></a>
			<a href="moveReply();"><img src="../img/btn_reply.gif" alt="답변"></a>
			
			</c:when>
			
			
			<c:when test="${readContentBean.content_writer_idx == loginUserBean.midx}">
            
            <a href="${conPath }board/modify?board_info_idx=${board_info_idx}&content_idx=${content_idx}&page=${page}"><img src="../img/btn_modify.gif" alt="수정"></a>
			<a href="${conPath }board/delete?board_info_idx=${board_info_idx}&content_idx=${content_idx}&board_info_idx=${board_info_idx}&content_idx=${content_idx}&page=${page}"><img src="../img/btn_delete.gif" alt="삭제"></a>
			
           </c:when>
           	</c:choose>
		
		<script>

function moveReply(){

location="${conPath }board/reply?content_bno=${board.content_bno}&content_step=${board.content_step}&content_level=${board.content_level}";

// board.jsp에서 버튼 누르면 Controller의 String reply 호출

}

</script>



		
		
			
		
            
            </div>     
       </div>
       </div>
  <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>

</body>
</html>



</html>