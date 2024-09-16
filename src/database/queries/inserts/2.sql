-- Liste o nome, limite de crédito, cidade e estado dos clientes americanos que já realizaram mais de 20 pedidos 
-- com o valor total de cada pedido maior do que 10.000 e que nunca compraram produtos da categoria “Smartphone”.

INSERT OR IGNORE INTO Categoria (ID, nome, descricao)
VALUES 
(2, 'Smartphone', 'Categoria de smartphones e dispositivos móveis');

INSERT OR IGNORE INTO Produto (ID, dataGarantia, status, precoTabela, precoVendaMin, fornecedorID, categoriaID)
VALUES
(3, '2024-01-01', 'disponivel', 10000.00, 9000.00, 2, 1), -- Produto com categoria de Eletrônicos
(4, '2024-05-10', 'disponivel', 5000.00, 4000.00, 2, 2); -- Produto com categoria de Smartphone

INSERT OR IGNORE INTO NomeProduto (produtoID, nome, idioma)
VALUES
(3, 'Eletrônico A', 'PT-br'),
(4, 'Smartphone A', 'PT-br');

INSERT OR IGNORE INTO DescricaoProduto (produtoID, descricao, idioma)
VALUES
(3, 'Eletrônico A com alto desempenho', 'PT-br'),
(4, 'Smartphone B com câmera de alta resolução', 'PT-br');

INSERT OR IGNORE INTO Cliente (ID, nome, pais, estado, cidade, rua, numero, complemento, limiteCredito, dataCadastro)
VALUES 
(1, 'Cliente A', 'Estados Unidos', 'California', 'Los Angeles', 'Rua ABC', 123, 'Apto 101', 50000.00, '2020-01-01'),
(2, 'Cliente B', 'Estados Unidos', 'New York', 'New York', 'Rua XYZ', 456, 'Bloco A', 40000.00, '2019-05-10'),
(3, 'Cliente C', 'Estados Unidos', 'Texas', 'Houston', 'Avenida 123', 789, 'Apto 100', 10000.00, '2021-07-15'),
(4, 'Cliente D', 'Estados Unidos', 'New York', 'New York', 'Rua ZYX', 654, 'Bloco B', 4000.00, '2019-05-10');

INSERT OR IGNORE INTO Pedido (ID, modoEncomenda, status, dataPedido, dataEntrega, clienteID)
VALUES 
(1, 'online', 'completo', '2023-01-15', '2023-01-20', 1),
(2, 'loja', 'completo', '2023-02-10', '2023-02-15', 2),
(3, 'online', 'completo', '2023-03-12', '2023-03-18', 3),
(4, 'loja', 'completo', '2023-04-05', '2023-04-10', 4);

INSERT OR IGNORE INTO ProdutoPedido (produtoID, pedidoID, quantidade, precoVenda)
VALUES 
(3, 1, 2, 10000.00), -- Total = 20.000 (Cliente 1)
(4, 2, 2, 6000.00),  -- Total = 12.000 (Cliente 2) (Smarthphone)
(3, 3, 1, 10000.00), -- Total = 10.000 (Cliente 3)
(4, 4, 3, 6000.00);  -- Total = 18.000 (Cliente 4) (Smarthphone)

-- Pedidos do cliente 1
INSERT OR IGNORE INTO Pedido (ID, modoEncomenda, status, dataPedido, dataEntrega, clienteID)
VALUES 
(5, 'online', 'completo', '2023-01-16', '2023-01-21', 1),
(6, 'loja', 'completo', '2023-01-20', '2023-01-25', 1),
(7, 'online', 'completo', '2023-02-01', '2023-02-06', 1),
(8, 'loja', 'completo', '2023-02-10', '2023-02-15', 1),
(9, 'online', 'completo', '2023-03-01', '2023-03-05', 1),
(10, 'loja', 'completo', '2023-03-15', '2023-03-20', 1),
(11, 'online', 'completo', '2023-04-01', '2023-04-07', 1),
(12, 'loja', 'completo', '2023-04-10', '2023-04-15', 1),
(13, 'online', 'completo', '2023-05-01', '2023-05-07', 1),
(14, 'loja', 'completo', '2023-05-15', '2023-05-20', 1),
(15, 'online', 'completo', '2023-06-01', '2023-06-07', 1),
(16, 'loja', 'completo', '2023-06-10', '2023-06-15', 1),
(17, 'online', 'completo', '2023-07-01', '2023-07-07', 1),
(18, 'loja', 'completo', '2023-07-10', '2023-07-15', 1),
(19, 'online', 'completo', '2023-08-01', '2023-08-07', 1),
(20, 'loja', 'completo', '2023-08-10', '2023-08-15', 1),
(21, 'online', 'completo', '2023-09-01', '2023-09-07', 1),
(22, 'loja', 'completo', '2023-09-10', '2023-09-15', 1),
(23, 'online', 'completo', '2023-10-01', '2023-10-07', 1),
(24, 'loja', 'completo', '2023-10-10', '2023-10-15', 1),
(25, 'online', 'completo', '2023-11-01', '2023-11-07', 1);

-- Produtos Pedidos do cliente 1
INSERT OR IGNORE INTO ProdutoPedido (produtoID, pedidoID, quantidade, precoVenda)
VALUES 
(3, 5, 2, 10000.00),  -- Total = 20.000
(3, 6, 3, 12000.00),  -- Total = 36.000
(3, 7, 4, 14000.00),  -- Total = 56.000
(3, 8, 2, 10000.00),  -- Total = 20.000
(3, 9, 5, 15000.00),  -- Total = 75.000
(3, 10, 3, 12000.00), -- Total = 36.000
(3, 11, 6, 18000.00), -- Total = 108.000
(3, 12, 4, 14000.00), -- Total = 56.000
(3, 13, 5, 15000.00), -- Total = 75.000
(3, 14, 2, 10000.00), -- Total = 20.000
(3, 15, 3, 12000.00), -- Total = 36.000
(3, 16, 4, 14000.00), -- Total = 56.000
(3, 17, 5, 15000.00), -- Total = 75.000
(3, 18, 6, 18000.00), -- Total = 108.000
(3, 19, 4, 14000.00), -- Total = 56.000
(3, 20, 3, 12000.00), -- Total = 36.000
(3, 21, 5, 15000.00), -- Total = 75.000
(3, 22, 4, 14000.00), -- Total = 56.000
(3, 23, 6, 18000.00), -- Total = 108.000
(3, 24, 3, 12000.00), -- Total = 36.000
(3, 25, 2, 10000.00); -- Total = 20.000