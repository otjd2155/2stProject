select * from book;
select * from users;
select * from room;
delete from room where R_no = '4';
drop table book;
DROP TABLE ROOM;
drop SEQUENCE book_seq;
CREATE SEQUENCE BOOK_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE Book (
		bk_no NUMBER(10) PRIMARY KEY NOT NULL,
		bk_date DATE NOT NULL,
		bk_stime TIMESTAMP NOT NULL,
		bk_status NUMBER(1) DEFAULT 1 NOT NULL,
        bk_tp NUMBER(10) NOT NULL,
        bk_tt NUMBER(2) NOT NULL,
        bk_rdate DATE DEFAULT SYSDATE NOT NULL,
		bk_etime TIMESTAMP NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		r_No NUMBER(10) NULL
);
CREATE SEQUENCE ROOM_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE Room (
		r_No NUMBER(10) PRIMARY KEY NOT NULL,
		r_name VARCHAR2(100) NOT NULL,
		r_image VARCHAR2(100) DEFAULT 'noImg' NOT NULL,
		r_ppr NUMBER(2) NOT NULL,
		r_pph NUMBER(10) NOT NULL,
		r_status NUMBER(1) DEFAULT 1 NOT NULL
);
INSERT INTO room(r_no, r_name, r_ppr, r_pph)
        values(ROOM_SEQ.nextval, '��ù�', 4, 8000);  
INSERT INTO room(r_no, r_name, r_ppr, r_pph)
        values(ROOM_SEQ.nextval, '��̹�', 2, 4000); 
INSERT INTO room(r_no, r_name, r_ppr, r_pph)
        values(ROOM_SEQ.nextval, '���չ�', 4, 8000);
INSERT INTO room(r_no, r_name, r_ppr, r_pph)
        values(ROOM_SEQ.nextval, 'ƫ����', 8, 16000);

-- ����Ʈ ���
  SELECT * FROM (SELECT ROWNUM RN, A.* FROM
    (SELECT bk_no, (SELECT u_name FROM Book B, Users U WHERE B.u_id=U.u_id AND Book.bk_no=bk_no) subscriber, 
        (SELECT r_name FROM Book B, Room R WHERE R.r_no=B.r_no AND book.bk_no=bk_no) roomname,
    bk_date, bk_stime, bk_etime, bk_tt, bk_tp, bk_rdate
    from Book WHERE bk_status !=0 ORDER BY bk_date DESC) A)
    WHERE RN BETWEEN 1 AND 20;
-- ���� ����Ʈ ���� ���
  SELECT * FROM (SELECT ROWNUM RN, A.* FROM
    (SELECT bk_no, (SELECT u_name FROM Book B, Users U WHERE B.u_id=U.u_id AND Book.bk_no=bk_no) subscriber, 
        (SELECT r_name FROM Book B, Room R WHERE R.r_no=B.r_no AND book.bk_no=bk_no) roomname,
    bk_date, bk_stime, bk_etime, bk_tt, bk_tp, bk_rdate
    from Book WHERE bk_status !=0 ORDER BY bk_date DESC) A)
    WHERE subscriber = '������' and RN BETWEEN 1 AND 20 and bk_date >= sysdate;
-- ���� ���� ����Ʈ ���
  SELECT * FROM (SELECT ROWNUM RN, A.* FROM
    (SELECT bk_no, (SELECT u_name FROM Book B, Users U WHERE B.u_id=U.u_id AND Book.bk_no=bk_no) subscriber, 
        (SELECT r_name FROM Book B, Room R WHERE R.r_no=B.r_no AND book.bk_no=bk_no) roomname,
    bk_date, bk_stime, bk_etime, bk_tt, bk_tp, bk_rdate
    from Book WHERE bk_status !=0 ORDER BY bk_date DESC) A)
    WHERE subscriber = '������' and RN BETWEEN 1 AND 20 and bk_date < sysdate;   
    
-- �� ����Ʈ ���
  SELECT * FROM ROOM;
-- �� ����
 SELECT count(*) FROM BOOK;
-- �����ϱ�
 INSERT INTO BOOK (bk_no, bk_date, bk_stime, bk_tp, bk_tt, bk_etime, u_id, r_no)
          values (book_seq.nextval, to_date('20200424', 'YYYY-MM-DD'), to_timestamp('2020/04/24/14'), 10000, 2, to_timestamp('2020-04-24 18:00:00'), 'aaaaa', 3); 
           INSERT INTO BOOK (bk_no, bk_date, bk_stime, bk_tp, bk_tt, bk_etime, u_id, r_no)
          values (book_seq.nextval, to_date('20200424', 'YYYY-MM-DD'), to_timestamp('2020-04-24 12:00:00'), 10000, 2, to_timestamp('2020-04-24 14:00:00'), 'aaaaa', 3); 
-- �󼼺���
 select * from book where bk_no=1;
-- �����ϱ�
 update book set bk_status=0 where bk_no=3;
 UPDATE BOOK SET bk_status=0 WHERE bk_no=3;
-- ���� �ߺ�üũ
 SELECT COUNT(*) FROM BOOK WHERE BK_STIME BETWEEN '2020/04/24/15' AND '2020/04/24/20' OR BK_ETIME BETWEEN '2020/04/24/15' AND '2020/04/24/20' AND R_NO=3 AND bk_status=1;
commit;

-- 예약현황
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(
        select BK_NO, u.u_name subscriber, r.r_name roomname, bk_date, bk_stime, bk_etime, bk_tt, bk_tp, bk_rdate,bk_rv_status from book b, users u, room r 
        where u.u_id=b.u_id and b.r_no=r.r_no and bk_date >= sysdate 
            and u.u_id='aaaa'
        order by bk_date )A)WHERE RN BETWEEN 1 AND 100; 

-- 예약이력
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(
        select BK_NO, u.u_name subscriber, r.r_name roomname, bk_date, bk_stime, bk_etime, bk_tt, bk_tp, bk_rdate, bk_rv_status from book b, users u, room r 
        where u.u_id=b.u_id and b.r_no=r.r_no and bk_date < sysdate 
            and u.u_id='aaaa'
        order by bk_date )A)WHERE RN BETWEEN 1 AND 100;
        
-- 예약 후기 완료
UPDATE book set bk_rv_status=1 where bk_no=10; 
select * from book where bk_rv_status=1;