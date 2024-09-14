WITH ProdutosBuscados AS (
  SELECT
    p.ID AS produtoID
  FROM 
    Produto p
  JOIN 
    Estoque e ON p.ID = e.produtoID
  JOIN 
    Fornecedor f ON p.fornecedorID = f.ID
  WHERE 
    f.pais = 'Japão'
  GROUP BY
    p.ID
  HAVING
    SUM(e.qtdProduto) > 120
)

SELECT
    np.nome,
    dp.descricao, 
    p.precoVendaMin
FROM 
    ProdutosBuscados pb
JOIN 
    Produto p ON pb.produtoID = p.ID
JOIN 
    NomeProduto np ON p.ID = np.produtoID
JOIN 
    DescricaoProduto dp ON p.ID = dp.produtoID
GROUP BY
    p.ID
