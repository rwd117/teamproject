<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='conPath' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html lang="en">

<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/order.css">
    <!-- <link href="css/5.css" rel="stylesheet"> -->
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="../js/7.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
    </div>
    <!-- 중간에 컨텐츠부분 -->
	<div id="contents2">
        <div id="contents3">
            <div class="section">
            <div class="cart">
                <ul><a href="#"><li>ORDER</li></a></ul>
                
            </div>
            <table border="1" class="table1">
            <tr>
                <th rowspan="2"><h4>혜택정보</h4></th>
                <td><p>김나리 님은, [일반회원] 회원이십니다.</p></td>
            </tr>
            <tr>
                <td> 
                    <ul>
                    <li><a href="">가용적립금 : 2,000원</a></li>
                    <li><a href="">예치금 : </a></li>
                    <li><a href="">쿠폰 : 1개</li>
                </ul>
            </td>
            </tr>
            </table>
        </div>
             <!-- 탭 -->
             <ul class="section1">
             <div class="tabArea">
                <ul class="tabList">
                    <li ><a href="#" class="tabBtn">국내배송상품 (1)</a>
                    <!--  -->
                    <div class="tabCon notice">
                        <table class="table table-striped">
                            <thead>
                                <tr class="tr2">
                                    <th scope="cols"><input class="th1" type="checkbox" onclick=""></th>
                                    <th scope="cols">이미지</th>
                                    <th scope="cols">상품정보</th>
                                    <th scope="cols">판매가</th>
                                    <th scope="cols">수량</th>
                                    <th scope="cols">적립금</th>
                                    <th scope="cols">배송구분</th>
                                    <th scope="cols">배송비</th>
                                    <th scope="cols">합계</th>
                                    <th scope="cols">선택</th>
                                </tr>
                            </thead>
                            <tbody>    
                                <tr class="tr12">
                                    <td scope="row"><a href=""><input type="checkbox" onclick=""></a></td>
                                    <td><img src="" alt=""></td>
                                    <td><a href=""><img src="" alt="">상품옵션
                                        <select size="" id="">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select></a><br/>
                                        <input type="submit" value="추가">
                                        <input type="submit" value="변경">
                                        <input type="reset" value="삭제">
                                    </td>
                                    <td scope="row">원</td>
                                    <td><input type="number" value="" min="0" max="100" step="1"></td>
                                    <td>원</td>
                                    <td>기본배송<br/>(해외배송가능)</td>
                                    <td>원<br/>조건배송</td>
                                    <td>원</td>
                                    <td><a href="" onclick=""><input type="button" value="주문하기"><br/><input type="button" value="삭제하기"></a></td>
                                </tr>
                                <tr class="tr13">
                                    <th colspan="10" scope="row">
                                        <p>[기본배송]</p>                    
                                        <a>상품구매금액 + 배송비 = 합계 : 원</a>
                                    </th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </li>
            
                
                <li>
                    <a href="#" class="tabBtn">해외배송상품 (0)</a>
                    <div class="tabCon notice">
                        <table class="table table-striped">
                            <thead>
                                <tr class="tr2">
                                    <th scope="cols"><input class="th1" type="checkbox" onclick=""></th>
                                    <th scope="cols">이미지</th>
                                    <th scope="cols">상품정보</th>
                                    <th scope="cols">판매가</th>
                                    <th scope="cols">수량</th>
                                    <th scope="cols">적립금</th>
                                    <th scope="cols">배송구분</th>
                                    <th scope="cols">배송비</th>
                                    <th scope="cols">합계</th>
                                    <th scope="cols">선택</th>
                                </tr>
                            </thead>
                            <tbody>    
                                <tr class="tr12">
                                    <td scope="row"><a href=""><input type="checkbox" onclick=""></a></td>
                                    <td><img src="" alt=""></td>
                                    <td><a href=""><img src="" alt="">상품옵션
                                        <select size="" id="">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select></a><br/>
                                        <input type="submit" value="추가">
                                        <input type="submit" value="변경">
                                        <input type="reset" value="삭제">
                                    </td>
                                    <td scope="row">원</td>
                                    <td><input type="number" value="" min="0" max="100" step="1"></td>
                                    <td>원</td>
                                    <td>해외배송</td>
                                    <td>원<br/>해외배송</td>
                                    <td>원</td>
                                    <td><a href="" onclick=""><input type="button" value="주문하기"><br/><input type="button" value="삭제하기"></a></td>
                                </tr>
                                <tr class="tr13">
                                    <th colspan="10" scope="row">
                                        <p>[기본배송]</p>                    
                                        <a>상품구매금액 + 배송비 = 합계 : 원</a>
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </li>
                </ul>
             </div>
        </ul>
     
        <table border="1" class="table1">
            <h2>주문정보</h2>
            <tr>
                <th><h5>주문하시는분</h5></th>
                <td><input type="text" ></td>
            </tr>
            <tr>
                <th><h5>휴대폰</h5></th>
                <td><input type="text" ></td>
            </tr>
            <tr>
                <th rowspan="2"><h5>주소</h5></th>
                <td><input type="text" >&nbsp;<input type="button" value="주소검색"></td>
            </tr>
                <td><input type="text" ></td>
            </table>
            <table border="1" class="table1">
                <h2>배송지정보</h2> 
                <br/><input type="checkbox"> 위 주문자와 주소 동일
                <tr>
                    <th><h5>배송받는분</h5></th>
                <td><input type="text" ></td>
                </tr>
                <tr>
                    <th><h5>휴대폰</h5></th>
                    <td><input type="text" ></td>
                </tr>
                <tr>
                    <th rowspan="2"><h5>주소</h5></th>
                    <td><input type="text" >&nbsp;<input type="button" value="주소검색"></td>
                </tr>
                    <td><input type="text" ></td>
                </table>
                <table border="1" class="table1">
                    <h2>결제방법</h2>
                    <tr>
                        <th><h5>계좌이체</h5></th>
                        <td><input type="checkbox"></td>
                        <th><h5>신용카드</h5></th>
                        <td><input type="checkbox"></td>
                        <th><h5>무통장입금</h5></th>
                        <td><input type="checkbox"></td>
                        <th><h5>핸드폰결제</h5></th>
                        <td><input type="checkbox"></td>
                    </tr>
                    </table>


            <div class="section3">    
            <table border="1" class="table3">
                <h2>주문금액 확인 및 결제</h2>
                <tr>
                <th>총상품금액</th>
                <th>총 배송비</th>
                <th>총 할인금액</th>
                <th>결제예정금액</th>
            </tr>
            <tr>
                <td> [] 원</td>
                <td> + [] 원</td>
                <td> - [] 원</td>
                <td> = [] 원</td>
            </tr>       
            </table><br/> 
            </div>
        <div class="section4">
            <a><input  type="submit" value="전체상품결제"></a>
           <a><input  type="submit" value="선택상품결제"></a>
            <a><input  type="submit" value="쇼핑계속하기"></a><br/>
    <br/>
    </div>
    <div class="section5">
            <table border="1" class="table4">
                <tr>
                    <th>이용안내</th>
    
                </tr>
                <tr>
                    <td>
                        <ul>
                            <li><h2>세금계산서 발행 안내</h2></li>
                        <li>■ 부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.
                            세금계산서는 사업자만 신청하실 수 있습니다.</li><br/>
                        <li>■ 세금계산서는 사업자만 신청하실 수 있습니다.</li><br/>
                        <li>■ 배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li><br/>
                        <li>■ [세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</li><br/>
                        <li>■ [세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li><br/>
                        <li><h2>무이자할부 이용안내</h2></li>
                        <li>■ 상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li><br/>
                        <li>■ [전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li><br/>
                        <li>■ 단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li><br/>
                    </td>
                </ul>
    
                </tr>
            </table>
        </div>
    </div>
    </div>
    <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</body>
</html>