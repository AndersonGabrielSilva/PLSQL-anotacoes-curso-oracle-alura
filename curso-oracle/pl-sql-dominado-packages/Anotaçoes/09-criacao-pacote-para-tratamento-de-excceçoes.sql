/*
 Organizando as exceçoes
*/

-- Criando pacote para tratamento de exception
CREATE OR REPLACE PACKAGE EXCEPTION_PAC    
IS
    --CODE ERROR: ORA-01400;
    e_null EXCEPTION;    
    PRAGMA EXCEPTION_INIT(e_null,-1140);
    
    --CODE ERROR: ORA-02291
    e_fk EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_fk,-2291);
    
END;


--***************** Forma de adicionar a exception no bloco *******************
/* 

EXCEPTION
    WHEN EXCEPTION_PAC.e_null THEN
        raise_application_error(-2012,'Preenchimento de campo obrigatorio');
        
*/
