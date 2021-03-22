function addCart(a,b){

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	var addCarturl = getContextPath()+"/"+"cart/cart";
	var c_m_IDx = a;
	var c_p_ID = b;
	var cAmount= $('#cAmount').val();
	if(isNaN(cAmount)){
		cAmount = 1;
	}
	//유저 고유번호,게시물 고유번호, 수량
	$.ajax({
		url : addCarturl+'/'+c_m_IDx+'/'+c_p_ID+'/'+cAmount,
		type : 'POST',
		dataType: 'json',
		beforeSend: function(xhr){
        xhr.setRequestHeader(header, token);
    	},
		success : function(result){
			
			check(result.result,a);
			
						
		},error : function(result){
			
			console.log("지금 오류나는 거임? 설마?");
		}
	});
}

function check(value,a){
	var rootpath=getContextPath(),
		subpath="/cart/cart?",
		midx="midx="+a;
		console.log(value);
	if(value==="insertsuccess"){
	
		if(confirm("장바구니로 가시겠습니까?") == true){
 	 	
			location.href=rootpath+subpath+midx;
	
		}else{
			return;
		}
	}else {
		
		if(confirm("이미 장바구니에 있는 상품입니다. 수량이 추가 되었습니다. 장바구니로 가시겠습니까?") == true){
	 	 	
			location.href=rootpath+subpath+midx;
	
		}else{
			return;
		}
		
	}
};

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}