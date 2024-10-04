use master
if exists (select * from sysdatabases where name = 'cnpm')
	drop database cnpm
go
create database cnpm
go
use cnpm
go
create table TaiKhoan(
    ID	    INT	identity (1,1)  NOT NULL primary key, 
    TenTK   NVARCHAR (50) not null,
    VaiTro  nvarchar (50) not null,
    MK      varCHAR (50) not null,
);

create table KhachHang (
    MaKH    int identity (1,1) not null primary key, 
    TenKH   nvarchar(50) not null,
    SDT     varchar(10) not null,
    Email   nvarchar(30),
    DiaChi  nvarchar (50) not null, 
);

create table LoaiSP(
    MaLoai  varchar(10) not null primary key,
    TenLoai nvarchar(50) not null,
);

create table SanPham(
    maloai  varchar(10) foreign key references LoaiSP not null,
    MaSP    varchar(50) not null primary key,
    TenSP   nvarchar(1000) not null,
    MoTa    nvarchar(4000),
	ChiTiet    nvarchar(4000),
	DiaChi    nvarchar(2000),
    GiaBan  float default 0 not null,
    Hinh    nvarchar(50),
);

create table HoaDon(
    MaHD        int identity (1,1) not null primary key,
    makh        int foreign key references KhachHang not null,
    NgayDat     date not null,
    NgayGiao    date not null,
    DiaChiGiao  nvarchar(50) not null,  
    TongTien    float default 0 not null,
    TinhTrang   nvarchar(50),
);

create table CTHD (
    mahd      int references HoaDon not null,
    masp      varchar (50) references SanPham not null,
    SoLuong   int not null,
    DonGia    float default 0 not null,
    ThanhTien float default 0 not null,
    primary key (mahd, masp)
);
use cnpm
ALTER TABLE KhachHang
		ADD tentk varchar(50), mk nvarchar(50)

use cnpm
--Tài khoản
insert into TaiKhoan(TenTK, VaiTro, MK) values ('quyen', N'Quản lý', 'quin887')
Insert into TaiKhoan values ('tuong', N'Nhân viên', '12345678')

--Khách hàng
Insert into KhachHang(TenKH, SDT, Email, DiaChi, mk)	
values (N'Nguyễn Minh Tú', '0908070605', 'minhtunguyen@gmail.com', N'TP HCM', '123456789')

--Loại SP
insert into LoaiSP (MaLoai, TenLoai) values ('at', N'Ẩm thực')
insert into LoaiSP values ('dl', N'Du lịch')
insert into LoaiSP values ('hs', N'Hotel & Resort')
insert into LoaiSP values ('spa', N'Spa & Làm đẹp')
insert into LoaiSP values ('gt', N'Giải trí & Thể thao')
insert into LoaiSP values ('nk', N'Nha khoa')

--Sản Phẩm
insert into SanPham (maloai, MaSP, TenSP, MoTa, chitiet, diachi, GiaBan, Hinh)
values ('dl','DL02', N'Tour Trekking Tà Đùng 2N2Đ - Thực Đơn Hấp Dẫn',
N'Tour Trekking Tà Đùng 2N2Đ - Du Sơn Ngoạn Thủy - Thực Đơn Hấp Dẫn. Voucher 5,900,000 VNĐ, Còn 2,690,000 VNĐ, Giảm 54%.', 
N'TOUR TREKKING TÀ ĐÙNG - DU SƠN NGOẠN THỦY - THỰC ĐƠN HẤP DẪN

Thời gian: 2 ngày 2 đêm

Khởi hành: Hàng ngày

 Lưu trú: Khách sạn Tà Đùng

Du lịch kết hợp trekking là một loại hình không mấy xa lạ đối với tín đồ du lịch Việt những năm gần đây. Có đến hàng chục cung trekking tại Việt Nam với những thử thách, độ khó, trải nghiệm khác nhau và điều ấy làm bạn băn khoăn không biết nên chọn như thế nào? Hãy đến với Tour trekking Tà Đùng 2N2Đ - Du sơn ngoạn thủy do Hải Đăng Travel tổ chức, đây chắc chắn sẽ là trải nghiệm tuyệt vời dành cho chính bạn.

Lịch trình tour:

ĐÊM NGÀY 1: TP. HCM - TÀ ĐÙNG

21h00: Hướng dẫn viên Haidang Travel đón quý khách tại điểm hẹn. Rời Tp.Hồ Chí Minh theo QL14 đi Tà Đùng. Trên xe HDV chia sẽ cho quý khách những lưu ý cũng như những kỹ năng cơ bản khi tham gia trekking.

Đoàn tự do nghỉ đêm trên xe.
',
N'367 Tân Sơn, P.15, Q.Tân Bình, TP HCM',
2690000, 'tadung.jpg')

