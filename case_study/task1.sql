
use khu_nghi_duong_furama;

insert into trinh_do
value (1,'trung cap'),
(2, 'cao dang'),
(3,'dai hoc'),
(4, 'sau dai hoc');

insert into vi_tri
value(1,'le tan'),
(2,'phuc vu'),
(3,'chuyen vien'),
(4,'giam sat'),
(5,'quan ly'),
(6,'giam doc');
insert into bo_phan
value(1,'sale-marketing'),
(2,'hanh chinh'),
(3,'phuc vu'),
(4,'quan ly');
insert into dich_vu_di_kem
value(1,'massage',200,2,'het'),
(2,'karaoke',300,10,'het'),
(3,'thuc an',50,15,'con'),
(4,'nuoc uong',50,15,'con'),
(5,'thue xe',100,1,'con');
insert into loai_dich_vu
value(1,'tuyet voi'),
(2,'tot'),
(3,'binh thuong');
insert into kieu_thue
value(1,'nam',20000),
(2,'thang',4000),
(3,'ngay',900),
(4,'gio',100);
insert into dich_vu
value(1,'villa',200,5,20,1000,3,1,'con'),
(2,'house',120,3,10,4000,2,2,'con'),
(3,'room',30,1,4,100,4,3,'con');
insert into loai_khach
value(1,'diamond'),
(2,'platinium'),
(3,'good'),
(4,'silver'),
(5,'member');

insert into khach_hang
value(1,2,'dong','1989-06-09','d019890609','dong@gmail.com','ha noi'),
(2,1,'trang','1999-12-29','t019991229','trang@gmail.com','sai gon'),
(3,5,'khoa','1991-01-11','k019910111','khoa@gmail.com','da nang');
insert into khach_hang
value(4,1,'hung','2002-02-22','h020020222','hung@gmail.com','vinh'),
(5,1,'phuong','2001-11-11','p020011111','phuong@gmail.com','quang ngai'),
(6,1,'trang','2000-10-20','t020001020','trang2k@gmail.com','quang binh');
alter table khach_hang 
add sdt_kh int ;


insert into hop_dong
value(1,1,1,1,'2021-06-28','2021-07-05',3000,6300),
(2,1,2,2,'2021-06-28','2021-06-29',500,900),
(3,1,3,3,'2021-06-22','2021-06-25',200,300);
insert into hop_dong
value(4,2,4,3,'2018-04-22','2018-04-25',250,400),
(5,2,5,2,'2018-01-22','2018-02-25',900,1800),
(6,2,6,2,'2019-11-22','2019-11-25',300,800);
insert into hop_dong_chi_tiet
value(1,3,5,10),
(2,4,4,8),
(3,1,3,5),
(4,6,1,2),
(5,2,5,5),
(6,5,4,8);


insert into nhan_vien
value(1,'Hai',3,3,2,'1999-09-19','h019990919','9tr','019990919','hai@gmail.com','da nang'),
(2,'tinh',2,1,3,'2000-06-28','t020000628','6tr','020000628','tinh@gmail.com','quang tri'),
(3,'phuong',1,1,1,'2002-02-22','p020020222','5tr','020020222','phuong@gmail.com','quang binh');
