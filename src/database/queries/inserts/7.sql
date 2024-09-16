-- Inserir Fornecedor
INSERT INTO Fornecedor (ID, nome, pais, estado, cidade, rua, numero, complemento, tipo, documento)
VALUES (5, 'Tim Roth', 'Brasil', 'SP', 'São Paulo', 'Rua Exemplo', 123, 'Apto 101', 'Fornecedor', '123456789');

INSERT INTO Produto (ID, dataGarantia, status, precoVendaMin, precoTabela, fornecedorID, categoriaID)
VALUES 
  (9937, '2025-12-31', 'disponível', 500.00, 1500.00, 5, 3),
  (9938, '2025-05-20', 'disponível', 1000.00, 2000.00, 5, 3);

INSERT INTO NomeProduto (produtoID, nome, idioma)
VALUES 
  (9937, 'Geladeira', 'pt-br'),
  (9938, 'Máquina de lavar', 'pt-br');

INSERT INTO DescricaoProduto (produtoID, descricao, idioma)
VALUES 
  (9937, 'Descrição da geladeira', 'pt-br'),
  (9938, 'Descrição da máquina de lavar', 'pt-br');

-- Inserir Armazéns
INSERT INTO Armazem (nome, pais, estado, cidade, rua, numero, complemento)
VALUES 
  ('Armazém 41', 'Brasil', 'SP', 'São Paulo', 'Rua A', 101, 'Bloco 1'),
  ('Armazém 42', 'Brasil', 'SP', 'São Paulo', 'Rua B', 102, 'Bloco 2'),
  ('Armazém 43', 'Brasil', 'SP', 'São Paulo', 'Rua C', 103, 'Bloco 3'),
  ('Armazém 44', 'Brasil', 'SP', 'São Paulo', 'Rua D', 104, 'Bloco 4'),
  ('Armazém 45', 'Brasil', 'SP', 'São Paulo', 'Rua E', 105, 'Bloco 5');

-- Inserir Estoque
INSERT INTO Estoque (codigo, armazemID, produtoID, qtdProduto)
VALUES 
  ('ABC001', (SELECT ID FROM Armazem WHERE nome = 'Armazém 41'), 9937, 50),
  ('ABC002', (SELECT ID FROM Armazem WHERE nome = 'Armazém 42'), 9937, 50),
  ('ABC003', (SELECT ID FROM Armazem WHERE nome = 'Armazém 43'), 9937, 50),
  ('ABC004', (SELECT ID FROM Armazem WHERE nome = 'Armazém 44'), 9937, 50),
  ('ABC005', (SELECT ID FROM Armazem WHERE nome = 'Armazém 45'), 9937, 50),
  ('XYZ001', (SELECT ID FROM Armazem WHERE nome = 'Armazém 41'), 9938, 60),
  ('XYZ002', (SELECT ID FROM Armazem WHERE nome = 'Armazém 42'), 9938, 60),
  ('XYZ003', (SELECT ID FROM Armazem WHERE nome = 'Armazém 43'), 9938, 60),
  ('XYZ004', (SELECT ID FROM Armazem WHERE nome = 'Armazém 44'), 9938, 60),
  ('XYZ005', (SELECT ID FROM Armazem WHERE nome = 'Armazém 45'), 9938, 60);

-- Inserir ProdutoPedido
INSERT INTO ProdutoPedido (pedidoID, produtoID, precoVenda, quantidade)
VALUES 
  (1, 9937, 1500.00, 23),
  (2, 9938, 2000.00, 10);