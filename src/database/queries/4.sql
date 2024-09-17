SELECT 
    a.nome AS nomeArmazem, 
    e.codigo AS codigoEstoque, 
    c.nome AS nomeCategoria,
    SUM(e.qtdProduto) AS quantidadeProdutos,
    AVG(e.qtdProduto) AS mediaProdutos
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
