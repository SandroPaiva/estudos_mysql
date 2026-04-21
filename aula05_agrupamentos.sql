use sakila;

select * from actor;

select * FROM customer;

select * from payment;

SELECT 
    c.first_name AS nome_do_cliente,
    COUNT(p.payment_id) AS quantidade_de_pedidos,
    SUM(p.amount) AS valor_total_gasto
FROM customer c
INNER JOIN payment p 
    ON c.customer_id = p.customer_id
-- A regra de ouro: Toda coluna do SELECT que NÃO é uma função matemática 
-- (como SUM ou COUNT) PRECISA estar no GROUP BY.
GROUP BY c.customer_id, c.first_name;


SELECT 
    c.first_name AS nome_do_cliente,
    COUNT(p.payment_id) AS quantidade_de_pedidos,
    IFNULL(SUM(p.amount), 0.00) AS valor_total_gasto
FROM customer c
LEFT JOIN payment p 
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name;





