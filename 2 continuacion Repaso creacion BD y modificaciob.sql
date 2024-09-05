CREATE DATABASE repaso2
go
USE repaso2
go

CREATE TABLE estudiantes(
idEstudiante INT PRIMARY KEY,
nombre NVARCHAR(60) NOT NULL,
estatura DECIMAL(3,2),
fecha DATE,
matricula INT,

);
-- FORMA 1 INSERTAR DATATOS A UNA TABLA

INSERT INTO estudiantes (idEstudiante,nombre,estatura,fecha,matricula) VALUES (1,'Camilo Perez',1.55,'01/30/2020',1345678)

SELECT *
FROM estudiantes

-- FORMA 2 INSERTAR DATATOS A UNA TABLA

INSERT INTO estudiantes VALUES (2,'Hernán Pelaez',1.20,'2019/04/28',1200000)

SELECT *
FROM estudiantes

CREATE TABLE asignatura(
idAsignatura INT PRIMARY KEY IDENTITY(1,1),
nombreAsignatura NVARCHAR(40) NOT NULL,
);

INSERT INTO asignatura VALUES ('Español')
INSERT INTO asignatura VALUES ('Geografía')
INSERT INTO asignatura VALUES ('Historia')
INSERT INTO asignatura VALUES ('Matemáticas')
INSERT INTO asignatura VALUES ('Física')

SELECT *
FROM asignatura

CREATE TABLE notas(
idNota INT PRIMARY KEY IDENTITY(1,1),
idEstudiante INT,
idAsignatura INT,
nota DECIMAL(3,2),
FOREIGN KEY (idEstudiante) REFERENCES estudiantes(idEstudiante),
FOREIGN KEY (idAsignatura) REFERENCES asignatura(idAsignatura),

);
	-- REFERENCES 
	
	--DROP TABLE Notas

	SELECT *
	FROM estudiantes
	SELECT *
	FROM asignatura

	-- Insertando datos a la tabla intermedia notas

	INSERT INTO notas VALUES  (1,1,3.5)
	INSERT INTO notas VALUES  (1,2,4.5)
	INSERT INTO notas VALUES  (1,3,4.1)
	INSERT INTO notas VALUES  (1,4,3.8)
	INSERT INTO notas VALUES  (1,5,5)

	INSERT INTO notas VALUES  (2,1,3.8)
	INSERT INTO notas VALUES  (2,2,4.7)
	INSERT INTO notas VALUES  (2,3,4)
	INSERT INTO notas VALUES  (2,4,3.7)
	INSERT INTO notas VALUES  (2,5,4.8)

	SELECT *
	FROM notas

	SELECT *
	FROM estudiantes


	UPDATE estudiantes SET nombre='JORGE LUIS' WHERE idEstudiante=1
