--Montar uma fun��o que eu entro com um faturamento e eu retorno a categoria 
/*
    ELSE IF => ELSIF
*/

--Rascunho da fun��o
/*uma dica � come�ar sempre por meio de um rascunho, anonimo antes de criar 
  uma fun��o ou procedure, depois que conseguimos bater os valores, copiamos o bloco
   para dentro de uma fun��o ou procedure de fato*/
SET SERVEROUTPUT ON;
DECLARE
    V_FATURAMENTO_PREVISTO CLIENTE.FATURAMENTO_PREVISTO%TYPE:=7000;
    V_CATEGORIA CLIENTE.CATEGORIA%TYPE;

BEGIN

    IF (V_FATURAMENTO_PREVISTO < 10000) 
        THEN V_CATEGORIA := 'PEQUENO';
    ELSIF (V_FATURAMENTO_PREVISTO < 50000) 
        THEN V_CATEGORIA := 'M�DIO';
    ELSIF (V_FATURAMENTO_PREVISTO < 100000) 
        THEN V_CATEGORIA := 'M�DIO GRANDE';
    ELSE 
        V_CATEGORIA := 'GRANDE';        
    END IF;        
    
    dbms_output.put_line(V_CATEGORIA);
END;


--**************************CRIA��O DA FUN��O**********************************
-- Criado Fun��o para definir a categoria apartir do faturamento
CREATE OR REPLACE FUNCTION CATEGORIA_CLIENTE
    (p_FATURAMENTO_PREVISTO IN CLIENTE.FATURAMENTO_PREVISTO%TYPE)
    RETURN CLIENTE.CATEGORIA%TYPE
IS
    V_CATEGORIA CLIENTE.CATEGORIA%TYPE;
BEGIN

     IF (p_FATURAMENTO_PREVISTO < 10000) 
        THEN V_CATEGORIA := 'PEQUENO';
    ELSIF (p_FATURAMENTO_PREVISTO < 50000) 
        THEN V_CATEGORIA := 'M�DIO';
    ELSIF (p_FATURAMENTO_PREVISTO < 100000) 
        THEN V_CATEGORIA := 'M�DIO GRANDE';
    ELSE 
        V_CATEGORIA := 'GRANDE';        
    END IF;        

    RETURN V_CATEGORIA;
END;

SET SERVEROUTPUT ON;
DECLARE    
BEGIN     
    DBMS_OUTPUT.PUT_LINE(CATEGORIA_CLIENTE(9000));
END;




