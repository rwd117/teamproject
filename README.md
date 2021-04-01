## TeamProject(쇼핑몰 Ssa da gu)

+ SpringMVC패턴을 이용한 쇼핑몰

------------

## 기술스택

+ Backend: Spring boot | Java 8 | Oracle | Mybatis | Tomcat 9.0

+ Frontend: JavaScript(jQuery), css

------------
## 참여 인원
  A, B, C(본인) 총 3명
  
  A -> 전체적인 Frontend, 문의사항(계층형) 및 공지사항, Wish리스트
  
  B -> 회원 수정 및 삭제, 팝업 창, Memberlist 관리 
  
  C -> 전체적인 DB, 메뉴, 회원 가입(Daum 주소 찾기 Api), 주문관리, 상품 관리, 리뷰, 댓글(Ajax), 위시리스트(Ajax), 장바구니, 비밀번호 암호화
  
  총 소요 기간 : 2/22 ~ 3/22 
  

## TeamProject 기능 설명

------------
- Admin : 관리자가 사용 가능한 기능(회원 관리, 상품 관리, 문의 관리 등)
- Member : 사용자가 사용 가능한 기능(메뉴확인, 주문 등)

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
   - 
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



