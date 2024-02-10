# Índices simples (o normales): Estos son los índices más comunes en MySQL y se crean utilizando la sentencia CREATE INDEX. Pueden ser creados en una o varias columnas y son eficaces para consultas que filtran o buscan registros basados en una columna o una combinación de columnas. 

# Por ejemplo:
CREATE INDEX index_name ON table_name(column_name);

# Índices únicos: Estos índices garantizan que los valores en la columna (o columnas) especificada sean únicos en la tabla. Son útiles cuando necesitas asegurarte de que no haya duplicados en una columna específica. Pueden crearse con la sentencia CREATE UNIQUE INDEX.

# Por ejemplo:
CREATE UNIQUE INDEX index_name ON table_name(column_name);

# Claves primarias (Primary Keys): La clave primaria es un tipo especial de índice único que se utiliza para identificar de manera única cada fila en una tabla. Se utiliza la sentencia ALTER TABLE para agregar una clave primaria a una tabla. 

# Por ejemplo:
ALTER TABLE table_name ADD PRIMARY KEY (column_name);

# Claves externas (Foreign Keys): Aunque no son índices en sí mismos, las claves externas son importantes para mantener la integridad referencial entre tablas. Se crean utilizando la sentencia ALTER TABLE y estableciendo una restricción de clave externa. 

# Por ejemplo:
ALTER TABLE table_name ADD FOREIGN KEY (column_name) REFERENCES other_t;



# EJ1 - CREA UN ÍNIDCE DE TIPO HASH Y ÚNICO PARA LA MATRÍCULA DE LOS VEHÍCULOS
# EJ2 - CREA UN ÍNDICE PARA LA FECHA DE PERMISO Y DE NACIMIENTO DE LOS LIENTES