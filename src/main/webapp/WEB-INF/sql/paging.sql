-- 테이블에 데이터 추가

-- 데이터를 1000개 추가한다
DECLARE
    DATA1 VARCHAR2(100) :='JAVA 게시물 ';
BEGIN
    FOR I IN 10 .. 1000
    LOOP
        INSERT INTO BOARD (
            BNO,
            MENU_ID,
            TITLE,
            content,
            WRITER,
            REGDATE,
            HIT
        ) VALUES (
            I,
            'MENU01',
            DATA1 || I ,
            'JAVA 내용',
            'sky',
            sysdate,
            0
        );
   END LOOP;
   COMMIT;
END;
/

SELECT * FROM BOARD
ORDER BY BNO ASC;


2. ROW_NUMBER() 사용

SET TIMING ON
 SELECT *
 FROM 
    (SELECT  
            ROW_NUMBER() OVER (ORDER BY BNO DESC) RN,
           BNO,
            MENU_ID,
            TITLE,
            content,
            WRITER,
            REGDATE,
            HIT
    FROM BOARD) T
 WHERE T.RN BETWEEN 11 AND 20;

3.  OFFSET .. FETCH ..

SET TIMING ON
SELECT    
    BNO,
    MENU_ID,
    TITLE,
    content,
    WRITER,
    TO_CHAR(REGDATE, 'YYYY-MM-DD') REGDATE,
    HIT
FROM BOARD
ORDER BY BNO DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
