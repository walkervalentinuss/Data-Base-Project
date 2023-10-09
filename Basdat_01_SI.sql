--I Create Database dan Table
Create database Basdat2022_01_SI
Use Basdat2022_01_SI

Create table Asrama
(Nama_Asrama	varchar(30) not null,
 Lokasi			varchar(20)	not null,
 Primary Key (Nama_Asrama)
);

Create table Keasramaan
(NIP_K				char(9) not null,
 Nama_Keasramaan	varchar(30) not null,
 Email_Keasramaan	varchar(20) not null,
 Nama_Asrama		varchar(30) not null,
 Primary Key (NIP_K),
 Foreign Key (Nama_Asrama)
 References Asrama(Nama_Asrama)
);

Create table Telepon_Keasramaan
(NIP_K		char(9) not null,
 no_telp	varchar(30),
 Foreign key (NIP_K)
 References Keasramaan(NIP_K)
);

Create table Dosen_MK
(NIDN_M			varchar(20) not null,
 Nama_MK		varchar(20) not null,
 Email_dosenMK	varchar(20) not null,
 Primary Key (NIDN_M)
);

Create table Kelas
(no_ruangan varchar(20) not null,
 prodi		varchar(20) not null,
 angkatan	int not null,
 NIDN_M		varchar(20) not null,
 Primary Key (no_ruangan),
 Foreign Key (NIDN_M)
 References Dosen_MK(NIDN_M)
);


Create table Dosen_Wali
(NIDN_W		char(10) not null,
 Nama_Wali	varchar(20) not null,
 Email_Wali	varchar(20) not null,
 Primary key (NIDN_W)
);

Create table Mahasiswa 
(NIM			char(8) not null,
 Nama_Mahasiswa	varchar(50) not null,
 Prodi			varchar(20) not null,
 Email			varchar(50) not null,
 Gender			varchar(10) not null,
 Nama_Asrama	varchar(30) not null,
 no_ruangan		varchar(20) not null,
 NIDN_W			char(10) not null,
 Primary key (NIM),
 Foreign key (Nama_Asrama)
 References Asrama(Nama_Asrama),
 Foreign key (no_ruangan)
 References Kelas(no_ruangan),
 Foreign key (NIDN_W)
 References Dosen_Wali(NIDN_W)
);


Create table BAAK
(NIP_B		char(10) not null,
 Nama_BAAK	varchar(30) not null,
 fakultas	varchar(20) not null,
 Primary key (NIP_B)
);

Create table Izin_Keluar
(id_suratIK			varchar(20) not null,
 NIM				char(8) not null,
 tgl_berangkat		date not null,
 tgl_kembali		date not null,
 tujuan				varchar(20) not null,
 alasan				varchar(20) not null,
 status_req			varchar(20) not null,
 NIDN_W				char(10) not null,
 NIP_K				char(9) not null,
 NIP_B				char(10) not null,
 Primary key (id_SuratIK),
 Foreign key (NIDN_W)
 References Dosen_Wali(NIDN_W),
 Foreign key (NIP_K)
 References Keasramaan(NIP_K),
 Foreign key (NIP_B)
 References BAAK(NIP_B),
 Foreign key (NIM)
 References Mahasiswa(NIM)
);


Create table Izin_Bermalam
(id_suratIB		varchar(20) not null,
 NIM			char(8) not null,
 tgl_berangkat	date not null,
 tgl_kembali	date not null,
 tujuan			varchar(20) not null,
 alasan			varchar(20) not null,
 status_req		varchar(20) not null,
 NIP_K			char(9) not null,
 Primary key (id_suratIB),
 Foreign key (NIM)
 References Mahasiswa(NIM),
 Foreign key (NIP_K)
 References Keasramaan(NIP_K)
);

