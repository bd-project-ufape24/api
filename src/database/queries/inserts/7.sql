-- Inserir Fornecedor
INSERT OR IGNORE INTO Fornecedor (ID, nome, pais, estado, cidade, rua, numero, complemento, tipo, documento)
VALUES 
  (5, 'Tim Roth', 'Brasil', 'SP', 'São Paulo', 'Rua Exemplo', 123, 'Apto 101', 'Fornecedor', '123456789');

INSERT OR IGNORE INTO Produto (ID, dataGarantia, status, precoVendaMin, precoTabela, fornecedorID, categoriaID)
VALUES 
  (9937, '2025-12-31', 'disponível', 500.00, 1500.00, 5, 3),
  (9938, '2025-05-20', 'disponível', 1000.00, 2000.00, 5, 3);

INSERT OR IGNORE INTO NomeProduto (produtoID, nome, idioma)
VALUES 
  (9937, 'Geladeira', 'pt-br'),
  (9938, 'Máquina de lavar', 'pt-br');

INSERT OR IGNORE INTO DescricaoProduto (produtoID, descricao, idioma)
VALUES 
  (9937, 'Descrição da geladeira', 'pt-br'),
  (9938, 'Descrição da máquina de lavar', 'pt-br');

-- Inserir Armazéns
INSERT OR IGNORE INTO Armazem (ID, nome, pais, estado, cidade, rua, numero, complemento)
VALUES 
  (5, 'Armazém 5', 'Brasil', 'SP', 'São Paulo', 'Rua A', 101, 'Bloco 1'),
  (6, 'Armazém 6', 'Brasil', 'SP', 'São Paulo', 'Rua B', 102, 'Bloco 2'),
  (7, 'Armazém 7', 'Brasil', 'SP', 'São Paulo', 'Rua C', 103, 'Bloco 3'),
  (8, 'Armazém 8', 'Brasil', 'SP', 'São Paulo', 'Rua D', 104, 'Bloco 4'),
  (9, 'Armazém 9', 'Brasil', 'SP', 'São Paulo', 'Rua E', 105, 'Bloco 5');

-- Inserir Estoque
INSERT OR IGNORE INTO Estoque (codigo, armazemID, produtoID, qtdProduto)
VALUES 
  ('ABC001', 5, 9937, 50),
  ('ABC002', 6, 9937, 50),
  ('ABC003', 7, 9937, 50),
  ('ABC004', 8, 9937, 50),
  ('ABC005', 9, 9937, 50),
  ('XYZ001', 5, 9938, 60),
  ('XYZ002', 6, 9938, 60),
  ('XYZ003', 7, 9938, 60),
  ('XYZ004', 8, 9938, 60),
  ('XYZ005', 9, 9938, 60);

-- Inserir ProdutoPedido
INSERT OR IGNORE INTO ProdutoPedido (pedidoID, produtoID, precoVenda, quantidade)
VALUES 
  (1, 9937, 1500.00, 23),
  (2, 9938, 2000.00, 10);