Insert into SanPham (maloai, MaSP, TenSP, MoTa, chitiet, diachi, GiaBan, Hinh)
values ('at','AT01',N'Hotel Nikko Saigon - Buffet Hải Sản Tôm Hùm Cao Cấp',
N'Hotel Nikko Saigon - Buffet Hải Sản Tôm Hùm Cao Cấp. Voucher 1,906,000 VNĐ, Còn 1,582,000 VNĐ, Giảm 17%. Chỉ Có Tại Hotdeal.vn!',
N'Bữa tiệc buffet tối tại nhà hàng La Brasserie - Hotel Nikko Saigon 5* nuông chiều các giác quan thực khách với những món ngon tuyệt đỉnh, đặc biệt là các loại hải sản thượng hạng như tôm hùm, hàu Nhật, cua, vẹm xanh... Các món ăn được chế biến và thay đổi mỗi ngày, bạn sẽ luôn tìm thấy sự mới mẻ trong ẩm thực tại La Brasserie.
Hải sản phong phú, thượng hạng

Bữa tiệc buffet tại La Brasserie phục vụ phong phú các loại hải sản cao cấp như tôm hùm, cua tuyết, bào ngư, súp vi cá, hàu Nhật nguyên vỏ Hyogo, vẹm xanh, các loại sò... ', 
N'235 Nguyễn Văn Cừ, Phường Nguyễn Cư Trinh, Quận 1, Tp.HCM',
650000, 'buffet.jpg')

Insert into SanPham (maloai, MaSP, TenSP, MoTa, chitiet, diachi, GiaBan, Hinh)
    values ('at','AT02',N'Viễn Đông - Buffet Chay Trưa/ Tối Mùa Vu Lan Hơn 40 Món',
	N'Viễn Đông - Buffet Trưa Tinh Hoa Những Món Chay. Voucher 189,000 VNĐ, Còn 160,000 VNĐ, Giảm 15%. Chỉ Có Tại Hotdeal.vn!', 
	N'Thực đơn buffet phong phú, đa dạng

Viễn Đông Hotel mang đến cho thực khách một thực đơn chay hoành tráng với hơn 40 món ăn được chế biến đa đạng, cầu kỳ, đầy màu sắc, ngon miệng và dinh dưỡng',
	N'Viễn Đông Hotel - 275A Phạm Ngũ Lão, Phường Phạm Ngũ Lão, Quận 1, Tp.HCM',
	160000, 'chay.jpg')

Insert into SanPham (maloai, MaSP, TenSP, MoTa, chitiet, diachi, GiaBan, Hinh)
    values ('gt','GT01',N'KVC Dream Kids Gigamall - Combo Ăn Uống No Say, Bé Chơi Cả Ngày',
	N'KVC Dream Kids Gigamall - Combo Ăn Uống No Say, Bé Chơi Cả Ngày. Voucher 180,000 VNĐ, Còn 99,000 VNĐ, Giảm 45%. Chỉ Có Tại Hotdeal.vn!',
	N'Dream Kids - Khu vui chơi giáo dục tiên tiến theo tiêu chuẩn Nhật Bản duy nhất tại Việt Nam nay đã có mặt tại Gigamall - trung tâm thương mại kiểu mới, kết hợp giữa trải nghiệm mua sắm và hoạt động giải trí với quy mô “khủng” tại TP. Hồ Chí Minh. Đến với Dream Kids, các bé sẽ được thỏa thích vui đùa với nhiều trò chơi hấp dẫn giúp các bé phát huy sức sáng tạo cũng như được tận hưởng những giờ phút thư giãn thoải mái sau những giờ phút học hành căng thẳng. Voucher lần này áp dụng cho Combo "Ăn uống no say, bé chơi cả ngày, học nhiều điều hay" tại khu vui chơi Dream Kids Gigamall bao gồm như sau:

+ Vé vào cổng tham gia tất cả các trò chơi cho bé & kèm 01 người lớn

+ Combo ăn no say gồm: 01 Phần xúc xích + 01 Ly Pepsi tươi

+ 01 Vé chơi tô tượng size lớn (Size XL) cho bé.
Dream Kids kiến tạo nên một không gian vui chơi bổ ích và hấp dẫn dành cho các bé với tiêu chí "An toàn - An tâm - Sạch sẽ". Đến với Dream Kids, các bé sẽ được thỏa thích vui đùa với nhiều trò chơi hấp dẫn giúp các bé phát huy sức sáng tạo cũng như được tận hưởng những giờ phút thư giãn thoải mái sau những giờ phút học hành căng thẳng.', 
	N'Tầng 3, Tòa nhà Gigamall, 240 - 242 Phạm Văn Đồng, Phường Hiệp Bình Chánh, TP.Thủ Đức',
	99000, 'gigamall.jpg')

