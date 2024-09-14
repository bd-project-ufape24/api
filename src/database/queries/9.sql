WITH Clientes2023 AS (
    SELECT c.ID, c.limiteCredito, c.pais
    FROM  Cliente c
    JOIN Pedido p ON c.ID = p.clienteID
    WHERE p.dataPedido BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY c.ID
),
TotalClientesAmericanos AS (
    SELECT COUNT(c.ID) AS quantidadeClientes
    FROM Clientes2023 c
    WHERE c.limiteCredito > 700 AND c.pais = 'Estados Unidos'
),
TotalClientes AS (
    SELECT COUNT(*) AS quantidadeTotal
    FROM Clientes2023
)

SELECT
    tca.quantidadeClientes,
    (tca.quantidadeClientes * 1.0 / tc.quantidadeTotal) AS percentual
FROM
    TotalClientesAmericanos tca,
    TotalClientes tc;