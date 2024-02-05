USE SAKILA;

SELECT * FROM FILM;

# EJ1 MUESTRA LA PLEÍCULA MÁS LARGA

SELECT TITLE, LENGTH FROM FILM ORDER BY LENGTH DESC LIMIT 1;

SELECT TITLE, LENGTH FROM FILM WHERE LENGTH = (SELECT MAX(LENGTH) FROM FILM);

# EJ2 MUESTRA LA PELÍCULA CON MENOR DURACIÓN

SELECT TITLE, LENGTH FROM FILM ORDER BY LENGTH ASC LIMIT 1;

SELECT TITLE, LENGTH FROM FILM WHERE LENGTH = (SELECT MIN(LENGTH) FROM FILM);

# EJ3 MUESTRA LOS DISTINTOS RATING DE EDAD USADOS

SELECT DISTINCT RATING FROM FILM;

# EJ4 CUÁNTAS PELÍCULAS DURAN MÁS DE 2H

SELECT COUNT(*) FROM FILM WHERE LENGTH>(60*2);

# EJ5 MUESTRA EL NOMBRE DE LAS PELÍCULAS Y SU DURACIÓN EN HORAS (ORDENA DE MENOR A MAYOR DURACIÓN)

SELECT 
	TITLE,
    LENGTH/60 AS DURACION_HORAS
FROM FILM
ORDER BY LENGTH ASC;

# EJ6 ¿CUÁNTAS PELÍCULAS CONTIENEN ESCENAS ELIMINADAS?

SELECT COUNT(*) FROM FILM WHERE SPECIAL_FEATURES LIKE "%DELETED SCENES%";

# EJ7 ¿QUÉ PELÍCULAS TIENEN "ALIEN" EN SU NOMBRE? (MUESTRA POR ORDEN ALFABÉTICO)

SELECT * FROM FILM WHERE TITLE LIKE "%ALIEN%" ORDER BY TITLE;

# EJ8 ¿CUÁL ES LA PELÍCULA MÁS LARGA QUE PODEMOS VER POR MENOS DE 1$ (RENTAL_RATE)?

SELECT 
	TITLE, 
    LENGTH 
FROM FILM WHERE RENTAL_RATE<1 
ORDER BY LENGTH DESC
LIMIT 1;

SELECT 
	TITLE, 
    LENGTH 
FROM FILM WHERE RENTAL_RATE<1 
AND LENGTH = (SELECT MAX(LENGTH) FROM FILM WHERE RENTAL_RATE<1);

# EJ9 ¿CUÁNTAS PELÍCULAS SON DOCUMENTALES? (COLUMNA DESCRIPTION)

SELECT COUNT(*) FROM FILM WHERE DESCRIPTION LIKE "%DOCUMENTARY%";

# EJ10 ¿CUÁL ES EL PRECIO DE REEMPLAZO MEDIO DE LAS PELÍCULAS CON RATING "R"?

SELECT AVG(REPLACEMENT_COST) FROM FILM WHERE RATING = "R";

# EJ11 ¿CUÁNTOS DÍAS TARDARÍAMOS EN VER TODAS LAS PELÍCULAS? ¿Y AÑOS?

SELECT SUM(LENGTH)/60/24/365 FROM FILM;

USE SAKILA;

# PT7 - EJ1.- ¿CUÁLES SON LAS TARIFAS DE ALQUILER (RENTAL RATE)?

SELECT DISTINCT RENTAL_RATE FROM FILM;

# PT7 - EJ2.- ¿CUÁNTAS PELÍCULAS DURAN MÁS DE 100 MINUTOS Y TIENEN UN RATING DE PG, R O G?

SELECT COUNT(*) FROM FILM WHERE LENGTH>100 AND RATING IN ("PG", "R", "G");

SELECT COUNT(*) FROM FILM WHERE LENGTH>100 AND (RATING = "PG" OR RATING = "R" OR RATING = "G");

# PT7 - EJ3.- ¿CUÁL ES LA PELÍCULA O PELÍCULAS CON MAYOR DURACIÓN DE LAS QUE CONTIENEN TRAILERS COMO EXTRAS?

