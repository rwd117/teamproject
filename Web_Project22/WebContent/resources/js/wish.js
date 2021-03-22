
function WISH(a,b){
	var WISHurl =getContextPath()+"/"+"wishlist/wish";
	var c_m_IDx = a;
	var c_p_ID = b;
	var wAmount= 1;
	console.log(WISHurl+'/'+c_m_IDx+'/'+c_p_ID+'/'+wAmount);
	
	
	//유저 고유번호,게시물 고유번호, 수량
	$.ajax({
		url : WISHurl+'/'+c_m_IDx+'/'+c_p_ID+'/'+wAmount,
		type : 'POST',
		dataType: 'json',
		success : function(result){
			
			check1(result.result,a);
			
						
		},error : function(result){
			
			console.log("지금 오류나는 거임? 설마?");
		}
	});
}

function check1(value,a){
	var rootpath= getContextPath()+"/",
		subpath="wishlist/wish?",
		midx="midx="+a;
		
	if(value==="insertsuccess"){
	
		if(confirm("WISHLIST로 가시겠습니까?") == true){
 	 	
			location.href=rootpath+subpath+midx;
	
		}else{
			return;
		}
	}else {
		
		if(confirm("이미 WISHLIST에 있는 상품입니다.  WISHLIST로 가시겠습니까?") == true){
	 	 	
			location.href=rootpath+subpath+midx;
	
		}else{
			return;
		}
		
	}
};