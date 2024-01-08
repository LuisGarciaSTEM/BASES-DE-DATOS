DROP SCHEMA IF EXISTS COLEGIO;
CREATE SCHEMA COLEGIO;
USE COLEGIO;

CREATE TABLE PROFESOR (
	NRP INT PRIMARY KEY AUTO_INCREMENT, 
    NOMBRE VARCHAR(50), 
    ÁREA_CONOCIMIENTO VARCHAR(50), 
    CATEGORÍA VARCHAR(50), 
    CÓDIGO_DEPARTAMENTO INT
);

CREATE TABLE DEPARTAMENTO (
	CÓDIGO INT PRIMARY KEY AUTO_INCREMENT, 
    NRP_DIRECTOR INT,
    FOREIGN KEY (NRP_DIRECTOR) REFERENCES PROFESOR(NRP)
);

ALTER TABLE PROFESOR 
ADD FOREIGN KEY (CÓDIGO_DEPARTAMENTO) REFERENCES DEPARTAMENTO(CÓDIGO);

CREATE TABLE GRUPO (
	CÓDIGO INT PRIMARY KEY AUTO_INCREMENT, 
    MÁXIMO_ALUMNOS SMALLINT, 
    TIPO VARCHAR(50)
);

CREATE TABLE GRUPO_TEORÍA (
	CÓDIGO_GRUPO INT PRIMARY KEY,
    HORAS_CLASE TIME,
    FOREIGN KEY (CÓDIGO_GRUPO) REFERENCES GRUPO(CÓDIGO)
);

CREATE TABLE GRUPO_PRÁCTICA (
	CÓDIGO_GRUPO INT PRIMARY KEY,
    TALLER VARCHAR(50),
    FOREIGN KEY (CÓDIGO_GRUPO) REFERENCES GRUPO(CÓDIGO)
);

CREATE TABLE ALUMNO (
	DNI CHAR(9) PRIMARY KEY,
    FECHA_NACIMIENTO DATE,
    NOMBRE VARCHAR(50),
    BECA BOOLEAN,
    CONSTRAINT DNI_VALIDO CHECK ( DNI RLIKE "[0-9]{8}[A-Z]" )
);

CREATE TABLE ASIGNATURA (
	CÓDIGO INT PRIMARY KEY AUTO_INCREMENT, 
    NOMBRE VARCHAR(50), 
    CRÉDITOS SMALLINT, 
    CARÁCTER CHAR(1),
    CURSO TINYINT
);

CREATE TABLE PROFESOR_IMPARTE_GRUPO (
	NRP INT, 
    CÓDIGO_GRUPO INT,
    PRIMARY KEY (NRP, CÓDIGO_GRUPO),
    FOREIGN KEY (NRP) REFERENCES PROFESOR(NRP),
    FOREIGN KEY (CÓDIGO_GRUPO) REFERENCES GRUPO(CÓDIGO)
);

CREATE TABLE GRUPO_CONTIENE_ASIGNATURA (
	CÓDIGO_GRUPO INT, 
    CÓDIGO_ASIGNATURA INT,
    PRIMARY KEY(CÓDIGO_GRUPO, CÓDIGO_ASIGNATURA),
    FOREIGN KEY (CÓDIGO_GRUPO) REFERENCES GRUPO(CÓDIGO),
    FOREIGN KEY (CÓDIGO_ASIGNATURA) REFERENCES ASIGNATURA(CÓDIGO)
);

CREATE TABLE MATRÍCULA (
	DNI_ALUMNO CHAR(9), 
	CÓDIGO_GRUPO INT, 
    CÓDIGO_ASIGNATURA INT,
    PRIMARY KEY(DNI_ALUMNO, CÓDIGO_GRUPO, CÓDIGO_ASIGNATURA),
    FOREIGN KEY (DNI_ALUMNO) REFERENCES ALUMNO(DNI),
    FOREIGN KEY (CÓDIGO_GRUPO) REFERENCES GRUPO(CÓDIGO),
    FOREIGN KEY (CÓDIGO_ASIGNATURA) REFERENCES ASIGNATURA(CÓDIGO)
);