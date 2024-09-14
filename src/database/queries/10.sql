WITH ComprasAcima50Mil AS (
    SELECT 
        SUM(precoVenda * quantidade) AS soma,
        strftime('%Y', p.dataPedido) AS ano,
        p.clienteID
    FROM Pedido p
    JOIN ProdutoPedido pp ON p.ID = pp.pedidoID
    WHERE strftime('%Y', p.dataPedido) IN ('2021', '2023', '2024')
    GROUP BY ano, p.clienteID
    HAVING soma > 50000
), PedidoCategoriaUnica AS (
    SELECT pe.clienteID, COUNT(DISTINCT pr.categoriaID) AS categorias_distintas
    FROM Pedido pe
    JOIN ProdutoPedido pp ON pe.ID = pp.pedidoID
    JOIN Produto pr ON pp.produtoID = pr.ID
    GROUP BY pe.clienteID
), americanosComprasUnicas50 AS (
    SELECT c.ID, c.nome, c.pais, c.estado, c.cidade, c.rua, c.numero, c.complemento
    FROM ComprasAcima50Mil c21
    JOIN ComprasAcima50Mil c23 ON c21.clienteID = c23.clienteID AND c23.ano = '2023'
    JOIN ComprasAcima50Mil c24 ON c21.clienteID = c24.clienteID AND c24.ano = '2024'
    JOIN PedidoCategoriaUnica pcu ON pcu.clienteID = c21.clienteID
    JOIN Cliente c ON c21.clienteID = c.ID
    WHERE c21.ano = '2021' AND c.pais = 'Estados Unidos' AND pcu.categorias_distintas = 1
    GROUP BY c.ID
)

SELECT *
FROM americanosComprasUnicas50;