SELECT digitador AS Digitador,COUNT(digitador) AS Total_Digitador,
(SELECT count(digitador) FROM z04_estado WHERE fecha_notificacion = CURDATE() ) AS Total_Dia
FROM z04_estado  WHERE digitador LIKE "%%" AND fecha_notificacion = CURDATE()
GROUP BY digitador
ORDER BY Total_Digitador DESC
