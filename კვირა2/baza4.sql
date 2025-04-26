CREATE DATABASE Baza4
ON
(
    NAME = Baza4,
    FILENAME = '/var/opt/mssql/data/Baza4.mdf',
    FILEGROWTH = 8
)
LOG ON
(
    NAME = Baza4_log,
    FILENAME = '/var/opt/mssql/data/Baza4_log.ldf',
    FILEGROWTH = 4
)