Create table Izin_Tidak_Kuliah
(kode_izin		varchar(20) not null, 
 tgl_berangkat	date not null,
 tgl_kembali	date not null,
 tujuan			varchar(20) not null,
 alasan			varchar(20) not null, 
 status_req		varchar(20) not null,
 NIDN_M			varchar(20) not null,
 NIDN_W			char(10) not null,
 NIP_B			char(10) not null,
 NIM			char(8) not null,
 Primary key (kode_izin),
 Foreign key (NIM)
 References Mahasiswa(NIM),
 Foreign key (NIDN_W)
 References Dosen_Wali(NIDN_W),
 Foreign key (NIP_B)
 References BAAK(NIP_B),
 Foreign key (NIM)
 References Mahasiswa(NIM)
);

--II Basic SQL query

--insert values to asrama
Insert into Asrama(Nama_Asrama, Lokasi)
values('Mahanaim', 'Jl. Arjuna');
Insert into Asrama(Nama_Asrama, Lokasi)
values('Mamre', 'Jl. Radio');
Insert into Asrama(Nama_Asrama, Lokasi)
values('Nazareth', 'Jl. Radio');
Insert into Asrama(Nama_Asrama, Lokasi)
values('Silo', 'Jl. Koran');
Insert into Asrama(Nama_Asrama, Lokasi)
values('Kapernaum', 'Jl. Radio');

--insert values to keasramaan
Insert into Keasramaan(NIP_K, Nama_Keasramaan, Email_Keasramaan, Nama_Asrama)
values('M01', 'Timur', 'timur@gmail.com', 'Mahanaim');
Insert into Keasramaan(NIP_K, Nama_Keasramaan, Email_Keasramaan, Nama_Asrama)
values('M02', 'Elsa', 'elsa@gmail.com', 'Mamre');
Insert into Keasramaan(NIP_K, Nama_Keasramaan, Email_Keasramaan, Nama_Asrama)
values('M03', 'Josua', 'josua@gmail.com', 'Nazareth');
Insert into Keasramaan(NIP_K, Nama_Keasramaan, Email_Keasramaan, Nama_Asrama)
values('M04', 'Josi', 'josi@gmail.com', 'Silo');
Insert into Keasramaan(NIP_K, Nama_Keasramaan, Email_Keasramaan, Nama_Asrama)
values('M05', 'Herlin', 'herlin@gmail.com', 'Kapernaum');


--insert values to Telepon_Keasramaan
Insert into Telepon_Keasramaan(NIP_K, no_telp)
values('M01', '81209283712');
Insert into Telepon_Keasramaan(NIP_K, no_telp)
values('M02', '81234671234');
Insert into Telepon_Keasramaan(NIP_K, no_telp)
values('M03', '82176385612');
Insert into Telepon_Keasramaan(NIP_K, no_telp)
values('M04', '81871267814');
Insert into Telepon_Keasramaan(NIP_K, no_telp)
values('M05', '78181231271');

--insert values to Dosen_MK
Insert into Dosen_MK(NIDN_M, Nama_MK, Email_dosenMK)
values('K01', 'Mario', 'mario@del.ac.id');
Insert into Dosen_MK(NIDN_M, Nama_MK, Email_dosenMK)
values('K02', 'Asido', 'saragih.asido@del.ig');
Insert into Dosen_MK(NIDN_M, Nama_MK, Email_dosenMK)
values('K03', 'Junita Amalia', 'junitaamalia@del.id');
Insert into Dosen_MK(NIDN_M, Nama_MK, Email_dosenMK)
values('K04', 'Sahat', 'sahat@del.ac.id');
Insert into Dosen_MK(NIDN_M, Nama_MK, Email_dosenMK)
values('K05', 'Tennov', 'tennov@del.ac.id');

--insert values to Kelas
Insert into Kelas(no_ruangan, prodi, angkatan, NIDN_M)
values('SI1', 'Sistem Informasi', '2021', 'K01');
Insert into Kelas(no_ruangan, prodi, angkatan, NIDN_M)
values('IF1', 'Informatika', '2021', 'K02');
Insert into Kelas(no_ruangan, prodi, angkatan, NIDN_M)
values('BP', 'Bioproses', '2021', 'K03');
Insert into Kelas(no_ruangan, prodi, angkatan, NIDN_M)
values('MR1', 'Management Rekayasa', '2021', 'K04');
Insert into Kelas(no_ruangan, prodi, angkatan, NIDN_M)
values('TI1', 'Teknologi Informasi', '2021', 'K05');

