USE Shekveta;

-- ხელშეკრულები, რომელთა თანხა არ აღემატება 7000 ლარს
SELECT *
FROM Xelshekruleba
WHERE gadaxdili <= 7000;

-- გამოიტანეთ ინფორმაცია თბილისში მცხოვრები ფიზიკური პირების შესახებ. 

SELECT *
FROM Shemkveti
WHERE qalaqi = N'თბილისი'
    AND iuridiuli_fizikuri = N'ფიზიკური';

-- გამოიტანეთ ინფორმაცია იმ თანამშრომლების შესახებ, რომელთა ხელფასი 1000-დან 3000 ლარამდეა. 
SELECT *
FROM Personali
WHERE xelfasi >= 1000 AND xelfasi <= 3000;


-- გამოიტანეთ ინფორმაცია Shemkvetebi ცხრილის პირველი 5 თანამშრომლის შესახებ. 
SELECT TOP 5
    *
FROM Shemkveti

-- გამოთვალეთ იურიდიული პირების რაოდენობა. 
SELECT COUNT(*) AS [იურიდიული პირების რაოდენობა]
FROM Shemkveti
WHERE iuridiuli_fizikuri = N'იურიდიული';

-- გამოთვალეთ  თბილისში მომუშავე თანამშრომლების მინიმალური ასაკი. 
SELECT MIN(asaki) AS [მინიმალური ასაკი]
FROM Personali
WHERE qalaqi = N'თბილისი';

-- გამოთვალეთ  საბურთალოზე მცხოვრები ფიზიკური პირების რაოდენობა. 
SELECT COUNT(*) AS [საბურთალოზე მცხოვრები ფიზიკური პირების რაოდენობა]
FROM Shemkveti
WHERE misamarti = N'საბურთალო'
    AND iuridiuli_fizikuri = N'ფიზიკური';

-- დათვალეთ იმ ხელშეკრულებების რაოდენობა, რომლებიც 2006 წლის ბოლომდე შესრულდება. 
SELECT COUNT(*) AS [ხელშეკრულებების რაოდენობა, რომლებიც 2006 წლის ბოლომდე შესრულდება]
FROM Xelshekruleba
WHERE shesrulebis_tarigi <= '2006-12-31';