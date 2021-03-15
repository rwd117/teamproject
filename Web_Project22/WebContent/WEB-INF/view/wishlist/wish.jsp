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
<script type="text/javascript">
$(document).ready(function(){<!-- 로드되면 기본적으로 list를 불러옴!-->
wishlist();
});


function wishlist(){
var wishlisturl = "${conPath}wishlist/wishlist";
var midx=${loginUserBean.midx};

$.ajax({
	url : wishlisturl+'/'+midx,
	type : 'POST',
	dataType : 'json',
	success : function(result){
		var rootpath = ${conPath}; 
		var wishitem = "";
 		var payinfo ="";
 		var cost = 0;<!--원래 가격!-->
 		var price =0;<!--할인 된 가격!-->
 		var point=0;<!--적립금!-->
 		var sumprice=0;<!--해당 상품의 price * amount 값!-->
		
 		<!--String 사용자에게 보여질 값!-->
 		var viewprice="";
 		var viewsumprice="";
 		var viewpoint="";
 		
 		if(result.length < 1){
 			wishitem = "WISHLIST가 비었습니다.";
 		}else{
	 
		$(result).each(function(){
		
		if(this.w_pdiscount==0){<!-- 할인된 값 및 포인트 사전에 정의!-->
			price = this.w_pPRICE;
			point = (price*(1/100))*this.wAmount;
			sumprice = price*this.wAmount;
			
			viewprice = moneyunit(price)+'원'; 
			viewpoint = moneyunit(point)+'point';
			viewsumprice = moneyunit(sumprice)+'원';
			
		}else{
			price = this.w_pPRICE*(1-(this.w_pdiscount/100));
			point = (price*(1/100))*this.wAmount;
			sumprice = price*this.wAmount;
			
			viewprice = moneyunit(price)+'원';
			viewpoint = point = moneyunit(point)+'point';
			viewsumprice = moneyunit(sumprice)+'원';
		}

		wishitem +='<tr class="tr12" id="wID'+this.wID+'">';
		wishitem +='<td scope="row">';
		wishitem +='<input type="checkbox" name="checkitem" value="'+this.wID+'" onclick="check(2);"></td>';
		wishitem +='<td><img src="'+rootpath+'upload/'+this.w_pIMAGE1+'"width="100px" height="100px" alt="상품사진1"></td>';
		wishitem +='<td>'+this.w_pNAME+'</td>';
		wishitem +='<td scope="row">';
		wishitem +='<input type="hidden" class="jsprice" value="'+price+'">';
		wishitem +='<span>'+viewprice+'</span>';
		wishitem +='</td>';
		wishitem +='<td>';
		wishitem +='<input type="hidden" class="jspoint" value="'+point+'">';
		wishitem +='<span>'+viewpoint+'</span>';
		wishitem +='</td>';		
		wishitem +='<td>[기본배송]<br/></td>';
		wishitem +='<td>';
		wishitem +='<span class="jssumprice">'+viewsumprice+'</span>';
		wishitem +='<input type="hidden" class"jssumvar" value="'+sumprice+'">';
		wishitem +='</td>';			
		wishitem +='<td>';
		wishitem +='<input type="button" value="주문하기"><br/>';
		wishitem +='<input type="button" value="삭제하기" onclick="deletecheck('+this.wID+')">';
		wishitem +='</td>';
		wishitem +='</tr>';
	});
	
	payinfo = value_check();
			 
 }
 	$("#tr13").html(wishitem);

	
	}, error : function(result){
	
	console.log("에러");
}

});

}


