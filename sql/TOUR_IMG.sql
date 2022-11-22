-------------------------------------------------
--TOUR_IMG 테이블 CREATE
-------------------------------------------------
CREATE TABLE tour_img (
    IMG_NO NUMBER PRIMARY KEY,
    TOUR_NAME VARCHAR2(128),
    ADDRESS VARCHAR2(80),
    IMG_URL VARCHAR2(600)
);


-------------------------------------------------
--TOUR_IMG 데이터 추가하는 PROCEDURE(데이터 생성 시 사용함)
-------------------------------------------------
CREATE OR REPLACE PROCEDURE insert_tour_img_tname
    IS
    BEGIN
        FOR tlitem IN (SELECT * FROM tour_list) LOOP
            IF tlitem.tour_name NOT IN ('제주공룡랜드', '제주동물테파파크', '타임파크') THEN
--                        DBMS_OUTPUT.PUT_LINE('tlitem : '||tlitem.tour_name);
                        INSERT INTO tour_img
                        VALUES (tlitem.id, tlitem.tour_name,tlitem.address, '');
            END IF;
    END LOOP;   
    COMMIT;
END insert_tour_img_tname;
/

exec insert_tour_img_tname;