--insert values to Dosen_Wali
Insert into Dosen_Wali(NIDN_W, Nama_Wali, Email_Wali)
values('W01', 'Parmonangan', 'parmonangan@del.id');
Insert into Dosen_Wali(NIDN_W, Nama_Wali, Email_Wali)
values('W02', 'Eka', 'eka@del.ac.id');
Insert into Dosen_Wali(NIDN_W, Nama_Wali, Email_Wali)
values('W03', 'Samuel', 'samuel@del.ac.id');
Insert into Dosen_Wali(NIDN_W, Nama_Wali, Email_Wali)
values('W04', 'Sari', 'sari@del.ac.id');
Insert into Dosen_Wali(NIDN_W, Nama_Wali, Email_Wali)
values('W05', 'Tiurma', 'tiurma@del.ac.id');

--insert values to Mahasiswa
Insert into Mahasiswa(NIM, Nama_Mahasiswa, Prodi, Email, Gender, Nama_Asrama, no_ruangan, NIDN_W)
values ('12S21050', 'Gabe', 'Sistem Informasi', 'Gabe@gmail.com', 'Pria', 'Mahanaim', 'SI1', 'W01');
Insert into Mahasiswa(NIM, Nama_Mahasiswa, Prodi, Email, Gender, Nama_Asrama, no_ruangan, NIDN_W)
values ('11S21051', 'Samsudin', 'Informatika', 'Samsud@gmail.com', 'Pria', 'Mahanaim', 'IF1', 'W02');
Insert into Mahasiswa(NIM, Nama_Mahasiswa, Prodi, Email, Gender, Nama_Asrama, no_ruangan, NIDN_W)
values ('13S21052', 'Bastian', 'Sistem Informasi', 'Babas@gmail.com', 'Pria', 'Mahanaim', 'BP', 'W03');
Insert into Mahasiswa(NIM, Nama_Mahasiswa, Prodi, Email, Gender, Nama_Asrama, no_ruangan, NIDN_W)
values ('21S21053', 'Sela', 'Sistem Informasi', 'Sela@gmail.com', 'Wanita', 'Mamre', 'SI1', 'W04');
Insert into Mahasiswa(NIM, Nama_Mahasiswa, Prodi, Email, Gender, Nama_Asrama, no_ruangan, NIDN_W)
values ('12S21054', 'Ros', 'Sistem Informasi', 'Ros@gmail.com', 'Wanita', 'Mamre', 'SI1', 'W05');

--insert values to BAAK
Insert into BAAK(NIP_B, Nama_BAAK, fakultas)
values('B01', 'Oka', 'FITE');
Insert into BAAK(NIP_B, Nama_BAAK, fakultas)
values('B02', 'Januar', 'FTI');
Insert into BAAK(NIP_B, Nama_BAAK, fakultas)
values('B03', 'August', 'VOKASI');
Insert into BAAK(NIP_B, Nama_BAAK, fakultas)
values('B04', 'Lukas', 'BIOTEKNOLOGI');
Insert into BAAK(NIP_B, Nama_BAAK, fakultas)
values('B05', 'Josep', 'FITE');

