/*
    LOOP -> INFORMA QUE ESTOU INICIANDO UM LOOP
    
    EXIT WHEN -> CONDIÇÃO DE SAIDA DO LOOP
    
    END LOOP -> FINAL DO LOOP
*/

EXECUTE atualizar_cli_seg_mercado(5,7);

SELECT*FROM SEG_MERCADO;

SELECT*FROM CLIENTE;


DECLARE
    V_SEG_MERCADO_ID CLIENTE.SEQMERCADO_ID%TYPE := 3;
    v_Indice NUMBER(3) :=1;    
BEGIN 
    LOOP
        atualizar_cli_seg_mercado(v_Indice,V_SEG_MERCADO_ID);
        V_INDICE := V_INDICE + 1;
    EXIT WHEN V_INDICE > 6;    
    END LOOP;
END;