SELECT TITLE, LENGTH FROM FILM 
WHERE LENGTH = (SELECT MAX(LENGTH) FROM FILM WHERE SPECIAL_FEATURES LIKE "%TRAILERS%")
AND SPECIAL_FEATURES LIKE "%TRAILERS%";

# PT7 - EJ4.- ¿QUÉ PELÍCULAS ESTÁN PROTAGONIZADAS POR UN ASTRONAUTA Y UN ADMINSTRADOR DE BASES DE DATOS (DESCRIPTION)?

SELECT * FROM FILM WHERE DESCRIPTION LIKE "%DATABASE ADMINISTRATOR%" AND DESCRIPTION LIKE "%ASTRONAUT%";

# PT7 - EJ5.- ¿CUÁNTO DURAN, DE MEDIA, LAS PELÍCULAS PROTAGONIZADAS POR EL ACTOR 1 (FILM_ACTOR)?

SELECT AVG(LENGTH) FROM FILM
WHERE FILM_ID IN (SELECT FILM_ID FROM FILM_ACTOR WHERE ACTOR_ID=1);

# PT7 - EJ6.- ¿CUÁNTO TARDARÍAMOS (EN HORAS) EN VER TODAS LAS PELÍCULAS DE CATEGORÍA 6 (FILM_CATEGORY)?

SELECT SUM(LENGTH)/60 FROM FILM
WHERE FILM_ID IN (SELECT FILM_ID FROM FILM_CATEGORY WHERE CATEGORY_ID=6);

# EJ12 MUESTRA LOS PRECIOS DE ALQUILER (RENTAL_RATE) Y CUÁNTAS PELÍCULAS SE ALQUILAN DE CADA PRECIO.

SELECT 
	RENTAL_RATE,
    COUNT(*) AS CANTIDAD
FROM FILM
GROUP BY RENTAL_RATE;

# EJ13 MUESTRA LA DURACIÓN MEDIA DE LAS PELÍCULAS AGRUPADAS POR RATING.

SELECT 
	RATING,
    ROUND(AVG(LENGTH)) AS DURACION_MEDIA
FROM FILM
GROUP BY RATING;

# EJ14 MUESTRA LA DURACIÓN MEDIA DE LAS PELÍCULAS SIN ESCENAS ELIMINADAS AGRUPADAS POR RATING.

SELECT 
	RATING,
    ROUND(AVG(LENGTH)) AS DURACION_MEDIA
FROM FILM
WHERE SPECIAL_FEATURES NOT LIKE "%DELETED SCENES%"
GROUP BY RATING;

# EJ15 ¿CUÁNTO NOS COSTARÍA REEMPLAZAR (REPLACEMENT_COST) LAS PELÍCULAS DE JENNIFER DAVIS (TABLA ACTOR Y FILM_ACTOR) SI VAMOS AL VIDEOCLUB Y LAS DESTRUIMOS?

SELECT
	SUM(REPLACEMENT_COST)
FROM FILM 
WHERE FILM_ID IN 
	(SELECT FILM_ID FROM FILM_ACTOR 
	WHERE ACTOR_ID = 
			(SELECT 
				ACTOR_ID 
			FROM ACTOR 
			WHERE FIRST_NAME="JENNIFER" AND LAST_NAME="DAVIS")
	);

SELECT * FROM FILM_ACTOR;

# EJ16 MUESTRA EL NOMBRE DE LAS PELÍCULAS EN MINÚSCULA

SELECT 
	LOWER(TITLE) AS NOMBRE_MINUSUCLA
FROM FILM;

# EJ17 CREA UN CÓDIGO CONCATENANDO LAS 4 PRIMERAS LETRAS DE CADA PELÍCULA Y LOS 2 ÚLTIMOS DÍGITOS DE LA FECHA DE LANZAMIENTO.

SELECT 
	TITLE,
    RELEASE_YEAR,
    CONCAT(LEFT(TITLE, 4),RIGHT(RELEASE_YEAR, 2)) AS CODIGO
FROM FILM;

# EJ18 IGUAL QUE EJ17 PERO EN MINÚSCULA

SELECT 
	TITLE,
    RELEASE_YEAR,
    LOWER(CONCAT(LEFT(TITLE, 4),RIGHT(RELEASE_YEAR, 2))) AS CODIGO
