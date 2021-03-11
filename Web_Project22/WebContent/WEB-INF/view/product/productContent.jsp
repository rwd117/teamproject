<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='conPath' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<head>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product Content</title>
<link href='../css/productContent.css' rel='stylesheet'>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){<!-- 로드되면 기본적으로 list를 불러옴!-->
		replylist();
});



function addCart(){
	var addCarturl = "${conPath}cart/cart";
	var c_m_IDx = ${loginUserBean.midx};
	var c_p_ID = ${productbean.pID};
	var cAmount= $('#cAmount').val();
	console.log(addCarturl+'/'+c_m_IDx+'/'+c_p_ID+'/'+cAmount);
	
	
	//유저 고유번호,게시물 고유번호, 수량
	$.ajax({
		url : addCarturl+'/'+c_m_IDx+'/'+c_p_ID+'/'+cAmount,
		type : 'POST',
		dataType: 'json',
		success : function(result){
			
			check(result.result);
			
						
		},error : function(result){
			
			console.log("지금 오류나는 거임? 설마?");
		}
	});
};

function check(value){
	var rootpath=${conPath},
		subpath="cart/cart?",
		midx="midx="+${loginUserBean.midx};
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

function replybutton(a){
	var re_rid = a;//게시물 번호
	var re_mIDx = ${loginUserBean.midx} ;
	var re_content = $('.content'+re_rid).val();
	
	var replywriteurl = "${conPath}reply/replywrite";
	
	$.ajax({
		url : replywriteurl+'/'+re_rid+'/'+re_mIDx+'/'+re_content,
		type : "post",
		dataType : 'json',
		success : function(result){
		
			console.log(result.result);
			replylist();
			$('.content'+re_rid).val('');
			
		}, error : function(result){
		
			console.log(result.result);			
	
		}
	});
	
};

function replylist(){
	var replylisturl = "${conPath}reply/replylist";
	var pID = ${pID};
	var mIDx = ${loginUserBean.midx} ;

	$.ajax({
		url : replylisturl+"/"+pID,
		type : "post",
		dataType : 'json',
		success : function(result){
			var reply = "";
			var renum = 0;
			
				if(result.length == 0){
					reply += "댓글이 없습니다.";
					console.log("0입니다");
					$('.reviewList #noreply').html(reply);
				}else{
					console.log("0이상입니다");
				for(var i=0;i<result.length;i++){
					var map = result[i];
						
					for(var key in map){
						
						console.log("key : " + key);
						console.log('map[key] : '+map[key]);
						
						$(map[key]).each(function(){
							
							renum = this.re_rid;
							reply += '<td class="r'+this.re_ID+'">';
							reply += '<div class="left">';
							reply += '작성자 : ' + this.re_mname;
							if(this.re_mIDx == mIDx){
								reply += '<input type="button" value="댓글 수정" onclick="replyupdate('+this.re_rid +',\'' + this.re_ID +'\', \'' + this.re_mname+'\', \''+ this.re_date+'\', \''+ this.re_content +'\')">';
								reply += '<input type="button" value="댓글 삭제" onclick="replydelete('+this.re_ID+')">';
							}
							reply += '<br/>';
							reply +=  this.re_date;
							reply += '</div>';
							reply += '<br/>';
							reply += this.re_content;
							reply += '</td>';
							
						});
					
						}
						$(".reply"+renum).html(reply);				
					}
				}
			}, error : function(result){
		
				console.log("오류");	
			}
		
		});
	
};

function replydelete(re_ID){
	var deleteurl = "${conPath}reply/replydelete";
	
	$.ajax({
		url: deleteurl+'/'+re_ID,
		type : 'POST',
		dataType : 'json',
		success : function(result){
			
			replylist();
			
		}, error : function(error){
			console.log("에러 : " + error);
		}
	});
	
}



function replyupdate(re_rid,re_ID,re_mname,re_date,re_content){
	var reply = "";
	console.log("수정???");
	reply += '<td class="r'+re_ID+'">';
	reply += '<div class="left">';
	reply += '작성자 : ' + re_mname;
	reply += '<input type="button" value="수정 하기" onclick="replyupdateok('+re_ID+')">';
	reply += '<input type="button" value="수정 취소" onclick="canclebtn();">';
	reply += '<br/>';
	reply +=  re_date;
	reply += '</div>';
	reply += '<br/>';
	reply += '<textarea style="resize:none" rows="4" cols="150" class="edit_content" >';
	reply += re_content;
	reply += '</textarea>';
	reply += '</td>';
	$('.reply'+re_rid+' .r'+re_ID).replaceWith(reply);
	$('.reply'+re_rid+' .r'+re_ID+' .edit_content').focus();
};


function canclebtn(){
	replylist();
};

function replyupdateok(re_ID){
	var updateurl = "${conPath}reply/replyupdate";
	var reply_content = $('.r'+re_ID+" .edit_content").val();
	
	$.ajax({
		url: updateurl+'/'+re_ID+'/'+reply_content,
		type : 'POST',
		dataType: 'json',
		success: function(result){
			console.log(result.result);
			if(result.result === "success"){
				console.log(result.result);
				replylist();
			}
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
	
};


</script>


	<c:if test="${not empty cartMsg }">
		<script>
		alert('${cartMsg }');
	</script>
	</c:if>
	<c:if test="${not empty wishListMsg }">
		<script>
		alert('${wishListMsg }');
	</script>
	</c:if>
	<c:import url="/WEB-INF/view/include/top_menu.jsp" />
	<div id="productContent_wrap">
		<div id="top">
			<div id="productImage">
				<div class="pImage">

					<img src="${conPath}upload/${productbean.pIMAGE1}" alt="상품사진1">

				</div>
			</div>
			<div id="product_info">
				<div id="accordion">

					<h3>${productbean.pNAME }</h3>
				</div>

				<div id="productPrice">
					<form action="${conPath }/cartInsert.do" method="get">
						<input type="hidden" id="pId" name="pId" value="${dto.pId }">
						<input type="hidden" id="mId" name="mId" value="${member.mId }">
						<!-- 세션 값 받아옴 -->


						<table>
							<tr>
								<th>판매가격</th>
								<td><fmt:formatNumber value="${productbean.pPRICE}" pattern="#,###,###" />원</td>
							</tr>
							<c:if test="${productbean.pdiscount != 0 }">
								<tr>
									<th>할인가격</th>
									<td>
									<c:set var="discountedPrice" value="${productbean.pPRICE*(1-(productbean.pdiscount/100)) }" />
										<fmt:formatNumber value="${discountedPrice }" pattern="#,###,###" />원 
										<span>(${productbean.pdiscount }%할인) </span></td>
								</tr>
							</c:if>
							<tr>
								<th>수량</th>
								<td><select name="cAmount" id="cAmount">
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
								</select> 개</td>
							</tr>
							<tr>
								<td colspan="2"><c:choose>
										<c:when test="${loginUserBean.userLogin == true }">

											<c:if test="${loginUserBean.mlevel == 0 }">
												<input type="button" class="btn" value="addCart"
													onClick="addCart();">
												<input type="button" value="go to Cart" class="btn"
													onclick="location.href='${conPath }cart/cart?midx=${loginUserBean.midx}'">
												<input type="button" class="heartbtn"
													onclick="location.href='${conPath}/wishListInsert.do?pId=${dto.pId}&mId=${member.mId}'">
											</c:if>
											<c:if test="${loginUserBean.mlevel > 0 }">
												<input type="button" value="상품 정보 수정" class="guestBtn"
													onclick="location.href='${conPath}product/productModify?pID=${pID}'">
												<input type="button" value="상품 삭제" class="guestBtn"
													onclick="location.href='${conPath}product/productDelete?pID=${pID}'">
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${loginUserBean.userLogin == false }">
												<input type="button" value="상품 구매는 로그인 후 가능합니다."
													class="guestBtn"
													onclick="location.href='${conPath}user/login'">
											</c:if>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>


		<div id="bottom">
			<div class="bottomInfo">
				<div class="pImage">
					<c:if test="${ not empty dto.pImage2 }">
						<img src="${conPath}/productImg/${dto.pImage2 }" alt="상품사진2">
					</c:if>
					<c:if test="${empty dto.pImage2  }">
					</c:if>
				</div>
				<div class="pContent">${dto.pContent }</div>
			</div>





			<div class="reviewList">

				<table>
					<tr>
						<td colspan="4" id="firstrow" class="left">Review.</td>
					</tr>
					<c:if test="${reviewlist.size() eq 0 }">
						<tr>
							<td colspan="6">작성된 리뷰가 없습니다.</td>
						</tr>
					</c:if>

					<c:if test="${reviewlist.size() != 0 }">
						<c:forEach var="obj" items="${reviewlist }">
							<tr>
								<td class="left" id="title">
										${obj.r_TITLE }</td>
										
								<td id="writer">
								<c:choose>
								<c:when test="${(obj.r_mIDx eq loginUserBean.midx) or loginUserBean.mlevel >0 } ">
								<c:if test="${obj.r_mIDx eq loginUserBean.midx }">
									<input type="button" value="수정하기" />
									<input type="button" value="삭제하기" />
									<br/>
								</c:if>
								<c:if test="${ loginUserBean.mlevel >0  }">
									<input type="button" value="수정하기" />
									<input type="button" value="삭제하기" />
									<br/>
								</c:if>
								</c:when>
								
								</c:choose>
									작성자 :${obj.r_mname}
								<td id="date">
									작성 날짜 :${obj.r_DATE }
								</tr>
								<td id="content">
									<div class="left">
								  <c:choose>
										<c:when test="${obj.r_FILE1 !=null and obj.r_FILE2 !=null }">
										<img src="${conPath}upload/${obj.r_FILE1}" width="50px" height="50px">
										<img src="${conPath}upload/${obj.r_FILE2}" width="50px" height="50px">
										</c:when>
										<c:when test="${obj.r_FILE1 !=null and obj.r_FILE2 eq null }">
										<img src="${conPath}upload/${obj.r_FILE1}" width="50px" height="50px">
										</c:when>
										<c:otherwise>
										
										</c:otherwise>
								</c:choose>
								 </div>
									 내용 :	${obj.r_CONTENT}
									
								</td>
								<tr>
									<td>
									<textarea style="resize:none"rows="7" cols="150" name="re_content" class="content${obj.r_ID}"></textarea>
									<input type="button" id="replywrite" value="댓글 작성" onclick="replybutton(${obj.r_ID});">
									</td>
								</tr>
								<tr class="reply${obj.r_ID}" id="noreply">
								
								</tr>
						</c:forEach>
					</c:if>
				</table>


				<div class="paging">
					<c:if test="${startPage > BLOCKSIZE }">
						<a href="${conPath }/productContent.do?pageNum=${startPage-1}">
							〈 &nbsp; </a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:if test="${i eq pageNum }">
							<b> &nbsp; ${i }</b>
						</c:if>
						<c:if test="${i != pageNum }">
							<a href="${conPath }/productContent.do?pageNum=${i }">&nbsp;
								${i }</a>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCnt }">
						<a href="${conPath }/productContent.do?pageNum=${endPage+1}">
							&nbsp; 〉 </a>
					</c:if>
				</div>

			</div>
		</div>
	</div>




	<c:import url="/WEB-INF/view/include/bottom_menu.jsp" />
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
  $( function() {
    $( "#accordion" ).accordion({
      	collapsible: true
    });  
    $("h3").click(function(){
    	$(this).css("background-color","white").css("color","black");
    });
  });
  
  $( function() {
	  function setCookie(cookie_name, value, days){
		  
	  }
	  
  });
  </script>
</body>
</html>