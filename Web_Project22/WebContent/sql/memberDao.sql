drop table MEMBER cascade constraints;

create sequence MEMBER_seq
start with 0
increment by 1
minvalue 0;

create table MEMBER(
	midx number constraint MEMBER_PK primary key,
	mname varchar2(100) not null,
	mid varchar2(100) not null,
	mpw varchar2(100) not null,
	mpw2 varchar2(100) ,
	memail varchar2(100) not null ,
	maddress varchar2(100) not null,
	maddress2 varchar2(100) ,
	mbirth date not null,
	mdate date,
	mphone varchar2(100) not null,
	mpost varchar2(100) 
);
select*from MEMBER;
-- 아이디 중복 체크
SELECT*FROM MEMBER WHERE mID='aaa';

-- 회원가입(mID,mPW,mNAME,mPHONE,mADDRESS/mBIRTH,mDROP//mDATE)
INSERT INTO MEMBER(midx,mname,mid,mpw,memail,maddress,mbirth,mphone)
    VALUES (MEMBER_seq.nextval,'김나리','knr215','1111','aaa@aaa.aaa','daegu','90/02/15','01040328060');

-- 로그인
SELECT*FROM MEMBER WHERE MDROP=0 AND mID='aaa' AND mPW='111';

-- 로그인 후 세션에 정보를 넣기 위해 mId로 dto 가져오기
SELECT*FROM MEMBER WHERE mID='aaa';

-- 회원 정보 수정(mId)
UPDATE MEMBER
    SET mPW='111',
        mNAME='밝지영',
        mEMAIL='aaa@aaa.aaa',
        mPHONE='01050910108',
        mADDRESS='서울시 중랑구',
        mBIRTH='1990/01/08'
    WHERE mID='aaa';

-- 회원 탈퇴 
UPDATE MEMBER
    SET mDROP=1
    WHERE mID='aaa';

-- 리스트 조회(startRow, endRow)
--- 리스트 기준 : mDATE 내림차순
SELECT*FROM MEMBER ORDER BY mDATE DESC;
SELECT*FROM (SELECT ROWNUM RN, A.* FROM (SELECT*FROM MEMBER ORDER BY mDATE DESC)A) WHERE RN BETWEEN 3 AND 10;

-- 가입한 전체 회원수 
SELECT COUNT(*) TOTCNT FROM MEMBER;

-- 임시 비밀번호 발급 가능 조건 체크 -> mId, mName, mEmail 이 조건에 맞는 회원 있는지 가져오기
SELECT*FROM MEMBER WHERE mID='bbarkji' AND mNAME='박지영' AND mEMAIL='barkji0@naver.com';

-- mID, mNAME, mEMAIL 일치하는 회원 임시 비밀번호로 비밀번호 수정
UPDATE MEMBER 
    SET mPW='111'
    WHERE mID='bbarkji' AND mName='박지영' AND mEmail='barkji0@naver.com';

-- 이 회원이 탈퇴한 회원인지 확인하기
SELECT mDROP FROM MEMBER WHERE mID='aaa';


COMMIT;