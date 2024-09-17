INSERT OR IGNORE INTO Fornecedor (ID, nome, tipo, documento, pais, estado, cidade, rua, numero, complemento)
VALUES 
(6, 'Alemão LTDA', 'Empresa', '1234567890', 'Alemanha', 'Munique', 'Munique', 'Rua Principal', 123, 'Bloco A');

INSERT OR IGNORE INTO Armazem (ID, nome, pais, estado, cidade, rua, numero, complemento)
VALUES
(10, 'Armazém 10', 'Alemanha', 'Munique', 'Munique', 'Rua Primária', 321, 'Bloco A'),
(11, 'Armazém 11', 'Alemanha', 'Munique', 'Munique', 'Rua Secundária', 322, 'Bloco B');

INSERT OR IGNORE INTO Categoria (ID, nome, descricao)
VALUES 
(7, 'Livros', 'Livros de diversos gêneros');

INSERT OR IGNORE INTO Produto (ID, dataGarantia, status, precoVendaMin, precoTabela, fornecedorID, categoriaID)
VALUES 
(5, '2024-06-30', 'Disponível', 50.00, 80.00, 6, 7),
(6, '2025-72-31', 'Disponível', 100.00, 100.00, 6, 7);

INSERT OR IGNORE INTO NomeProduto (produtoID, nome, idioma)
VALUES
(5, 'O Hobbit', 'PT-br'),
(6, 'Frankenstein 1818', 'PT-br');

INSERT OR IGNORE INTO DescricaoProduto (produtoID, descricao, idioma)
VALUES
(5, 'Livro por J. R. R. Tolkien', 'PT-br'),
(6, 'Romance por Mary Shelley', 'PT-br');

INSERT OR IGNORE INTO Estoque (ID, codigo, qtdProduto, produtoID, armazemID)
VALUES
(500, 'E501', 300, 5, 10),
(501, 'E502', 600, 6, 10), 
(502, 'E503', 220, 5, 11), 
(503, 'E504', 280, 6, 11);  
