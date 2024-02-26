# Crea un usuario que sólo se puede conectar si lo hace desde la misma máquina donde está el servidor de  MySQL.

CREATE USER 'system' IDENTIFIED BY 'efd5r26';

GRANT ALL PRIVILEGES ON *.* TO 'system' WITH GRANT OPTION; 

