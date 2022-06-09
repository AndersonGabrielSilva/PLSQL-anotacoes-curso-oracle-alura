/*
 * UTILIZANDO O FOR COM O CURSOR
   
   SINTAXE:
   FOR _CLIENTE IN cur_CLIENTE LOOP
   
   A Variavel Cliente é um array de posicoes.
   Exemplo: 
   Se o cursor representa uma lista de linhas da minha consulta, para acessar cada prosição precisará 
   acessar indice. 
   Semelhante ao DataTable do .NET/C#.
   
   Consulta SQL no cursor: ?
   ID | Nome    | Endereco  | Idade |
   2  | Ander   | Dutra 2   | 27    |
   3  | Livia   | Jandaia   | 26    |  
*/

--******************* CURSOR NO MUNDO REAL COM O COMANDO FOR *************************

DECLARE
    CURSOR cur_CLIENTE IS SELECT ID FROM CLIENTE;
    V_SEG_MERCADO_ID CLIENTE.SEQMERCADO_ID%TYPE := 6;    
BEGIN  
     FOR cliente IN cur_CLIENTE LOOP    
     atualizar_cli_seg_mercado(p_id=> cliente.ID,p_segmercado_id=> V_SEG_MERCADO_ID);    
     END LOOP;        
END;

SELECT*FROM CLIENTE;

/* PODEMOS ADICIONAR ALIAS A PROPRIEDADE E REFERENCIAR NO LOOP FOR NORMALMENTE */
SET SERVEROUTPUT ON;
DECLARE
    CURSOR cur_CLIENTE IS SELECT id, razao_social as nome FROM CLIENTE;    
BEGIN  
     FOR cli IN cur_CLIENTE LOOP     
        DBMS_OUTPUT.PUT_LINE(cli.nome);
     END LOOP;        
END;




