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
$(document).ready(function(){<!-- �ε�Ǹ� �⺻������ list�� �ҷ���!-->
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
 		var cost = 0;<!--���� ����!-->
 		var price =0;<!--���� �� ����!-->
 		var point=0;<!--������!-->
 		var sumprice=0;<!--�ش� ��ǰ�� price * amount ��!-->
		
 		<!--String ����ڿ��� ������ ��!-->
 		var viewprice="";
 		var viewsumprice="";
 		var viewpoint="";
 		
 		if(result.length < 1){
 			wishitem = "WISHLIST�� ������ϴ�.";
 		}else{
	 
		$(result).each(function(){
		
		if(this.w_pdiscount==0){<!-- ���ε� �� �� ����Ʈ ������ ����!-->
			price = this.w_pPRICE;
			point = (price*(1/100))*this.wAmount;
			sumprice = price*this.wAmount;
			
			viewprice = moneyunit(price)+'��'; 
			viewpoint = moneyunit(point)+'point';
			viewsumprice = moneyunit(sumprice)+'��';
			
		}else{
			price = this.w_pPRICE*(1-(this.w_pdiscount/100));
			point = (price*(1/100))*this.wAmount;
			sumprice = price*this.wAmount;
			
			viewprice = moneyunit(price)+'��';
			viewpoint = point = moneyunit(point)+'point';
			viewsumprice = moneyunit(sumprice)+'��';
		}

		wishitem +='<tr class="tr12" id="wID'+this.wID+'">';
		wishitem +='<td scope="row">';
		wishitem +='<input type="checkbox" name="checkitem" value="'+this.wID+'" onclick="check(2);"></td>';
		wishitem +='<td><img src="'+rootpath+'upload/'+this.w_pIMAGE1+'"width="100px" height="100px" alt="��ǰ����1"></td>';
		wishitem +='<td>'+this.w_pNAME+'</td>';
		wishitem +='<td scope="row">';
		wishitem +='<input type="hidden" class="jsprice" value="'+price+'">';
		wishitem +='<span>'+viewprice+'</span>';
		wishitem +='</td>';
		wishitem +='<td>';
		wishitem +='<input type="hidden" class="jspoint" value="'+point+'">';
		wishitem +='<span>'+viewpoint+'</span>';
		wishitem +='</td>';		
		wishitem +='<td>[�⺻���]<br/></td>';
		wishitem +='<td>';
		wishitem +='<span class="jssumprice">'+viewsumprice+'</span>';
		wishitem +='<input type="hidden" class"jssumvar" value="'+sumprice+'">';
		wishitem +='</td>';			
		wishitem +='<td>';
		wishitem +='<input type="button" value="�ֹ��ϱ�"><br/>';
		wishitem +='<input type="button" value="�����ϱ�" onclick="deletecheck('+this.wID+')">';
		wishitem +='</td>';
		wishitem +='</tr>';
	});
	
	payinfo = value_check();
			 
 }
 	$("#tr13").html(wishitem);

	
	}, error : function(result){
	
	console.log("����");
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
	 		var cost = 0;<!--���� ����!-->
	 		var price =0;<!--���� �� ����!-->
	 		var point=0;<!--������!-->
	 		var sumprice=0;<!--�ش� ��ǰ�� price * amount ��!-->
	 		
	 		<!--String ����ڿ��� ������ ��!-->
	 		var viewprice="";
	 		var viewsumprice="";
	 		var viewpoint="";
	 		
	 		if(result.length < 1){
		 		cartitem = "WISHLIST�� ������ϴ�.";
	 		}else{
		 
			$(result).each(function(){
			this.cAmount=1
			if(this.c_pdiscount==0){<!-- ���ε� ��,���� �� ����Ʈ ������ ����!-->
				price = this.c_pPRICE;
				point = (price*(1/100))*this.cAmount;
				sumprice = price*this.cAmount;
				
				viewprice = moneyunit(price)+'��'; 
				viewpoint = moneyunit(point)+'point';
				viewsumprice = moneyunit(sumprice)+'��';
				
			}else{
				price = this.c_pPRICE*(1-(this.c_pdiscount/100));
				point = (price*(1/100))*this.cAmount;
				sumprice = price*this.cAmount;
				
				viewprice = moneyunit(price)+'��';
				viewpoint = point = moneyunit(point)+'point';
				viewsumprice = moneyunit(sumprice)+'��';
			}
			
			cartitem +='<tr class="tr12" id="cID'+this.cID+'">';
			cartitem +='<td scope="row">';
			cartitem +='<input type="checkbox" name="checkitem" value="'+this.cID+'" onclick="check(2);"></td>';
			cartitem +='<td><img src="'+rootpath+'upload/'+this.c_pIMAGE1+'"width="100px" height="100px" alt="��ǰ����1"></td>';
			cartitem +='<td>'+this.c_pNAME+'</td>';
			cartitem +='<td scope="row">';
			cartitem +='<input type="hidden" class="jsprice" value="'+price+'">';
			cartitem +='<span>'+viewprice+'</span>';
			cartitem +='</td>';
			cartitem +='<td>';
			cartitem +='<input type="hidden" class="jspoint" value="'+point+'">';
			cartitem +='<span>'+viewpoint+'</span>';
			cartitem +='</td>';
			cartitem +='<td>[�⺻���]<br/></td>';					
			cartitem +='<td>';
			cartitem +='<input type="hidden" class"jssumvar" value="'+sumprice+'">';
			cartitem +='<span class="jssumprice">'+viewsumprice+'</span>';
			cartitem +='</td>';
			cartitem +='<td>';
			cartitem +='<input type="button" value="�ֹ��ϱ�"><br/>';
			cartitem +='<input type="button" value="�����ϱ�" onclick="deletecheck('+this.wID+')">';
			cartitem +='</td>';
			cartitem +='</tr>';
		});
		
		payinfo = value_check();
				 
	 }
	 	$("#cartlistdiv").html(cartitem);
		$(".section3").html(payinfo);

		}, error : function(result){
		
		console.log("����");
	}
	
});

}

