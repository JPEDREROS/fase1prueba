USE DATABASE_GITHUB2;
USE SCHEMA OBJETOSGITHUB;

CREATE OR ALTER TABLE TABLE1(ID VARCHAR, NOMBRE VARCHAR);
=======
CREATE OR ALTER TABLE TABLE1 (ID VARCHAR, NOMBRE VARCHAR);
>>>>>>> e5f8f25f113d3470569fded8830142c21cae8353

EXECUTE IMMEDIATE 'SELECT *
FROM TABLE1';


--Ambientes en GitHub ()
--Repositorio final debe tener reglas (protecciones para el Branch, para los permisos en los ajustes)
