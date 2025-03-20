USE DATABASE_GITHUB2;
USE SCHEMA OBJETOSGITHUB;

CREATE OR ALTER TABLE TABLE1(ID VARCHAR, NOMBRE VARCHAR);

EXECUTE IMMEDIATE 'SELECT *
FROM TABLE1';


--Ambientes en GitHub ()
--Repositorio final debe tener reglas (protecciones para el Branch, para los permisos en los ajustes)
