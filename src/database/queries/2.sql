SELECT 
    c.nome, 
    c.limiteCredito, 
    c.cidade, 
    c.estado
FROM 
    Cliente c
WHERE 
    c.pais = 'Estados Unidos'
    AND (
        SELECT COUNT(*) as totalPedidos
        FROM Pedido p 
        WHERE (p.clienteID = c.ID 
        	AND (
        	    SELECT SUM(pp.precoVenda * pp.quantidade) 
        	    FROM ProdutoPedido pp 
        	    WHERE pp.pedidoID = p.ID
        	) > 10000)
      	GROUP BY p.clienteID
      	HAVING totalPedidos > 20
    )
    AND c.ID NOT IN (
        SELECT DISTINCT pe.clienteID 
        FROM Pedido pe
        JOIN ProdutoPedido ppe ON pe.ID = ppe.pedidoID
        JOIN Produto prod ON ppe.produtoID = prod.ID
        JOIN Categoria cat ON prod.categoriaID = cat.ID
        WHERE cat.nome = 'Smartphone'
    );
