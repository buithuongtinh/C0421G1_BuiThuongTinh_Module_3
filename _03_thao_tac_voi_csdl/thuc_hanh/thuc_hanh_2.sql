USE QuanLySinhVien;
SELECT *
FROM Student;

SELECT *
FROM Student
WHERE Status = true;

SELECT *
FROM Subject
WHERE Credit < 10;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S 
inner join Mark M on S.StudentId = M.StudentId
inner join `Subject` Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';