USE DataStudent
go

SELECT * FROM Student

-- voy a actualizar el nombre de un estudante, si son varias columnas a modificar deben ir separadas por COMA , 
-- OJO SI NO SE LE COLOCA WHERE Y SE EJECUTA REEMPLAZA EL CAMPO DE TODA LA BASE DE DATO

UPDATE Student
SET first_name = 'Heidy',
	last_name = 'Usuga'
WHERE idStudent = 1

select * from Student
where idStudent=1

UPDATE Student
SET age = 20
WHERE idStudent=1

--DELETE Student OJO SI LO EJECUTO ASÍ BORRA TODO OJO

DELETE Student
WHERE idStudent = 1

SELECT * FROM Student