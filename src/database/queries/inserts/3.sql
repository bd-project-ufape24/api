INSERT OR IGNORE INTO Categoria (ID, nome, descricao)
VALUES 
(3, 'Eletrodomésticos', 'Categoria de Eletrodomésticos');

INSERT OR IGNORE INTO Fornecedor (ID, nome, pais, estado, cidade, rua, numero, complemento, tipo, documento)
VALUES 
  (3, 'Chris', 'Brasil', 'SP', 'São Paulo', 'Rua Principal', 10, 'Bloco 1', 'Fornecedor', '12345678900'),
  (4, 'Greg', 'Brasil', 'RJ', 'Rio de Janeiro', 'Avenida Secundária', 20, 'Sala 202', 'Fornecedor', '09876543211');

INSERT OR IGNORE INTO Produto (ID, dataGarantia, status, precoTabela, precoVendaMin, fornecedorID, categoriaID)
VALUES 
  (900, '2025-12-31', 'disponivel', 1500.00, 1200.00, 3, 3),
  (901, '2026-05-15', 'disponivel', 3000.00, 2500.00, 3, 3),
  (902, '2026-10-10', 'disponivel', 2000.00, 1800.00, 4, 3);

INSERT OR IGNORE INTO Armazem (ID, nome, pais, estado, cidade, rua, numero, complemento)
VALUES 
  (3, 'Armazém 1', 'Brasil', 'SP', 'São Paulo', 'Rua ABC', 100, 'Apto 101'),
  (4, 'Armazém 2', 'Brasil', 'RJ', 'Rio de Janeiro', 'Avenida XYZ', 200, 'Sala 202');


WITH ProdutoIDs AS (
    SELECT ID FROM Produto WHERE ID IN (900, 901, 902)
),
ProdutoEstoque AS (
    SELECT 
        p.ID AS produtoID, 
        1 AS armazemID 
    FROM ProdutoIDs p
    CROSS JOIN (SELECT 1 AS repetition UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) AS x,
              (SELECT 1 AS repetition UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) AS y,
              (SELECT 1 AS repetition UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) AS z
    LIMIT 200
)
INSERT INTO Estoque (codigo, armazemID, produtoID, qtdProduto)
SELECT 
    'XYZ123' || ROW_NUMBER() OVER (),
    armazemID, 
    produtoID, 
    1 
FROM ProdutoEstoque;
