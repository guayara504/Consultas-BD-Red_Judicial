SELECT A.ciudad
FROM z04_estado A LEFT JOIN ciudades B ON A.ciudad = B.nombre
WHERE B.nombre IS NULL AND fecha_notificacion LIKE "%2022%"
GROUP BY A.ciudad
 