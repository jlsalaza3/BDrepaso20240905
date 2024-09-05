use DataStudent
go

-- Practicando la funcion de agrupamiento, los campos tienen que estar tanto en select como en group by, de lo contrario sale error
SELECT city,gender,COUNT(city) AS 'Cant alumnos por Ciudad'
FROM Student
GROUP BY city, gender
HAVING COUNT(city)>40
ORDER BY city

-- informe administrativo por facultad
SELECT faculty, COUNT(CITY) as 'Estudiantes por facultad',
		SUM(registrationValue) AS 'Total Matricula',
		AVG(registrationValue) AS 'Promedio Matricula',
		MAX(registrationValue) AS 'Matricula Mayor',
		MIN(registrationValue) AS 'Matricula Menor',
		AVG(age) AS 'Promedio edad',
		MAX(age) AS 'Edad Mayor',
		MIN(age) AS 'Edad Menor'
		
FROM Student
GROUP BY faculty