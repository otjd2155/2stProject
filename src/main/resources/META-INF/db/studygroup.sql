SELECT * FROM STUDYGROUP;
SELECT * FROM STUDYMEMBER;
SELECT * FROM STUDYBOARD;
select * from sb_comment;
select * from users;
SELECT *  FROM STUDYGROUP WHERE SG_NAME = '붐비치';
CREATE SEQUENCE SG_NO_SQ;
CREATE SEQUENCE SM_NO_SQ;
ALTER TABLE STUDYMEMBER
    ADD(SM_STATUS NUMBER(2) DEFAULT 1);
    ALTER TABLE STUDYGROUP
    MODIFY(SG_NAME UNIQUE);
CREATE TABLE SB_COMMENT(
    SC_NO NUMBER(10) PRIMARY KEY,
    U_ID VARCHAR2(20) REFERENCES USERS(U_ID),
    C_CONTENT VARCHAR2(400) NOT NULL,
    C_STATUS NUMBER(1) DEFAULT 1,
    C_RDATE TIMESTAMP DEFAULT SYSTIMESTAMP,
    SB_NO NUMBER(10) REFERENCES STUDYBOARD(SB_NO),
    SG_NO NUMBER(10) REFERENCES STUDYGROUP(SG_NO)
    );
ALTER TABLE SB_COMMENT
    ADD (SG_NO NUMBER(10) REFERENCES STUDYGROUP(SG_NO));
ALTER TABLE STUDYMEMBER
   ADD CONSTRAINT PLAYER_FK
   UNIQUE (u_id);
delete from studygroup;
delete from studymember;
--스터디그룹 개설
INSERT INTO STUDYGROUP(SG_NO, SG_NAME, U_ID, SG_PERSON, SG_EXPLAIN, ST_NO)
            VALUES(SG_NO_SQ.NEXTVAL, '영어회화스터디', 'aaa', 1, '영어회화스터디 톡입니다.', 1);
--방장추가
INSERT INTO STUDYMEMBER(SM_NO, U_ID, SG_NO, SM_STATUS)
                VALUES (SM_NO_SQ.NEXTVAL, 'sedongdong', (SELECT sg_no from studygroup where sg_name = '전화영어'), 1);
SELECT * FROM STUDYMEMBER;
--타입
INSERT INTO STUDYTYPE(ST_NO, ST_NAME) VALUES(2, '컴퓨터');
--회원추가
INSERT INTO STUDYMEMBER VALUES(5, 'aaa1', 26, 1);

SELECT * FROM STUDYGROUP SG, STUDYMEMBER SM WHERE SG.SG_NO = SM.SG_NO;
-- 회원의 스터디그룹 출력
SELECT * FROM STUDYGROUP SG, studymember SM WHERE SG.SG_NO = SM.SG_NO AND SM.U_ID = 'aaa';
--내가 운영중인 스터디그룹 출력
SELECT * FROM STUDYGROUP SG, USERS U WHERE SG.U_ID = U.U_ID AND U.U_ID = 'aaa';
--회원 탈퇴
DELETE FROM STUDYMEMBER WHERE U_ID = 'aaa';
COMMIT;
--스터디 디테일
SELECT * FROM STUDYGROUP WHERE SG_NO = 26;
--맴버 수
SELECT COUNT(*) FROM STUDYMEMBER WHERE SG_NO = 26;
            rollback;
-- 스터디그룹의 회원목록 출력SELECT * FROM USERS U, STUDYMEMBER SM, STUDYGROUP SG WHERE SG.SG_NO = SM.SG_NO AND U.U_ID = SG.U_ID AND SG.SG_NAME = '영어회화스터디';
SELECT * FROM STUDYMEMBER WHERE SG_NO = 27 AND U_ID = 'aaa';

--회원 중복 바\ㅇ지

ALTER TABLE STUDYBOARD
    ADD(SB_RDATE TIMESTAMP DEFAULT SYSTIMESTAMP);
