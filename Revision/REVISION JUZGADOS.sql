SELECT z01_radicacion_juzgado AS JUZGADO, ciudad AS Ciudad,fecha_notificacion AS Fecha,digitador FROM z04_estado  WHERE fecha_notificacion LIKE "%2022%"
GROUP BY z01_radicacion_juzgado,ciudad
ORDER BY fecha_notificacion DESC