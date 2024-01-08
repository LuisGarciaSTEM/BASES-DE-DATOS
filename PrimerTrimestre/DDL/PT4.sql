DROP SCHEMA IF EXISTS CAZAFANTASMAS;
CREATE SCHEMA CAZAFANTASMAS;
USE CAZAFANTASMAS;

CREATE TABLE CAZAFANTASMA (
	ID INT PRIMARY KEY AUTO_INCREMENT, 
    NOMBRE VARCHAR(50) NOT NULL, 
    AÑOS_EXPERIENCIA TINYINT, 
    ESPECIALIZACIÓN VARCHAR(50),
    
    CONSTRAINT AÑOS_EXPERIENCIA_MAS_0 CHECK (AÑOS_EXPERIENCIA>0)
);

CREATE TABLE GRUPO (
	ID INT PRIMARY KEY AUTO_INCREMENT, 
    NOMBRE VARCHAR(50)  NOT NULL, 
    FECHA_FORMACIÓN DATE, 
    FECHA_DISOLUCIÓN DATE, 
    ID_LÍDER INT,
    
    FOREIGN KEY (ID_LÍDER) REFERENCES CAZAFANTASMA(ID),
    
    CONSTRAINT FECHA_DISOLUCIÓN_POSTERIOR CHECK (FECHA_DISOLUCIÓN>FECHA_FORMACIÓN)
);

CREATE TABLE EQUIPO (
	ID INT PRIMARY KEY AUTO_INCREMENT, 
    NOMBRE VARCHAR(50) UNIQUE NOT NULL, 
    DIFICULTAD_USO VARCHAR(50) DEFAULT "MEDIA", 
    FOTO MEDIUMBLOB, 
    DESCRIPCIÓN MEDIUMTEXT
);

CREATE TABLE PERSONA (
	ID INT PRIMARY KEY AUTO_INCREMENT,  
    NOMBRE VARCHAR(50)  NOT NULL, 
    FECHA_NACIMIENTO DATE, 
    FECHA_DEFUNCIÓN DATE
);

CREATE TABLE FANTASMA (
	ID INT PRIMARY KEY AUTO_INCREMENT,  
    NOMBRE VARCHAR(50) NOT NULL UNIQUE, 
    EDAD SMALLINT, 
    TIPO VARCHAR(50), 
    DESCRIPCIÓN MEDIUMTEXT, 
    ID_CAZAFANTASMA INT, 
    ID_PERSONA INT,
    
    FOREIGN KEY (ID_CAZAFANTASMA) REFERENCES CAZAFANTASMA(ID),
    FOREIGN KEY (ID_PERSONA) REFERENCES PERSONA(ID),
    
    CONSTRAINT EDAD_1_1000 CHECK (EDAD BETWEEN 1 AND 1000)
);

CREATE TABLE CAZAFANTASMA_PERTENECE_GRUPO (
	ID_CAZAFANTASMA INT, 
    ID_GRUPO INT,
    
    PRIMARY KEY(ID_CAZAFANTASMA, ID_GRUPO),
    
    FOREIGN KEY (ID_CAZAFANTASMA) REFERENCES CAZAFANTASMA(ID),
    FOREIGN KEY (ID_GRUPO) REFERENCES GRUPO(ID)
);

CREATE TABLE CAZAFANTASMA_MANEJA_EQUIPO (
	ID_CAZAFANTASMA INT, 
    ID_EQUIPO INT,
    
    PRIMARY KEY(ID_CAZAFANTASMA, ID_EQUIPO),
    
    FOREIGN KEY (ID_CAZAFANTASMA) REFERENCES CAZAFANTASMA(ID),
    FOREIGN KEY (ID_EQUIPO) REFERENCES EQUIPO(ID)
);

CREATE TABLE PERSONA_AVISTA_FANTASMA (
	ID_PERSONA INT, 
    ID_FANTASMA INT, 
    FECHA DATE, 
    LUGAR VARCHAR(50),
    
    PRIMARY KEY(ID_PERSONA, ID_FANTASMA, FECHA),
    
    FOREIGN KEY (ID_PERSONA) REFERENCES CAZAFANTASMA(ID),
    FOREIGN KEY (ID_FANTASMA) REFERENCES FANTASMA(ID)
);

CREATE TABLE GRUPO_INVESTIGA_FANTASMA (
	ID_GRUPO INT, 
    ID_FANTASMA INT,
    
    PRIMARY KEY(ID_GRUPO, ID_FANTASMA),
    
    FOREIGN KEY (ID_GRUPO) REFERENCES GRUPO(ID),
    FOREIGN KEY (ID_FANTASMA) REFERENCES FANTASMA(ID)
);