function cartlist(){
	var cartlisturl = "${conPath}cart/cartlist";
	var midx=${loginUserBean.midx};
	
	$.ajax({
		url : cartlisturl+'/'+midx,
		type : 'POST',
		dataType : 'json',
		success : function(result){
	 		var rootpath = ${conPath}; 
	 		var cartitem = "";
	 		var payinfo ="";
	 		var cost = 0;<!--원래 가격!-->
	 		var price =0;<!--할인 된 가격!-->
	 		var point=0;<!--적립금!-->
	 		var sumprice=0;<!--해당 상품의 price * amount 값!-->
	 		
	 		<!--String 사용자에게 보여질 값!-->
	 		var viewprice="";
	 		var viewsumprice="";
	 		var viewpoint="";
	 		
	 		if(result.length < 1){
		 		cartitem = "WISHLIST가 비었습니다.";
	 		}else{
		 
			$(result).each(function(){
			this.cAmount=1
			if(this.c_pdiscount==0){<!-- 할인된 값,수량 및 포인트 사전에 정의!-->
				price = this.c_pPRICE;
				point = (price*(1/100))*this.cAmount;
				sumprice = price*this.cAmount;
				
				viewprice = moneyunit(price)+'원'; 
				viewpoint = moneyunit(point)+'point';
				viewsumprice = moneyunit(sumprice)+'원';
				
			}else{
				price = this.c_pPRICE*(1-(this.c_pdiscount/100));
				point = (price*(1/100))*this.cAmount;
				sumprice = price*this.cAmount;
				
				viewprice = moneyunit(price)+'원';
				viewpoint = point = moneyunit(point)+'point';
				viewsumprice = moneyunit(sumprice)+'원';
			}
			
			cartitem +='<tr class="tr12" id="cID'+this.cID+'">';
			cartitem +='<td scope="row">';
			cartitem +='<input type="checkbox" name="checkitem" value="'+this.cID+'" onclick="check(2);"></td>';
			cartitem +='<td><img src="'+rootpath+'upload/'+this.c_pIMAGE1+'"width="100px" height="100px" alt="상품사진1"></td>';
			cartitem +='<td>'+this.c_pNAME+'</td>';
			cartitem +='<td scope="row">';
			cartitem +='<input type="hidden" class="jsprice" value="'+price+'">';
			cartitem +='<span>'+viewprice+'</span>';
			cartitem +='</td>';
			cartitem +='<td>';
			cartitem +='<input type="hidden" class="jspoint" value="'+point+'">';
			cartitem +='<span>'+viewpoint+'</span>';
			cartitem +='</td>';
			cartitem +='<td>[기본배송]<br/></td>';					
			cartitem +='<td>';
			cartitem +='<input type="hidden" class"jssumvar" value="'+sumprice+'">';
			cartitem +='<span class="jssumprice">'+viewsumprice+'</span>';
			cartitem +='</td>';
			cartitem +='<td>';
			cartitem +='<input type="button" value="주문하기"><br/>';
			cartitem +='<input type="button" value="삭제하기" onclick="deletecheck('+this.wID+')">';
			cartitem +='</td>';
			cartitem +='</tr>';
		});
		
		payinfo = value_check();
				 
	 }
	 	$("#cartlistdiv").html(cartitem);
		$(".section3").html(payinfo);

		}, error : function(result){
		
		console.log("에러");
	}
	
});

}

function cartamountchange(cID){<!--수량 변경시 ajax로 그 수량들을 보냄.!-->

	var cartamounturl = "${conPath}cart/cartchange";
	var cidvar = cID;
	var c_m_IDx = ${loginUserBean.midx};
	var amountvar = $('#cID'+cidvar+' .jsamount').val();

	$.ajax({
		url : cartamounturl+'/'+cidvar+'/'+c_m_IDx+'/'+amountvar,
		type : 'POST',
		dataType: 'json',
		success : function(result){
		
			sumcal(cidvar);
			cartlist();
		
		}, error : function(result){
		
			console.log(result.result);			
	
		}
});
}

function wishcancle(wID){<!--장바구니에서 해당 상품 삭제!-->
	var wishcancle = "${conPath}wishlist/wishcancle";
	var widvar= wID;

	$.ajax({
		url : wishcancle+'/'+widvar,
		type : 'POST',
		dataType: 'json',
		success : function(result){
		
		alert("삭제되었습니다.");				
		wishlist();
		
		}, error : function(result){
		
			console.log(result.result);			
	
		}
	});

};


function deletecheck(wID){<!--장바구니에서 해당 상품 삭제시 물어보고 확인 누를 시 ajax delete 실행!-->
	if(confirm("WISHLIST에서 지우시겠습니까? ")== true){
		var widvar= wID;
		wishcancle(widvar);
	}else {
		return;
	}
}

