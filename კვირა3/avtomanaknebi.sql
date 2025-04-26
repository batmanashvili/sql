CREATE DATABASE Avto;
GO
USE Avto;
GO
CREATE TABLE Manqana_1
(
    Manqana_1ID INT PRIMARY KEY IDENTITY(1,1),
    modeli NVARCHAR(20),
    mwarmoebeli NVARCHAR(20),
    qveyana NVARCHAR(20),
    tarigi_gamoshvebis DATE,
    feri NVARCHAR(20) default N'შავი',
    kari_raodenoba INT check (kari_raodenoba>0),
    dzravis_moculoba FLOAT,
    fasi FLOAT
);