CREATE DATABASE Baza6
ON
(
    NAME = Baza6,
    FILENAME = '/var/opt/mssql/data/Baza6.mdf'
)
LOG ON
(
    NAME = Baza6_log1,
    FILENAME = '/var/opt/mssql/data/Baza6_log1.ldf'
),
(
    NAME = Baza6_log2,
    FILENAME = '/var/opt/mssql/data/Baza6_log2.ldf'
)