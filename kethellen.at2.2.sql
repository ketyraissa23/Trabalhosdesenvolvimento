show databases; 
drop database bdestoqueloja;
create database bdestoqueloja;
USE bdestoqueLoja;
-- criação das tabelas 
CREATE TABLE CategoriasDeProdutos (
    ID INT PRIMARY KEY,         -- Identificador exclusivo da categoria.
    NomeDaCategoria VARCHAR(255)  -- Nome da categoria de produtos.
);

CREATE TABLE Fornecedores (
    ID INT PRIMARY KEY,         -- Identificador exclusivo do fornecedor.
    Nome VARCHAR(255),          -- Nome do fornecedor.
    Endereco VARCHAR(255),      -- Endereço do fornecedor.
    Telefone VARCHAR(15)        -- Número de telefone do fornecedor.
);

CREATE TABLE Produtos (
    ID INT PRIMARY KEY,         -- Identificador exclusivo do produto.
    Nome VARCHAR(255),          -- Nome do produto.
    Descricao TEXT,             -- Descrição detalhada do produto.
    Preco DECIMAL(10, 2),       -- Preço do produto.
    QuantidadeEmEstoque INT,    -- Quantidade atual em estoque.
    Categoria INT,              -- Chave estrangeira para CategoriasDeProdutos (associação à categoria).
    Fornecedor INT,             -- Chave estrangeira para Fornecedores (associação ao fornecedor).
    FOREIGN KEY (Categoria) REFERENCES CategoriasDeProdutos(ID),  -- Relação com a categoria.
    FOREIGN KEY (Fornecedor) REFERENCES Fornecedores(ID)         -- Relação com o fornecedor.
);

-- Criação da tabela de Vendas
CREATE TABLE Vendas (
    ID INT PRIMARY KEY,         -- Identificador exclusivo da venda.
    DataDaVenda DATE,           -- Data da venda.
    ValorTotal DECIMAL(10, 2),  -- Valor total da venda.
    Funcionario VARCHAR(255)    -- Nome do funcionário que processou a venda.
);

-- Criação da tabela de Itens de Venda
CREATE TABLE ItensDeVenda (
    ID INT PRIMARY KEY,         -- Identificador exclusivo do item de venda.
    IDDoProduto INT,           -- Chave estrangeira para Produtos (produto vendido).
    IDDaVenda INT,             -- Chave estrangeira para Vendas (venda à qual o item está associado).
    QuantidadeVendida INT,     -- Quantidade do produto vendido.
    PrecoUnitario DECIMAL(10, 2), -- Preço unitário do produto na transação.
    FOREIGN KEY (IDDoProduto) REFERENCES Produtos(ID),   -- Relação com o produto.
    FOREIGN KEY (IDDaVenda) REFERENCES Vendas(ID)        -- Relação com a venda.
);
,