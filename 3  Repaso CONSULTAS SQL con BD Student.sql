USE DataStudent
GO


-- EL ORDEN ES SIEMPRE SELECT Y DESPUES FROM
-- PARA QUE TRAIGA LAS COMNAS AUTOMATICAMENTE, ANTES DE SELECCIONAR LOS CAMPOS QUE QUIEREO CONSULTAR EN EL SELECT
-- SE RECOMIENDA ESCRIBIR EN EL FROM LA TABLA DE LA QUE VOY A EXTRAER LA INFORMACION PARA QUE
-- EL GESTOR DE BASES DE DATOS SE AUTOCOMPLETE AL MOENTO DE SELECCIONAR LAS COLUMNAS

-- Muestra todo lo que contiene la tabla:
SELECT *
FROM Student

--Muestra la informacion de las columnas que pido en SELECT
SELECT first_name, last_name, age
FROM Student

-- Me muestra los primeros 7 datos:
SELECT TOP 7 first_name, age, city
FROM Student


--Por de fecto ordena de A-z, PERO si uso  DESC ordena de Z-A o si es un numero de mayor a menor

SELECT TOP 7 first_name, age, city,idStudent
FROM Student
ORDER BY idStudent DESC

SELECT TOP 100 first_name,age, city
FROM Student
ORDER BY city DESC, age

SELECT first_name,age, city
FROM Student
ORDER BY city DESC, age

-- para pedir en lugar de TOP y numero de datos, un porcentaje de la base de datos

SELECT TOP 10 PERCENT first_name, city, age
FROM Student

-- en lugar de colocar el nombre de la columna para que lo ordene se le puede decir el
-- numero de la columna, en este caso la columna 1 es el FIRST NAME
SELECT TOP 20 first_name, city, age
FROM Student
ORDER BY 1

-- cuando en el SELECT se le adiciona la propiedad DISTINCT solo trae 1 valor de ese campo sin repetirse
SELECT DISTINCT city
FROM Student
ORDER BY 1

SELECT DISTINCT city, faculty
FROM Student
ORDER BY 1

SELECT DISTINCT first_name,age, city
FROM Student
ORDER BY 1

-- WHERE, filtrar la base de datos
SELECT *
FROM Student
WHERE city='Copacabana'-- A, a son iguales

----listar nombre, age, facultad de los que temgan una edad de 16 años
SELECT first_name, age, faculty
FROM Student
WHERE age=16
ORDER BY 2
-- todos los datos de los que vivien en medellin
SELECT *
FROM Student
WHERE city='Medellín'
-- LISTAR LA CIUDAD EL GENERO Y EL IMC de los que sean mayores de 40
SELECT city,gender,imc,age
FROM Student
WHERE age>40
ORDER BY age

--listar nombre, ciudad y facultad de los que no tengan una facultad asignada
-- OJO CUANDO SE BUSCAN LOS NULL SE USA is Y NO EL =
SELECT first_name, city, faculty
FROM Student
WHERE faculty IS null

SELECT first_name, city, faculty
FROM Student
WHERE faculty IS NOT null

-- AND OR
-- QUE SEA DE GENRERO NO VINARIO Y VIVVE EN BELLO 26 personas

SELECT *
FROM Student
WHERE gender='Nonbinary' and city='Bello'


-- QUE SEA DE GENRERO NO VINARIO o VIVVE EN BELLO 272 personas
SELECT *
FROM Student
WHERE gender='Nonbinary' OR city='Bello'
ORDER BY gender, city

--listar todos los datos de los  que tienen una matricula entre 2 y 3 millosnes
SELECT *
FROM Student
WHERE registrationValue>=2000000 AND registrationValue<=3000000
ORDER BY registrationValue

-- listar todos los datos de los que viven en medellin, tengan entre 20 y 25 años  y la matricula sea mayor de 2 millones
SELECT *
FROM Student
WHERE city='Medellín' and age>=20 and age<=25 and registrationValue>2000000
ORDER BY city

--listar el nombre, genero, imc y facultad de las personas que
-- sean masculinos y la facultad sea soporte sistemas o el imc entre 18 y 25
-- OJO CON LOS PARENTESIS PARA QUE FUNCIONE CORRECTAMENTE

SELECT first_name, gender, imc, faculty
FROM Student
WHERE  gender='Male' and (faculty='Soporte Sistemas' OR (imc>=18 AND imc<=25))
ORDER BY imc

--LIKE como, para buscar en cadenas de texto, utiliza dos caracteres % para todas las letras, 
 --y guion bajo  _ una letra

--listar todos los nombres que terminen con la letra A
SELECT *
FROM Student
WHERE first_name LIKE '%a'

--listar todos los nombres que empiecen y terminen con la letra A
SELECT first_name
FROM Student
WHERE first_name LIKE 'a%a'

--listar los nombres que empiecen por A terminen con A y tengan 4 letras intermedio
SELECT first_name
FROM Student
WHERE first_name LIKE 'a____a'

--SELECT first_name
--FROM Student
--WHERE CONTAINS(first_name)=1

--SELECT first_name, city
--FROM Student 
--WHERE city ='Bello' 
   --AND CONTAINS(first_name,'Dun')  

--SELECT first_name
--FROM Student 
--WHERE FREETEXT (first_name, 'Dun') 
--Cannot use a CONTAINS or FREETEXT predicate on table or indexed view 'Student' because it is not full-text indexed.


-- IN SIGNIFICA dentro para buscar datos dentro de una columna
-- listar todos los datos de las personas que vivan en itagui y copacabana

SELECT *
FROM Student
WHERE city IN('Itagui','Copacabana')
ORDER BY city

--BETWEEN, entre un rango de datos
-- listar todos los datos que tengan una matricula entre 2 y 3 millones

SELECT *
FROM Student
WHERE registrationValue BETWEEN 2000000 AND 3000000
ORDER BY registrationValue