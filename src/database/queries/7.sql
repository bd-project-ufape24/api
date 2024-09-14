WITH ProdutosArmazens AS (
    SELECT
        p.ID AS produtoID,
  		p.precoVendaMin as precoVendaMin,
  		p.dataGarantia as dataGarantia
    FROM
        Produto p
    JOIN
        Estoque e ON p.ID = e.produtoID
    GROUP BY
        p.ID
    HAVING
        COUNT(DISTINCT e.armazemID) >= 5
),
ProdutosFiltrados AS (
    SELECT
        pp.produtoID AS produtoID,
  		pa.dataGarantia as dataGarantia
    FROM
        ProdutoPedido pp
    JOIN
        ProdutosArmazens pa ON pp.produtoID = pa.produtoID
    WHERE
        (pp.precoVenda - pa.precoVendaMin) < 2000
)

SELECT
    np.nome,
    pf.dataGarantia,
    dp.descricao
FROM
    ProdutosFiltrados pf
JOIN
    NomeProduto np ON pf.produtoID = np.produtoID
JOIN
    DescricaoProduto dp ON pf.produtoID = dp.produtoID
GROUP BY 
dp.descricao
