/*
    Parametros nomeados
    - É quando passamos o valor diretamente para o seu campo especifico.
      é semelhante a expressão lambda do C# ou do javascript
     atualizar_cli_seg_mercado(p_id=> V_INDICE,p_segmercado_id => V_SEG_MERCADO_ID);
*/


SELECT*FROM CLIENTE;

DECLARE
    V_SEG_MERCADO_ID CLIENTE.SEQMERCADO_ID%TYPE := 3;
    
    v_inicio number(3) := 1;
    v_termino number(3) := 10;
BEGIN 
   FOR V_INDICE IN v_inicio..v_termino LOOP
    atualizar_cli_seg_mercado(p_id=>V_INDICE,p_segmercado_id=> V_SEG_MERCADO_ID);
   END LOOP;           
END;
