USE Shekveta;
GO

-- პრაქტიკული სამუშაო 13
-- თემა: ინდექსები (Indexes)

-- 8. შექმენით არაკლასტერული ინდექსი Personali ცხრილის saxeli სვეტისთვის
CREATE NONCLUSTERED INDEX Index_Saxeli
ON [Personali] ([saxeli]);
GO

-- 9. შექმენით არაკლასტერული ინდექსი Xelshekruleba ცხრილის gaformebis_tarigi სვეტისთვის
CREATE NONCLUSTERED INDEX Index_Gaformebis_Tarigi
ON [Xelshekruleba] ([gaformebis_tarigi]);
GO

-- 10. შექმენით უნიკალური ინდექსი Shemkveti ცხრილის mobiluri_direqtoris სვეტისთვის
CREATE UNIQUE INDEX Index_Mobiluri_Direqtoris
ON [Shemkveti] ([mobiluri_direqtoris]);
GO

-- 11. შექმენით არაკლასტერული ინდექსი Personali ცხრილის staji სვეტისთვის (ზრდადობით)
CREATE NONCLUSTERED INDEX Index_Staji_ASC
ON [Personali] ([staji] ASC);
GO

-- 12. შექმენით კომპოზიტური ინდექსი Shemkveti ცხრილის qalaqi და regioni სვეტებისთვის
CREATE NONCLUSTERED INDEX Index_Qalaqi_Regioni
ON [Shemkveti] ([qalaqi], [regioni]);
GO

-- 13. შექმენით არაკლასტერული ინდექსი Xelshekruleba ცხრილის shesrulebis_tarigi სვეტისთვის
CREATE NONCLUSTERED INDEX Index_Shesrulebis_Tarigi
ON [Xelshekruleba] ([shesrulebis_tarigi]);
GO

-- 14. შექმენით უნიკალური ინდექსი Xelshekruleba ცხრილის xelshekrulebisID სვეტისთვის
CREATE UNIQUE INDEX Index_XelshekrulebisID
ON [Xelshekruleba] ([xelshekrulebisID]);
GO

-- 15. შექმენით არაკლასტერული ინდექსი Personali ცხრილის qalaqi სვეტისთვის
CREATE NONCLUSTERED INDEX Index_Personali_Qalaqi
ON [Personali] ([qalaqi]);
GO

-- 16. შექმენით კომპოზიტური ინდექსი Xelshekruleba ცხრილის personaliID და gaformebis_tarigi სვეტებისთვის
CREATE NONCLUSTERED INDEX Index_PersonaliID_Gaformebis_Tarigi
ON [Xelshekruleba] ([personaliID], [gaformebis_tarigi]);
GO

-- 17. შექმენით არაკლასტერული ინდექსი Shemkveti ცხრილის sabanko_angarishi სვეტისთვის
CREATE NONCLUSTERED INDEX Index_Sabanko_Angarishi
ON [Shemkveti] ([sabanko_angarishi]);
GO

-- ინდექსების ინფორმაციის ნახვა
SELECT name, type_desc, is_unique, is_primary_key
FROM sys.indexes
WHERE object_id = OBJECT_ID('Xelshekruleba');
GO

-- ყველა ცხრილის ინდექსების ნახვა
SELECT
    t.name AS [ცხრილის სახელი],
    i.name AS [ინდექსის სახელი],
    i.type_desc AS [ტიპი],
    i.is_unique AS [უნიკალურია]
FROM sys.tables t
    INNER JOIN sys.indexes i ON t.object_id = i.object_id
WHERE t.name IN ('Personali', 'Shemkveti', 'Xelshekruleba')
ORDER BY t.name, i.name;
GO 