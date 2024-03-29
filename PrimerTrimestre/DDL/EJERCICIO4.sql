DROP SCHEMA IF EXISTS PELICULAS;
CREATE SCHEMA PELICULAS;
USE PELICULAS;

CREATE TABLE PELICULA (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    TITULO VARCHAR(100),
    ANIO SMALLINT,
    NACIONALIDAD VARCHAR(50),
    IDIOMA VARCHAR(50),
    COLOR BOOLEAN, 
    RESTRICCIÓN_EDAD VARCHAR(10),
    RESUMEN TEXT,
    OBSERVACIONES TEXT
);

CREATE TABLE ACTOR (
	ID INT PRIMARY KEY AUTO_INCREMENT, 
	NOMBRE VARCHAR(50), 
	NACIONALIDAD VARCHAR(50)
);

CREATE TABLE DIRECTOR (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	NOMBRE VARCHAR(50),
    FECHA_NACIMIENTO DATE,
    PAÍS_ORIGEN VARCHAR(50)
);

CREATE TABLE ACTOR_ACTUA_PELICULA (
	ID_ACTOR INT, 
	ID_PELICULA INT, 
    PERSONAJE VARCHAR(50),
    
    PRIMARY KEY (ID_PELICULA, ID_ACTOR, PERSONAJE),
    FOREIGN KEY (ID_PELICULA) REFERENCES PELICULA(ID),
    FOREIGN KEY (ID_ACTOR) REFERENCES ACTOR(ID)
);

CREATE TABLE DIRECTOR_DIRIGE_PELICULA (
	ID_DIRECTOR INT,
	ID_PELICULA INT,
    
	PRIMARY KEY (ID_DIRECTOR, ID_PELICULA),
    FOREIGN KEY (ID_PELICULA) REFERENCES PELICULA(ID),
    FOREIGN KEY (ID_DIRECTOR) REFERENCES DIRECTOR(ID)
);

# CREA 2 PELÍCULAS

INSERT INTO PELICULA VALUES
(DEFAULT, "METROPOLI", 1920, "RUSA", "MUDA", FALSE, "+18", "FKJSDFSE", NULL),
(DEFAULT, "WALL-E", 2005,"ESTADOUNIDENSE", "INGLÉS", TRUE, "AP", "ROBOT QUE LIMPIA Y SE QUIERE CONECTAR A EVA", NULL);

# CADA PELÍCULA TIENE DOS ACTORES

INSERT INTO ACTOR (NOMBRE, NACIONALIDAD) VALUES
("PERICO", "ANDORRANO"),
("MANUELA", "ANDORRANO"),
("BAGETO", "FRANCES"),
("ADOLFO", "ALEMÁN");

# UNO DE LOS ACTORES REALIZA 3 PERSONAJES EN UNA MISMA PELÍCULA

INSERT INTO ACTOR_ACTUA_PELICULA VALUES
(1, 1, "ROBOT"),
(2, 1, "ARBOL"),
(3, 2, "WALL-E"),
(3, 2, "TIMÓN"),
(3, 2, "CAPITÁN"),
(4, 2, "EVA");

# CREA DOS DIRECTORES
INSERT INTO DIRECTOR VALUES
(DEFAULT, "JUAN", "1998-03-16", "MEXICANO"),
(DEFAULT, "MOHAMMED", "1975-03-16", "LIBANÉS");

# UNA DE LAS PELÍCUALS ESTÁ CODIRIGIDA POR LOS DOS DIRECTORES

INSERT INTO DIRECTOR_DIRIGE_PELICULA VALUES
(1, 1),
(2, 2),
(2, 1);



