-- 1. DEMONSTRE: O Padrão Ouro da Indústria — "Soft Delete" (Exclusão Lógica)

-- Criado a tabela de Fornecedores com a coluna de Soft Delete
CREATE TABLE fornecedores (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	ativo BOOLEAN DEFAULT TRUE -- O padrão ao criar é ser verdadeiro (1)
);
select * from fornecedores;

-- criando a tabela de produtos (Sem CASCADE, para [proteger os dados)
CREATE TABLE produtos_estoque (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome_produto VARCHAR(100) NOT NULL,
	fornecedor_id INT,
	CONSTRAINT fk_fornecedor_prod
	FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id)
);


INSERT INTO fornecedores (nome) VALUES ('Tech Distribuidora'), ('Alimentos SA');

SELECT * FROM fornecedores; -- para descobrir quais os IDs dos fornecedores

-- Cadastrando produtos na tabela produtos_estoque
INSERT INTO 
	produtos_estoque (nome_produto, fornecedor_id)
VALUES 
	('Teclado Mecânico', 1), 
	('Mouse Sem Fio', 1), 
	('Pacote de Café', 2);

select * from produtos_estoque;

-- Aplicando o uso do Soft Delete, 
-- O SoftDelete não é um comando mas uma regra de exclusão lógica
-- O usa-se a regra de não exclusáo mas sim de desativação de registros, assim não se perde informçoes 
-- como dados de vendas que precisam constar em nostas feiscais ou em relatórios que precisam ser exibidos em audutorias

UPDATE fornecedores SET ativo = FALSE WHERE id = 1; -- Aqui o registro de id = 1 está sendo "Desativado"

-- Para perquisar os registros ativos, o select deve ser feito da seguite forma:
SELECT * FROM fornecedores WHERE ativo = TRUE; -- Assim somente os registros da tabela fornecedores que estivere com o ATIVO = TRUE aparecerão

-- Mas ao pesquisar o histórico, os fornecedores inativos ainda estarão lá para consulta.
SELECT * FROM produtos_estoque;







