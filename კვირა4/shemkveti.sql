USE Shekveta;
SET DATEFORMAT dmy;

INSERT INTO Shemkveti
    (gvari_direqtoris, personaliID, iuridiuli_fizikuri, gvari,
    saxeli, email, qalaqi, regioni, raioni, sqesi, misamarti,
    mobiluri, firmis_dasaxeleba, mobiluri_direqtoris, sabanko_angarishi)
VALUES
    (N'კაჭარავა', 5, N'იურიდიული', N'გოგუა',
        NULL, N'maia@mail.ru', N'ბათუმი', N'აჭარა', NULL,
        N'კაცი', N'დადიანის 10', '574-222-777', 'maia&Co.',
        '577-654-686', N'ინვესტბანკი');

SELECT *
FROM Shemkveti; 