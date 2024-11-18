-- Criando o banco de dados
CREATE DATABASE Ecommerce;
USE Ecommerce;

-- Criando a tabela Cliente
CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do cliente
    Nome VARCHAR(100) NOT NULL,                -- Nome do cliente
    CPF CHAR(11) UNIQUE,                       -- CPF exclusivo (apenas para PF)
    CNPJ CHAR(14) UNIQUE,                      -- CNPJ exclusivo (apenas para PJ)
    Email VARCHAR(100) UNIQUE NOT NULL,        -- Email único
    Telefone VARCHAR(15),                      -- Telefone do cliente
    Endereço TEXT                              -- Endereço do cliente
);

-- Criando a tabela Fornecedor
CREATE TABLE Fornecedor (
    ID_Fornecedor INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do fornecedor
    Nome_Fornecedor VARCHAR(100) NOT NULL,        -- Nome do fornecedor
    Telefone VARCHAR(15),                         -- Telefone do fornecedor
    Email VARCHAR(100) UNIQUE,                    -- Email único do fornecedor
    Endereço TEXT                                 -- Endereço do fornecedor
);

-- Criando a tabela Produto
CREATE TABLE Produto (
    ID_Produto INT AUTO_INCREMENT PRIMARY KEY,   -- Identificador único do produto
    Nome_Produto VARCHAR(100) NOT NULL UNIQUE,   -- Nome do produto
    Preço DECIMAL(10, 2) NOT NULL,               -- Preço do produto
    Descrição TEXT,                              -- Descrição do produto
    Quantidade_Estoque INT DEFAULT 0,            -- Quantidade disponível em estoque
    Fornecedor_ID_Fornecedor INT NOT NULL,       -- Relacionamento com Fornecedor
    FOREIGN KEY (Fornecedor_ID_Fornecedor) REFERENCES Fornecedor(ID_Fornecedor) -- Chave estrangeira
);

-- Criando a tabela Pedido
CREATE TABLE Pedido (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único do pedido
    Data_Pedido DATETIME DEFAULT CURRENT_TIMESTAMP, -- Data do pedido com valor padrão atual
    Total_Pedido DECIMAL(10, 2) DEFAULT 0.00,  -- Total do pedido
    Cliente_ID_Cliente INT NOT NULL,           -- Relacionamento com Cliente
    FOREIGN KEY (Cliente_ID_Cliente) REFERENCES Cliente(ID_Cliente) -- Chave estrangeira
);

-- Criando a tabela Item_Pedido
CREATE TABLE Item_Pedido (
    ID_Item INT AUTO_INCREMENT PRIMARY KEY,       -- Identificador único do item do pedido
    Pedido_ID_Pedido INT NOT NULL,                -- Relacionamento com Pedido
    Produto_ID_Produto INT NOT NULL,              -- Relacionamento com Produto
    Quantidade INT NOT NULL DEFAULT 1,            -- Quantidade do produto no pedido
    Subtotal DECIMAL(10, 2) NOT NULL,             -- Subtotal calculado (preço x quantidade)
    FOREIGN KEY (Pedido_ID_Pedido) REFERENCES Pedido(ID_Pedido), -- Chave estrangeira
    FOREIGN KEY (Produto_ID_Produto) REFERENCES Produto(ID_Produto) -- Chave estrangeira
);

-- Criando a tabela Pagamento
CREATE TABLE Pagamento (
    ID_Pagamento INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do pagamento
    Tipo_Pagamento ENUM('Crédito', 'Débito', 'Pix', 'Boleto') NOT NULL, -- Tipo de pagamento
    Valor_Pagamento DECIMAL(10, 2) NOT NULL,     -- Valor do pagamento
    Pedido_ID_Pedido INT NOT NULL,               -- Relacionamento com Pedido
    FOREIGN KEY (Pedido_ID_Pedido) REFERENCES Pedido(ID_Pedido) -- Chave estrangeira
);

