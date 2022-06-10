/*
    [Sinonimo]
    - É utilizado para dar um apelido/sinonimo a uma tabela.
    - sua vantagem é não ter que ficar passando o nome do usuario que criou
    nas consultas ou procedures como no exemplo a baixo:
    => SELECT*FROM user_dev.Cliente;  
    
    [ATENÇÂO] => quem cria o sinonimo é o dono do objeto, 
    ou sejá o usuario que criou a tabela ou procedure.
    
    SINTAXE:
    CREATE PUBLIC SYNONYM sinonimo_alias for objeto_original;
*/

CREATE PUBLIC SYNONYM INCLUIR_CLIENTE FOR user_dev.INCLUIR_CLIENTE;
CREATE PUBLIC SYNONYM ATUALIZAR_CLI_SEG_MERCADO FOR user_dev.ATUALIZAR_CLI_SEG_MERCADO;
CREATE PUBLIC SYNONYM ATUALIZAR_FATURAMENTO_PREVISTO FOR user_dev.ATUALIZAR_FATURAMENTO_PREVISTO;
CREATE PUBLIC SYNONYM INCLUIR_SEGMERCADO FOR user_dev.INCLUIR_SEGMERCADO;
CREATE PUBLIC SYNONYM EXCLUIR_CLIENTE FOR user_dev.EXCLUIR_CLIENTE;

CREATE PUBLIC SYNONYM CLIENTE FOR user_dev.CLIENTE;

CREATE PUBLIC SYNONYM CLIENTE FOR CLIENTE;