FROM FILM;

# EJ19 CREA UN CÓDIGO DE ACTOR CONCATENANDO LAS 3 PRIMERAS LETRAS DEL NOMBRE Y LAS 3 PRIMERAS LETRAS DE LOS APELLIDOS DE CADA ACTOR Y DÁNDOLE LA VUELTA A LA CADENA. EN MINÚSCULA.

SELECT 
	FIRST_NAME,
    LAST_NAME,
    REVERSE(LOWER(CONCAT(LEFT(FIRST_NAME, 3),LEFT(LAST_NAME, 3)))) AS CODIGO
FROM ACTOR;

# EJ20 MUESTRA LA DURACIÓN MEDIA DE LAS PELÍCULAS AGRUPADAS POR RATING (REDONDEA 2 DECIMALES)

SELECT 
	RATING,
    ROUND(AVG(LENGTH), 2) AS DURACION_MEDIA
FROM
	FILM
GROUP BY RATING;

# EJ21 SUPONIENDO QUE RENTAL_DURATION ES LA DURACIÓN EN DÍAS DEL ALQUILER, Y QUE RENTAL_RATE ES EL PRECIO DIARIO DE CADA PELÍCULA, MUESTRA: 
#	- EL NOMBRE DE LA PELÍCULA, 
#	- LOS DÍAS DE ALQUILER,
#	- EL PRECIO DIARIO,
#	- EL PRECIO TOTAL
#	- UNA COLUMNA QUE ME DIGA CUÁNTOS BILLETES DE 10 DÓLARES
#	  NECESITARÍA PARA ALQUILAR LA PELÍCULA.

SELECT
	TITLE,
    RENTAL_DURATION,
    RENTAL_RATE,
    RENTAL_DURATION*RENTAL_RATE AS TOTAL_RATE,
    CEIL(RENTAL_DURATION*RENTAL_RATE/10) AS BILLETE_10
FROM FILM;

# EJ22 SELECCIONA EL TÍTULO DE LAS PELÍCULAS, UNA COLUMNA QUE MUESTRE SI DURA MÁS O MENOS DE 2H, OTRA COLUMNA QUE MUESTRE SI TIENE O NO ESCENAS ELIMINADAS Y OTRA QUE MUESTRE SI TIENE O NO TRAILERS (COLUMNAS BOOLEANAS).

SELECT 
    TITLE,
    LENGTH,
    SPECIAL_FEATURES,
    LENGTH > 120 AS DURA_MAS_2H,
    SPECIAL_FEATURES LIKE '%DELETED SCENES%' AS TIENE_ESCENAS_ELIMINADAS,
    SPECIAL_FEATURES LIKE '%TRAILERS%' AS TIENE_TRAILERS
FROM
    FILM;

# EJ23 SELECCIONA EL TÍTULO DE LAS PELÍCULAS Y UNA COLUMNA QUE MUESTRE SI LA PELÍCULA ES APTA PARA TODOS LOS PÚBLICOS (G, PG Y PG-13)

SELECT 
    TITLE,
    RATING IN ("G", "PG", "PG-13") AS APTA
FROM
    FILM;

# EJ24 SELECCIONA LA DURACIÓN MÁXIMA DE LAS PELÍCULAS AGRUPADAS POR RENTAL_DURATION

SELECT 
	RENTAL_DURATION,
    MAX(LENGTH) AS MAXIMA_DURACION
FROM FILM
GROUP BY RENTAL_DURATION;

# EJ25 SELECCIONA EL COSTE DE REEMPLAZO MEDIO DE LAS PELÍCULAS AGRUPADAS POR DURACIÓN>120

SELECT 
	LENGTH>120,
	AVG(REPLACEMENT_COST)
FROM FILM
GROUP BY LENGTH>120;

# EJ26 ¿CUÁL ES EL ACTOR QUE MÁS PELÍCULAS HA HECHO? TABLAS ACTOR Y ACTOR_FILM (USA LIMIT 1). MUESTRA EL NOMBRE DEL ACTOR Y SU APELLIDO CONCATENADO.

SELECT 
	CONCAT(FIRST_NAME, " ", LAST_NAME) AS ACTOR
