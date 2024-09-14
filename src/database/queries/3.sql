SELECT 
    a.nome, 
    a.rua, 
    a.numero, 
    a.complemento, 
    a.cidade, 
    a.estado, 
    a.pais
FROM 
    Armazem a
JOIN 
    Estoque e ON a.ID = e.armazemID
JOIN 
    Produto p ON e.produtoID = p.ID
JOIN 
    Categoria c ON p.categoriaID = c.ID
WHERE 
    c.nome = 'eletrodomésticos'
GROUP BY 
    a.ID
HAVING 
    COUNT(e.ID) >= 200 
    AND (
        SELECT COUNT(*) 
        FROM Estoque e2 
        WHERE a.ID = e2.armazemID
    ) < 1000;
