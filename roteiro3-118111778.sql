CREATE TYPE estados AS ENUM ('paraiba', 'pernambuco', 'ceara', 'sergipe', 'maranhao', 'alagoas', 'piaui', 'rio grande do norte');
CREATE TYPE tipos_funcionario AS ENUM('farmacêutrico', 'vendedor', 'entregador', 'caixa', 'administrador');
CREATE TYPE tipos_endereco_cliente AS ENUM('residência', 'trabalho', 'outro');

CREATE TABLE farmacia(
	id_farmacia INT PRIMARY KEY NOT NULL,
	bairro VARCHAR(30) UNIQUE NOT NULL,
	cidade VARCHAR(30) NOT NULL,
	estado estados NOT NULL,
	teleforne VARCHAR(16) NOT NULL,
	categoria VARCHAR(6) NOT NULL,
	cpf_gerente CHAR(11) UNIQUE NOT NULL,
	funcao_gerente tipos_funcionario

);

--verifica se a categoria da  farmacia é válida
ALTER TABLE farmacia ADD CONSTRAINT validade_categoria CHECK (categoria = 'S' OR categoria = 'F');

--referencia um gerente a farmacia
ALTER TABLE farmacia ADD CONSTRAINT fk_gerente FOREIGN KEY (cpf_gerente) REFERENCES funcionario(cpf_funcionario);

-- verifica se o gerente é o tipo de funcionario correto
ALTER TABLE farmacia ADD CONSTRAINT validade_gerente CHECK (funcao_gerente = 'administrador' OR funcao_gerente = 'farmacêutrico');

--verifica se a sede única
ALTER TABLE farmacia ADD CONSTRAINT sede_unica EXCLUDE USING gist (categoria with =) WHERE (categoria = 'S');


CREATE TABLE funcionario(
	cpf_funcionario CHAR(11) NOT NULL,
	nome VARCHAR(40) NOT NULL,
	locacao INT REFERENCES farmacia UNIQUE NOT NULL,
	teleforne VARCHAR(16) NOT NULL,
	tipo_func tipos_funcionario
);

ALTER TABLE funcionario ADD CONSTRAINT pk_funcionario PRIMARY KEY (cpf_funcionario);

CREATE TABLE medicamento(
	id_medicamento BIGINT PRIMARY KEY NOT NULL,
	nome_medicamento VARCHAR(40) NOT NULL,
	preco NUMERIC NOT NULL,
	caracteristica_med VARCHAR(27) NOT NULL,
	venda_associada INT NOT NULL
);

CREATE TABLE venda(
	id_venda BIGINT PRIMARY KEY NOT NULL,
	caracteristica_medicamento_vendido VARCHAR(21) NOT NULL,
	funcionario_vinculado CHAR(11) NOT NULL,
	medicamento_vendido INT NOT NULL,
	cliente INT NOT NULL,
	tipo_cliente VARCHAR(14) NOT NULL
);

--tipo_funcionario_associado tipos_funcionario REFERENCES funcionario(tipo_func) NOT NULL,


ALTER TABLE venda ADD CONSTRAINT fk_funcionario_venda FOREIGN KEY (funcionario_vinculado) REFERENCES funcionario(cpf_funcionario);
ALTER TABLE venda ADD CONSTRAINT validade_funcionario_venda CHECK (tipo_funcionario_associado = 'vendedor');
--ALTER TABLE venda ADD COLUMN tipo_funcionario_associado FOREIGN KEY (tipo_funcionario_associado) REFERENCES funcionario(tipo_func);
ALTER TABLE venda ADD CONSTRAINT medicamento_vendido FOREIGN KEY (medicamento_vendido) REFERENCES medicamento(id_medicamento);
ALTER TABLE medicamento ADD CONSTRAINT venda_medicamento FOREIGN KEY (venda_associada) REFERENCES venda(id_venda);

CREATE TABLE cliente(
	cpf_cliente CHAR(11) PRIMARY KEY NOT NULL,
	endereco tipos_endereco_cliente NOT NULL,
	tipo_cliente VARCHAR(14) NOT NULL, 
	data_nascimento TIMESTAMP NOT NULL,
	data_atual TIMESTAMP NOT NULL

);

CREATE TABLE enderecos_cliente(
	id CHAR(11) REFERENCES cliente(cpf_cliente) NOT NULL,
	rua VARCHAR(50) NOT NULL,
	bairro VARCHAR(50) NOT NULL,
	numero VARCHAR(8) NOT NULL,
	cep BIGINT NOT NULL,
	tipo_endereco tipos_endereco_cliente
);

CREATE TABLE entrega(
	id_cliente CHAR(11) REFERENCES cliente(cpf_cliente) NOT NULL,
	id_medicamento BIGINT REFERENCES medicamento(id_medicamento) NOT NULL,
	tipo_cliente VARCHAR(14) NOT NULL,

	CONSTRAINT cliente_cadastrado_entrega CHECK (tipo_cliente = 'cadastrado')
);

ALTER TABLE enderecos_cliente ADD CONSTRAINT endereco_valido CHECK (tipo_endereco IN('residência', 'trabalho', 'outro'));
ALTER TABLE enderecos_cliente ADD PRIMARY KEY(id);
ALTER TABLE venda ADD CONSTRAINT fk_cliente FOREIGN KEY (cliente) REFERENCES cliente(cpf_cliente);
--ALTER TABLE venda ADD CONSTRAINT venda_exclusiva CHECK (tipo_cliente = 'cadastrado');

--ALTER TABLE venda ADD CONSTRAINT cliente_venda FOREIGN KEY (cliente) REFERENCES cliente(id_cliente);

--CÁLCULO DA IDADE
ALTER TABLE cliente ADD CONSTRAINT verifica_idade_cliente CHECK (tipo_cliente = 'cadastrado' AND (age(data_atual, data_nascimento)) >= 18); 

ALTER TABLE venda ADD CONSTRAINT fk_venda_cliente FOREIGN KEY cliente REFERENCES cliente(cpf_cliente);