FROM ACTOR
WHERE ACTOR_ID =
	(SELECT 
		ACTOR_ID
	FROM FILM_ACTOR
	GROUP BY ACTOR_ID
	ORDER BY COUNT(FILM_ID) DESC 
	LIMIT 1);

# EJ27 MUESTRA LAS CATEGORÍAS DE PELÍCULA (CÓDIGO DE CATEGORÍA) QUE HAY Y CUÁNTAS PELÍCULAS HAY DE CADA CATEGORÍA. TABLA FILM_CATEGORY.

SELECT
	CATEGORY_ID,
    COUNT(*) AS PELÍCULAS
FROM FILM_CATEGORY
GROUP BY CATEGORY_ID;

# EJ28 MUESTRA LOS DISTINTOS AÑOS DE LANZAMIENTO PARA LOS QUE TENEMOS PELÍCULAS.

SELECT DISTINCT RELEASE_YEAR FROM FILM;

# EJ29 MUESTRA (EN MINÚSUCLA) EL NOMBRE Y LOS APELLIDOS DE LOS ACTORES QUE HAN HECHO MÁS DE 15 PELÍCULAS (CUENTA SOLO PELÍCULAS DE MÁS DE 100 MINUTOS)

SELECT 
	LOWER(FIRST_NAME), 
    LOWER(LAST_NAME) 
FROM ACTOR 
WHERE ACTOR_ID IN
		(SELECT 
			ACTOR_ID
		FROM FILM_ACTOR 
		WHERE FILM_ID IN (SELECT FILM_ID FROM FILM WHERE LENGTH>100)
		GROUP BY ACTOR_ID
		HAVING COUNT(FILM_ID)>15);

# EJ30 ¿CUÁL ES EL RENTAL_RATE MEDIO DE LAS PELÍCULAS EN LAS QUE APARECE UN FRISBEE?

SELECT AVG(RENTAL_RATE) FROM FILM WHERE DESCRIPTION LIKE "%FRISBEE%";

# EJ31 ¿QUÉ ACTOR HA PARTICIPADO EN MÁS PELÍCULAS CON FRISBEE? (USA LIMIT 1)

SELECT 
	FIRST_NAME, 
    LAST_NAME
FROM ACTOR 
WHERE ACTOR_ID =
		(SELECT 
			ACTOR_ID
		FROM
			FILM_ACTOR
		WHERE
			FILM_ID IN (SELECT FILM_ID FROM FILM WHERE DESCRIPTION LIKE '%FRISBEE%')
		GROUP BY ACTOR_ID
		ORDER BY COUNT(*) DESC
		LIMIT 1);
        
# EJ32 - MUESTRA LA DIRECCIÓN DE LAS TIENDAS Y CÚANTAS PELÍCULAS HAY EN CADA UNA

SELECT 
    A.ADDRESS,
    COUNT(I.FILM_ID) AS NUM_PELICULAS
FROM STORE AS S
JOIN ADDRESS AS A ON S.ADDRESS_ID = A.ADDRESS_ID
JOIN INVENTORY AS I ON S.STORE_ID = I.STORE_ID
GROUP BY S.STORE_ID, A.ADDRESS;



# EJ33 - ¿CUÁL ES LA PELÍCULA DE LA QUE TENEMOS MÁS COPIAS?

SELECT 
	F.TITLE,
    COUNT(*) AS QTY_PELÍCULAS
FROM INVENTORY AS INV
JOIN FILM AS F ON INV.FILM_ID=F.FILM_ID
GROUP BY F.FILM_ID
ORDER BY QTY_PELÍCULAS DESC 
LIMIT 1;


SELECT 
    F.TITLE, COUNT(*) AS QTY_PELÍCULAS
FROM
    INVENTORY AS INV
        JOIN
    FILM AS F ON INV.FILM_ID = F.FILM_ID
GROUP BY F.FILM_ID
HAVING QTY_PELÍCULAS = (SELECT 
        MAX(QTY_PELÍCULAS)
    FROM
        (SELECT 
            F.TITLE, COUNT(*) AS QTY_PELÍCULAS
        FROM
            INVENTORY AS INV
        JOIN FILM AS F ON INV.FILM_ID = F.FILM_ID
        GROUP BY F.FILM_ID) AS QTY_POR_TÍTULO);

