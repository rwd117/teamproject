## TeamProject(쇼핑몰 Ssa da gu)

+ SpringMVC패턴을 이용한 쇼핑몰

------------

## 기술스택

+ Backend: Spring | Java 8 | Oracle | Mybatis | Tomcat 9.0

+ Frontend: JavaScript(jQuery), css

------------
## 참여 인원
  A, B, C(본인) 총 3명
  
  A -> 전체적인 Frontend, 문의사항(계층형) 및 공지사항, Wish리스트
  
  B -> 회원 수정 및 삭제, 팝업 창, Memberlist 관리 
  
  C -> 전체적인 DB, 메뉴, 회원 가입(Daum 주소 찾기 Api), 주문관리, 상품 관리, 리뷰, 댓글(Ajax), 위시리스트(Ajax), 장바구니, 비밀번호 암호화
  
  총 소요 기간 : 2/22 ~ 3/22 
  

## TeamProject 기능 설명
1. [관리자 기능](#Admin 기능)

2. [사용자 기능](#Member기능)

3. [기본 기능 설명](#기능 요약)

------------
                                           Admin : 관리자가 사용 가능한 기능(회원 관리, 상품 관리, 문의 관리 등)
 ![image](https://user-images.githubusercontent.com/69449157/115358317-80374800-a1f8-11eb-9eb6-971c7ce6b146.png)

                                          Member : 사용자가 사용 가능한 기능(메뉴확인, 주문 등)
 ![image](https://user-images.githubusercontent.com/69449157/115358220-6564d380-a1f8-11eb-995b-cb75cf05e12b.png)

## 공통

- 로그인 Session을 이용
- 회원 비밀번호 암호화 이용

# Admin 기능

1. Create
   - 상품 등록(상품의 사진 및 내용 등록)
   - 공지 사항
   - 문의 사항 답변 등록

2. Update
   - 상품 수정 및 공지사항 수정
   - Member의 주문이 들어 왔을 경우, 배달 보냈을 경우 order update

3. Delete
   - 회원 탈퇴 시 MemberList에서 Member정보 DB에서 삭제 가능   
   - 상품 삭제 및 공지사항 삭제
   - 리뷰 삭제 및 댓글 삭제

4. list
   - Memberlist, 주문 리스트, 공지사항 리스트, Qna리스트, 메뉴 리스트

5. Read
   - 문의사항 비밀글 
------------

# Member기능

1. Read
   - menulist, 상품, 주문리스트, 리뷰리스트
   - 조회수가 높은 list와 해당 메뉴의 리스트가 별도로 보임
   - 문의사항 비밀글 설정(본인 혹은 Admin만)

2. Creat
   - 리뷰 작성,댓글 작성(ajax)
   - 위시리스트(찜하기), 장바구니 기능
   - 문의사항 글 작성(비밀글 작성)
   - 회원가입(주소 DaumApi 이용)
3. Update
   - 자신이 작성한 글에 한하여 수정 가능(리뷰 및 문의사항, 댓글)
   - 위시리스트(찜하기), 장바구니 기능

4. Delete
   - 위시리스트, 장바구니 삭제(ajax)
   - 자신이 작성한 글에 한하여 삭제 가능(리뷰 및 문의사항, 댓글)

5. Search
   - 상품에 한하여 검색 가능

6. authority
   - 인터셉터를 이용한 페이지 접근 금지 
----------

# 기능 요약

1. 회원가입

  ![image](https://user-images.githubusercontent.com/69449157/115359915-191a9300-a1fa-11eb-99f7-8260645470cb.png)
  
  ~~~
  <script>
 $("#addressBtn").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
			var addr = ''; // 주소 변수
			var extraAddr =''; // 참고항목 변수
			
			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
             addr = data.roadAddress;
         } else { // 사용자가 지번 주소를 선택했을 경우(J)
             addr = data.jibunAddress;
         }			
         // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
         if(data.userSelectedType === 'R'){
             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraAddr += data.bname;
             }
             // 건물명이 있고, 공동주택일 경우 추가한다.
             if(data.buildingName !== '' && data.apartment === 'Y'){
                 extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if(extraAddr !== ''){
                 extraAddr = ' (' + extraAddr + ')';
             }
             // 조합된 참고항목을 해당 필드에 넣는다.
             $("#maddress2").val(extraAddr);           
	            
         } else {
	                $("#maddress2").val(' ');
	            }
         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         $("#mpost").val(data.zonecode);
         $("#maddress").val(addr);
         $("#maddress2").focus();
     	}
	    }).open();
	});	
 </script>
  ~~~
