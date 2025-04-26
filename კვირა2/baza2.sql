CREATE DATABASE Baza2 
ON 
( 
    NAME = Baza2, 
    FILENAME = '/var/opt/mssql/data/Baza2.mdf',
    SIZE = 15MB, 
    MAXSIZE = 50MB, 
    FILEGROWTH = 5MB            
)                                                                 
LOG ON                                                                  
(  
    NAME = Baza2_log, 
    FILENAME = '/var/opt/mssql/data/Baza2_Log.ldf',
    SIZE = 5MB, 
    MAXSIZE = 25MB, 
    FILEGROWTH = 3MB  
);
