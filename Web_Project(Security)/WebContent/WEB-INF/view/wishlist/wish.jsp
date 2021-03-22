<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	<sec:authentication property="principal" var="user"/> 
<c:set var='conPath' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf_header" id="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" id="_csrf" content="${_csrf.token}">
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
var midx=${user.midx};
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$.ajax({
	url : wishlisturl+'/'+midx,
	type : 'POST',
	dataType : 'json',
	beforeSend: function(xhr){
        xhr.setRequestHeader(header, token);
    },
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
		wishitem +='<input type="number" class="jsamount" value="'+this.wAmount+'"min="1" max="'+this.w_pSTOCK+'"step="1" onchange="wishamountchange('+this.wID+')">';					
		wishitem +='</td>';
		wishitem +='<td>';
		wishitem +='<input type="hidden" class="jsprice" value="'+price+'">';
		wishitem +='<span>'+viewprice+'</span>';
		wishitem +='</td>';	
		wishitem +='<td>';
		wishitem +='<input type="hidden" class="jspoint" value="'+point+'">';
		wishitem +='<span>'+viewpoint+'</span>';
		wishitem +='</td>';		
		wishitem +='<td>[�⺻���]<br/></td>';
		wishitem +='<td>';
		wishitem +='<input type="hidden" class"jssumvar" value="'+sumprice+'">';
		wishitem +='<span class="jssumprice">'+viewsumprice+'</span>';		
		wishitem +='</td>';			
		wishitem +='<td>';
		wishitem +='<input type="button" value="�����ϱ�" onclick="deletecheck('+this.wID+')">';
		wishitem +='</td>';
		wishitem +='</tr>';
		
	});
	
	payinfo = value_check();
			 
 }
 	$("#wishlistdiv").html(wishitem);
 	$(".section3").html(payinfo);
 
	}, error : function(result){
	
	console.log("����");
}

});

}


function wishamountchange(wID){<!--���� ����� ajax�� �� �������� ����.!-->

	var wishamounturl = "${conPath}wishlist/wishchange";
	var widvar = wID;
	var w_mIDx = ${user.midx};
	var amountvar = $('#wID'+widvar+' .jsamount').val();
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$.ajax({
		url : wishamounturl+'/'+widvar+'/'+w_mIDx+'/'+amountvar,
		type : 'POST',
		dataType: 'json',
		beforeSend: function(xhr){
	        xhr.setRequestHeader(header, token);
	    },
		success : function(result){
		
			sumcal(widvar);
			wishlist();
		
		}, error : function(result){
		
			console.log(result.result);			
	
		}
});
}

function wishdelete(wID){<!--��ٱ��Ͽ��� �ش� ��ǰ ����!-->
	var widelete = "${conPath}wishlist/widelete";
	var widvar= wID;
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$.ajax({
		url : widelete+'/'+widvar,
		type : 'POST',
		dataType: 'json',
		beforeSend: function(xhr){
	        xhr.setRequestHeader(header, token);
	    },
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
		wishdelete(widvar);
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

function sumcal(wID){<!--���� ����� ����*������ ǥ��!-->

 	var widvar = wID;
 
 	var amountvar = $('#wID'+widvar+' .jsamount').val();
 
	 var price=	$('#wID'+widvar+' .jsprice').val();
 
	 var sumprice = amountvar*price;
 
 	sumprice = moneyunit(sumprice)+'��';
 
 	$('#wID'+widvar+' .jssumprice').text(sumprice);
 
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
                var widvar = document.getElementsByName("checkitem")[i].value;
				var price = $('#wID'+widvar+' .jsprice').val();
				var amount = $('#wID'+widvar+' .jsamount').val();
				var point = $('#wID'+widvar+' .jspoint').val();
				
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


function cartcheck(kind){
	
	if($("input:checkbox[name='checkitem']:checked").length < 1){
		alert("��ǰ�� �������ּ���!");
		return;
	}else {
		if(kind === 1 ){
			var cartArray = new Array();
			console.log(cartArray.length);
			$("input:checkbox[name='checkitem']").each(function(){
				cartArray.push($(this).val());
				console.log(cartArray.length);
			});
		
			$('#charray').val(cartArray);
		
			console.log($('#charray').val());
		
			if(confirm("��ü��ǰ�� ��ٱ��Ͽ� �߰��Ͻðڽ��ϱ�?")==true){
			
				$('#cartform').submit();
			}else {
				return;
			}
			for(var i=0;i< cartArray.length;i++){<!--�迭 Ȯ�� �� !-->
			console.log(cartArray[i]);
			};
		
		}else if(kind === 2){
			var cartArray = new Array();
			$("input:checkbox[name='checkitem']:checked").each(function(){
				cartArray.push($(this).val());
			});
			$('#charray').val(cartArray);
			if(confirm("���û�ǰ�� ��ٱ��Ͽ� �߰��Ͻðڽ��ϱ�?")==true){
				$('#cartform').submit();
			}else {
				return;
			}
			for(var i=0;i< cartArray.length;i++){<!--�迭 Ȯ�� �� !-->
				console.log(cartArray[i]);
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
                <td><p>${user.mname}����,[�Ϲ�ȸ��] ȸ���̽ʴϴ�.</p></td>
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
                                    <td><a href="" onclick=""><input type="button" value="�����ϱ�"></a></td>
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
                    <li ><a href="#" class="tabBtn">������ۻ�ǰ (${wAmount})</a>
                    <!--  -->
                    <div class="tabCon notice"  style="overflow:auto">
                        <table class="table table-striped">
                            <thead>
                                <tr class="tr2">
                                    <th scope="cols"><input class="th1" type="checkbox" id="allcheck" onclick="check(1);"></th>
                                    <th scope="cols">�̹���</th>
                                    <th scope="cols">��ǰ����</th>
                                    <th scope="cols">����</th>
                                    <th scope="cols">�ǸŰ�</th>
                                    <th scope="cols">������</th>
                                    <th scope="cols">��۱���</th>
                                    <th scope="cols">�հ�</th>
                                    <th scope="cols">����</th>
                                </tr>
                            </thead>
                        <tbody id="wishlistdiv">
						</tbody>
                                <tr id="tr13" >
                                    <th colspan="10" scope="row">
                                        <p>[�Ϲݹ��]</p>                    
                                        <a>��ǰ���űݾ� + ��ۺ� = �հ� : ��</a>
                                    </th>
                                </tr>
                              
                            </tbody>
                            </table>    
                    </div>
                </li>
                
                </ul>
             </div>
        </ul>
        <div class="section3">
				
		</div>
        <div class="section4">
				<form action="${conPath }cart/cartwrite" method="post" id="cartform" autocomplete="off">
				<input type="hidden" name="cha[]" id="charray" value="">
				<input type="button" value="��ü��ǰCART" id="allcart" onclick="cartcheck(1)" >
				<input type="button" value="���û�ǰCART" id="onepartcart" onclick="cartcheck(2)" >
				<input type="button" value="���ΰ���ϱ�" >
				</form>
				<br /> <br />
				</div>
    </div>
    </div>
    <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>

</body>
</html>