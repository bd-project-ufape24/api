SELECT cat.nome
FROM ProdutoPedido pp
    JOIN 
        Pedido pe ON pp.pedidoID = pe.ID
    JOIN 
        Produto p ON pp.produtoID = p.ID
    JOIN
    	Categoria cat on p.categoriaID = cat.ID
WHERE strftime('%m', pe.dataPedido) >= 7 
AND strftime('%Y', pe.dataPedido) >= strftime('%Y', date('now', '-5 years'))
GROUP by cat.nome
ORDER BY SUM(pp.precoVenda * quantidade) DESC
LIMIT 8