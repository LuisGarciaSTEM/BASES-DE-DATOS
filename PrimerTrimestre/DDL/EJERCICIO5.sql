DROP SCHEMA IF EXISTS PUBLICACIONES;
CREATE SCHEMA PUBLICACIONES;
USE PUBLICACIONES;

CREATE TABLE PUBLICACION(
	ISSN CHAR(8) PRIMARY KEY,
    TITULO VARCHAR(50),
    NUMERO SMALLINT,
    ANIO SMALLINT
);

CREATE TABLE ARTICULO(
	TITULO VARCHAR(50) PRIMARY KEY, 
    PAGINA_INICIO SMALLINT, 
    PAGINA_FIN SMALLINT, 
    ISSN_PUBLICACION CHAR(8),
    
    FOREIGN KEY (ISSN_PUBLICACION) REFERENCES PUBLICACION(ISSN)
);

CREATE TABLE AUTOR(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    E_MAIL VARCHAR(50),
    DEPARTAMENTO VARCHAR(50)
);

CREATE TABLE AUTOR_ESCRIBE_ARTICULO(
	ID_AUTOR INT, 
	TITULO_ARTICULO VARCHAR(50), 
    POSICION TINYINT,
    
    PRIMARY KEY(ID_AUTOR, TITULO_ARTICULO),
       
    FOREIGN KEY (ID_AUTOR) REFERENCES AUTOR(ID),
    FOREIGN KEY (TITULO_ARTICULO) REFERENCES ARTICULO(TITULO)
);

# CREA UNA REVISTA CON DOS ARTÍCULOS.
# CADA ARTÍCULO DEBE ESTAR ESCRITO POR AL MENOS DOS AUTORES.

INSERT INTO PUBLICACION VALUES
("12345678", "NATURE", 256, 2023);

INSERT INTO ARTICULO VALUES
("LA PLAGA DE MOSQUITOS", 20, 65, "12345678"),
("¿PICABAN LOS MOSQUITOS A LOS DINOSAURIOS?", 67, 100, "12345678");

INSERT INTO AUTOR VALUES
(DEFAULT, "JOSELITO", "JOSELITO@CORREO.ES", "BIOLOGÍA"),
(DEFAULT, "JOSEFITA", "JOSEFITA@CORREO.ES", "BIOLOGÍA");

INSERT INTO AUTOR_ESCRIBE_ARTICULO VALUES
(1, "LA PLAGA DE MOSQUITOS", 1),
(2, "LA PLAGA DE MOSQUITOS", 2),
(1, "¿PICABAN LOS MOSQUITOS A LOS DINOSAURIOS?", 2),
(2, "¿PICABAN LOS MOSQUITOS A LOS DINOSAURIOS?", 1);

SELECT * FROM AUTOR_ESCRIBE_ARTICULO;





