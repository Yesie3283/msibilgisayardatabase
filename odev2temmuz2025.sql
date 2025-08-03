create database msibilgisayar;
go
use msibilgisayar;
go
create table urunler
(
    id int primary key identity(1,1),
    model_adi nvarchar(100) not null,
    cikis_tarihi date,
    fiyat money
)
go
create table parcalar
(
    id int primary key identity(1,1),
    parca_adi nvarchar(100) not null,
    parca_tipi nvarchar(50) not null
)
go
create table urun_parca
(
    urun_id int,
    parca_id int,
    adet int,
    constraint pk_urunparca primary key (urun_id, parca_id),
    constraint fk_urun foreign key (urun_id) references urunler(id),
    constraint fk_parca foreign key (parca_id) references parcalar(id)
)
go

create table bayiler
(
    id int primary key identity(1,1),
    bayi_adi nvarchar(100) not null,
    sehir nvarchar(50)
)
go
create table satislar
(
    id int primary key identity(1,1),
    urun_id int,
    bayi_id int,
    satis_tarihi date,
    miktar int,
    constraint fk_satis_urun foreign key (urun_id) references urunler(id),
    constraint fk_satis_bayi foreign key (bayi_id) references bayiler(id)
)
go




INSERT INTO urunler (model_adi, cikis_tarihi, fiyat) VALUES
('MSI Katana GF66', '2023-03-01', 32500),
('MSI Stealth 15M', '2022-11-15', 41500),
('MSI Raider GE78', '2024-05-20', 58999),
('MSI Bravo 15', '2021-09-10', 27800),
('MSI Pulse GL66', '2022-06-05', 34900);




INSERT INTO parcalar (parca_adi, parca_tipi) VALUES
('NVIDIA RTX 4060', 'GPU'),
('Intel Core i7-12700H', 'CPU'),
('16GB DDR5 RAM', 'RAM'),
('512GB NVMe SSD', 'Depolama'),
('165Hz IPS Panel', 'Ekran');


INSERT INTO urun_parca (urun_id, parca_id, adet) VALUES
(1, 1, 1), -- Katana GF66 + RTX 4060
(1, 2, 1), -- + i7
(1, 3, 2), -- + 2x RAM
(1, 4, 1), -- + SSD
(1, 5, 1), -- + ekran

(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(2, 4, 1),
(2, 5, 1),

(3, 1, 1),
(3, 2, 1),
(3, 3, 2),
(3, 4, 1),
(3, 5, 1);



INSERT INTO bayiler (bayi_adi, sehir) VALUES
('TeknoTrend Ýstanbul', 'Ýstanbul'),
('BilgisayarDünyasý Ankara', 'Ankara'),
('MegaTech Ýzmir', 'Ýzmir'),
('KomplePc Bursa', 'Bursa'),
('GameZone Antalya', 'Antalya');



INSERT INTO satislar (urun_id, bayi_id, satis_tarihi, miktar) VALUES
(1, 1, '2024-01-10', 15),
(2, 3, '2024-02-15', 8),
(3, 2, '2025-06-05', 5),
(4, 4, '2023-12-20', 12),
(5, 5, '2025-01-25', 7);