# EJ34 - MUESTRA LA DIRECCIÓN DE LAS TIENDAS Y CÚANTO EN TOTAL HA FACTURADO CADA UNA.

SELECT
	A.ADDRESS,
    SUM(PAY.AMOUNT) AS FACTURACIÓN
FROM PAYMENT PAY
JOIN RENTAL RENT ON PAY.RENTAL_ID=RENT.RENTAL_ID
JOIN INVENTORY INV ON RENT.INVENTORY_ID=INV.INVENTORY_ID
JOIN STORE S ON INV.STORE_ID=S.STORE_ID
JOIN ADDRESS A ON S.ADDRESS_ID=A.ADDRESS_ID
GROUP BY S.STORE_ID;

# EJ35 - MUESTRA UNA LISTA DE LAS PELÍCULAS, Y CUÁNTO HAN PAGADO DE MEDIA POR ALQUILARLAS.

SELECT
	FILM.TITLE,
    ROUND(AVG(PAY.AMOUNT), 2) AS PAGO_MEDIO
FROM PAYMENT PAY
JOIN RENTAL RENT ON PAY.RENTAL_ID=RENT.RENTAL_ID
JOIN INVENTORY INV ON RENT.INVENTORY_ID=INV.INVENTORY_ID
JOIN FILM ON INV.FILM_ID=FILM.FILM_ID
GROUP BY FILM.FILM_ID;

# EJ36 - ¿CUÁL HA SIDO LA PELÍCULA MÁS RENTABLE?

SELECT
	FILM.TITLE,
    SUM(PAY.AMOUNT) AS INGRESOS_GENERADOS
FROM PAYMENT PAY
JOIN RENTAL RENT ON PAY.RENTAL_ID=RENT.RENTAL_ID
JOIN INVENTORY INV ON RENT.INVENTORY_ID=INV.INVENTORY_ID
JOIN FILM ON INV.FILM_ID=FILM.FILM_ID
GROUP BY FILM.FILM_ID
ORDER BY INGRESOS_GENERADOS DESC
LIMIT 1;

# EJ37 - MUESTRA UNA LISTA DE LOS CLIENTES Y CUÁNTO DINERO HA GASTADO CADA UNO.

SELECT
	CUST.FIRST_NAME,
    CUST.LAST_NAME,
    SUM(PAY.AMOUNT) AS INGRESOS_GENERADOS
FROM PAYMENT PAY
JOIN CUSTOMER CUST ON PAY.CUSTOMER_ID=CUST.CUSTOMER_ID
GROUP BY CUST.CUSTOMER_ID;

# EJ38 - ¿QUIÉN HA SIDO EL CLIENTE MÁS RENTABLE?

SELECT
	CUST.FIRST_NAME,
    CUST.LAST_NAME,
    SUM(PAY.AMOUNT) AS INGRESOS_GENERADOS
FROM PAYMENT PAY
JOIN CUSTOMER CUST ON PAY.CUSTOMER_ID=CUST.CUSTOMER_ID
GROUP BY CUST.CUSTOMER_ID
ORDER BY INGRESOS_GENERADOS DESC
LIMIT 1;

# EJ39 - ¿HAY ALGUNA PELÍCULA PARA LA QUE NO TENGAMOS NINGUNA COPIA?



# EJ40 - MUESTRA UNA LISTA DE LAS PELÍCULAS QUE NOS FALTAN EN LA TIENDA 2

SELECT * 
FROM FILM 
LEFT JOIN INVENTORY INV
ON FILM.FILM_ID=INV.FILM_ID AND INV.STRORE_ID=2
WHERE INV.INVENTORY_ID IS NULL;

# EJ41 - ¿CUÁL ES EL ACTOR MÁS FAMOSO? (AQUEL CUYAS PELÍCULAS SE HAYAN ALQUILADO MÁS VECES)

SHOW TABLES;


# EJ42 - ¿CUAL ES LA PELÍCULA MAS ALQUILADA EN LA TIENDA 2?

 SELECT * 
 FROM TITLE

# EJ43 - ¿DESDE QUÉ PAÍS NOS HAN ALQUILADO MÁS PELÍCULAS? (CUSTOMERS)














