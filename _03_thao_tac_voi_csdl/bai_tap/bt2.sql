use quan_ly_ban_hang;
insert into customer(c_id, c_name, c_age)
value(1,'Minh Quan' , 10),
     (2,'Ngoc Oanh' , 20),
     (3,'Hong Ha', 50);
     
insert into `order`(o_id,c_id,o_date,o_total_price)
value(1,1,'2006-03-21',null),
(2,2,'2006-03-23',null),
(3,1,'2006-03-16',null);

insert into product(p_id,p_name,p_pice)
value(1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);

insert into oder_detail(o_id,p_id,od_qty)
VALUES (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id,o_date,o_total_price
from `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select OD.o_id , C.c_name , P.p_name 
from oder_detail OD
inner join product P On P.p_id = OD.p_id
inner join `order` O ON O.o_id = OD.o_id
inner join customer C On C.c_id = O.c_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select C.c_name , O.o_id
from `order` O
right join customer C On C.c_id = O.c_id
where O.c_id is NULL;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
--  Giá bán của từng loại được tính = odQTY*pPrice)
select OD.o_id , O.o_date , OD.od_qty*P.p_pice AS total_price
from oder_detail OD 
inner join product P ON P.p_id = OD.p_id
inner join `order` O ON O.o_id = OD.o_id;


     
     