--insert values to Izin_Keluar
Insert into Izin_Keluar(id_suratIK, NIM, tgl_berangkat,tgl_kembali, tujuan, alasan, status_req, NIDN_W, NIP_K, NIP_B)
values('SK01', '12S21050', '11-12-2022', '11-12-2022', 'Balige', 'Pergi ke Bank', 'Disetujui', 'W01', 'M01', 'B01');
Insert into Izin_Keluar(id_suratIK, NIM, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIDN_W, NIP_K, NIP_B)
values('SK02', '11S21051', '11-12-2022', '11-12-2022', 'Parapat', 'Pulang ke rumah', 'Tidak Disetujui', 'W02', 'M01', 'B01');
Insert into Izin_Keluar(id_suratIK, NIM, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIDN_W, NIP_K, NIP_B)
values('SK03', '13S21052', '12-12-2022', '12-12-2022', 'Siantar', 'Kontrol Gigi', 'Disetujui', 'W03', 'M01', 'B01');
Insert into Izin_Keluar(id_suratIK, NIM, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIDN_W, NIP_K, NIP_B)
values('SK04', '21S21053', '12-12-2022', '12-12-2022', 'Balige', 'Acara Keluarga', 'Tidak Disetujui', 'W04', 'M02', 'B05');
Insert into Izin_Keluar(id_suratIK, NIM, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIDN_W, NIP_K, NIP_B)
values('SK05', '12S21054', '11-12-2022', '11-12-2022', 'Balige', 'Periksa Mata', 'Disetujui', 'W05', 'M02', 'B05');

--insert values to Izin_Bermalam
Insert into Izin_Bermalam(id_suratIB, NIM, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIP_K)
values('SB01', '12S21050', '2022-12-11', '2022-12-14', 'Balige', 'Pulang ke rumah', 'Disetujui', 'M01');
Insert into Izin_Bermalam(id_suratIB, NIM, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIP_K)
values('SB02', '11S21051', '2022-12-11', '2022-12-14', 'Medan', 'Pulang ke rumah', 'Tidak Disetujui', 'M01');
Insert into Izin_Bermalam(id_suratIB, NIM, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIP_K)
values('SB03', '13S21052', '2022-12-12', '2022-12-16', 'Siantar', 'Kontrol Gigi', 'Disetujui', 'M01');
Insert into Izin_Bermalam(id_suratIB, NIM, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIP_K)
values('SB04', '21S21053', '2022-12-12', '2022-12-14', 'Balige', 'Acara Keluarga', 'Tidak Disetujui', 'M02');
Insert into Izin_Bermalam(id_suratIB, NIM, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIP_K)
values('SB05', '12S21054', '2022-12-11', '2022-12-13', 'Tarutung', 'Periksa Mata', 'Disetujui', 'M02');

--insert values to Izin_Tidak_Kuliah
Insert into Izin_Tidak_Kuliah(kode_izin, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIDN_M, NIDN_W, NIP_B, NIM)
values('TK01', '11-12-2022', '11-12-2022', 'Balige', 'Pergi ke Bank', 'Disetujui', 'K01', 'W01', 'B01', '12S21050');
Insert into Izin_Tidak_Kuliah(kode_izin, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIDN_M, NIDN_W, NIP_B, NIM)
values('TK02', '11-12-2022', '11-12-2022',	'Parapat', 'Pulang Ke rumah', 'Tidak Disetujui', 'K02',	'W02', 'B01', '11S21051');
Insert into Izin_Tidak_Kuliah(kode_izin, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIDN_M, NIDN_W, NIP_B, NIM)
values('TK03', '12-12-2022', '12-12-2022',	'Siantar', 'Kontrol Gigi', 'Disetujui', 'K03',	'W03', 'B01', '13S21052');
Insert into Izin_Tidak_Kuliah(kode_izin, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIDN_M, NIDN_W, NIP_B, NIM)
values('TK04', '12-12-2022', '12-12-2022',	'Balige', 'Acara Keluarga', 'Tidak Disetujui', 'K04', 'W04', 'B05', '21S21053');
Insert into Izin_Tidak_Kuliah(kode_izin, tgl_berangkat, tgl_kembali, tujuan, alasan, status_req, NIDN_M, NIDN_W, NIP_B, NIM)
values('TK05', '11-12-2022', '11-12-2022',	'Balige', 'Periksa Mata', 'Disetujui', 'K05',	'W05', 'B05', '12S21054');

--a) membuat query untuk menampilkan semua data di tabel yang ada di database

