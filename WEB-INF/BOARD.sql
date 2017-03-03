CREATE TABLESPACE BOARD
 DATAFILE 'D:\007_ORA_DATA\BOARD.dbf' SIZE 300M
 DEFAULT STORAGE 
 ( INITIAL    500K
  NEXT      10K
  MINEXTENTS 2
  MAXEXTENTS 50
  PCTINCREASE 50);
  
  DROP TABLESPACE SOP_TOGA_V6 INCLUDING CONTENTS;
  drop user BOARD cascade
  
  
create user board
 identified by board
 default tablespace board;

grant connect,resource to board;
grant create table, create sequence, create view TO board;


CREATE TABLE BOARD(
IDX NUMBER,
TITLE VARCHAR2(200) ,
WRITER VARCHAR2(20),
REGDATE VARCHAR2(20),
COUNT NUMBER ,
CONTENT CLOB,
PRIMARY KEY(IDX)

)

;


select * from board;
select board
delete board
where idx >= 2

CREATE SEQUENCE  "BOARD_SEQ"  MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1

select board_seq.currval from dual
