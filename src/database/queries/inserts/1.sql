INSERT OR IGNORE INTO Fornecedor (ID, nome, tipo, documento, pais, estado, cidade, rua, numero, complemento)
VALUES 
(1, 'Japa LTDA', 'Empresa', '1234567890', 'Japão', 'Tóquio', 'Tóquio', 'Rua Principal', 123, 'Bloco A'),
(2, 'BR Produtos LTDA', 'Empresa', '9876543210', 'Brasil', 'São Paulo', 'São Paulo', 'Av Paulista', 1000, 'Bloco B');

INSERT OR IGNORE INTO Categoria (ID, nome, descricao)
VALUES 
(1, 'Eletrônicos', 'Produtos eletrônicos diversos');

INSERT OR IGNORE INTO Produto (ID, dataGarantia, status, precoVendaMin, precoTabela, fornecedorID, categoriaID)
VALUES 
(1, '2025-12-31', 'Disponível', 100.00, 150.00, 1, 1), -- Produto fornecido pelo fornecedor do Japão
(2, '2024-06-30', 'Disponível', 200.00, 250.00, 2, 1); -- Produto fornecido pelo fornecedor do Brasil

INSERT OR IGNORE INTO NomeProduto (produtoID, nome, idioma)
VALUES
(1, 'Câmera Digital', 'PT-br'),
(2, 'Fone de ouvido', 'PT-br');

INSERT OR IGNORE INTO DescricaoProduto (produtoID, descricao, idioma)
VALUES
(1, 'Câmera digital com alta resolução', 'PT-br'),
(2, 'Fone de ouvido intra auricular com fio', 'PT-br');

INSERT OR IGNORE INTO Armazem (ID, nome, pais, estado, cidade, rua, numero, complemento)
VALUES
(1, 'Armazém Central', 'Japão', 'Tóquio', 'Tóquio', 'Rua Secundária', 321, 'Bloco A'),
(2, 'Armazém Sul', 'Brasil', 'Rio de Janeiro', 'Rio de Janeiro', 'Av Atlântica', 200, 'Bloco B');

INSERT OR IGNORE INTO Estoque (ID, codigo, qtdProduto, produtoID, armazemID)
VALUES
(1, 'E001', 100, 1, 1), -- Produto 1 do Fornecedor Japonês
(2, 'E002', 80, 1, 2),  -- Produto 1 do Fornecedor Japonês
(3, 'E003', 50, 2, 1),  -- Produto 2 do Fornecedor Brasileiro
(4, 'E004', 100, 2, 1);  -- Produto 2 do Fornecedor Brasileiro
