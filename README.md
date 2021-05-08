## TeamProject(쇼핑몰 Ssa da gu)

+ SpringMVC패턴을 이용한 쇼핑몰

------------
<details>
	<summary>  <h3> 기술스택 </h3>  </summary>
<div markdown="1">

+ Backend: Spring | Java 8 | Oracle | Mybatis | Tomcat 9.0

+ Frontend: JavaScript(jQuery), css
</div>
</details>

------------

<details>
<summary><h3>참여 인원</h3></summary>
<div markdown="1">
	
 A, B, C(본인) 총 3명
  
  A -> 전체적인 Frontend(디자인), 문의사항(계층형) 및 공지사항, Wish리스트
  
  B -> 회원 수정 및 삭제, 팝업 창, Memberlist 관리 
  
  C -> 전체적인 DB 설계, 메뉴, 회원 가입, 주문관리, 상품 관리, 리뷰, 댓글(Ajax), 위시리스트(Ajax), 장바구니, 비밀번호 암호화
  
  총 소요 기간 : 2/22 ~ 3/22 
  
</div>
</details>

------------

## TeamProject 기능 설명

1. [기본 정보](#기본정보)

2. [관리자 기능](#Admin기능)

3. [사용자 기능](#Member기능)

4. [기능 요약](#기능요약)


------------
## 기본정보


								DB설계

![image](https://user-images.githubusercontent.com/69449157/115374460-d364c700-a207-11eb-8b82-048a5d230435.png)




                                           Admin : 관리자가 사용 가능한 기능(회원 관리, 상품 관리, 문의 관리 등)
					   
 ![image](https://user-images.githubusercontent.com/69449157/115358317-80374800-a1f8-11eb-9eb6-971c7ce6b146.png)

                                          Member : 사용자가 사용 가능한 기능(메뉴확인, 주문 등)
					  
 ![image](https://user-images.githubusercontent.com/69449157/115358220-6564d380-a1f8-11eb-995b-cb75cf05e12b.png)



- 로그인 Session을 이용


- 회원 비밀번호 암호화 이용

~~~
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	@PostMapping("/join_pro")
	public String join_pro(@ModelAttribute("joinUserBean") UserBean userBean) {
		String pwd = userBean.getMpw();
		String enpwd = pwdEncoder.encode(pwd);

		userBean.setMpw(enpwd);//비밀번호 암호화 한후 set

		userService.addUserInfo(userBean);
		return "/user/join_success";
	}
	
~~~

----------------------------

<details>
<summary><h3>Admin기능</h3></summary>

<div markdown="1">

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
</div>

</details>


------------



<details>
<summary><h3>Member기능</h3></summary>

<div markdown="1">

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
   - 
</div>

</details>

----------

## 기능요약

 <h3>0. 홈 화면</h3>
 
 ![image](https://user-images.githubusercontent.com/69449157/117528240-21e9d200-b00c-11eb-8d2a-55fa22eb8ed5.png)

+  검색 기능 및 DB에서 메뉴 호출 후, mapper에서 각 경우에 대하여 설정
~~~
<select id="getproductInfolist" 
		parameterType="kr.co.korea.beans.ProductBean"
		resultType="kr.co.korea.beans.ProductBean">

		select pID,pNAME,pPRICE,pIMAGE1,pCONTENT,to_char(pDATE, 'YYYY-MM-DD')as pDATE,phit
		from (select ROW_NUMBER() over(order by pid desc) as RNUM, tb.*
		         from product tb ) tb
		where (RNUM between #{pro_rowStart} and #{pro_rowEnd}) 
		<include refid="keywordcheck"></include>
		<include refid="all"></include>
		
</select>

<sql id="all">
		<if test="pro_all!=0 ">
			<if test="pro_best!=0">
				order by phit desc
			</if>
		</if>
		<if test="pro_all ==0 ">
			<if test="p_top_idx == 1">
			
			</if>
			<if test="p_top_idx == 2">
				order by phit desc
			</if>
			<if test="p_top_idx > 2">
				and (p_top_idx=(select top_idx from topmenu where top_idx=#{p_top_idx}))
				<if test="p_sub_idx!=0">
				and (p_sub_idx=(select sub_idx from submenu where sub_idx=#{p_sub_idx}))
				</if>
			</if>
		</if>
</sql>

<sql id="keywordcheck">
		<if test="pro_keyword != null and pro_keyword != ''">
				and (pNAME LIKE '%' || #{pro_keyword} || '%')
		</if>
</sql>
~~~

+ jstl을 이용하여 로그인 전, 로그인 후에 맞는 메뉴를 보여 줌.
	1. 로그인 전
	 
		![image](https://user-images.githubusercontent.com/69449157/117528539-c02a6780-b00d-11eb-9b23-a518b5d4f730.png)
		
	2. 로그인 후(회원)
	
		![image](https://user-images.githubusercontent.com/69449157/117528593-ecde7f00-b00d-11eb-85d2-292b5055620c.png)

	3. 로그인 후(관리자)
	 
		![image](https://user-images.githubusercontent.com/69449157/117528635-1697a600-b00e-11eb-900d-6fcd256c3e20.png)


+ 슬라이드의 경우 Best에서 상위 3개의 상품을 확인 가능

 <h3>1. 회원가입 </h3>

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

<h3> 2. 상품 주문 </h3>
  
  ![image](https://user-images.githubusercontent.com/69449157/115361287-677c6180-a1fb-11eb-9582-9f85f144fd70.png)
  
  ![image](https://user-images.githubusercontent.com/69449157/115361610-b32f0b00-a1fb-11eb-94d8-7a2832542b17.png)
  
  
  
  + 임의의 상품을 클릭 후, 그 상품에 대한 정보를 확인.
  
  + 하트 모양은 wishlist 
  
  + go to cart는 장바구니로 이동
  
  + add cart 는 장바구니에 추가


  
  ![image](https://user-images.githubusercontent.com/69449157/115362336-639d0f00-a1fc-11eb-8276-586ed194a668.png)
  
  ![image](https://user-images.githubusercontent.com/69449157/115362665-bc6ca780-a1fc-11eb-906b-c4fb63bc0937.png)
  
  ~~~
  function addCart(a,b){
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



<h3> 3. 주문하기 </h3>

  ![image](https://user-images.githubusercontent.com/69449157/115363622-9562a580-a1fd-11eb-91cb-11a61e03daa0.png)
  
  ![image](https://user-images.githubusercontent.com/69449157/115367520-3d2da280-a201-11eb-883c-0c17e6a9dcb8.png)
  
  ~~~
  @PostMapping("/orderwrite")
	public String order(OrderBean orderbean,
						@RequestParam(value="cha[]") List<String> Checklist,
						@RequestParam(value="allsumprice") int sumprice,
						@RequestParam(value="postcost") int postcost,
						@RequestParam(value="allsum") int allsum,
						Model model) {
		
		List<CartBean> cartlist = new ArrayList<CartBean>();
		
		int Cartid=0;
		for(String i : Checklist) {
			Cartid = Integer.parseInt(i);
			cartlist.add(cartservice.idxcartgetinfo(Cartid));
		}//카트 정보
		
		
		Map<String,Object> pricemap = new LinkedHashMap<String,Object>();
		pricemap.put("sumprice",sumprice);
		pricemap.put("postcost",postcost);
		pricemap.put("allsum",allsum);
		//결제 금액 전부 가져와서 map에 담기
		
		UserBean userbean = new UserBean();
		userservice.getUserInfo(userbean);
		
		model.addAttribute("Checklist",Checklist);
		model.addAttribute("userbean",userbean);
		model.addAttribute("cartlist",cartlist);
		model.addAttribute("pricemap",pricemap);
		
		return "/orders/order";
	}
  ~~~
  
  

+ 선택 상품 주문 혹은 전체 상품 주문을 클릭할 시, 주문하기 화면으로 이동

+ 상품은 장바구니 테이블, 고객정보는 세션을 이용하여 읽어 옵니다.



<h3> 4. 주문 확인 </h3>
  
  ![image](https://user-images.githubusercontent.com/69449157/115368032-a9a8a180-a201-11eb-9771-52d98273acec.png)
  ![image](https://user-images.githubusercontent.com/69449157/115368182-ce047e00-a201-11eb-975a-8c88a877fb54.png)

  
  + 관리자가 배송을 보내기 전에는 배송 준비 중 이라는 문구로 표시
  
  + 주문 내역에서는 상세보기와 재구매 버튼을 활성 화

  + 관리자가 배송 후에는 상세보기 -> 리뷰 작성버튼으로 활성화




