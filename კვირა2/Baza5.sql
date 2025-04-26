CREATE DATABASE Baza5
ON
(
    NAME = Baza5,
    FILENAME = '/var/opt/mssql/data/Baza5.mdf'
)
LOG ON
(
    NAME = Baza5_log,
    FILENAME = '/var/opt/mssql/data/Baza5_log.ldf'
),
(
    NAME = Baza5log,
    FILENAME = '/var/opt/mssql/data/Baza5log.ldf'
);