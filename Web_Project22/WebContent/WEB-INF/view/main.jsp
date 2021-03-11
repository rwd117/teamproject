<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
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
    <script src="js/2.js"></script>
    <script src="js/3.js"></script>
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
       
    
    
        <!-- 푸터 -->
        <div id="footer">
            <div class="left">
                <ul>
                    <li><a href="#">법적고지</a></li>
                    <li><a href="#">이메일무단수집거부</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보취급방침</a></li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">입찰공고</a></li>
                </ul>
            </div>
            <div class="right">
                <select>
                    <option>바로가기</option>
                    <option>aaaa</option>
                    <option>bbbb</option>
                    <option>cccc</option>
                    <option>dddd</option>
                    <option>eeee</option>
                </select>
            </div>
        </div>
    
    
        <!-- /* 왼쪽사이드바 */ -->
        <aside id="aside">
		<nav id="aside nav">
			<ul>
			<c:forEach items="${topmenulist}" var="obj">
				<c:choose>
					<c:when test="${obj.top_idx < 4 }">
						<li class="sideMenu1"><a
							href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a></li>
					</c:when>
					<c:when test="${(3<obj.top_idx) && (obj.top_idx <8) }">
						<li class="sideMenu1"><a
							href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a>
							<c:forEach var="obj2" items="${ submenulist}">
								<c:if test="${obj.top_idx eq obj2.sub_top_idx }">
									<ul class="subMenu1">
										<li><a
											href="${conPath}product/productList?top_idx=${obj.top_idx}&sub_idx=${obj2.sub_idx}">${obj2.sub_name }</a></li>
									</ul>
								</c:if>
							</c:forEach></li>
					</c:when>
					<c:otherwise>
						<li class="sideMenu1"><a
							href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
				</ul>
		</nav>
	</aside>
        <!-- /* 오른쪽사이드바 */ -->
        <right-sidebar>
            <div class="right">
                <ul class="subMenu2">
                    <li><a href="${conPath }cart/cart"><img src="img/ico_cart_b.png"> CART</a></li>
                <li><a href="${conPath }orders/order"><img src="img/ico_order_b.png"> ORDER</a></li>
                <li><a href="${conPath }wishlist/wish"><img src="img/my_icon2.png"> WISHLIST</a></li>	
                <li><a href="${conPath }qtable/notice"><img src="img/rsi_22.png"> EVENT</a></li>
                <li><a href="${conPath }board/main"><img src="img/lsi_theday_off.png"> Q&A</a></li>
                <li><a href="${conPath }review/qna"><img src="img/lsi_best50_off.png"> REVIEW</a></li>
                </ul>
                <button class="up1"><img src="img/up1.png"></button>
                <a href="#"><button class="up" ><img src="img/up.png" ></button></a>
            </div>
        </right-sidebar>
    </body>
    
    </html>
    </body>
    
    