<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>

</head>
<body>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<link href="../css/writeetc.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="../js/7.js"></script>
<script src="../ckeditor/ckeditor.js"></script>
<script>
window.onload = function(){
   ck = CKEDITOR.replace("editor");
};
</script>
</head>


<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
        
        <!-- 중간에 컨텐츠부분 -->
        <div id="contents2">
            <div id="contents3">
                <input type="button" value="Q & A">
        </div>
            <div id="contents4">
           
<form:form action='${conPath }qtable/write_pro' method='post' enctype="multipart/form-data" modelAttribute="writeQtableBean">
        
        <table border="1" class="table">
            <tr>
                <th>제목</th>
                <td colspan="1">
			<input type="text" name="q_title"></td>				
			
			</td>		
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="text" name="q_name"></td>
                
            </tr>
           
            <tr class="tr20">
                
                <td colspan="2" ><textarea name="q_content" id="editor" ></textarea>
                </td>
                
            <tr>
                <th><form:label path="q_file">첨부 이미지</form:label></th>
                <td colspan="1"><form:input type='file' path='upload_file' class="form-control" accept="image/*"/></td>	
            </tr>
            <tr>
                <th>비밀번호</th>
                <td colspan="1"><input type="password" name="q_pwd"></td>	
            </tr>
        </table>
        <div class="section3">
                <input type="submit" value="등록" >
                 <input type="button" value="삭제" onclick="location.href='${conPath}qtable/notice'"/>
            <input type="button" value="목록" onclick="location.href='${conPath}qtable/notice'"/>
            </div>
            </form:form>     
       </div>
       </div>
   <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>    
  
</body>
</html>