Select * From Asrama;
Select * From Keasramaan;
Select * From Telepon_Keasramaan;
Select * From Dosen_MK;
Select * From Kelas;
Select * From Dosen_Wali;
Select * From Mahasiswa;
Select * From BAAK;
Select * From Izin_Keluar;
Select * From Izin_Bermalam;
Select * From Izin_Tidak_Kuliah;

--b) membuat query untuk mengupdate status dari request pada tabel izin_keluar
Update Izin_Keluar
SET status_req = 'Disetujui'
WHERE id_suratIK = 'SK02';

--c) membuat query untuk menampilkan data mahasiswa yang memiliki status request IB Disetujui
SELECT status_req AS status, id_suratIB AS nomor_surat, NIM
from Izin_Bermalam
WHERE status_req LIKE 'D_%';

--d) Menampilkan data surat dari surat IB yang tanggal kembalinya di bawah tanggal 12 atau yang suratnya disetujui
Select id_suratIB, NIM, status_req, tgl_kembali
from Izin_Bermalam
where tgl_kembali < '2022-12-12' OR status_req = 'Disetujui';

--e) menghitung jumlah mahasiswa di setiap rodi 
Select prodi, count(*) as jumlah 
from Mahasiswa
group by prodi;

--III Querying Multiple Tables, Implementing Views
--a) Menampilkan data mahasiswa yang berjenis kelamin pria dan memiliki ruangan SI1
Select Mahasiswa.NIM, Mahasiswa.Nama_Mahasiswa, Mahasiswa.Gender, Dosen_Wali.Nama_Wali
from Mahasiswa, Dosen_Wali
where Mahasiswa.NIDN_W = Dosen_Wali.NIDN_W AND Mahasiswa.no_ruangan = 'SI1';

--b) Menggabungkan tabel keasramaan dan telepon keasramaan
Select Keasramaan.Nama_Keasramaan AS 'Nama', Keasramaan.NIP_K, Keasramaan.Email_Keasramaan, Keasramaan.Nama_Asrama, Telepon_Keasramaan.no_telp
from Keasramaan, Telepon_Keasramaan
Where Keasramaan.NIP_K = Telepon_Keasramaan.NIP_K;

--c) Menampilkan permintaan izin bermalam mahasiswa
Select Mahasiswa.Nama_Mahasiswa, Mahasiswa.NIM, Izin_Bermalam.tgl_berangkat, Izin_Bermalam.tgl_kembali, Izin_Bermalam.status_req
from Mahasiswa, Izin_Bermalam
where Izin_Bermalam.NIM = Mahasiswa.NIM;

--d) Menggabungkan tabel mahasiswa dengan dosen wali untuk menampilkan data mahasiswa dan dosen walinya dalam satu tabel
Select Mahasiswa.Nama_Mahasiswa, Mahasiswa.NIM, Dosen_Wali.Nama_Wali
from Mahasiswa JOIN Dosen_Wali ON Mahasiswa.NIDN_W = Dosen_Wali.NIDN_W

--e) Menggabungkan tabel izin tidak kuliah dan mahasiswa menggunakan left outer join untuk menampilkan data mahasiswa yang status request itk nya sudah disetujui dan tidak kembali pada tanggal 11
Select Izin_Tidak_Kuliah.status_req, Izin_Tidak_Kuliah.NIDN_W, Izin_Tidak_Kuliah.NIM, Mahasiswa.Nama_Mahasiswa
from Izin_Tidak_Kuliah LEFT OUTER JOIN Mahasiswa
ON Izin_Tidak_Kuliah.NIM = Mahasiswa.NIM
where Izin_Tidak_Kuliah.status_req = 'Disetujui' AND tgl_kembali < '12-13-2022';

--Create View
Create View Mahasiswa_View
AS
Select Mahasiswa.NIM, Mahasiswa.Nama_Mahasiswa, Mahasiswa.Gender, Dosen_Wali.Nama_Wali
from Mahasiswa, Dosen_Wali
where Mahasiswa.NIDN_W = Dosen_Wali.NIDN_W AND Mahasiswa.no_ruangan = 'SI1';

