/*
  [PACKAGE]
  - O pacote agrupa um conjunto de procedures ou fun��es e voc� d� acesso de 
    execu��o ao pacote. Tudo que estiver dentro vai ser liberado para o usu�rio. 
    Isso simplifica muito.
  - Pacote � uma forma de agrupar procedures e fun��es que tem algo em comum.
  - Somente o usuario dono dos Objetos pode criar o pacote.
  
  -* FORMA DE CRIAR O PACOTE
    - Criamos o pacote em duas fases. 
    - 1� Primeiro fazemos a declara��o da procedure, no package. 
         N�o somente o nome, mas tamb�m a forma como passo par�metros.     
         Como se fosse o cabe�alho.
         
      2� Segundo consiste em colocar o corpo do pacote.
         Ele consiste no c�digo da procedure.
         � como se no cabe�alho coloc�ssemos s� a chamada e no corpo o c�digo.
         
    - � muito importante que o nome e os parametros da procedure declara no cabe�alho,m
      seja o mesmo do codigo declarado no corpo.
    
*/

-- Cria�ao do Package
CREATE OR REPLACE PACKAGE CLIENTE_PAC
IS

--1� Declara��o da Procedure/Cabe�alho
PROCEDURE INCLUIR_CLIENTE_PC 
   (p_id in cliente.id%type,
    p_razao_social in cliente.razao_social%type,
    p_CNPJ cliente.CNPJ%type ,
    p_segmercado_id cliente.segmercado_id%type,
    p_faturamento_previsto cliente.faturamento_previsto%type);


END;

--Criacao do corpo do pacote, vinculando ao cabecalho
CREATE OR REPLACE PACKAGE BODY CLIENTE_PAC
IS

--2� Cria��o do corpo do package  
PROCEDURE INCLUIR_CLIENTE_PC 
   (p_id in cliente.id%type,
    p_razao_social in cliente.razao_social%type,
    p_CNPJ cliente.CNPJ%type ,
    p_segmercado_id cliente.segmercado_id%type,
    p_faturamento_previsto cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
    v_CNPJ cliente.cnpj%type := p_CNPJ;
    v_codigo_erro number(5);
    v_mensagem_erro varchar2(200);
    v_dummy number;
    v_verifica_segmento boolean;
    e_segmento exception;
BEGIN
    v_verifica_segmento := 	verifica_segmento_mercado(p_segmercado_id);
    IF v_verifica_segmento = false THEN
        RAISE e_segmento;
    END IF;
    v_categoria := obter_categoria_cliente(p_faturamento_previsto);
    format_cnpj (v_cnpj);
    INSERT INTO cliente 
          VALUES (p_id, UPPER(p_razao_social), v_CNPJ, p_segmercado_id
                  ,SYSDATE, p_faturamento_previsto, v_categoria);
   COMMIT;   
   
EXCEPTION
    WHEN dup_val_on_index then
        raise_application_error(-20010,'Cliente j� cadastrado');
    WHEN e_segmento then
        raise_application_error (-20011,'Segmento de mercado inexistente');
    WHEN OTHERS then
        v_codigo_erro := sqlcode;
        v_mensagem_erro := sqlerrm;
        raise_application_error (-20000,to_char(v_codigo_erro)||v_mensagem_erro);
END;

END;

--************************A��es com os pacotes********************************

-- Dando Previlegios do pacote "CLIENTE_PAC" ao user_app 
GRANT EXECUTE ON CLIENTE_PAC TO user_app; 

-- Cria��o do sinonimo do pacote
CREATE PUBLIC SYNONYM CLIENTE_PAC FOR user_dev.cliente_pac;

--Forma de acessar procedure de dentro do pacote
EXECUTE user_dev.cliente_pac.incluir_cliente_pc(N,N)

--Forma de acessar procedure de dentro do pacote pelo sinonimo
EXECUTE cliente_pac.incluir_cliente_pc(N,N)




