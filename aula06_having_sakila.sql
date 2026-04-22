use sakila;

-- =======================================================
-- O ERRO COMUM (Se você rodar isso, o banco vai reclamar)
-- "Invalid use of group function"
-- =======================================================
/*
SELECT c.nome, SUM(p.valor) as total_gasto
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
WHERE SUM(p.valor) > 200 -- O WHERE não entende o SUM!
GROUP BY c.id, c.nome;
*/

-- =======================================================
-- A SOLUÇÃO: A Cláusula HAVING
-- =======================================================
SELECT 
    c.first_name AS nome_do_cliente,
    COUNT(p.payment_id) AS quantidade_de_pedidos,
    SUM(p.amount) AS valor_total_gasto
FROM customer c
INNER JOIN payment p 
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name
HAVING SUM(p.amount) > 150.00; 
-- O HAVING entra DEPOIS do GROUP BY. Ele olha para o total já somado e filtra.


