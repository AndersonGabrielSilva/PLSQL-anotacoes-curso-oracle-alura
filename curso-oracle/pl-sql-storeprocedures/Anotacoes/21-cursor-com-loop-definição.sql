
/*
    CURSOR
    - Um cursor armazena os dados de uma consulta SELECT em memoria, é
      semelhante a uma lista.
    - Fases de um CURSOR
       #Declaração
       #Abertura
       #Percorrer Cursor
       #Fechar Cursor
    
    **Sintaxe**
    DECLARE 
         CURSOR cursor_name IS SELECT camp3, campo2 FROM table_name;
    BEGIN 
        OPEN cursor_name;            
            FETCH cursor_name INTO variavel_qualquer;
            FETCH cursor_name INTO variavel_qualquer;        
        CLOSE;
    END;
    
    - A cada comando fecth o index do cursor avança uma linha;
    - Semelhante ao GetEnumerator do C# .NET
    
*/
-- CURSOR BASE / COMO UTILIZAR
SET SERVEROUTPUT ON;
DECLARE
    v_CLIENTE_ID CLIENTE.ID%TYPE;
    v_RAZAO_SOCIAL CLIENTE.RAZAO_SOCIAL%TYPE;
    CURSOR cur_CLIENTE IS SELECT ID, RAZAO_SOCIAL FROM CLIENTE;
BEGIN
    OPEN cur_CLIENTE;
     
     LOOP
        FETCH cur_CLIENTE INTO v_CLIENTE_ID, v_RAZAO_SOCIAL; -- A SEQUENCIA DEVE SER A MESMA QUE VEM NO SQL       
     
     DBMS_OUTPUT.put_line(v_CLIENTE_ID || ' - ' || v_RAZAO_SOCIAL);    
     --DBMS_OUTPUT.put_line(v_RAZAO_SOCIAL);
     
     EXIT WHEN cur_CLIENTE%NOTFOUND;-- SAIA DO LOOP QUANDO O FETCH NÃO ENCONTRAR
                                    -- UMA LINHA
    
     END LOOP;
    
    CLOSE cur_CLIENTE;

END;

--******************* CURSOR NO MUNDO REAL PARA EXECULTAR PROCEDURE *************************

DECLARE
    V_SEG_MERCADO_ID CLIENTE.SEQMERCADO_ID%TYPE := 7;
    v_CLIENTE_ID CLIENTE.ID%TYPE;
    CURSOR cur_CLIENTE IS SELECT ID FROM CLIENTE;
BEGIN
    OPEN cur_CLIENTE;
     
     LOOP
        FETCH cur_CLIENTE INTO v_CLIENTE_ID; -- A SEQUENCIA DEVE SER A MESMA QUE VEM NO SQL       
     
     EXIT WHEN cur_CLIENTE%NOTFOUND;-- SAIA DO LOOP QUANDO O FETCH NÃO ENCONTRAR
                                    -- UMA LINHA
    
     atualizar_cli_seg_mercado(p_id=>v_CLIENTE_ID,p_segmercado_id=> V_SEG_MERCADO_ID);
    
     END LOOP;
    
    CLOSE cur_CLIENTE;
END;

SELECT*FROM CLIENTE;


