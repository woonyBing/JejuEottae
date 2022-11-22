-------------------------------------------------
--TOUR_IMG ���̺� CREATE
-------------------------------------------------
CREATE TABLE tour_img (
    IMG_NO NUMBER PRIMARY KEY,
    TOUR_NAME VARCHAR2(128),
    ADDRESS VARCHAR2(80),
    IMG_URL VARCHAR2(600)
);


-------------------------------------------------
--TOUR_IMG ������ �߰��ϴ� PROCEDURE(������ ���� �� �����)
-------------------------------------------------
CREATE OR REPLACE PROCEDURE insert_tour_img_tname
    IS
    BEGIN
        FOR tlitem IN (SELECT * FROM tour_list) LOOP
            IF tlitem.tour_name NOT IN ('���ְ��淣��', '���ֵ���������ũ', 'Ÿ����ũ') THEN
--                        DBMS_OUTPUT.PUT_LINE('tlitem : '||tlitem.tour_name);
                        INSERT INTO tour_img
                        VALUES (tlitem.id, tlitem.tour_name,tlitem.address, '');
            END IF;
    END LOOP;   
    COMMIT;
END insert_tour_img_tname;
/

exec insert_tour_img_tname;

