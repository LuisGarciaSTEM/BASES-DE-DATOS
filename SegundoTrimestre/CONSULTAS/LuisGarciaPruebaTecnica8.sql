USE WORLD;

# EJ1 - MUESTRA EL NOMBRE DE LOS PAÍSES Y CREA UN CÓDIGO DE PAÍS CONCATENANDO LAS DOS (2) PRIMERAS LETRAS DEL CONTINENTE, EL CODE2 REPETIDO TRES (3) VECES Y LAS TRES (3) PRIMERAS LETRAS DEL PAÍS (TODO EN MAYÚSCULA).

SELECT 
    NAME,
    CONCAT(
        LEFT(CONTINENT, 2), 
        REPEAT(CODE2, 3), 
        UPPER(LEFT(NAME, 3))
    ) AS CODIGO_PAIS
FROM COUNTRY;


# EJ2 - MUESTRA UNA LISTA DE LAS REGIONES EN MAYÚSCULA, Y LA SUPERFICIE TOTAL DE CADA REGIÓN SIN DECIMALES (REDONDEA HACIA ARRIBA).

SELECT 
    UPPER(REGION) AS REGION_MAYUSCULA,
    CEIL(SUM(SURFACEAREA)) AS SUPERFICIE_TOTAL
FROM COUNTRY
GROUP BY UPPER(REGION);

SELECT * FROM COUNTRY;    


# EJ3 - MUESTRA EL CÓDIGO DE LOS PAÍESES DE EUROPA O ASIA CON MÁS DE 10M DE HABITANTES Y EL NOMBRE DEL PAÍS CONCATENANDO CON SU NOMBRE LOCAL (LocalName).

SELECT 
    CODE AS CODIGO_PAIS,
    CONCAT(NAME, ' - ', LocalName) AS NOMBRE_COMPLETO
FROM COUNTRY    
WHERE 
    (CONTINENT = 'EUROPE' OR CONTINENT = 'ASIA') 
	AND POPULATION > 10000000;
    

SELECT * FROM COUNTRY;
    
    
# EJ4 - MUESTRA UNA LISTA DE LOS NOMBRES DE LOS PAISES, SU NOMBRE LOCAL Y UNA COLUMNA BOOLEANA QUE INDICA SI COINICDEN LOS NOMBRES ANTERIORES.

 SELECT 
    NAME,
    LocalName, 
    (NAME = LocalName) AS COINCIDEN
FROM COUNTRY;

SELECT * FROM COUNTRY;


# EJ5 - MUESTRA UNA LISTA DE LOS PAÍSES QUE HABLAN MÁS DE DOS (2) IDIOMAS DE FORMA OFICIAL Y SU ESPERANZA DE VIDA REDONDEADA HACIA ABAJO.

SELECT 
	NAME,
    FLOOR(LIFEEXPECTANCY)
FROM COUNTRY 
WHERE 
	CODE IN
		(SELECT 
			COUNTRYCODE
			#COUNT(*) AS IDIOMAS_OFICIALES
		FROM COUNTRYLANGUAGE 
		WHERE ISOFFICIAL="T"
		GROUP BY COUNTRYCODE
		HAVING COUNT(*)>2);
        
SELECT * FROM COUNTRY;       
        