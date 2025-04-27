USE Shekveta;
SET DATEFORMAT dmy;
INSERT INTO Personali
VALUES
    (N'ქვლივიძე', N'ბექა', N'სასოფლო', N'თბილისი', null, N'ვაკე', 300.55, 27, 5, '07.09.1980', N'კაცი', N'პეტრიაშვილის ქ.1', '221-11-00', '599-012-345', N'beqa@geo.net.ge')
SELECT *
FROM Personali;