function moneyunit(number){

	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


function sumArraycal(array){<!--배열을 받아와서 그것을 다 더함.!-->

	var cal = array;
	var sumcal = 0;
		for(var i=0; i<cal.length;i++){
			sumcal += cal[i];
		};
	return sumcal;
}

function sumcal(cID){<!--수량 변경시 수량*가격을 표시!-->

 	var cidvar = cID;
 
 	var amountvar = $('#cID'+cidvar+' .jsamount').val();
 
	 var price=	$('#cID'+cidvar+' .jsprice').val();
 
	 var sumprice = amountvar*price;
 
 	sumprice = moneyunit(sumprice)+'원';
 
 	$('#cID'+cidvar+' .jssumprice').text(sumprice);
 
}

function check(checkflag){
	
	var payinfo ="";
	
	if(checkflag === 1 ){<!--전체 선택, 전체 해제!-->
	
		if($("input:checkbox[id='allcheck']").is(":checked") ==true ){
	
			$("input:checkbox[name='checkitem']").prop("checked", true);	
			payinfo = value_check();
			$(".section3").html(payinfo);
		}else{
	
			$("input:checkbox[name='checkitem']").prop("checked", false);
			payinfo = value_check();
			$(".section3").html(payinfo);
		} 
	}else if(checkflag === 2 ){<!--하위 요소 하나하나 전부 선택시에만 전체 선택이 체크가 됨.-->
		
		if($("input:checkbox[name='checkitem']:checked").length == $("input:checkbox[name='checkitem']").length){
			
			$("input:checkbox[id='allcheck']").prop("checked", true);
			payinfo = value_check();
			$(".section3").html(payinfo);
		}else if($("input:checkbox[name='checkitem']:checked").length != $("input:checkbox[name='checkitem']").length){
			
			$("input:checkbox[id='allcheck']").prop("checked", false);
			payinfo = value_check();
			$(".section3").html(payinfo);
			
		}
		
	}
	
};


function value_check(){
	  var checkcount = document.getElementsByName("checkitem").length;
	 
	  var allsumprice = 0;
	  var postcost = 2500;
	  var sumpoint = 0;
		
	  
	  var payinfo ="";
	  var discountcostvar=0;<!--총 할인된 금액!-->
	  var sumpriceArray = new Array();<!--해당 상품의 최종 가격을 배열로 저장!-->
	  var pointArray = new Array();<!--총 적립금 배열!-->
	  
	  for(var i=0; i<checkcount; i++){
		    if (document.getElementsByName("checkitem")[i].checked == true) {
                var cidvar = document.getElementsByName("checkitem")[i].value;
				var price = $('#cID'+cidvar+' .jsprice').val();
				var amount = $('#cID'+cidvar+' .jsamount').val();
				var point = $('#cID'+cidvar+' .jspoint').val();
				
				sumpriceArray.push(price*amount);
				pointArray.push(point*amount);
            };
	  };
	  
	  var allsumprice = sumArraycal(sumpriceArray);<!--총 결제 금액!-->
	  if(allsumprice > 50000){
			postcost = 0;
	  }
	  sumpoint = sumArraycal(pointArray);<!--총 적립금!-->
	  allsum = (allsumprice+postcost);
		
	  	
	  	
		viewpostcost = moneyunit(postcost);
		viewallsumprice = moneyunit(allsumprice);
		var viewsumpoint = moneyunit(sumpoint);
		viewallsum = moneyunit(allsum);<!--최종 결제금액!-->
		
		payinfo +='<table border="1" class="table3">';
		payinfo +='<h2>총 주문금액</h2>';
		payinfo +='<tr>';
		payinfo +='<th>총상품금액</th>';
		payinfo +='<th>총 배송비</th>';
		payinfo +='<th>결제예정금액</th>';
		payinfo +='</tr>';
		payinfo +='<tr>';
		payinfo += '<input type="hidden" id="allsumprice" value="'+allsumprice+'">';
		payinfo += '<input type="hidden" id="postcost" value="'+postcost+'">';
		payinfo += '<input type="hidden" id="allsum" value="'+allsum+'">';
		payinfo +='<td>['+viewallsumprice+'] 원</td>';
		payinfo +='<td>+ ['+viewpostcost+'] 원</td>';
		payinfo +='<td>= ['+viewallsum+'] 원</td>';
		payinfo +='</tr>';
		payinfo +='</table>';
		payinfo +='<br />';
		
		return payinfo;

}


function wishcheck(kind){
	
	if($("input:checkbox[name='checkitem']:checked").length < 1){
		
		alert("상품을 선택해주세요!");
		return;
		
	}else {
		var allsumprice =$('#allsumprice').val();
		var postcost=$('#postcost').val();
		var allsum=$('#allsum').val();
		
		
		if(kind === 1 ){
		
			var wishArray = new Array();
			console.log(wishArray.length);
			$("input:checkbox[name='checkitem']").each(function(){
				wishArray.push($(this).val());
				console.log(wishArray.length);
			});
		
			$('#charray').val(wishArray);
			$('#suballsumprice').val(allsumprice);
			$('#subpostcost').val(postcost);
			$('#suballsum').val(allsum);
		
			console.log($('#charray').val());
		
			if(confirm("전체상품을 장바구니에 추가하시겠습니까?")==true){
			
				$('#wishform').submit();
			
			}else {
				return;
			}
		
			for(var i=0;i< wishArray.length;i++){<!--배열 확인 용 !-->
			console.log(wishArray[i]);
			};
		
		}else if(kind === 2){
			var wishArray = new Array();
		
			$("input:checkbox[name='checkitem']:checked").each(function(){
				wishArray.push($(this).val());
			});
		
			$('#charray').val(wishArray);
			$('#suballsumprice').val(allsumprice);
			$('#subpostcost').val(postcost);
			$('#suballsum').val(allsum);
		
			if(confirm("선택상품을 장바구니에 추가하시겠습니까?")==true){

				$('#wishform').submit();
			
			}else {
				return;
			}
		
			for(var i=0;i< wishArray.length;i++){<!--배열 확인 용 !-->
				console.log(wishArray[i]);
			};
		
		}
	}
}

</script>

</head>
<body>
	<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
   
    <!-- 중간에 컨텐츠부분 -->
	<div id="contents2">
        <div id="contents3">
            <div class="section">
            <div class="cart">
                <ul><a href="#"><li>WISH LIST</li></a></ul>
                
            </div>
            <table border="1" class="table1">
            <tr>
                <th rowspan="2"><h4>혜택정보</h4></th>
                <td><p>${loginUserBean.mname}님은,[일반회원] 회원이십니다.</p></td>
            </tr>
            <tr>
                <td> 
                    <ul>
                    <li><a href="">가용적립금 : 2,000원</a></li>
                    <li><a href="">예치금 : </a></li>
                    <li><a href="">쿠폰 : 1개</a></li>
                </ul>
            </td>
            </tr>
            </table>
        </div>
             <!-- 탭 -->
             <ul class="section1">
             <div class="tabArea">
                <ul class="tabList">
                    <li ><a href="#" class="tabBtn">국내배송상품 (${cAmount})</a>
                    <!--  -->
                    <div class="tabCon notice">
                        <table class="table table-striped">
                            <thead>
                                <tr class="tr2">
                                    <th scope="cols"><input class="th1" type="checkbox" id="allcheck" onclick="check(1);"></th>
                                    <th scope="cols">이미지</th>
                                    <th scope="cols">상품정보</th>
                                    <th scope="cols">판매가</th>
                                    <th scope="cols">적립금</th>
                                    <th scope="cols">배송구분</th>
                                    <th scope="cols">합계</th>
                                    <th scope="cols">선택</th>
                                </tr>
                            </thead>
                        <tbody id="tr13">
						</tbody>
                                <tr id="cartlistdiv" >
                                    <th colspan="10" scope="row">
                                        <p>[일반배송]</p>                    
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
                                    <td><a href="" onclick=""><input type="button" value="카트넣기"><br/><input type="button" value="삭제하기"></a></td>
                                </tr>
                                <tr class="tr13">
                                    <th colspan="10" scope="row">
                                        <p>[해외배송]</p>                    
                                        <a>상품구매금액 + 배송비 = 합계 : 원</a>
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </li>
                </ul>
             </div>
        </ul>
        <div class="section3">
				
		</div>
        <div class="section4">
				<form action="${conPath }cart/cartwrite" method="post" id="wishform" autocomplete="off">
				<input type="hidden" name="cha[]" id="charray" value="">
				<input type="hidden" id="suballsumprice" name="allsumprice" value="">
				<input type="hidden" id="subpostcost" name="postcost" value="">
				<input type="hidden" id="suballsum" name="allsum" value="">
				   
				
				<input type="button" value="전체상품CART" id="allorder" onclick="wishcheck(1)" >
				<input type="button" value="선택상품CART" id="onepartorder" onclick="wishcheck(2)" >
				<input type="button" value="쇼핑계속하기" >
				</form>
				<br /> <br />
				</div>
    </div>
    </div>
    <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>

</body>
</html>