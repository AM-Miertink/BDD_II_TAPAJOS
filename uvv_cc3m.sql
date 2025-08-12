CREATE DATABASE UVV_CC3M
USE UVV_CC3M

-- Tabela de empresas
CREATE TABLE IF NOT EXISTS empresas (
	empresa_id INT PRIMARY KEY AUTO_INCREMENT,
    empresa_nome VARCHAR(50) NOT NULL,
    empresa_telefone VARCHAR(15) NOT NULL,
    empresa_categoria ENUM('Cliente', 'Fornecedor', 'Cliente e Fornecedor') NOT NULL,
    empresa_cnpj_cpf VARCHAR(20) NOT NULL,
    empresa_rua VARCHAR(100) NOT NULL,
    empresa_numrua VARCHAR(10) NOT NULL,
    empresa_complemento VARCHAR(50),
    empresa_bairro VARCHAR(50) NOT NULL,
    empresa_cidade VARCHAR(50) NOT NULL,
    empresa_estado VARCHAR(50) NOT NULL,
    empresa_pais VARCHAR
    empresa_cep VARCHAR(10) NOT NULL
);

-- Tabela de bancos
CREATE TABLE IF NOT EXISTS bancos (
	banco_id INT PRIMARY KEY AUTO_INCREMENT,
    banco_cod VARCHAR(3) NOT NULL,
    

-- Tabela de contas a pagar
CREATE TABLE IF NOT EXISTS contas_pagar (
	id_conta_pagar INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT NOT NULL,
    valor_conta_pagar DECIMAL(7, 2) NOT NULL,
    data_conta_pagar DATE NOT NULL,
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa)
);

-- Tabela de conta bancária