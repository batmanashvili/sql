USE Shekveta;


-- გვაინტერესებს თითოეული თანამშრომლის შეკვეთების მაქსიმალური თანხა, რომელიც 6000-ზე მეტია. 
SELECT P.gvari, P.saxeli, MAX(X.gadaxdili) AS [მაქსიმალური თანხა]
FROM Personali P
    JOIN Xelshekruleba X ON P.personaliID = X.personaliID
GROUP BY P.personaliID, P.gvari, P.saxeli
HAVING MAX(X.gadaxdili) > 6000
ORDER BY [მაქსიმალური თანხა] DESC;

-- დაალაგეთ თანამშრომელთა სია ასაკის კლების და გვარის ზრდის(ანბანის) მიხედვით. 
SELECT *
FROM Personali
ORDER BY asaki DESC, gvari ASC;

-- გამოვიტანოთ თითოეული განყოფილების თანამშრომლების საშუალო ხელფასი
SELECT ganyofileba, AVG(xelfasi) AS [საშუალო ხელფასი]
FROM Personali
GROUP BY ganyofileba
ORDER BY [საშუალო ხელფასი] DESC;

-- გამოვიტანოთ შემკვეთების რაოდენობა ქალაქების მიხედვით, დალაგებული კლებადობით
SELECT qalaqi, COUNT(*) AS [შემკვეთების რაოდენობა]
FROM Shemkveti
GROUP BY qalaqi
ORDER BY [შემკვეთების რაოდენობა] DESC;

-- გვაინტერესებს ის ქალაქები, სადაც 2-ზე მეტი თანამშრომელი ცხოვრობს. 
SELECT qalaqi, COUNT(*) AS [თანამშრომელების რაოდენობა]
FROM Personali
GROUP BY qalaqi
HAVING COUNT(*) > 2;

-- გვაინტერესებს ინფორმაცია ფიზიკურ პირებთან გაფორმებული ხელშეკრულებების შესახებ
SELECT X.xelshekrulebisID, S.gvari, S.saxeli, X.gaformebis_tarigi, X.gadaxdili
FROM Xelshekruleba X
    INNER JOIN Shemkveti S ON X.shemkvetiID = S.shemkvetiID
WHERE S.iuridiuli_fizikuri = N'ფიზიკური'
ORDER BY X.gadaxdili DESC;

-- Personali და Xelshekruleba ცხრილებს შორის FULL OUTER კავშირი
SELECT P.personaliID, P.saxeli, P.gvari, X.xelshekrulebisID, X.gadaxdili
FROM Personali P
    FULL OUTER JOIN Xelshekruleba X ON P.personaliID = X.personaliID
ORDER BY P.personaliID, X.xelshekrulebisID;