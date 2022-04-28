SELECT clase_proceso AS PROCESO
FROM z04_estado 
WHERE fecha_notificacion LIKE "%2022%" AND 
			(	clase_proceso  LIKE "%\%%"
		OR clase_proceso  LIKE "%&%"
		OR clase_proceso  LIKE "%+%"
		OR clase_proceso  LIKE "%`%"
		OR clase_proceso  LIKE "%}%"
		OR clase_proceso  LIKE "%{%"
		OR clase_proceso  LIKE "%^%"
		OR clase_proceso  LIKE "%[%"
		OR clase_proceso  LIKE "%]%"
		OR clase_proceso  LIKE "%#%"
		OR clase_proceso  LIKE "%<%"
		OR clase_proceso  LIKE "%>%"

)