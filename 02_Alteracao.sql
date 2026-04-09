-- 02_Alteracao.sql
USE CINESQL;
GO

-- 1. ADICIONANDO COLUNAS DE DINHEIRO E DATA 
ALTER TABLE FILMES
ADD PRECO_BASE DECIMAL(10,2),
	DATA_CADASTRO DATETIME DEFAULT GETDATE(); 
GO

-- 2. ATUALIZANDO OS DADOS QUE JÁ EXISTEM (PARA NÃO FICAREM VAZIO)
UPDATE FILMES SET PRECO_BASE = 29.90 WHERE NOME = 'Matrix';                   -- ADICIONANDO A COLUNA PRECO_BASE COM OS VALORES
UPDATE FILMES SET PRECO_BASE = 35.00 WHERE NOME = 'Vingadores';               -- UPDATE TABELA 
UPDATE FILMES SET PRECO_BASE = 40.00 WHERE NOME = 'O Poderoso Chefão';        -- SET COLUNA E VALOR 
GO																			  -- WHERE ONDE VAI
																			  
-- 3. CRIANDO A TABELA DE ATORES
CREATE TABLE ATORES (
	ID_ATOR INT PRIMARY KEY IDENTITY(1,1),
	NOME VARCHAR(100) NOT NULL,
	NACIONALIDADE VARCHAR(50)
);
GO

-- 4. Criando a ligação (Relacionamento Muitos para Muitos N-N)
CREATE TABLE ELENCO (
	ID_FILME INT,          -- Um filme tem vários atores, 
	ID_ATOR INT,           -- e um ator pode estar em vários filmes.
	PAPEL VARCHAR(50),

	-- DEFININDO QUE ESSES IDs DEPENDEM DAS TABELAS PRINCIPAIS
	FOREIGN KEY (ID_FILME) REFERENCES FILMES(ID_FILMES),   -- ID_FILME da tabela ELENCO deve existir na  TABELA FILMES
	FOREIGN KEY (ID_ATOR) REFERENCES ATORES(ID_ATOR)       -- ID_ATOR da tabela ELENCO deve existir na TABELA ATORES 
);                                                         -- Chave estrangeira que garante que o ID do ator ou filme exista na tabela ATORES ou FILMES
GO