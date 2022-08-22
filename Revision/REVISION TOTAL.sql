SELECT z01_radicacion_juzgado AS JUZGADO,z01_radicacion_z01_radicacion AS RADICACION,demandante,demandado,clase_proceso AS PROCESO,fecha_ingreso AS FECHA,sincronizado AS SYNC,digitador,ciudad 
FROM z04_estado
WHERE
		#FECHA A REVISAR
		(fecha_notificacion LIKE "%2022%"
		#fecha_notificacion = CURDATE()
		
		#REVISAR ESPACIOS EN JUZGADOS Y CIUDADES AL PRINCIPIO Y AL FINAL
		AND ((z01_radicacion_juzgado LIKE " %" OR ciudad LIKE " %" OR z01_radicacion_juzgado LIKE "% " OR ciudad LIKE "% ")
		
		#REVISAR RADICACIONES FUERA DEL RANGO DE DIGITACION Y QUE NO TERMINEN EN 0001
		OR ((z01_radicacion_z01_radicacion NOT BETWEEN "195000000" AND "202299999") AND z01_radicacion_z01_radicacion NOT LIKE ("%0001") AND z01_radicacion_z01_radicacion NOT LIKE ("%660884089%") AND z01_radicacion_z01_radicacion NOT LIKE ("%768924001%"))
		
		#REVISAR JUZGADOS SIN NUMERO 
		OR (z01_radicacion_juzgado NOT LIKE "%0"
		AND z01_radicacion_juzgado NOT LIKE "%1"
		AND z01_radicacion_juzgado NOT LIKE "%2"
		AND z01_radicacion_juzgado NOT LIKE "%3"
		AND z01_radicacion_juzgado NOT LIKE "%4"
		AND z01_radicacion_juzgado NOT LIKE "%5"
		AND z01_radicacion_juzgado NOT LIKE "%6"
		AND z01_radicacion_juzgado NOT LIKE "%7"
		AND z01_radicacion_juzgado NOT LIKE "%8"
		AND z01_radicacion_juzgado NOT LIKE "%9"
		AND z01_radicacion_juzgado NOT LIKE "CONSEJO%"
		AND z01_radicacion_juzgado NOT LIKE "CORTE%"
		AND z01_radicacion_juzgado NOT LIKE "TRIBUNAL%")
		
		#REVISAR JUZGADOS CON EL NUMERO SIN ESPACIO
		OR  (z01_radicacion_juzgado NOT LIKE "% 0%"
		AND z01_radicacion_juzgado NOT LIKE "% 1%"
		AND z01_radicacion_juzgado NOT LIKE "% 2%"
		AND z01_radicacion_juzgado NOT LIKE "% 3%"
		AND z01_radicacion_juzgado NOT LIKE "% 4%"
		AND z01_radicacion_juzgado NOT LIKE "% 5%"
		AND z01_radicacion_juzgado NOT LIKE "% 6%"
		AND z01_radicacion_juzgado NOT LIKE "% 7%"
		AND z01_radicacion_juzgado NOT LIKE "% 8%"
		AND z01_radicacion_juzgado NOT LIKE "% 9%"
		AND z01_radicacion_juzgado NOT LIKE "CONSEJO%"
		AND z01_radicacion_juzgado NOT LIKE "CORTE%"
		AND z01_radicacion_juzgado NOT LIKE "TRIBUNAL%")
		
		#REVISAR JUZGADOS CON CARACTERES DIFERENTES AL INICIO
		OR (z01_radicacion_juzgado NOT LIKE "J%"
		AND z01_radicacion_juzgado NOT LIKE "T%"
		AND z01_radicacion_juzgado NOT LIKE "C%")
		
		#REVISAR JUZGADOS CON DOBLE ESPACIO ANTES DEL NUMERO
		OR (z01_radicacion_juzgado  LIKE "%  %")
		
		#DOBLE "DE" EN EL JUZGADO
		OR (z01_radicacion_juzgado LIKE "%DE DE%")
		
		#Revisar Linea con doble linea
		OR (z01_radicacion_juzgado LIKE "%\n%" 
			 OR z01_radicacion_z01_radicacion LIKE "%\n%" 
			 OR ciudad LIKE "%\n%"
			 OR demandante LIKE "%\n%" 
			 OR demandado LIKE "%\n%" 
			 OR clase_proceso LIKE "%\n%")
		
		OR (clase_proceso = " " OR demandante = " " OR demandado = " "
			 OR clase_proceso = "  " OR demandante = "  " OR demandado = "  "))
		)
		#Revisar Fecha Notificacion Mala
		OR fecha_notificacion LIKE "0000-00-00"
