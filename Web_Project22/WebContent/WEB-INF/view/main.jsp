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
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
 
    <link href="css/main.css" rel="stylesheet">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/slidescript.js"></script>
    <script src="js/1.js"></script>
    <script src="js/2.js"></script>
    <script src="js/4.js"></script>
    <script src="js/8.js"></script>
    <script >
        function showPopup() { 
        	window.open("${conPath}popup/popup1", "veiwimg", "width=1050, height=600, left=300, top=500, toolbar=no,scrollbars=no,status=no,location=no"); 
        	}
	</script>    
    
    </head>
    
    <body>
    	
        <!-- <슬라이드, 로그인,메뉴바 헤더부분> -->
        <div id="contents1">   
            <!-- 상단배너 -->
            <div class="slideShow">
                <!-- 슬라이드 -->
                <div class="slideArea">
                    <a href="#" class="slide"><img src="img/bn4.jpg" alt=""></a>
                    <a href="#" class="slide"><img src="img/bn5.jpg" alt=""></a>
                    <a href="#" class="slide"><img src="img/bn7.jpg" alt=""></a>
                    <a href="#" class="slide"><img src="img/bn8.jpg" alt=""></a>
                </div>
                <!-- 좌우버튼 -->
                <div class="slideNav">
                    <a href="#" class="prev">이전</a>
                    <a href="#" class="next">다음</a>
                </div>
                <div class="slideIndicator">
                    <!-- a 포함예정 -->
                </div>
            </div>
            
            <header>
                
                <c:import url="/WEB-INF/view/include/main_top_menu.jsp"></c:import>
                
            </header>
            
        </div>
        <!-- 중간에 컨텐츠부분 -->
        <div id="contents2">
            <div id="top">
                <div class="left">
                    <ul>
                        <li> <img src="img/111.jpg" class="img1" onclick="showPopup();"></li>
                        <li><img src="img/222.jpg" class="img2" onclick="showPopup();"></li>
                        <li><img src="img/333.jpg" class="img3" onclick="showPopup();"></li>
                    </ul>
    
                    <p class="nex"><img src="img/btn_next.png" alt="이전으로"></p>
                    <p class="pre"><img src="img/btn_prev.png" alt="다음으로"></p>
                </div>
                <div class="right">
                    <a href="#"><img src="img/444.jpg" class="img4" onclick="showPopup();"></a>
    
                    <a href="#"><img src="img/555.jpg" class="img5" onclick="showPopup();"></a>
    
                </div>
            </div>
    
            <!-- 중앙박스  -->
            <div id="section">
                <div id="best">           
                    <ul>
                       <li><a href="#">BEST</a></li> 
                    </ul>                            
            </div>
                <div class="left">
                    <div class="box">
                        <a href="#"><img src="webp/1.webp" id="image"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><button class="popup1" onclick="showPopup()" ><img id="span_gif" src="img/v.gif"></button></a>
                            </span>
                        <a href="#"><h3>러브레터링니트</h3></a>
                        <a href="#"><p>￦39000</p></a>
                    </div>
                    <div class="box">
                        <a href="#"><img src="webp/2.webp" id="image"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><img id="span_gif" src="img/v.gif"></a>
                            </span>
                        <a href="#"><h3>러브레터링니트</h3></a>
                        <a href="#"><p>￦39000</p></a>
                    </div>
                    <div class="box">
                        <a href="#"><img src="webp/3.webp" id="image"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><img id="span_gif" src="img/v.gif"></a>
                            </span>
                        <a href="#"><h3>러브레터링니트</h3></a>
                        <a href="#"><p>￦39000</p></a>
                    </div>
                    <div class="box">
                        <a href="#"><img src="webp/4.webp" id="image"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><img id="span_gif" src="img/v.gif"></a>
                            </span>
                        <a href="#"><h3>러브레터링니트</h3></a>
                        <a href="#"><p>￦39000</p></a>
                    </div>
                    <div class="box">
                        <a href="#"><img src="webp/5.webp" id="image"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><img id="span_gif" src="img/v.gif"></a>
                            </span>
                        <a href="#"><h3>러브레터링니트</h3></a>
                        <a href="#"><p>￦39000</p></a>
                    </div>
                    <div class="box">
                        <a href="#"><img src="webp/6.webp" id="image"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><img id="span_gif" src="img/v.gif"></a>
                            </span>
                        <a href="#"><h3>러브레터링니트</h3></a>
                        <a href="#"><p>￦39000</p></a>
                    </div>
                </div>
                <div class="right">
                    <a href="#"><img src="webp/7.webp" id="img12"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><img id="span_gif" src="img/v.gif"></a>
                            </span>
                        <a href="#"><h3>러브레터링니트</h3></a>
                        <a href="#"><p>￦39000</p></a>
                </div>
            </div>
    
            <!-- 가로로긴박스 -->
            <div>
                <article class="side3">
                    <a href="#">
                        <h3>NEW</h3>
                    </a>
                </article>
            </div>
            <!-- /* 박스 4개 부분  -->
    
            <div class="section1">
                <div class="container">
                    <div class="quick">
                        <a href="#"><img src="webp/8.webp" id="image"></a> 
                        <p id="buttonp">
                           <span class="span1">						
                               <a href="#"><img id="span_icon" src="img/z.png"></a>
                               <a href="#"><img id="span_icon" src="img/x.png"></a>
                               <a href="#"><img id="span_icon" src="img/c.png"></a>
                               <a href="#"><img id="span_gif" src="img/v.gif"></a>
                           </span>
                           </p>
                            <a href="#">
                               <h3>러브레터링니트</h3>
                               <p>￦39000</p>
                           </a>
                   </div>
                   <div class="quick">
                    <a href="#"><img src="webp/9.webp" id="image"></a> 
                    <p id="buttonp">
                       <span class="span1">						
                           <a href="#"><img id="span_icon" src="img/z.png"></a>
                           <a href="#"><img id="span_icon" src="img/x.png"></a>
                           <a href="#"><img id="span_icon" src="img/c.png"></a>
                           <a href="#"><img id="span_gif" src="img/v.gif"></a>
                       </span>
                       </p>
                        <a href="#">
                           <h3>러브레터링니트</h3>
                           <p>￦39000</p>
                       </a>
               </div>
               <div class="quick">
                <a href="#"><img src="webp/10.webp" id="image"></a> 
                <p id="buttonp">
                   <span class="span1">						
                       <a href="#"><img id="span_icon" src="img/z.png"></a>
                       <a href="#"><img id="span_icon" src="img/x.png"></a>
                       <a href="#"><img id="span_icon" src="img/c.png"></a>
                       <a href="#"><img id="span_gif" src="img/v.gif"></a>
                   </span>
                   </p>
                    <a href="#">
                       <h3>러브레터링니트</h3>
                       <p>￦39000</p>
                   </a>
           </div>
           <div class="quick">
            <a href="#"><img src="webp/11.webp" id="image"></a> 
            <p id="buttonp">
               <span class="span1">						
                   <a href="#"><img id="span_icon" src="img/z.png"></a>
                   <a href="#"><img id="span_icon" src="img/x.png"></a>
                   <a href="#"><img id="span_icon" src="img/c.png"></a>
                   <a href="#"><img id="span_gif" src="img/v.gif"></a>
               </span>
               </p>
                <a href="#">
                   <h3>러브레터링니트</h3>
                   <p>￦39000</p>
               </a>
       </div>
                </div>
                <div class="container">
                    <div class="quick">
                        <a href="#"><img src="webp/1.webp" id="image"></a> 
                        <p id="buttonp">
                           <span class="span1">						
                               <a href="#"><img id="span_icon" src="img/z.png"></a>
                               <a href="#"><img id="span_icon" src="img/x.png"></a>
                               <a href="#"><img id="span_icon" src="img/c.png"></a>
                               <a href="#"><img id="span_gif" src="img/v.gif"></a>
                           </span>
                           </p>
                            <a href="#">
                               <h3>러브레터링니트</h3>
                               <p>￦39000</p>
                           </a>
                   </div>
                   <div class="quick">
                    <a href="#"><img src="webp/2.webp" id="image"></a> 
                    <p id="buttonp">
                       <span class="span1">						
                           <a href="#"><img id="span_icon" src="img/z.png"></a>
                           <a href="#"><img id="span_icon" src="img/x.png"></a>
                           <a href="#"><img id="span_icon" src="img/c.png"></a>
                           <a href="#"><img id="span_gif" src="img/v.gif"></a>
                       </span>
                       </p>
                        <a href="#">
                           <h3>러브레터링니트</h3>
                           <p>￦39000</p>
                       </a>
               </div>
               <div class="quick">
                <a href="#"><img src="webp/3.webp" id="image"></a> 
                <p id="buttonp">
                   <span class="span1">						
                       <a href="#"><img id="span_icon" src="img/z.png"></a>
                       <a href="#"><img id="span_icon" src="img/x.png"></a>
                       <a href="#"><img id="span_icon" src="img/c.png"></a>
                       <a href="#"><img id="span_gif" src="img/v.gif"></a>
                   </span>
                   </p>
                    <a href="#">
                       <h3>러브레터링니트</h3>
                       <p>￦39000</p>
                   </a>
           </div>
           <div class="quick">
            <a href="#"><img src="webp/4.webp" id="image"></a> 
            <p id="buttonp">
               <span class="span1">						
                   <a href="#"><img id="span_icon" src="img/z.png"></a>
                   <a href="#"><img id="span_icon" src="img/x.png"></a>
                   <a href="#"><img id="span_icon" src="img/c.png"></a>
                   <a href="#"><img id="span_gif" src="img/v.gif"></a>
               </span>
               </p>
                <a href="#">
                   <h3>러브레터링니트</h3>
                   <p>￦39000</p>
               </a>
       </div>
                </div>
                <div class="container">
                    <div class="quick">
                        <a href="#"><img src="webp/5.webp" id="image"></a> 
                        <p id="buttonp">
                           <span class="span1">						
                               <a href="#"><img id="span_icon" src="img/z.png"></a>
                               <a href="#"><img id="span_icon" src="img/x.png"></a>
                               <a href="#"><img id="span_icon" src="img/c.png"></a>
                               <a href="#"><img id="span_gif" src="img/v.gif"></a>
                           </span>
                           </p>
                            <a href="#">
                               <h3>러브레터링니트</h3>
                               <p>￦39000</p>
                           </a>
                   </div>
                   <div class="quick">
                    <a href="#"><img src="webp/6.webp" id="image"></a> 
                    <p id="buttonp">
                       <span class="span1">						
                           <a href="#"><img id="span_icon" src="img/z.png"></a>
                           <a href="#"><img id="span_icon" src="img/x.png"></a>
                           <a href="#"><img id="span_icon" src="img/c.png"></a>
                           <a href="#"><img id="span_gif" src="img/v.gif"></a>
                       </span>
                       </p>
                        <a href="#">
                           <h3>러브레터링니트</h3>
                           <p>￦39000</p>
                       </a>
               </div>
               <div class="quick">
                <a href="#"><img src="webp/7.webp" id="image"></a> 
                <p id="buttonp">
                   <span class="span1">						
                       <a href="#"><img id="span_icon" src="img/z.png"></a>
                       <a href="#"><img id="span_icon" src="img/x.png"></a>
                       <a href="#"><img id="span_icon" src="img/c.png"></a>
                       <a href="#"><img id="span_gif" src="img/v.gif"></a>
                   </span>
                   </p>
                    <a href="#">
                       <h3>러브레터링니트</h3>
                       <p>￦39000</p>
                   </a>
           </div>
           <div class="quick">
            <a href="#"><img src="webp/8.webp" id="image"></a> 
            <p id="buttonp">
               <span class="span1">						
                   <a href="#"><img id="span_icon" src="img/z.png"></a>
                   <a href="#"><img id="span_icon" src="img/x.png"></a>
                   <a href="#"><img id="span_icon" src="img/c.png"></a>
                   <a href="#"><img id="span_gif" src="img/v.gif"></a>
               </span>
               </p>
                <a href="#">
                   <h3>러브레터링니트</h3>
                   <p>￦39000</p>
               </a>
       </div>
                </div>
            </div>       
        </div>
       
      <c:import url="/WEB-INF/view/include/bottom_menu2.jsp"/>
    
    </body>
    
    </html>
    </body>
    
    