Insert into SanPham (maloai, MaSP, TenSP, MoTa, chitiet, diachi, GiaBan, Hinh)
    values ('spa','SPA01',N'Haan Beauty & Spa - Triệt Lông Diode Laser - 15 Lần + BH 5 Năm', 
	N'Haan Beauty & Spa - Triệt Lông Diode Laser - 15 Lần + BH 5 Năm. Voucher 4,000,000 VNĐ, Còn 179,000 VNĐ, Giảm 96%. Chỉ Có Tại Hotdeal.vn!',
	N'Haan Beauty Spa sử dụng công nghệ triệt lông vĩnh viễn Diode Laser mới nhất 2023, phù hợp cho mọi đối tượng nam nữ, dùng được cho nhiều vùng da trên cơ thể, hiệu quả lên cả những sợi lông mảnh hoặc cứng. Đối với những khách hàng từng triệt lông thất bại, đến với Haan Beauty Spa bạn sẽ được có kết quả như ý.',
	N'Lầu 1 - 601B Cách Mạng Tháng Tám, Phường 15, Quận 10',
	 180000, 'haanspa.jpg')

Insert into SanPham (maloai, MaSP, TenSP, MoTa, chitiet, diachi, GiaBan, Hinh)
    values ('spa','LD01',N'E.B.L Beauty Salon Hàn Quốc - Trọn Gói Làm Tóc Cao Cấp',
	N'E.B.L Beauty Salon Hàn Quốc - Trọn Gói Làm Tóc Cao Cấp. Voucher 840,000 VNĐ, Còn 319,000 VNĐ, Giảm 62%. Chỉ Có Tại Hotdeal.vn!',
	N'Với những bạn trẻ yêu thời trang, ngoài việc trau chuốt cho mình bằng những bộ trang phục đẹp thì việc sở hữu một mái tóc sành điệu, hiện đại cũng là điều rất được quan tâm. Nếu là bạn trẻ năng động, sáng tạo hẳn bạn sẽ không ngần ngại khi "thử nghiệm" mình với những kiểu tóc mới? Hãy đến với Hệ thống E.B.L Beauty Salon, bạn sẽ có những cuộc "phiêu lưu" thật thú vị cho mái tóc nhưng lại rất an toàn với đội ngũ thợ dày dạn kinh nghiệm.',
	N'14 Đường Số 8 - Hà Đô Centrosa Garden - 118 Ba Tháng Hai, Phường 12, Quận 10',
	 320000, 'hair.jpg')

Insert into SanPham (maloai, MaSP, TenSP, MoTa, chitiet, diachi, GiaBan, Hinh)
    values ('nk','NK01',N'Nha Khoa Kim Long - Răng Toàn Sứ Zirconia - Bảo Hành Trọn Đời',
	N'Nha Khoa Kim Long - Răng Toàn Sứ Zirconia - Bảo Hành Trọn Đời. Voucher 3,000,000 VNĐ, Còn 1,190,000 VNĐ, Giảm 60%. Chỉ Có Tại Hotdeal.vn!',
	N'Răng toàn sứ Zirconia được chế tác từ chất liệu Zirconia, với những điểm nổi bật như: độ bền cao, chịu lực tốt và không bị mài mòn trong môi trường có tính axit cao như khoang miệng. Đồng thời, răng sứ được làm từ Zirconia có màu trắng, trong tự nhiên, mang lại tính thẩm mỹ cao. Răng sứ Zirconia có nguồn gốc từ nước Đức. Ngoài ra, răng sứ Zirconia có tính tương hợp sinh học tốt và không gây ra các biến chứng hay tác dụng phụ cho cơ thể.',
	N'257 Tân Sơn Nhì, Phường Tân Sơn Nhì, Quận Tân Phú, TPHCM',
	 1190000, 'nhakhoa.jpg')

Insert into SanPham (maloai, MaSP, TenSP, MoTa, chitiet, diachi, GiaBan, Hinh)
    values ('spa','SPA02',N'Spa Nhân Tâm - Massage Body/ Foot/ Gội Đầu Dưỡng Sinh 100’',
	N'Trong thời đại ngập tràn áp lực và cuộc sống bận rộn, việc chăm sóc sức khỏe dưỡng sinh đều đặn đã trở thành một phương pháp không thể thiếu để duy trì sự cân bằng và tận hưởng cuộc sống. 
Và Spa Nhân Tâm hiểu rằng sức khỏe là tài sản quý giá nhất mà bạn có thể đầu tư.
Vì vậy, trong lần hợp tác với Hotdeal, Spa Nhân Tâm mang đến cho Quý khách hàng các dịch vụ Massage body/ Massage foot/ Gội đầu dưỡng sinh, giúp bạn tìm lại sự cân bằng trong cuộc sống và mang lại nhiều lợi ích to lớn cho sức khỏe và tinh thần',
	N'113 Bùi Thị Xuân, Phường Phạm Ngũ Lão, Quận 1',
	N'Spa Nhân Tâm - Massage Body/ Foot/ Gội Đầu Dưỡng Sinh 100’. Voucher 480,000 VNĐ, Còn 119,000 VNĐ, Giảm 75%. Chỉ Có Tại Hotdeal.vn!',
	120000, 'spanhantam.jpg')

select * from SanPham
select * from KhachHang
select * from TaiKhoan
