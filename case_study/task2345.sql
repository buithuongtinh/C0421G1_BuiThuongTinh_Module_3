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
and dia_chi_kh in ('da nang','quang tri');

-- task 4 Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
--  Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
--  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select I.id_khach_hang, I.ho_ten_kh, count(H.id_hop_dong)
from khach_hang I 
inner join hop_dong H on I.id_khach_hang = H.id_khach_hang
where id_loai_khach= 1
group by H.id_khach_hang
order by count(H.id_hop_dong) asc;
-- task5
-- Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
-- (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem)
--  cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select I.id_khach_hang ,I.ho_ten_kh,T.ten_loai_khach,H.id_hop_dong,D.ten_dich_vu,H.ngay_lam_hop_dong,H.ngay_ket_thuc, sum(chi_phi_thue + DVDK.gia_dich_vu_di_kem* HDCT.so_luong ) as tongtien
from khach_hang I 
left join loai_khach T on I.id_loai_khach = T.id_loai_khach
left join hop_dong H on I.id_khach_hang = H.id_khach_hang
left join dich_vu D on H.id_dich_vu = D.id_dich_vu
left join hop_dong_chi_tiet HDCT on H.id_hop_dong = HDCT.id_hop_dong
left join dich_vu_di_kem DVDK on HDCT.id_dich_vu_di_kem =HDCT.id_dich_vu_di_kem
group by id_khach_hang;















