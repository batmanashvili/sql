USE Shekveta;
GO

DELETE FROM ##Temp 
WHERE iuridiuli_fizikuri = N'იურიდიული';

SELECT *
FROM ##Temp;

