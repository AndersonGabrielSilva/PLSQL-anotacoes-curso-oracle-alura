
/*
    FOR -> INICIO DO COMANDO FOR
         SINTAXE : FOR V_INDICE IN 1..10 LOOP
                    |       |        | 
   Inicio do comando    Indice    Range do FOR: Exemplo vai de 1 até 10
                
    IN -> CONDIÇÃO DE SAIDA DO LOOP
    
    END LOOP -> FINAL DO LOOP
*/

EXECUTE atualizar_cli_seg_mercado(5,7);

SELECT*FROM SEG_MERCADO;

SELECT*FROM CLIENTE;

DECLARE
    V_SEG_MERCADO_ID CLIENTE.SEQMERCADO_ID%TYPE := 3;
    
    v_inicio number(3) := 1;
    v_termino number(3) := 10;
BEGIN 
   FOR V_INDICE IN v_inicio..v_termino LOOP
    atualizar_cli_seg_mercado(V_INDICE,V_SEG_MERCADO_ID);   
   END LOOP;           
END;







