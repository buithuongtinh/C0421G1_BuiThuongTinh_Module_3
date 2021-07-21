USE QuanLySinhVien;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT student.StudentName
FROM Student
WHERE  student.student_name like "h%";
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from class 
where month(start_date)= 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT *
FROM `Subject`
WHERE credit BETWEEN 3 AND 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;
update student
set class_id = 2
where student_name ='hung';
-- Hiển thị các thông tin: StudentName, SubName, Mark.
--  Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT s.student_name, sub.sub_name ,m.mark
FROM mark M
inner join student S on S.student_id = M.student_id
inner join `subject` SUB on SUB.sub_id = M.sub_id
order by M.mark DESC , S.student_name ASC;




