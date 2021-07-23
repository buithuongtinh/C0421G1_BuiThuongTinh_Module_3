use khu_nghi_duong_furama;
-- task 2
select *
from nhan_vien
where ho_ten like 'h%' and length(ho_ten) <= 15;

-- task 3
select*
from khach_hang
where ngay_sinh_kh BETWEEN 
CURDATE() - INTERVAL 50 YEAR 
AND CURDATE() - INTERVAL 18 YEAR 
-- having dia_chi_kh in 'da nang' or 'quang tri';
