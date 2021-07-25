use khu_nghi_duong_furama;
-- task 6 Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ 
-- chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
select I.id_dich_vu , I.ten_dich_vu , I.dien_tich ,I.chi_phi_thue,L.ten_loai_dich_vu ,N.ngay_lam_hop_dong 
from dich_vu I  
inner join loai_dich_vu L on I.id_loai_dich_vu = L.id_loai_dich_vu
inner join hop_dong N on N.id_dich_vu = I.id_dich_vu
where not (year(ngay_lam_hop_dong)= 2019 and month(ngay_lam_hop_dong) between 1 and 3);

-- task7 Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại
--  dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.

select I.id_dich_vu , I.ten_dich_vu , I.dien_tich ,I.so_nguoi_toi_da,I.chi_phi_thue,L.ten_loai_dich_vu,N.ngay_lam_hop_dong 
from dich_vu I 
inner join loai_dich_vu L on I.id_loai_dich_vu = L.id_loai_dich_vu
inner join hop_dong N on N.id_dich_vu = I.id_dich_vu
where year(ngay_lam_hop_dong)= 2018 and year(ngay_lam_hop_dong) <> 2019;
-- task 8 Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- c1 
select distinct ho_ten_kh 
from khach_hang;
-- c2
select ho_ten_kh
from khach_hang
union 
select ho_ten_kh
from khach_hang;
-- c3
select ho_ten_kh
from khach_hang
group by ho_ten_kh;
--  task 9 Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có 
--  bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as thang , count(id_hop_dong) as so_don_dat_phong
from hop_dong 
where year(ngay_lam_hop_dong)='2019'
group by month(ngay_lam_hop_dong);
-- task 10 Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả 
-- hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
-- (được tính dựa trên việc count các IDHopDongChiTiet).
select H.id_hop_dong , H.ngay_lam_hop_dong , H.ngay_ket_thuc, H.tien_dat_coc,D.so_luong ,count(id_hdct) as 'so luong dvdk'
from hop_dong H 
inner join hop_dong_chi_tiet D  on H.id_hop_dong = D.id_hop_dong
group by id_hop_dong;

-- task 11 Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang
--  là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
select  T.ten_dich_vu_di_kem,T.id_dich_vu_di_kem 
from dich_vu_di_kem T 
inner join hop_dong_chi_tiet HD on HD.id_dich_vu_di_kem = T.id_dich_vu_di_kem
inner join hop_dong H on H.id_hop_dong = HD.id_hop_dong
inner join khach_hang K on K.id_khach_hang = H.id_khach_hang
inner join loai_khach L on K.id_loai_khach= L.id_loai_khach
where L.ten_loai_khach = 'diamond' and (K.dia_chi_kh = 'quang ngai'or K.dia_chi_kh ='vinh');

-- task 12 Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem
--  (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt
--  vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019
select H.id_hop_dong, T.ho_ten , K.ho_ten_kh,K.sdt_kh , DV.ten_dich_vu ,HDCT.so_luong,H.ngay_lam_hop_dong,H.tien_dat_coc
from nhan_vien T
inner join hop_dong H on T.id_nhan_vien = H.id_nhan_vien
inner join khach_hang K on H.id_khach_hang = K.id_khach_hang
inner join dich_vu DV on H.id_dich_vu = DV.id_dich_vu
inner join hop_dong_chi_tiet HDCT on HDCT.id_hop_dong = H.id_hop_dong
where month(ngay_lam_hop_dong) between 10 and 12 ;
-- task 13 Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
--  (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select DK.id_dich_vu_di_kem , DK.ten_dich_vu_di_kem, DK.gia_dich_vu_di_kem ,DK.don_vi, sum(HT.so_luong) as so_lan_su_dung
from hop_dong_chi_tiet HT
inner join dich_vu_di_kem DK on DK.id_dich_vu_di_kem = HT.id_dich_vu_di_kem
group by HT.id_dich_vu_di_kem
having sum(HT.so_luong) >= all(select sum(so_luong) from hop_dong_chi_tiet group by id_dich_vu_di_kem);
-- task 14 
-- Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
select H.id_hop_dong , TV.ten_loai_dich_vu , TK.ten_dich_vu_di_kem , count(HT.so_luong) as so_lan_su_dung
from hop_dong H
inner join dich_vu D on H.id_dich_vu = D.id_dich_vu 
inner join loai_dich_vu TV on D.id_loai_dich_vu = TV.id_loai_dich_vu
inner join hop_dong_chi_tiet HT on HT.id_hop_dong = HT.id_hop_dong
inner join dich_vu_di_kem TK on HT.id_dich_vu_di_kem = TK.id_dich_vu_di_kem
group by Tk.id_dich_vu_di_kem
having count(HT.so_luong) = 1;

-- task 15 Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, 
-- SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.
select I.id_nhan_vien , I.ho_ten, I.id_trinh_do, I.id_bo_phan,I.sdt_nv , I.dia_chi_nv ,count(HD.ngay_lam_hop_dong) as so_hop_dong
from nhan_vien I 
inner join hop_dong HD on I.id_nhan_vien = HD.id_nhan_vien
where year (HD.ngay_lam_hop_dong) in (2018,2019)
group by HD.id_nhan_vien
having count(HD.ngay_lam_hop_dong) <= 3;


 






