Create View TeleponKeasramaanView
AS
Select Keasramaan.Nama_Keasramaan AS 'Nama', Keasramaan.NIP_K, Keasramaan.Email_Keasramaan, Keasramaan.Nama_Asrama, Telepon_Keasramaan.no_telp
from Keasramaan, Telepon_Keasramaan
Where Keasramaan.NIP_K = Telepon_Keasramaan.NIP_K;

Create View IBView
AS
Select Mahasiswa.Nama_Mahasiswa, Mahasiswa.NIM, Izin_Bermalam.tgl_berangkat, Izin_Bermalam.tgl_kembali, Izin_Bermalam.status_req
from Mahasiswa, Izin_Bermalam
where Izin_Bermalam.NIM = Mahasiswa.NIM;

Create View DosenWaliMahasiswa
AS
Select Mahasiswa.Nama_Mahasiswa, Dosen_Wali.Nama_Wali
from Mahasiswa, Dosen_Wali
where Dosen_Wali.NIDN_W = Mahasiswa.NIDN_W;

Create View ITKdisetujuiView
AS
Select Izin_Tidak_Kuliah.status_req, Izin_Tidak_Kuliah.NIDN_W, Izin_Tidak_Kuliah.NIM, Mahasiswa.Nama_Mahasiswa
from Izin_Tidak_Kuliah LEFT OUTER JOIN Mahasiswa
ON Izin_Tidak_Kuliah.NIM = Mahasiswa.NIM
where Izin_Tidak_Kuliah.status_req = 'Disetujui' AND tgl_kembali < '12-13-2022';

--IV Function and Stored Procedure
--a)Membuat fungsi untuk mengecek apakah nama yang diberikan ada atau tidak pada tabel mahasiswa
Create Function DaftarMahasiswa (@Nama varchar(30))
Returns varchar(50)
AS
Begin
	Declare @out varchar(50)
	If EXISTS (Select Nama_Mahasiswa From Mahasiswa Where Nama_Mahasiswa = @Nama)
	Begin
		set @out = 'Ada' + @Nama + 'di mahasiswa'
	End
	Else
	Begin
		set @out = 'Tidak ada' + @Nama + 'di mahasiswa'
	End
Return @out
End;

Select [dbo].[DaftarMahasiswa] ('Walker') AS info;
Select [dbo].[DaftarMahasiswa] ('Gabe') AS info;
Select [dbo].[DaftarMahasiswa] ('Bastian') AS info;
Select [dbo].[DaftarMahasiswa] ('Sitogab') AS info;

--b)Procedure unntuk menampilkan data mahasiswa
Create Procedure Display_Mahasiswa
AS  
Select  Nama_Mahasiswa, prodi, no_ruangan, NIM
From Mahasiswa
Exec Display_Mahasiswa
Drop Procedure  Display_Mahasiswa

--c)Procedure untuk menampilkan NIM mahasiswa yang surat IK nya telah disetujui
Create Procedure Display_status
AS
Select NIM, status_req, NIDN_W
From Izin_Keluar
Where status_req = 'Disetujui'
Exec Display_status

--d)Fungsi untuk menampilkan nama nama dosen wali yang terdaftar di dalam database
Create Function DaftarDosen(@nama_dosen varchar(30))
Returns varchar(50)
AS
Begin
	Declare @keluaran varchar(50)
	If EXISTS (Select Nama_Wali From Dosen_Wali Where Nama_Wali = @nama_dosen)
	Begin
		set @keluaran = 'Nama dosen ' + @nama_dosen + ' terdaftar'
	End
	Else
	Begin
		set @keluaran = 'Nama dosen ' + @nama_dosen + ' tidak terdaftar'
	End
Return @keluaran
End;

Select [dbo].[DaftarDosen] ('Eka') AS info;
Select [dbo].[DaftarDosen] ('Parmonangan') AS info;
Select [dbo].[DaftarDosen] ('Apriyanto') AS info;
Select [dbo].[DaftarDosen] ('Samuel') AS info;
Select [dbo].[DaftarDosen] ('Kristian') AS info