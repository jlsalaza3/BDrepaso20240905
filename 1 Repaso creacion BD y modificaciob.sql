CREATE DATABASE repaso
GO
USE repaso
GO

exec sp_helpdb --muestra las bases de datos del server
exec sp_helpdb repaso --muestra la estructura de la base de datos actual

-- DROP DATABASE repaso -- elimina la base de datos, se tiene que estar fuera de ella para eliminarla

CREATE TABLE tabla1(
idtabla1 INT PRIMARY KEY,
campo1 NVARCHAR(255),
campo2 NVARCHAR(255),
campo3 NVARCHAR(255),
campo4 NVARCHAR(255),
);

CREATE TABLE empleados(
identificacion REAL,
nombres VARCHAR(60),
salario INT,
edad TINYINT,
fechaIngreso DATE,

);
exec sp_columns empleados -- muestra los campos de la tabla y su composicion.

INSERT INTO empleados (identificacion,nombres,salario,edad,fechaIngreso) VALUES (98567637,'JORGE SALAZAR',1560700,50,'2000/01/03');
INSERT INTO empleados (identificacion,nombres,salario,edad,fechaIngreso) VALUES (21306167,'BLANCA RAMIREZ',2540000,90,'1997/01/30');
INSERT INTO empleados (identificacion,nombres,salario,edad,fechaIngreso) VALUES (3473419,'GILBERTO SALAZAR',5000000,95,'1974/03/30');

INSERT INTO empleados (identificacion,nombres,salario,edad,fechaIngreso) VALUES (43164643,'Paulina Londoño',7000000,44,'10/05/1980');
INSERT INTO empleados (identificacion,nombres,salario,edad,fechaIngreso) VALUES (43164644,'María Londoño',7000000,44,'05/30/1980');


SELECT *
FROM empleados

ALTER TABLE empleados ALTER COLUMN identificacion BIGINT 
-- con esto modifico el tipo de dato de la columna identificacion, cambiandolo de REAL a BIGINT

SELECT *
FROM empleados

EXEC sp_rename 'empleados.nombres', 'nomEmp' -- cambia el nombre de la columna

SELECT *
FROM empleados

-- PARA ADICIONAR UNA COLUMNA:
ALTER TABLE empleados
ADD idEmpleado INT IDENTITY PRIMARY KEY NOT NULL;

SELECT *
FROM empleados

-- PARA QUITAR COLUMNA O COLUMNAS
ALTER TABLE empleados
DROP COLUMN edad, salario;

SELECT *
FROM empleados

-- PARA CAMBIAR UN DATO DENTRO DE UNA TUPLA O FILA
UPDATE empleados SET identificacion=98567637 WHERE idEmpleado=1

UPDATE empleados SET nomEmp='LUIS SALAZAR' WHERE identificacion=98567640

SELECT *
FROM empleados

-- PARA ELIMINAR TODA UNA FILA O TUPLA
DELETE FROM empleados WHERE idEmpleado=5

SELECT *
FROM empleados

--CUANDO SE CREAN LAS TABLAS DE UNA BASE DE DATOS PRIMERO SE CREAN LAS TABLAS CON RELACIONES
-- UNO A UNO Y LUEGO LAS TABLAS INTERMEDIAS