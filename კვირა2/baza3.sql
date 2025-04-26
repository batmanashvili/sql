CREATE DATABASE Baza3
ON
(
    NAME = Baza3,
    FILENAME = '/var/opt/mssql/data/Baza3.mdf',
    SIZE = 20,
    MAXSIZE = 60,
    FILEGROWTH = 3
)
LOG ON
(
    NAME = Baza3_log,
    FILENAME = '/var/opt/mssql/data/Baza3_log.ldf',
    SIZE = 3,
    MAXSIZE = 14,
    FILEGROWTH = 2
)