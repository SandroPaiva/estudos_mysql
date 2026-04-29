use loja_exemplo;

-- =======================================================
-- 1. CRIANDO A STORED PROCEDURE
-- Como tem múltiplas linhas, precisamos usar o DELIMITER
-- O parâmetro "IN" significa que é um dado que está ENTRANDO na procedure.
-- =======================================================
DELIMITER $$

CREATE PROCEDURE sp_cadastrar_novo_pedido(
    IN p_cliente_id INT, -- váriável do tipo inteiro
    IN p_valor DECIMAL(10,2) -- variável do tipo decimal, com 10 caracteres a esqueda e 2 a direita da virgula.
)
BEGIN
    -- Aqui dentro você poderia ter IFs, validações complexas, etc.
    -- Vamos fazer um INSERT simples usando os parâmetros que recebemos:
    INSERT INTO pedidos (valor, cliente_id) 
    VALUES (p_valor, p_cliente_id);
    
    -- Podemos até retornar uma mensagem de sucesso no final
    SELECT 'Pedido cadastrado com sucesso!' AS status_mensagem;
END$$

DELIMITER ;

-- =======================================================
-- 2. EXECUTANDO (CONSUMINDO) A PROCEDURE
-- A aplicação/API não faz INSERT, ela apenas "chama" (CALL) a procedure.
-- =======================================================
-- Supondo que o cliente ID 1 vai fazer um pedido de R$ 99.90
CALL sp_cadastrar_novo_pedido(5, 957998979.90);

select * from pedidos;

select * from clientes;