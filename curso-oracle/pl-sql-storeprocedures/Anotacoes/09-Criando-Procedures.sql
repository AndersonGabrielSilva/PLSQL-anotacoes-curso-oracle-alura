-- CRIANDO PROCEDURES
/*
    È A FORMA DE GRAVAR O COMANDO NO BANCO DE DADOS PARA UTILIZAR SEMPRE 
    QUE NECESSARIO.
    
    - ESTRUTURA DE UMA PROCEDURE
    CREATE PROCEDURE "nome_da_procedure"
    
    -- Parametros da Procedure. por padrão começa com p_
    (p_01 number,p_02 varchar2)
    
    IS -- É equivalente ao declare  
    - Dentro deste bloco declamos todas as variaveis que iremos utilizar,
    assim como o declare.
    
    BEGIN
    
    END;
    
      
*/
-- criação da procedure
CREATE PROCEDURE INCLUIR_SEG_MERCADO
(P_ID IN NUMBER, P_DESCRICAO VARCHAR2)
IS
BEGIN 
 INSERT INTO SEG_MERCADO (ID,DESCRICAO) VALUES (P_ID,UPPER(P_DESCRICAO));
    COMMIT;
END;

-- Execultando procedures - 01
EXEC incluir_seg_mercado(6,'esportista');

-- Execultando procedures - 02
BEGIN
    incluir_seg_mercado(7,'INDUSTRIAL');
END;

--SELECT*FROM SEG_MERCADO;