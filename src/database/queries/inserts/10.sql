INSERT OR IGNORE INTO Cliente (ID, nome, pais, estado, cidade, rua, numero, complemento, limiteCredito, dataCadastro)
VALUES 
(3000, 'Joseph mourinho', 'Estados Unidos', 'California', 'Los Angeles', 'Rua ABC', 123, 'Apto 101', 50000.00, '2020-01-01'),
(3001, 'Albert Tesla', 'Estados Unidos', 'New York', 'New York', 'Rua XYZ', 456, 'Bloco A', 40000.00, '2019-05-10'),
(3002, 'Nicolau Copérnico', 'Estados Unidos', 'Texas', 'Houston', 'Avenida 123', 789, 'Apto 100', 10000.00, '2021-07-15');

INSERT OR IGNORE INTO Categoria (ID, nome, descricao)
VALUES 
(4, 'Móveis', 'Categoria de móveis'),
(5, 'Ferramentas', 'Categoria de Ferramentas'),
(6, 'Hardware', 'Categoria de Hardware');

INSERT OR IGNORE INTO Produto (ID, dataGarantia, status, precoVendaMin, precoTabela, fornecedorID, categoriaID)
VALUES 
  (9939, '2025-12-31', 'disponível', 1500.00, 4000.00, 5, 4),
  (9940, '2025-12-31', 'disponível', 1500.00, 4000.00, 5, 5),
  (9941, '2025-12-31', 'disponível', 1500.00, 4000.00, 5, 4),
  (9942, '2025-12-31', 'disponível', 1500.00, 4000.00, 5, 6);

INSERT OR IGNORE INTO NomeProduto (produtoID, nome, idioma)
VALUES 
  (9939, 'Armário', 'pt-br'),
  (9940, 'Martelo do BOB', 'pt-br'),
  (9941, 'Centro', 'pt-br'),
  (9942, 'Processador I7 12700KF', 'pt-br');

INSERT OR IGNORE INTO DescricaoProduto (produtoID, descricao, idioma)
VALUES 
  (9939, 'Descrição do armário', 'pt-br'),
  (9940, 'Descrição do martelo do BOB', 'pt-br'),
  (9941, 'Descrição do centro', 'pt-br'),
  (9942, 'Descrição do I7 12700KF', 'pt-br');

INSERT OR IGNORE INTO Pedido (ID, modoEncomenda, status, dataPedido, dataEntrega, clienteID)
VALUES 
    (200, 'Online', 'Finalizado', '2024-01-15', '2024-01-20', 3000),
    (201, 'Online', 'Finalizado', '2023-01-15', '2023-01-20', 3000),
    (202, 'Online', 'Finalizado', '2021-01-15', '2021-01-20', 3000),
    (203, 'Presencial', 'Finalizado', '2024-02-10', '2024-02-15', 3001),
    (204, 'Presencial', 'Finalizado', '2023-02-10', '2023-02-15', 3001),
    (205, 'Presencial', 'Finalizado', '2021-02-10', '2021-02-15', 3001),
    (206, 'Presencial', 'Finalizado', '2024-02-10', '2024-02-15', 3002),
    (207, 'Presencial', 'Finalizado', '2023-02-10', '2023-02-15', 3002),
    (208, 'Presencial', 'Finalizado', '2021-02-10', '2021-02-15', 3002);

INSERT OR IGNORE INTO ProdutoPedido (pedidoID, produtoID, precoVenda, quantidade)
VALUES 
  (200, 9939, 4000.00, 15), -- total=60mil categoria móvel
  (201, 9939, 2000.00, 27), -- total=54mil categoria móvel
  (202, 9941, 2000.00, 26), -- total= 52mil categoria móvel
  (203, 9939, 4000.00, 15), -- total=60mil categoria móvel
  (204, 9939, 2000.00, 27), -- total=54mil categoria móvel
  (205, 9940, 2000.00, 26), -- total= 52mil categoria FERRAMENTAS. POR ISSO ALBERT TESLA NÃO DEVE APARECER
  (206, 9942, 4000.00, 15), -- total=60mil categoria  hardware
  (207, 9942, 2000.00, 27), -- total=54mil categoria  hardware
  (208, 9942, 2000.00, 26); -- total= 52mil categoria 