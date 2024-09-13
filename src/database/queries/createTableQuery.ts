const sqls: string[] = [
	`CREATE TABLE IF NOT EXISTS Cliente (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome VARCHAR(100) NOT NULL,
        pais VARCHAR(75) NOT NULL,
        estado VARCHAR(50) NOT NULL,
        cidade VARCHAR(50) NOT NULL,
        rua VARCHAR(100) NOT NULL,
        numero INTEGER NOT NULL,
        complemento VARCHAR(100),
        limiteCredito REAL NOT NULL,
        dataCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
    )`,
	`CREATE TABLE IF NOT EXISTS Fornecedor (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome VARCHAR(100) NOT NULL,
        pais VARCHAR(75) NOT NULL,
        estado VARCHAR(50) NOT NULL,
        cidade VARCHAR(50) NOT NULL,
        rua VARCHAR(100) NOT NULL,
        numero INTEGER NOT NULL,
        complemento VARCHAR(100),
        tipo VARCHAR(50) NOT NULL,
        documento VARCHAR(20) NOT NULL
    )`,
	`CREATE TABLE IF NOT EXISTS Armazem (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome VARCHAR(100) NOT NULL,
        pais VARCHAR(75) NOT NULL,
        estado VARCHAR(50) NOT NULL,
        cidade VARCHAR(50) NOT NULL,
        rua VARCHAR(100) NOT NULL,
        numero INTEGER NOT NULL,
        complemento VARCHAR(100)
    )`,
	`CREATE TABLE IF NOT EXISTS Categoria (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome INTEGER NOT NULL
    )`,
	`CREATE TABLE IF NOT EXISTS Produto (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        dataGarantia DATETIME DEFAULT CURRENT_TIMESTAMP,
        status INTEGER NOT NULL CHECK(status IN (0, 1)),
        precoVendaMin NUMERIC NOT NULL CHECK(precoVendaMin < precoTabela),
        precoTabela NUMERIC NOT NULL,
        categoriaID INTEGER NOT NULL REFERENCES categoria(ID)
    )`,
	`CREATE TABLE IF NOT EXISTS NomeProduto (
        nome VARCHAR(100) NOT NULL,
        produtoID INTEGER NOT NULL REFERENCES Produto(ID),
        idioma VARCHAR(10) NOT NULL,
        PRIMARY KEY (produtoID, nome)
    )`,
	`CREATE TABLE IF NOT EXISTS DescricaoProduto (
        descricao VARCHAR(255) NOT NULL,
        produtoID INTEGER NOT NULL REFERENCES Produto(ID),
        idioma VARCHAR(10) NOT NULL,
        PRIMARY KEY (produtoID, descricao)
    )`,
	`CREATE TABLE IF NOT EXISTS Estoque (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo INTEGER NOT NULL,
        armazemID INTEGER NOT NULL REFERENCES Armazem(ID) ON DELETE CASCADE,
        produtoID INTEGER NOT NULL REFERENCES Produto(ID) ON DELETE SET NULL
    )`,
	`CREATE TABLE IF NOT EXISTS Pedido (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        modoEncomenda VARCHAR(70) NOT NULL CHECK(modoEncomenda IN ('expresso', 'normal')),
        status VARCHAR(70) NOT NULL CHECK (status IN ('concluido', 'pendente', 'cancelado')),
        dataPedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        dataEntrega DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        clienteID INTEGER NOT NULL REFERENCES Cliente(ID)
    )`,
	`CREATE TABLE IF NOT EXISTS ProdutoPedido (
        produtoID INTEGER NOT NULL REFERENCES Produto(ID) ON DELETE CASCADE,
        pedidoID INTEGER NOT NULL REFERENCES Pedido(ID) ON DELETE CASCADE,
        quantidade INTEGER NOT NULL CHECK(quantidade >= 0),
        precoVenda NUMERIC NOT NULL,
        PRIMARY KEY (produtoID, pedidoID) 
    )`,
	`CREATE TABLE IF NOT EXISTS EmailCliente (
        clienteID INTEGER NOT NULL REFERENCES Cliente(ID),
        email VARCHAR(255) NOT NULL,
        PRIMARY KEY (clienteID, email)
    )`,
	`CREATE TABLE IF NOT EXISTS TelefoneCliente (
        clienteID INTEGER NOT NULL REFERENCES Cliente(ID),
        telefone VARCHAR(255) NOT NULL,
        PRIMARY KEY (clienteID, telefone)
    )`,
];

export { sqls };
