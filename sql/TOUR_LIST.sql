-------------------------------------------------
--TOUR_LIST ���̺� CREATE
-------------------------------------------------
CREATE TABLE tour_list(
    id number,
    tour_name varchar(80),
    address varchar(150)
);


-------------------------------------------------
--TOUR_LIST ���̺� INSERT
-------------------------------------------------
INSERT INTO tour_list VALUES((select NVL(max(id),0)+1 from tour_list),?, ?);