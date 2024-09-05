USE Covid
GO

SELECT * FROM CovidAntioquia

-- 1- Cuantos registros contiene la tabla Covid Antioquia = 678
SELECT COUNT (*) AS Pacientes
FROM CovidAntioquia

-- 2- Cuantos pacientes pertenecen a la de Copacabana = 130
SELECT COUNT (*) AS PacientesCopacabana
FROM CovidAntioquia
WHERE Ciudad='Copacabana'

-- 3- Cuantos pacientes Estan entre los 40 y 60 años = 164
SELECT COUNT (*) AS edad40a60
FROM CovidAntioquia
WHERE Edad>=40 and Edad<=60

SELECT COUNT (*) AS edad40a60
FROM CovidAntioquia
WHERE Edad BETWEEN 40 and 60

-- 4- Numero de Hombres = 327
SELECT COUNT (*) AS Hombres
FROM CovidAntioquia
WHERE genero='Male'

-- 5- Numero de Mujeres = 351
SELECT COUNT (*) AS Mujeres
FROM CovidAntioquia
WHERE genero='Female'

-- 6- Mostrar todas las ciudades sin repetirlas
SELECT DISTINCT Ciudad
FROM CovidAntioquia

-- 7- Mostrar las edades mas altas sin repetirlas
SELECT TOP 15 Edad
FROM ( 
SELECT DISTINCT Edad 
FROM CovidAntioquia
) AS DISTINGIR 
ORDER BY Edad DESC;

-- 8- Mostrar todos los datos de los pacientes de Sura
SELECT *
FROM CovidAntioquia
WHERE Eps='Sura'

-- 9- Mostrar el 35% de los pacientes en estado leve: 79 de 224
SELECT  TOP 35 PERCENT *
FROM CovidAntioquia
WHERE Estado='Leve'

-- 10- Mostrar todos los datos de la ciudad de medellin que se encuentren hospitalizados O en UCI
SELECT *
FROM CovidAntioquia
WHERE Ciudad='Medellín' and (Ubicación='Hospital'OR Ubicación='UCI');

-- 11- Cuantos pacientes de la ciudad de itagui tienen entre 20 y 40 años
SELECT COUNT (*) AS 'pacientes itagui entre 20 y 40'
FROM CovidAntioquia
WHERE Ciudad='Itagui' and (Edad>=20 and Edad<=40);

SELECT COUNT (*)
FROM CovidAntioquia
WHERE Ciudad='Itagui' and Edad between 20 and 40;

-- 12- Mostrar todos los datos de los pacientes que no tienen EPS con mas de 20 de aislamiento
SELECT *
FROM CovidAntioquia
WHERE Eps='N/A' and diasAislamiento>=20

-- 13- Mostrar la ciudad, edad, eps, genero, estado de los pacientes fallecidos que sean hombres
SELECT Ciudad, Eps, genero, Estado
FROM CovidAntioquia
WHERE Estado='Fallecido' and genero='Male'

-- 14- Mostrar ciudad, eps, genero, tipo de contagio, de la ciudad de bello o que el tipo de contagio esta en estudio
SELECT Ciudad, Eps, genero, TipoContagio
FROM CovidAntioquia
WHERE Ciudad='Bello' OR TipoContagio='En estudio'

-- 15- Mostrar EPS, dias de aislamiento, genero, ubicaciòn, valor dìa, y que el estado sea grave y no tenga EPS

SELECT Eps, diasAislamiento,genero, Ubicación, VlrDia
FROM CovidAntioquia
WHERE Estado='Grave' and Eps='N/A'

-- 16- Mostrar la ciudad, eps, genero, ubicacion y estado de las eps coomeva y sisben

SELECT Ciudad, Eps, genero, Ubicación, Estado
FROM CovidAntioquia
WHERE Eps='Coomeva' or Eps='Sisben';

-- 17- mostrar todos la datos de los pacientes, menos de los pacientes que hayan fallecido
SELECT *
FROM CovidAntioquia
WHERE Estado!='Fallecido'

SELECT *
FROM CovidAntioquia
WHERE Estado<>'Fallecido'

-- 18- Mostrar ciudad, eps, tipo de contagio y ubicacion, de girardota y bello donde los dias de aislamiento 
--     se encuentren entre 10 y 15 y sean mujeres
SELECT Ciudad, Eps, TipoContagio, Ubicación, genero,diasAislamiento
FROM CovidAntioquia
WHERE (Ciudad='Girardota' or Ciudad='Bello') AND genero='Female' and  diasAislamiento BETWEEN 10 AND 15 


-- 19- Mostrar eps, genero, tipo de contagio de todos los hombres que se encuentren en casa y que la eps termine en a
SELECT eps,genero, TipoContagio, genero,Ubicación
FROM CovidAntioquia
WHERE  Eps LIKE '%a'and genero='Male' and Ubicación='Casa'

-- 20- Mostrar Ciudad, eps, diaaislamimento, de todos los fallecidos que estuvieron en UCI
SELECT Ciudad, Eps,diasAislamiento
FROM CovidAntioquia
WHERE Estado='Fallecido' and Ubicación='Uci'

-- CAMPOS CALCULADO Cambiar el nombre de la columna diasAislamiento por diasDeHospitalizacion

EXEC sp_rename 'CovidAntioquia.diasAislamiento', 'diasDeHospitalizacion';
EXEC sp_rename 'CovidAntioquia.diasDeHospitalizacion', 'diasAislamiento';

--ALTER TABLE CovidAntioquia CHANGE diasDeHospitalizacion diasAislamiento TINYINT; NO FUNCIONA EL CHANGE

SELECT * FROM CovidAntioquia

-- 21- Mostrar la ciudad, la eps, dias de aislamiento, valor dìa de todos los que estan hospitalizados, calcular la columna
--     valor hospitalizacion con los dìas de aislamiento y el valor dìa

--SELECT Ciudad, Eps, diasDeHospitalizacion,VlrDia, (VlrDia*diasDeHospitalizacion) AS valorHospitalizacion
--FROM CovidAntioquia

SELECT Ciudad, Eps, diasAislamiento,VlrDia, FORMAT(VlrDia*diasAislamiento,'#,##') AS valorHospitalizacion
FROM CovidAntioquia

-- 22- Mostrar la EPS, dias de aislamiento, el valor dìa, calcular el subtotal y realizar un descuento del 30%.

SELECT Eps, diasAislamiento, VlrDia, Format(VlrDia*diasAislamiento,'#,##') AS 'Valor Hospitalizacion sin descuento', 
FORMAT((VlrDia*diasAislamiento)*0.30,'#,##') AS 'Descuento 30%',
FORMAT((VlrDia*diasAislamiento)*0.70,'#,##') AS 'Nuevo Valor Hostitalizacion'
FROM CovidAntioquia

-- 23- Mostrar la ciudad, dias aislamiento, el valor del dia, calcular el subtotal, y realizar un descuento del 50% a las personas 
--    que sean mayores de 60 años
SELECT Ciudad, diasAislamiento, VlrDia,Edad ,Format(VlrDia*diasAislamiento,'#,##') AS 'Valor Hospitalizacion sin descuento',
FORMAT((VlrDia*diasAislamiento)*0.50,'#,##') AS 'Descuento 50% mayores 60 años',
FORMAT((VlrDia*diasAislamiento)*0.50,'#,##') AS 'Nuevo Valor Hostitalizacion'
FROM CovidAntioquia
WHERE (Edad>=60)
