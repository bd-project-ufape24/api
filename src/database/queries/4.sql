SELECT 
    SUM(e.qtdProduto) AS quantidade_produtos,
    AVG(e.qtdProduto) AS media_produtos
FROM 
    Estoque e
JOIN 
    Armazem a ON e.armazemID = a.ID
JOIN 
    Produto p ON e.produtoID = p.ID
JOIN 
    Categoria c ON p.categoriaID = c.ID
WHERE 
    e.qtdProduto >= 200
GROUP BY 
    a.nome, e.codigo, c.nome;
