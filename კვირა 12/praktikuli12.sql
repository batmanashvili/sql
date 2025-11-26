USE Shekveta;
GO

-- პრაქტიკული სამუშაო 12
-- თემა: წარმოდგენები (Views)


-- 9. შექმენით წარმოდგენა, რომელიც გამოაჩენს 30 წელზე ნაკლები ასაკის კაცი თანამშრომლებს
CREATE VIEW Axalgazrda_Kaci_Tanamshromlebi
AS
    SELECT gvari, saxeli, asaki, ganyofileba, xelfasi
    FROM Personali
    WHERE asaki < 30 AND sqesi = N'კაცი';
GO

-- 10. შექმენით წარმოდგენა, რომელიც გამოაჩენს კუთაისში მცხოვრები შემკვეთების ინფორმაციას
CREATE VIEW Kutaisi_Shemkvetelebi
AS
    SELECT gvari, saxeli, qalaqi, iuridiuli_fizikuri, mobiluri
    FROM Shemkveti
    WHERE qalaqi = N'ქუთაისი';
GO

-- 11. შექმენით წარმოდგენა, რომელიც დათვლის ფიზიკური პირების რაოდენობას განყოფილებების მიხედვით
CREATE VIEW Fizikuri_Pirebi_Ganyofilebis_Mixedvit
AS
    SELECT P.ganyofileba, COUNT(*) AS [ფიზიკური პირების რაოდენობა]
    FROM Personali P
        JOIN Shemkveti S ON P.PersonaliID = S.PersonaliID
    WHERE S.iuridiuli_fizikuri = N'ფიზიკური'
    GROUP BY P.ganyofileba;
GO

-- 12. შექმენით წარმოდგენა, რომელიც გამოაჩენს მინიმალური გადასახდელი თანხის მქონე ხელშეკრულებებს
CREATE VIEW Minimaluri_Gadasaxdeli
AS
    SELECT *
    FROM Xelshekruleba
    WHERE gadasaxdeli = (SELECT MIN(gadasaxdeli)
    FROM Xelshekruleba);
GO

-- 13. შექმენით წარმოდგენა, რომელიც გამოაჩენს 5 წელზე მეტი და 15 წელზე ნაკლები სტაჟის მქონე თანამშრომლებს
CREATE VIEW Sashualο_Stajis_Tanamshromlebi
AS
    SELECT gvari, saxeli, staji, ganyofileba, qalaqi
    FROM Personali
    WHERE staji > 5 AND staji < 15
    ORDER BY staji ASC;
GO

-- 14. შექმენით წარმოდგენა, რომელიც გამოაჩენს თითოეული განყოფილების მაქსიმალური ხელფასის მქონე თანამშრომელს
CREATE VIEW Maqsimaluri_Xelfasi_Ganyofilebashi
AS
    SELECT ganyofileba, MAX(xelfasi) AS [მაქსიმალური ხელფასი]
    FROM Personali
    GROUP BY ganyofileba
    HAVING MAX(xelfasi) > 1500;
GO

-- 15. შექმენით წარმოდგენა, რომელიც გამოაჩენს ბათუმში მომუშავე ქალი თანამშრომლების ინფორმაციას
CREATE VIEW Batumi_Qali_Tanamshromlebi
AS
    SELECT gvari, saxeli, asaki, xelfasi, mobiluri
    FROM Personali
    WHERE qalaqi = N'ბათუმი' AND sqesi = N'ქალი';
GO 