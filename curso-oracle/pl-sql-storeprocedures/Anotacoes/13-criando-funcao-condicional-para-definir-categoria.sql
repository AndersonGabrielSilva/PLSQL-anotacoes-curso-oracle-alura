--Montar uma função que eu entro com um faturamento e eu retorno a categoria 
/*
    ELSE IF => ELSIF
*/

--Rascunho da função
/*uma dica é começar sempre por meio de um rascunho, anonimo antes de criar 
  uma função ou procedure, depois que conseguimos bater os valores, copiamos o bloco
   para dentro de uma função ou procedure de fato*/
SET SERVEROUTPUT ON;
DECLARE
    V_FATURAMENTO_PREVISTO CLIENTE.FATURAMENTO_PREVISTO%TYPE:=7000;
    V_CATEGORIA CLIENTE.CATEGORIA%TYPE;

BEGIN

    IF (V_FATURAMENTO_PREVISTO < 10000) 
        THEN V_CATEGORIA := 'PEQUENO';
    ELSIF (V_FATURAMENTO_PREVISTO < 50000) 
        THEN V_CATEGORIA := 'MÉDIO';
    ELSIF (V_FATURAMENTO_PREVISTO < 100000) 
        THEN V_CATEGORIA := 'MÉDIO GRANDE';
    ELSE 
        V_CATEGORIA := 'GRANDE';        
    END IF;        
    
    dbms_output.put_line(V_CATEGORIA);
END;


--**************************CRIAÇÃO DA FUNÇÃO**********************************
-- Criado Função para definir a categoria apartir do faturamento
CREATE OR REPLACE FUNCTION CATEGORIA_CLIENTE
    (p_FATURAMENTO_PREVISTO IN CLIENTE.FATURAMENTO_PREVISTO%TYPE)
    RETURN CLIENTE.CATEGORIA%TYPE
IS
    V_CATEGORIA CLIENTE.CATEGORIA%TYPE;
BEGIN

     IF (p_FATURAMENTO_PREVISTO < 10000) 
        THEN V_CATEGORIA := 'PEQUENO';
    ELSIF (p_FATURAMENTO_PREVISTO < 50000) 
        THEN V_CATEGORIA := 'MÉDIO';
    ELSIF (p_FATURAMENTO_PREVISTO < 100000) 
        THEN V_CATEGORIA := 'MÉDIO GRANDE';
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




