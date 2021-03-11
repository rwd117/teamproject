<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
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
</head>
<body>
<script>

function check(){
	  var fileInput = document.getElementById("imgfile");
      var files = fileInput.files;
      var file;
		
      var TITLE=$('#r_TITLE').val();
      var content= $('#r_CONTENT').val();
      
      
      if(files.length > 2){
      	alert("파일 개수는 최대 2개 입니다.");
      	return false;
      }
      
      if(TITLE == null || TITLE.trim() == ""|| content == null  || content.trim() == ""){
    	 if(TITLE == null || TITLE.trim() == ""){
    		 alert("제목이 공백입니다.");
    	     return false;		 
    	 }
    	 
    	 if(content == null  || content.trim() == ""){
    		 alert("본문이 공백입니다.");
    	     return false;		 
    	 }
      }
	
}

</script>

<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
        
        <!-- 중간에 컨텐츠부분 -->
        <div id="contents2">
            <div id="contents3">
                <input type="button" value="ReView">
        </div>
            <div id="contents4">
            <form action="${conPath }review/reviewriteok" method="post" enctype="multipart/form-data" onsubmit="return check();">
        <table border="1" class="table">
            <tr>
                <th>제목</th>
                <td colspan="1">
			<input type="text" name="r_TITLE" id="r_TITLE"></td>
			
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="text" value="${meminfo.r_mname }" readonly></td>
                
            </tr>
            <tr>
                <th>이메일</th>
                <td><input id="customerEmailLocal" type="text" value="${meminfo.r_memail }" readonly >
               
                </td>
            </tr>
            <tr class="tr20">
                
                <td colspan="2"><textarea name="r_CONTENT" id="r_CONTENT"></textarea></td>
            <tr>
                <th>첨부파일</th>
                <td colspan="1"><input type="file" id="imgfile" accept="image/*" name="file[]" multiple></td>	
            </tr>
            <tr>
                <th>비밀글설정</th>
                <td colspan="1"><input type="checkbox" value="1" name="r_secret">비밀글 </td>	
            </tr>
            <tr class="tr21">
                <th class="tha">개인정보 수집 및 이용동의</th>
                <td colspan="1"><textarea >■ 개인정보의 수집·이용 목적
서비스 제공 및 계약의 이행, 구매 및 대금결제, 물품배송 또는 청구지 발송, 회원관리 등을 위한 목적
■ 수집하려는 개인정보의 항목
이름, 주소, 연락처, 이메일 등
■ 개인정보의 보유 및 이용 기간
회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외없이 해당정보를 파기합니다. 
                </textarea><br/>
                <br/>
                    개인정보 수집 및 이용에 동의하십니까?<input type="checkbox">동의함<input type="checkbox">동의안함 
                </td>	
            </tr>
        </table>
        <div class="section3">
        	<input type="hidden" name="r_oID" value="${ o_ID}">
        	<input type="hidden" name="r_mIDx" value="${o_mIDx }">
        	<input type="hidden" name="r_pID" value="${pID }">
             <input type="submit" value="등록" >
             <input type="reset" value="취소" onclick="${conPath }review/qna">
             <input type="button" value="목록" onclick="${conPath }review/qna">
            </div>
            </form>     
       </div>
       </div>
   <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>    
  
</body>
</html>