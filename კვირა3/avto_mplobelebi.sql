USE Avto;
CREATE TABLE Mplobelebi
(
    Mplobelebi_ID INT PRIMARY KEY IDENTITY (1,1),

    Manqana_1ID INT REFERENCES Manqana_1(Manqana_1ID),

    Saxeli NVARCHAR(20),

    gvari NVARCHAR(20),

    asaki INT,

    misamarti NVARCHAR(20),

    telefoni NVARCHAR(20),

    e_mail NVARCHAR(20),

    yidvis_tarigi DATE
)