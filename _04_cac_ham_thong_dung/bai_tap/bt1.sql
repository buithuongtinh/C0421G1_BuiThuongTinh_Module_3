use quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select*
from `subject` 
WHERE credit = (select max(credit) from `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT sb.sub_id, sb.sub_name, max(m.mark) 
FROM `subject` sb INNER JOIN Mark m ON sb.sub_id = m.sub_id;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT S.student_id, S.student_name, avg(mark)
from Student S inner join Mark M on S.student_id = M.student_id
group by S.student_id,S.student_name
order by AVG(Mark) DESC

