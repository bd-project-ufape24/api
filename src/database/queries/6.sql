WITH PedidosPresenciaisDeClientesAmericanos AS (
  SELECT
    p.ID as pedidoID
  FROM
    Pedido p
  JOIN
    Cliente c ON p.clienteID = c.ID
  WHERE
    c.pais = 'Estados Unidos' AND
    c.limiteCredito > 600 AND
  	p.modoEncomenda = 'Presencial' AND
  	(p.dataPedido BETWEEN '2023-05-01' AND '2023-12-31')
)
  
SELECT 
	COUNT(*) as quantidadePedidos, ROUND(COUNT(*) * 1.0 / (SELECT COUNT (*) FROM Pedido), 2) as percentualPedidos
FROM 
	PedidosPresenciaisDeClientesAmericanos ppeua
JOIN 
	ProdutoPedido pp on ppeua.pedidoID = pp.pedidoID
WHERE
	(pp.quantidade * pp.precoVenda) > 600