-- Cria��o do ambiente do curso

-- Alterando se��o para permitir a execu��o do Script
alter session set "_oracle_script"=true;

-- Criacao do usuario user_Dev
CREATE USER user_dev IDENTIFIED BY user_dev
DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;

-- Dando previlegios para o user_dev
GRANT connect, resource TO user_dev;
GRANT create public synonym TO user_dev;
GRANT create view TO user_dev;
GRANT EXECUTE ANY PROCEDURE TO user_dev;
GRANT CREATE ANY DIRECTORY TO user_dev;

CREATE USER user_app IDENTIFIED BY user_app
DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;

GRANT connect, resource TO user_app;


-- Criar as conex�es no Oracle SQL Developer dos usuarios: user_dev e user_app

