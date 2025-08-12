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
    empresa_cep VARCHAR(10) NOT NULL
);

-- Tabela de conta bancária
CREATE TABLE IF NOT EXISTS bancos (
	banco_id INT PRIMARY KEY AUTO_INCREMENT,
	empresa_id INT NOT NULL,
    banco_cod VARCHAR(3) NOT NULL,
	banco_agencia VARCHAR(20) NOT NULL,
    banco_num_conta VARCHAR(20) NOT NULL,
    banco_digito_conta VARCHAR(2) NOT NULL,
	banco_tipo_conta ENUM('Corrente', 'Poupança', 'Pagamento') NOT NULL,
    banco_saldo DECIMAL(15,2),
	CONSTRAINT fk_empresa FOREIGN KEY (empresa_id) REFERENCES empresas(empresa_id)
);

-- Tabela de contas a pagar
CREATE TABLE IF NOT EXISTS contas_a_pagar (
	pag_id INT PRIMARY KEY AUTO_INCREMENT,
    empresa_id INT NOT NULL,
	banco_id INT NOT NULL,
	pag_fornecedor VARCHAR(100) NOT NULL,
    pag_descricao TEXT NOT NULL,
    pag_valor DECIMAL(7,2) NOT NULL,
    pag_data_emissao DATE NOT NULL,
    pag_data_vencimento DATE NOT NULL,
    pag_data_pagamento DATE,
    pag_status ENUM('Pendente', 'Pago', 'Atrasado', 'Cancelado'),
    CONSTRAINT fk_empresa_pag FOREIGN KEY (empresa_id) REFERENCES empresas(empresa_id),
    CONSTRAINT fk_banco_pag FOREIGN KEY (banco_id) REFERENCES bancos(banco_id)	
);

-- Tabela de pagamentos a receber
CREATE TABLE IF NOT EXISTS contas_a_receber (
	rec_id INT PRIMARY KEY AUTO_INCREMENT,
    empresa_id INT NOT NULL,
	banco_id INT NOT NULL,
	rec_cliente VARCHAR(100) NOT NULL,
    rec_descricao TEXT NOT NULL,
    rec_valor DECIMAL(7,2) NOT NULL,
    rec_data_emissao DATE NOT NULL,
    rec_data_vencimento DATE NOT NULL,
    rec_data_recebimento DATE,
    rec_status ENUM('Pendente', 'Recebido', 'Atrasado', 'Cancelado'),
    CONSTRAINT fk_empresa_rec FOREIGN KEY (empresa_id) REFERENCES empresas(empresa_id),
    CONSTRAINT fk_banco_rec FOREIGN KEY (banco_id) REFERENCES bancos(banco_id)	
);
