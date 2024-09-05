use DataStudent
go

select * from Student

-- quiero hacer un incremento del 15% sobre el valor de la matricula

SELECT *,FORMAT(registrationValue*0.15,'#,##') AS 'valor incremento',FORMAT((registrationValue*1.15),'#,##') AS 'nuevo valor matricula'
FROM Student

-- CONSULTAS DE AGRUPACION
-- PROMEDIO DE EDAD POR FACULTAD

SELECT faculty, AVG(age) AS PROMEDIO
FROM Student
GROUP BY faculty -- la columna que quiero agrupar

-- contar, sumar, promedio, max min por ciudad

SELECT city,faculty, COUNT(city) AS 'Nro Personas',
	SUM(registrationValue) AS 'Total Matricula',
	AVG(registrationValue) AS 'Promedio',
	MIN(registrationValue) AS 'Valor Max',
	MAX(registrationValue) AS 'Valor Min'
FROM Student
GROUP BY city, faculty
ORDER BY city