function cartamountchange(cID){<!--���� ����� ajax�� �� �������� ����.!-->

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

function wishcancle(wID){<!--��ٱ��Ͽ��� �ش� ��ǰ ����!-->
	var wishcancle = "${conPath}wishlist/wishcancle";
	var widvar= wID;

	$.ajax({
		url : wishcancle+'/'+widvar,
		type : 'POST',
		dataType: 'json',
		success : function(result){
		
		alert("�����Ǿ����ϴ�.");				
		wishlist();
		
		}, error : function(result){
		
			console.log(result.result);			
	
		}
	});

};


function deletecheck(wID){<!--��ٱ��Ͽ��� �ش� ��ǰ ������ ����� Ȯ�� ���� �� ajax delete ����!-->
	if(confirm("WISHLIST���� ����ðڽ��ϱ�? ")== true){
		var widvar= wID;
		wishcancle(widvar);
	}else {
		return;
	}
}

function moneyunit(number){

	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


function sumArraycal(array){<!--�迭�� �޾ƿͼ� �װ��� �� ����.!-->

	var cal = array;
	var sumcal = 0;
		for(var i=0; i<cal.length;i++){
			sumcal += cal[i];
		};
	return sumcal;
}

function sumcal(cID){<!--���� ����� ����*������ ǥ��!-->

 	var cidvar = cID;
 
 	var amountvar = $('#cID'+cidvar+' .jsamount').val();
 
	 var price=	$('#cID'+cidvar+' .jsprice').val();
 
	 var sumprice = amountvar*price;
 
 	sumprice = moneyunit(sumprice)+'��';
 
 	$('#cID'+cidvar+' .jssumprice').text(sumprice);
 
}

function check(checkflag){
	
	var payinfo ="";
	
	if(checkflag === 1 ){<!--��ü ����, ��ü ����!-->
	
		if($("input:checkbox[id='allcheck']").is(":checked") ==true ){
	
			$("input:checkbox[name='checkitem']").prop("checked", true);	
			payinfo = value_check();
			$(".section3").html(payinfo);
		}else{
	
			$("input:checkbox[name='checkitem']").prop("checked", false);
			payinfo = value_check();
			$(".section3").html(payinfo);
		} 
	}else if(checkflag === 2 ){<!--���� ��� �ϳ��ϳ� ���� ���ýÿ��� ��ü ������ üũ�� ��.-->
		
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
	  var discountcostvar=0;<!--�� ���ε� �ݾ�!-->
	  var sumpriceArray = new Array();<!--�ش� ��ǰ�� ���� ������ �迭�� ����!-->
	  var pointArray = new Array();<!--�� ������ �迭!-->
	  
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
	  
	  var allsumprice = sumArraycal(sumpriceArray);<!--�� ���� �ݾ�!-->
	  if(allsumprice > 50000){
			postcost = 0;
	  }
	  sumpoint = sumArraycal(pointArray);<!--�� ������!-->
	  allsum = (allsumprice+postcost);
		
	  	
	  	
		viewpostcost = moneyunit(postcost);
		viewallsumprice = moneyunit(allsumprice);
		var viewsumpoint = moneyunit(sumpoint);
		viewallsum = moneyunit(allsum);<!--���� �����ݾ�!-->
		
		payinfo +='<table border="1" class="table3">';
		payinfo +='<h2>�� �ֹ��ݾ�</h2>';
		payinfo +='<tr>';
		payinfo +='<th>�ѻ�ǰ�ݾ�</th>';
		payinfo +='<th>�� ��ۺ�</th>';
		payinfo +='<th>���������ݾ�</th>';
		payinfo +='</tr>';
		payinfo +='<tr>';
		payinfo += '<input type="hidden" id="allsumprice" value="'+allsumprice+'">';
		payinfo += '<input type="hidden" id="postcost" value="'+postcost+'">';
		payinfo += '<input type="hidden" id="allsum" value="'+allsum+'">';
		payinfo +='<td>['+viewallsumprice+'] ��</td>';
		payinfo +='<td>+ ['+viewpostcost+'] ��</td>';
		payinfo +='<td>= ['+viewallsum+'] ��</td>';
		payinfo +='</tr>';
		payinfo +='</table>';
		payinfo +='<br />';
		
		return payinfo;

}


function wishcheck(kind){
	
	if($("input:checkbox[name='checkitem']:checked").length < 1){
		
		alert("��ǰ�� �������ּ���!");
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
		
			if(confirm("��ü��ǰ�� ��ٱ��Ͽ� �߰��Ͻðڽ��ϱ�?")==true){
			
				$('#wishform').submit();
			
			}else {
				return;
			}
		
			for(var i=0;i< wishArray.length;i++){<!--�迭 Ȯ�� �� !-->
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
		
			if(confirm("���û�ǰ�� ��ٱ��Ͽ� �߰��Ͻðڽ��ϱ�?")==true){

				$('#wishform').submit();
			
			}else {
				return;
			}
		
			for(var i=0;i< wishArray.length;i++){<!--�迭 Ȯ�� �� !-->
				console.log(wishArray[i]);
			};
		
		}
	}
}

</script>

</head>
<body>
	<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
   
    <!-- �߰��� �������κ� -->
	<div id="contents2">
        <div id="contents3">
            <div class="section">
            <div class="cart">
                <ul><a href="#"><li>WISH LIST</li></a></ul>
                
            </div>
            <table border="1" class="table1">
            <tr>
                <th rowspan="2"><h4>��������</h4></th>
                <td><p>${loginUserBean.mname}����,[�Ϲ�ȸ��] ȸ���̽ʴϴ�.</p></td>
            </tr>
            <tr>
                <td> 
                    <ul>
                    <li><a href="">���������� : 2,000��</a></li>
                    <li><a href="">��ġ�� : </a></li>
                    <li><a href="">���� : 1��</a></li>
                </ul>
            </td>
            </tr>
            </table>
        </div>
             <!-- �� -->
             <ul class="section1">
             <div class="tabArea">
                <ul class="tabList">
                    <li ><a href="#" class="tabBtn">������ۻ�ǰ (${cAmount})</a>
                    <!--  -->
                    <div class="tabCon notice">
                        <table class="table table-striped">
                            <thead>
                                <tr class="tr2">
                                    <th scope="cols"><input class="th1" type="checkbox" id="allcheck" onclick="check(1);"></th>
                                    <th scope="cols">�̹���</th>
                                    <th scope="cols">��ǰ����</th>
                                    <th scope="cols">�ǸŰ�</th>
                                    <th scope="cols">������</th>
                                    <th scope="cols">��۱���</th>
                                    <th scope="cols">�հ�</th>
                                    <th scope="cols">����</th>
                                </tr>
                            </thead>
                        <tbody id="tr13">
						</tbody>
                                <tr id="cartlistdiv" >
                                    <th colspan="10" scope="row">
                                        <p>[�Ϲݹ��]</p>                    
                                        <a>��ǰ���űݾ� + ��ۺ� = �հ� : ��</a>
                                    </th>
                                </tr>
                              
                            </tbody>
                            </table>    
                    </div>
                </li>
                
        			             
                <li>
                    <a href="#" class="tabBtn">�ؿܹ�ۻ�ǰ (0)</a>
                    <div class="tabCon notice">
                        <table class="table table-striped">
                            <thead>
                                <tr class="tr2">
                                    <th scope="cols"><input class="th1" type="checkbox" onclick=""></th>
                                    <th scope="cols">�̹���</th>
                                    <th scope="cols">��ǰ����</th>
                                    <th scope="cols">�ǸŰ�</th>
                                    <th scope="cols">����</th>
                                    <th scope="cols">������</th>
                                    <th scope="cols">��۱���</th>
                                    <th scope="cols">��ۺ�</th>
                                    <th scope="cols">�հ�</th>
                                    <th scope="cols">����</th>
                                </tr>
                            </thead>
                            <tbody>    
                                <tr class="tr12">
                                    <td scope="row"><a href=""><input type="checkbox" onclick=""></a></td>
                                    <td><img src="" alt=""></td>
                                    <td><a href=""><img src="" alt="">��ǰ�ɼ�
                                        <select size="" id="">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select></a><br/>
                                        <input type="submit" value="�߰�">
                                        <input type="submit" value="����">
                                        <input type="reset" value="����">
                                    </td>
                                    <td scope="row">��</td>
                                    <td><input type="number" value="" min="0" max="100" step="1"></td>
                                    <td>��</td>
                                    <td>�ؿܹ��</td>
                                    <td>��<br/>�ؿܹ��</td>
                                    <td>��</td>
                                    <td><a href="" onclick=""><input type="button" value="īƮ�ֱ�"><br/><input type="button" value="�����ϱ�"></a></td>
                                </tr>
                                <tr class="tr13">
                                    <th colspan="10" scope="row">
                                        <p>[�ؿܹ��]</p>                    
                                        <a>��ǰ���űݾ� + ��ۺ� = �հ� : ��</a>
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
				   
				
				<input type="button" value="��ü��ǰCART" id="allorder" onclick="wishcheck(1)" >
				<input type="button" value="���û�ǰCART" id="onepartorder" onclick="wishcheck(2)" >
				<input type="button" value="���ΰ���ϱ�" >
				</form>
				<br /> <br />
				</div>
    </div>
    </div>
    <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>

</body>
</html>