+ 유효성 검사 및 아이디 중복체크는 ajax를 이용.

+ 주소 등록의 경우 다음 주소찾기 api를 이용.

2. 상품 주문
  
  ![image](https://user-images.githubusercontent.com/69449157/115361287-677c6180-a1fb-11eb-9582-9f85f144fd70.png)
  
  ![image](https://user-images.githubusercontent.com/69449157/115361610-b32f0b00-a1fb-11eb-94d8-7a2832542b17.png)
  
  + 임의의 상품을 클릭 후, 그 상품에 대한 정보를 확인.
  
  + 하트 모양은 wishlist go to cart는 장바구니로 이동, add to cart 는 장바구니에 추가
  
  ![image](https://user-images.githubusercontent.com/69449157/115362336-639d0f00-a1fc-11eb-8276-586ed194a668.png)
  
  ![image](https://user-images.githubusercontent.com/69449157/115362665-bc6ca780-a1fc-11eb-906b-c4fb63bc0937.png)
  
  ~~~
  function addCart(a,b){
	var addCarturl = getContextPath()+"/"+"cart/cart";
	var c_m_IDx = a;
	var c_p_ID = b;
	var cAmount= $('#cAmount').val();
	console.log(addCarturl+'/'+c_m_IDx+'/'+c_p_ID+'/'+cAmount);
	console.log(isNaN(cAmount));
	if(isNaN(cAmount)){
		cAmount = 1;
	console.log(cAmount);	
	}
	
	//유저 고유번호,게시물 고유번호, 수량
	$.ajax({
		url : addCarturl+'/'+c_m_IDx+'/'+c_p_ID+'/'+cAmount,
		type : 'POST',
		dataType: 'json',
		success : function(result){
			
			check(result.result,a);
			
						
		},error : function(result){
			
			console.log("에러 체크");
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
  ~~~

  + cart와 wish는 ajax로 구현
  
  + 버튼 클릭 시, ajax로 cart,wish테이블에서 체크 
  
  + 없을 경우 장바구니에 추가, 기존에 있던 상품일 경우 수량 1증가

3. 주문하기

  ![image](https://user-images.githubusercontent.com/69449157/115363622-9562a580-a1fd-11eb-91cb-11a61e03daa0.png)
  
  ![image](https://user-images.githubusercontent.com/69449157/115367520-3d2da280-a201-11eb-883c-0c17e6a9dcb8.png)

+ 선택 상품 주문 혹은 전체 상품 주문을 클릭할 시, 주문하기 화면으로 이동

+ 상품은 장바구니 테이블, 고객정보는 세션을 통하여 읽어 옵니다.

4. 주문 확인
  
  ![image](https://user-images.githubusercontent.com/69449157/115368032-a9a8a180-a201-11eb-9771-52d98273acec.png)
  ![image](https://user-images.githubusercontent.com/69449157/115368182-ce047e00-a201-11eb-975a-8c88a877fb54.png)

  
  + 관리자가 배송을 보내기 전에는 배송 준비 중 이라는 문구로 표시
  
  + 주문 내역에서는 상세보기와 재구매 버튼을 활성 화

  + 관리자가 배송 후에는 상세보기 -> 리뷰 작성버튼으로 활성화




