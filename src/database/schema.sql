CREATE TABLE IF NOT EXISTS Armazem (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    pais TEXT NOT NULL,
    estado TEXT NOT NULL,
    cidade TEXT NOT NULL,
    rua TEXT NOT NULL,
    numero INTEGER NOT NULL,
    complemento TEXT
);

CREATE TABLE IF NOT EXISTS Fornecedor (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    tipo TEXT NOT NULL,
    documento TEXT NOT NULL,
    pais TEXT NOT NULL,
    estado TEXT NOT NULL,
    cidade TEXT NOT NULL,
    rua TEXT NOT NULL,
    numero INTEGER NOT NULL,
    complemento TEXT
);

CREATE TABLE IF NOT EXISTS Categoria (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Produto (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    dataGarantia DATETIME NOT NULL,
    status TEXT NOT NULL,
    precoVendaMin REAL NOT NULL,
    precoTabela REAL NOT NULL,
    fornecedorID INTEGER NOT NULL,
    categoriaID INTEGER NOT NULL,
    FOREIGN KEY (fornecedorID) REFERENCES Fornecedor(ID),
    FOREIGN KEY (categoriaID) REFERENCES Categoria(ID)
);

CREATE TABLE IF NOT EXISTS NomeProduto (
    produtoID INTEGER NOT NULL,
    nome TEXT NOT NULL,
    idioma TEXT NOT NULL,
    PRIMARY KEY (produtoID, nome),
    FOREIGN KEY (produtoID) REFERENCES Produto(ID)
);

CREATE TABLE IF NOT EXISTS DescricaoProduto (
    produtoID INTEGER NOT NULL,
    descricao TEXT NOT NULL,
    idioma TEXT NOT NULL,
    PRIMARY KEY (produtoID, descricao),
    FOREIGN KEY (produtoID) REFERENCES Produto(ID)
);

CREATE TABLE IF NOT EXISTS Estoque (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo TEXT NOT NULL,
    qtdProduto INTEGER NOT NULL,
    produtoID INTEGER NOT NULL,
    armazemID INTEGER NOT NULL,
    FOREIGN KEY (produtoID) REFERENCES Produto(ID),
    FOREIGN KEY (armazemID) REFERENCES Armazem(ID)
);

CREATE TABLE IF NOT EXISTS Cliente (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    pais TEXT NOT NULL,
    estado TEXT NOT NULL,
    cidade TEXT NOT NULL,
    rua TEXT NOT NULL,
    numero INTEGER NOT NULL,
    complemento TEXT,
    limiteCredito REAL NOT NULL,
    dataCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS EmailCliente (
    clienteID INTEGER NOT NULL,
    email TEXT NOT NULL UNIQUE,
    PRIMARY KEY (clienteID, email),
    FOREIGN KEY (clienteID) REFERENCES Cliente(ID)
);

CREATE TABLE IF NOT EXISTS TelefoneCliente (
    clienteID INTEGER NOT NULL,
    telefone TEXT NOT NULL UNIQUE,
    PRIMARY KEY (clienteID, telefone),
    FOREIGN KEY (clienteID) REFERENCES Cliente(ID)
);

CREATE TABLE IF NOT EXISTS Pedido (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    modoEncomenda TEXT NOT NULL,
    status TEXT NOT NULL,
    dataPedido DATETIME,
    dataEntrega DATETIME,
    clienteID INTEGER NOT NULL,
    FOREIGN KEY (clienteID) REFERENCES Cliente(ID)
);

CREATE TABLE IF NOT EXISTS ProdutoPedido (
    produtoID INTEGER NOT NULL,
    pedidoID INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    precoVenda REAL NOT NULL,
    PRIMARY KEY (produtoID, pedidoID),
    FOREIGN KEY (produtoID) REFERENCES Produto(ID),
    FOREIGN KEY (pedidoID) REFERENCES Pedido(ID)
);
