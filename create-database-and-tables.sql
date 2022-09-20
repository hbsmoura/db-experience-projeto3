-- Criação do banco de dados

DROP DATABASE IF EXISTS `dio-commerce`;

CREATE DATABASE `dio-commerce`;

USE `dio-commerce`;

-- Entidade/classe cliente e suas subclasses cliente_pf (pessoa física) e cliente_pj (pessoa jurídica)

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('pf', 'pj') NOT NULL DEFAULT 'pf',
    cep CHAR(8),
    logradouro VARCHAR(45) NOT NULL,
    numero INT,
    complemento VARCHAR(45),
    bairro VARCHAR(45) NOT NULL,
    municipio VARCHAR(45) NOT NULL,
    uf ENUM('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO',
			'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI',
			'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO') NOT NULL
);

-- CEP, Logradouro, Complemento, Número, Bairro, Cidade, Estado ou Sigla do Estado

DROP TABLE IF EXISTS `cliente_pf`;
CREATE TABLE `cliente_pf` (
	nome VARCHAR(45) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    id_cliente INT NOT NULL PRIMARY KEY,
    CONSTRAINT fk_pf_cliente_id FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

DROP TABLE IF EXISTS `cliente_pj`;
CREATE TABLE `cliente_pj` (
	razao_social VARCHAR(45) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    id_cliente INT NOT NULL PRIMARY KEY,
    CONSTRAINT fk_pj_cliente_id FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Entidade/classe forma_de_pagameto_salva e suas subclasses transferencia_bancaria e cartao_de_credito

DROP TABLE IF EXISTS `forma_pagamento_salva`;
CREATE TABLE `forma_pagamento_salva` (
	id_forma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    tipo ENUM('TRANSFERENCIA_BANCARIA', 'CARTAO_CREDITO'),
    CONSTRAINT fk_forma_pag_cliente_id FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

DROP TABLE IF EXISTS `transferencia_bancaria`;
CREATE TABLE `transferencia_bancaria` (
	codigo_banco INT NOT NULL,
    agencia VARCHAR(15) NOT NULL,
    conta VARCHAR(20) NOT NULL,
    id_forma_pagamento INT PRIMARY KEY,
    CONSTRAINT fk_transf_banc_forma_pag_id FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento_salva(id_forma)
);

DROP TABLE IF EXISTS `cartao_credito`;
CREATE TABLE `cartao_credito` (
	numero_cartao VARCHAR(20) NOT NULL,
    validade DATE NOT NULL,
    id_forma_pagamento INT NOT NULL PRIMARY KEY,
    CONSTRAINT fk_cart_cred_forma_pag_id FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento_salva(id_forma)
);

-- Entidade/classe pedido

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
	id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status_pedido ENUM('RECEBIDO', 'PAGAMENTO_APROVADO', 'PAGAMENTO_REPROVADO', 'PROCESSADO', 'EXPEDIDO', 'ENTREGUE') NOT NULL DEFAULT 'RECEBIDO',
    descricao TEXT NOT NULL,
    codigo_rastreio VARCHAR(45),
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedido_cliente_id FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Entidade/classe pagamento

DROP TABLE IF EXISTS `pagamento`;
CREATE TABLE `pagamento` (
	id_pedido INT NOT NULL,
    valor FLOAT NOT NULL,
    parcelas INT NOT NULL DEFAULT 1,
    codigo_boleto_pix VARCHAR(60),
    status_pagamento ENUM('AGUARDANDO_PAGAMENTO', 'PROCESSANDO', 'PAGO', 'CANCELADO', 'VENCIDO') NOT NULL DEFAULT 'AGUARDANDO_PAGAMENTO',
    id_forma_pagamento INT,
    CONSTRAINT pk_pagamento PRIMARY KEY (id_pedido),
    CONSTRAINT fk_pagamento_pedido_id FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    CONSTRAINT fk_pagamento_forma_pag_id FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento_salva(id_forma)
);

-- Entidade/classe produto

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
	id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categoria ENUM('BRINQUEDOS', 'CALCADOS', 'ELETRONICOS', 'ESPORTES', 'FERRAMENTAS', 'GAMES', 'LIVROS', 'VESTUARIO', 'OUTROS') NOT NULL DEFAULT 'OUTROS',
    descricao VARCHAR(255) NOT NULL,
    valor FLOAT
);

-- Entidade/classe estoque

DROP TABLE IF EXISTS `estoque`;
CREATE TABLE `estoque` (
	id_estoque INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    uf ENUM('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO',
			'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI',
			'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'),
    municipio VARCHAR(45) NOT NULL,
    agencia INT NOT NULL DEFAULT 1
);

-- Entidade/classe fornecedor

DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE `fornecedor` (
	id_fornecedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	razao_social VARCHAR(45) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL
);

-- Entidade/classe terceiro vendedor

DROP TABLE IF EXISTS `terceiro_vendedor`;
CREATE TABLE `terceiro_vendedor` (
	id_vendedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	razao_social VARCHAR(45) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

-- Relacionamento produto-estoque

DROP TABLE IF EXISTS `produto_no_estoque`;
CREATE TABLE `produto_no_estoque` (
	id_produto INT NOT NULL,
	id_estoque INT NOT NULL,
    quantidade INT NOT NULL,
    CONSTRAINT fk_prod_estoque_id_prod FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    CONSTRAINT fk_prod_estoque_id_estoque FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque),
    CONSTRAINT pk_prod_estoque PRIMARY KEY (id_produto, id_estoque)
);

-- Relacionamento fornecedor-produto (fornecedor disponibiliza produto)

DROP TABLE IF EXISTS `fornecer_produto`;
CREATE TABLE `fornecedor_produto` (
	id_fornecedor INT NOT NULL,
	id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    CONSTRAINT fk_forn_prod_id_forn FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor),
    CONSTRAINT fk_forn_prod_id_prod FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    CONSTRAINT pk_fornecedor_prod PRIMARY KEY (id_fornecedor, id_produto)
);

-- Relacionamento produto por terceiro vendedor

DROP TABLE IF EXISTS `produto_vendedor`;
CREATE TABLE `produto_vendedor` (
	id_produto INT NOT NULL,
	id_vendedor INT NOT NULL,
    quantidade INT NOT NULL,
    CONSTRAINT fk_prod_vend_id_prod FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    CONSTRAINT fk_prod_vend_id_forn FOREIGN KEY (id_vendedor) REFERENCES terceiro_vendedor(id_vendedor),
    CONSTRAINT pk_prod_vend PRIMARY KEY (id_produto, id_vendedor)
);

-- Relacionamento produto no pedido

DROP TABLE IF EXISTS `produto_no_pedido`;
CREATE TABLE `produto_no_pedido` (
	id_produto INT NOT NULL,
	id_pedido INT NOT NULL,
    quantidade INT NOT NULL,
    CONSTRAINT fk_prod_pedido_id_prod FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    CONSTRAINT fk_prod_pedido_id_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    CONSTRAINT pk_prod_pedido PRIMARY KEY (id_produto, id_pedido)
);