-- Criando a tabela Entrega
CREATE TABLE Entrega (
    ID_Entrega INT AUTO_INCREMENT PRIMARY KEY,   -- Identificador único da entrega
    Status_Entrega ENUM('Enviado', 'Entregue', 'Atrasado') DEFAULT 'Enviado', -- Status da entrega
    Codigo_Rastreamento VARCHAR(50) UNIQUE NOT NULL, -- Código de rastreamento único
    Pedido_ID_Pedido INT NOT NULL,               -- Relacionamento com Pedido
    FOREIGN KEY (Pedido_ID_Pedido) REFERENCES Pedido(ID_Pedido) -- Chave estrangeira
);

-- Criando a tabela Vendedor
CREATE TABLE Vendedor (
    ID_Vendedor INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do vendedor
    Nome_Vendedor VARCHAR(100) NOT NULL,        -- Nome do vendedor
    Telefone VARCHAR(15),                       -- Telefone do vendedor
    Email VARCHAR(100) UNIQUE                   -- Email único do vendedor
);

-- Script finalizado com comentários explicando cada etapa.
-- Este banco de dados pode agora ser populado com dados de teste e utilizado para consultas.

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Nome, CPF, CNPJ, Email, Telefone, Endereço)
VALUES
('João Silva', '12345678901', NULL, 'joao@gmail.com', '11987654321', 'Rua A, 123'),
('Empresa XPTO', NULL, '12345678000199', 'contato@xpto.com', '1132123434', 'Av. Central, 456'),
('Maria Oliveira', '98765432100', NULL, 'maria@gmail.com', '11999988877', 'Rua B, 321');

-- Inserindo dados na tabela Fornecedor
INSERT INTO Fornecedor (Nome_Fornecedor, Telefone, Email, Endereço)
VALUES
('Fornecedor ABC', '1145454545', 'abc@fornecedores.com', 'Rua das Flores, 10'),
('Fornecedor XYZ', '11989898989', 'xyz@fornecedores.com', 'Av. Paulista, 1000');

-- Inserindo dados na tabela Produto
INSERT INTO Produto (Nome_Produto, Preço, Descrição, Quantidade_Estoque, Fornecedor_ID_Fornecedor)
VALUES
('Produto 1', 25.50, 'Descrição do Produto 1', 100, 1),
('Produto 2', 50.00, 'Descrição do Produto 2', 200, 2),
('Produto 3', 15.00, 'Descrição do Produto 3', 50, 1);

-- Inserindo dados na tabela Pedido
INSERT INTO Pedido (Data_Pedido, Total_Pedido, Cliente_ID_Cliente)
VALUES
('2024-11-01 10:00:00', 75.50, 1),
('2024-11-02 15:30:00', 50.00, 2);

-- Inserindo dados na tabela Item_Pedido
INSERT INTO Item_Pedido (Pedido_ID_Pedido, Produto_ID_Produto, Quantidade, Subtotal)
VALUES
(1, 1, 2, 51.00),
(1, 3, 1, 24.50),
(2, 2, 1, 50.00);

-- Inserindo dados na tabela Pagamento
INSERT INTO Pagamento (Tipo_Pagamento, Valor_Pagamento, Pedido_ID_Pedido)
VALUES
('Crédito', 75.50, 1),
('Pix', 50.00, 2);

-- Inserindo dados na tabela Entrega
INSERT INTO Entrega (Status_Entrega, Codigo_Rastreamento, Pedido_ID_Pedido)
VALUES
('Enviado', 'R123456789BR', 1),
('Entregue', 'R987654321BR', 2);

-- Inserindo dados na tabela Vendedor
INSERT INTO Vendedor (Nome_Vendedor, Telefone, Email)
VALUES
('Carlos Souza', '11911112222', 'carlos@vendas.com'),
('Ana Santos', '11933334444', 'ana@vendas.com');


-- Exibe todos os clientes, ordenados pelo nome
SELECT * 
FROM Cliente
ORDER BY Nome;

-- Conta os pedidos de cada cliente
SELECT Cliente.Nome, COUNT(Pedido.ID_Pedido) AS Total_Pedidos
FROM Cliente
LEFT JOIN Pedido ON Cliente.ID_Cliente = Pedido.Cliente_ID_Cliente
GROUP BY Cliente.Nome
ORDER BY Total_Pedidos DESC;


