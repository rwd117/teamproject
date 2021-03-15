<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='conPath' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title color="darkgray">상세보기</title>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세보기</title>
    <link href="../css/popup.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/6.js"></script>
<script language="javascript">
    function moveClose() {
      opener.location.href="${conPath}product/productContent?pID=${pID}";
      self.close();
    }
    </script>
</head>
<body>
    <div id="contents2">
        <div id="contents3">
        <div id="top">
            <div class="left">
                <ul>
                    <li><img src="${conPath }upload/${pIMAGE1 }" class="img1"></li>
                    <li><img src="../img/222.jpg" class="img2"></li>
                    <li><img src="../img/333.jpg" class="img3"></li>
                </ul>

                <p class="nex"><img src="../img/btn_next.png" alt="이전으로"></p>
                <p class="pre"><img src="../img/btn_prev.png" alt="다음으로"></p>
            </div>
        </div>
            <div class="right">
                <ul>
                    <li><a href="#">${pNAME }</a></li>
                    <li><a href="#">${pNAME }</a></li>
                    <li><a href="#">${pPRICE }</a></li>
                    <li><a href="#">적립금</a></li>
                    <li><a href="#">쿠폰적용가</a></li>
                    <li><a href="#">색상</a></li>
                    <li><a href="#">사이즈</a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <input type="button" value="BUY IT NOW">
                    <input type="button" value="CART">
                    <input type="button" value="WISH">
                    <input type="button" value="상세보기" onclick="moveClose();'" >
                </ul>
                </div>
            </div>
        </div>
        
</body>
</html>