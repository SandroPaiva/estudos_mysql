
-- Criaçao do bandco
CREATE DATABASE loja_exemplo;
use loja_exemplo;

-- Criação da tabela de clientes
CREATE TABLE clientes
	(id INT AUTO_INCREMENT PRIMARY KEY,
	 nome VARCHAR(100) NOT NULL 
	 );

-- Criação da tabea de pedidos
CREATE TABLE pedidos 
	(id INT AUTO_INCREMENT PRIMARY KEY,
	 valor DECIMAL(10,2),
	 cliente_id INT,
	 -- Criando o relacionamento (Foreign Key)
	 CONSTRAINT fk_cliente_pedido
	 FOREIGN KEY (cliente_id) REFERENCES clientes(id)
	);

-- Inserindo registoa na tabela clientes
INSERT INTO clientes (nome) VALUES ('João Silva'), ('Maria Souza');

SELECT * FROM clientes;

-- com o joão na tabela clientes ele recebeu o ID 1, ele fez dois pedidos
INSERT INTO pedidos (valor, cliente_id) VALUES (150.50, 1), (300.00, 1);

-- com a maria na tabela clientes ele recebeu o ID 2, ela fez um pedidos
INSERT INTO pedidos (valor, cliente_id) VALUES (45.90, 2);

select * from pedidos;

-- Tentativa de exclusáo do cliente João (deve apresentar o ERRO 1451)
DELETE FROM clientes WHERE id = 1;

-- Forma correta de exclusão é primeiro remover os registros filhos que fazerm referencia a ele 
DELETE FROM pedidos WHERE cliente_id = 1; -- isso excluirá TODOS os registros da tabela pedidos que tenham sido feitos para o João deixando apenas o peduido da Maria

select * from pedidos;

-- Com isso é possivel excluir o registro pai que é o joão ou id = 1
DELETE FROM clientes WHERE id = 1;

select * from clientes;

-- Removendo a "trava" ou foreign key antiga fk_cliente_pedido usando o DROP FOREIGN KEY, o motivo é que ela não foi criada com o parâmetro ON DELETE CASTATE.
ALTER TABLE pedidos DROP FOREIGN KEY fk_cliente_pedido;

-- Adicioando agora a nova "trava" ON DELETE CASTATE, isso permitirá que ao excluir um registro da tabela cliente, tudo que extiver relacionado a ele será excluído também.
ALTER TABLE pedidos ADD CONSTRAINT fk_cliente_pedido
FOREIGN KEY (cliente_id) REFERENCES clientes(id)
ON DELETE CASCADE;

-- Inserindo mpvamente o registro do joão para testar
INSERT INTO clientes (nome) VALUES ('João Silva - O retorno'); 

select * from clientes; -- para descobrir qual é o novo ID do João

-- Agora inserir dois pedidos para o João.
INSERT INTO pedidos (valor, cliente_id) VALUES (500.00, 3), (750.00, 3);

select * from pedidos where cliente_id = 3; -- visualizar os pedidos do Jõao

-- Exclir o joão e todos seus pedidos de uma só vez
DELETE FROM clientes WHERE id = 3;

select * from clientes; -- verificando se o João foi excluido

select * from pedidos -- verificando se a exclusão deu certo e se ficou só o pedido da maria

