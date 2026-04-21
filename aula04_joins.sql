-- 1. DEMONSTRE: O Poder das Junções (JOINs)

use loja_exemplo;

INSERT INTO clientes (nome) VALUES ('Caslos sem compras');

select * from clientes;

-- =======================================================
-- INNER JOIN (A Junção Restrita)
-- Traz APENAS os registros que possuem correspondência nas DUAS tabelas.
-- =======================================================

SELECT
	c.nome AS nome_do_cliente,
    p.valor AS valor_do_pedido
FROM clientes c
INNER JOIN pedidos p
	ON c.id  = p.cliente_id;

-- =======================================================
-- LEFT JOIN (A Junção Inclusiva)
-- Traz TODOS os registros da tabela da "Esquerda" (clientes), 
-- mesmo que não tenham nada na tabela da "Direita" (pedidos).
-- =======================================================

SELECT 
	c.nome AS nome_do_cliente,
    p.valor AS valor_do_pedido
FROM clientes c
LEFT JOIN pedidos p
	ON c.id = p.cliente_id;