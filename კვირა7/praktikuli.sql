USE Shekveta;

-- გვაინტერესებს 500-1000 ლარი ვალის მქონე ხელშეკრულებები. 
SELECT *
FROM Xelshekruleba
WHERE vali BETWEEN 500 AND 1000;

-- გვაინტერესებს 30-40 ასაკის მქონე ბათუმელი თანამშრომელი კაცები. 
SELECT *
FROM Personal
WHERE asaki BETWEEN 30 AND 40 AND qalaqi=N'ბათუმელი';

-- გვაინტერესებს ინფორმაცია იმ თანამშრომლების შესახებ, რომელთა სტაჟია 5, 10 ან 15 წელი
SELECT *
FROM Personali
WHERE samushao_gamocdileba IN (5, 10, 15)
ORDER BY samushao_gamocdileba, gvari;

-- ამოარჩიეთ ინფორმაცია მინიმალური ვალის მქონე ხელშეკრულების შესახებ. 
SELECT MIN(vali) AS [მინიმალური ვალი]
FROM Xelshekruleba;

-- გვაინტერესებს ხელშეკრულებები, რომლებიც არ გააფორმეს თბილისელმა შემკვეთებმა. 
SELECT *
FROM Xelshekruleba
WHERE personaliID IN  
(  
SELECT P.personaliID
FROM Personali AS P
WHERE not P.qalaqi = N'თბილისი' 
);

-- გვაინტერესებს ხელშეკრულებები, რომლებიც არ გაფორმდა სამედიცინო განყოფილებაში
SELECT *
FROM Xelshekruleba
WHERE personaliID NOT IN (
    SELECT personaliID
FROM Personali
WHERE ganyofileba = N'სამედიცინო'
);

-- ამოარჩიეთ ის შემკვეთები, რომლებიც იმ ქალაქში ცხოვრობენ, რომელშიც ცხოვრობს 'ლომიძე მარინა'. 
SELECT *
FROM Shemkveti
WHERE qalaqi =  
(  
SELECT qalaqi
FROM Shemkveti
WHERE gvari = N'ლომიძე' AND saxeli = N'მარინა'  
); 

 