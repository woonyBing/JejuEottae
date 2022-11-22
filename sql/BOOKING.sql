-------------------------------------------------
--BOOKING ���̺� CREATE
-------------------------------------------------
CREATE TABLE Booking(
    bo_num NUMBER(2),
    ro_num NUMBER(2),
    hotel_name VARCHAR2(60),
    payment NUMBER(8),
    checkin DATE,
    checkout DATE,
    person_cnt NUMBER(4),
    user_id VARCHAR2(60)
);


-------------------------------------------------
--BOOKING ���̺� INSERT
-------------------------------------------------
INSERT INTO Booking VALUES((SELECT NVL(max(bo_num),0)+1 FROM booking),?,?,?,?,?,?,?);


-------------------------------------------------
--BOOKING ���̺� DELETE
-------------------------------------------------
DELETE Booking where BO_NUM = ?;