CREATE SEQUENCE SB_SQ;
SELECT * FROM STUDYBOARD;
--글 목록을 출력한다
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT S.*, U.U_NAME, U.U_IMAGE FROM STUDYBOARD S, USERS U WHERE SB_STATUS = 1 AND U.U_ID = S.U_ID ORDER BY SB_RDATE DESC) A ) WHERE RN BETWEEN 1 AND 3 AND SG_NO = 26;

--공지사항 목록을 출력한다.
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM STUDYBOARD WHERE SB_STATUS = 2 ORDER BY SB_RDATE DESC) A ) WHERE RN <= 10 AND SG_NO = 26;
--글작성하기
INSERT INTO STUDYBOARD (SB_NO, SB_TITLE, SB_CONTENT, SB_HIT, SB_STATUS, SG_NO, U_ID)
                VALUES(SB_SQ.NEXTVAL, '공지사항4', '읽어줭~', 0, 1, 26, 'sedongdong');
--글 상세보기
SELECT * FROM STUDYBOARD WHERE SB_NO = 1;
--글 삭제하기
UPDATE STUDYBOARD SET SB_STATUS = 0 WHERE SB_NO = 2;
--글 수정하기
UPDATE STUDYBOARD SET SB_CONTENT = '수정됨', SB_TITLE = '수정됨', SB_RDATE = SYSTIMESTAMP WHERE SB_NO = 2;
--조회수증가
UPDATE STUDYBOARD SET SB_HIT = SB_HIT + 1 WHERE SB_NO = 1;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM STUDYBOARD WHERE
		SB_STATUS = 1 ORDER BY SB_RDATE DESC) A ) WHERE RN BeTWEEN #{startRow} AND #{endRow} AND
		SG_NO = #{sg_no};
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT S.*, U.U_NAME, U.U_IMAGE FROM STUDYBOARD S, USERS U 
		WHERE SB_STATUS = 1 AND U.U_ID = S.U_ID 
		ORDER BY SB_RDATE DESC) A ) WHERE RN BETWEEN 1 AND 3 AND
		SG_NO = 26;
CREATE SEQUENCE SC_NO_SQ;
-- 댓글 생성
INSERT INTO SB_COMMENT (SC_NO, U_ID, C_CONTENT, SB_NO, SG_NO)
            VALUES(SC_NO_SQ.NEXTVAL, 'aaa', 'CONTENT', 27, 26);
--댓글 조회
SELECT SC.*, U_NAME, U_IMAGE FROM SB_COMMENT SC, USERS U WHERE C_STATUS > 0 AND Sb_NO = 26 AND SC.U_ID = U.U_ID;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM SB_COMMENT WHERE C_STATUS > 0 AND SG_NO = 26 ORDER BY C_RDATE DESC) A);
SELECT * FROM SB_COMMENT sb, users u WHERE SB_NO = 3 AND C_STATUS > 0 and sb.u_id = u.u_id;
--댓글 삭제
UPDATE SB_COMMENT SET C_CONTENT = '수정됨', C_RDATE = SYSTIMESTAMP WHERE SC_NO = 1;
UPDATE SB_COMMENT SET C_STATUS = 0 WHERE SC_NO = 1;
--댓글 수량
SELECT COUNT(*) FROM SB_COMMENT WHERE SB_NO = 26 AND C_STATUS > 0;
SELECT COUNT(*) FROM SB_COMMENT WHERE C_STATUS > 0 group by sb_no;
SELECT * FROM STUDYBOARD SB, SB_COMMENT SC WHERE SB.SB_NO = SC.SB_NO AND C_STATUS > 0;
COMMIT;
select * from studyboard sb, sb_comment sc where sb.sb_no = 26 and sb.sb_no = sc.sb_no;
SELECT * FROM SB_COMMENT WHERE SB_NO = 27;
SELECT * 
		FROM (SELECT ROWNUM RN, A.* 
		FROM (SELECT SC.*, U.U_NAME, U.U_IMAGE FROM SB_COMMENT SC, USERS U
		WHERE C_STATUS > 0 AND SG_NO = #{sg_no} ORDER BY C_RDATE DESC) A);
SELECT * FROM STUDYBOARD WHERE SB_NO = 26;