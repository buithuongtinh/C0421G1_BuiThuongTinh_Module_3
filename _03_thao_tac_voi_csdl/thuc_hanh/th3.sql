use quanlysinhvien;

INSERT INTO class (class_name,start_date,`status`)
value ('A1', '2008-12-20',1);
INSERT INTO class (class_name,start_date,`status`)
values ('A2', '2008-12-22',1);
INSERT INTO class (class_name,start_date,`status`)
value ('B3', current_date,0);

INSERT INTO student (student_name,address,phone, `status`,class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name,address, `status`,class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name,address,phone, `status`,class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO `subject` (sub_name,credit,`status`)
VALUES ('CF', 5, 1),
 ('C', 6, 1),
 ('HDJ', 5, 1),
 ('RDBMS', 10, 1);
 
 INSERT INTO Mark 
VALUES (1,1, 1, 8, 1),
       (2,1, 2, 10, 2),
       (3,2, 1, 12, 1);