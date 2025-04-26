CREATE DATABASE Aptiaki;
GO
USE Aptiaki;
GO
CREATE TABLE Camlebi
(
    camali_id INT PRIMARY KEY IDENTITY (1,1),

    dasaxeleba NVARCHAR(20),

    mwarmoebeli NVARCHAR(20),

    firma NVARCHAR(20),

    qvekaxa NVARCHAR(20),

    gamoshvebis_tarigi DATE,

    vada DATE,

    danishnuleba NVARCHAR(50),

    fasi FLOAT
);
CREATE TABLE Gakidvebi
(
    Gakidvebi_ID INT PRIMARY KEY IDENTITY (1,1),

    camali_id INT REFERENCES Camlebi(camali_id),

    gakiduli_raodenoba INT,

    tanxa FLOAT,

    gakidvis_tarigi DATE
);