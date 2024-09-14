SELECT 
    p.ID AS produtoID,
    p.precoVendaMin AS precoMinimo,
    p.precoTabela AS precoTabela,
    (SELECT MIN(pp.precoVenda) 
     FROM ProdutoPedido pp 
     JOIN Pedido pd ON pp.pedidoID = pd.ID
     WHERE pp.produtoID = p.ID 
     	AND pd.dataPedido BETWEEN '2023-01-01' AND '2024-12-31' 
    ) AS precoMinimoVendido
FROM 
    Produto p;