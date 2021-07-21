create database QuanLySinhVien;

use QuanLySinhVien;

create table Class
(
	class_id int not null auto_increment primary key ,
    class_name varchar(60) not null,
    start_date datetime not null,
    `status` bit
);

create table Student
(
	student_id int not null auto_increment primary key,
    student_name varchar(30) not null,
    address varchar(50),
    phone varchar(20),
    `status` bit,
    class_id int not null,
    foreign key(class_id) references Class(class_id)
);

create table `Subject`
(
sub_id int not null auto_increment primary key,
sub_name varchar(30) not null,
credit tinyint not null default 1 check(Credit >= 1),
`status` bit              default 1
);

create table Mark
(
	mark_id int not null auto_increment key,
    sub_id int  not null,
    student_id int not null,
    mark float default 0 check (Mark between 0 and 100),
    exam_times tinyint default 1,
    Unique (sub_id,student_id),
    foreign key(sub_id) references `subject` (sub_id),
    foreign key(student_id) references Student (student_id)
);