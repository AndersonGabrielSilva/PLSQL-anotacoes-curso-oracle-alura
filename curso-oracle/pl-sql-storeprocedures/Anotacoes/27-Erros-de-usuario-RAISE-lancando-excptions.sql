/*
    Erros de usu�rio:    
    RAISE => LAN�ANDO UMA EXCE��O, � SEMELHANTE AO THROWN DO .NET.
    
    SQL => � como se fosse um cursor interno que o oracle cria internamente.
    
    %NOTFOUND => Ocorre quando estamos percorrendo as linhas de um cursor
                 e n�o encontramos mais ninguem.
                 
    SQL%NOTFOUND => Retorna se a opera��o n�o manipulou nenhuma linha, 
    por exemplo se o comando afetou 0 linhas;
*/

-- TESTE
select*from Cliente order by id;
select*From seg_mercado;


EXECUTE ATUALIZAR_CLI_SEG_MERCADO(12,1);


CREATE OR REPLACE PROCEDURE ATUALIZAR_CLI_SEG_MERCADO
(P_ID IN CLIENTE.ID%TYPE, 
 P_SEGMERCADO_ID IN CLIENTE.SEQMERCADO_ID%TYPE)
IS
    e_CLIENTE_ID_INESISTENTE EXCEPTION;
    PRAGMA EXCEPTION_INIT (e_CLIENTE_ID_INESISTENTE, -4910);
BEGIN
    UPDATE CLIENTE SET SEQMERCADO_ID = P_SEGMERCADO_ID 
    WHERE ID = P_ID;
    
    -- Se retornou 0 linhas eu for�o uma exception com raise
    IF SQL%NOTFOUND THEN 
    -- ESTOU LAN�ANDO UM ERRO - SEMELHANTE AO THROWN DO .NET/c#
    RAISE e_CLIENTE_ID_INESISTENTE;
    END IF;
    COMMIT;
    
EXCEPTION
    WHEN e_CLIENTE_ID_INESISTENTE THEN
        raise_application_error(-20143,'Cliente n�o encontrado');
    WHEN OTHERS THEN 
        raise_application_error(-20123,'Erro gen�rico' || sqlerrm());
END;


 UPDATE CLIENTE SET SEQMERCADO_ID = 1 
    WHERE ID = 15;

