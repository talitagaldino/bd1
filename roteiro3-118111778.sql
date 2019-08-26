CREATE TYPE estados AS ENUM('paraiba', 'pernambuco', 'ceara', 'sergipe', 'maranhao', 'alagoas', 'piaui', 'rio grande do norte');

CREATE TABLE farmacia(
	id_farmacia INT PRIMARY KEY,
	nome VARCHAR(15),
	bairro VARCHAR(50) UNIQUE,
	cidade VARCHAR(50),
	estado estados,
	telefone VARCHAR(16),
	categoria VARCHAR(6),
	cpf_gerente CHAR(11),
	funcao_gerente tipos_funcionario,
	FOREIGN KEY (cpf_gerente, funcao_gerente) REFERENCES funcionario(cpf, funcao),
	ADD CONSTRAINT categoria_gerente CHECK(funcao_gerente = 'administrador' OR funcao_gerente = 'farmacêutrico')

);

ADD CONSTRAINT check_categoria CHECK (categoria = 'S' OR categoria = 'F'); -- S -> sede, F -> filial
ADD CONSTRAINT sede_unica EXCLUDE USING gist (categoria with =) WHERE (nome = 'sede');

CREATE TYPE tipos_funcionario AS ENUM('farmacêutrico', 'vendedor', 'entregador', 'caixa', 'administrador');

CREATE TABLE funcionario(
	cpf CHAR(11) PRIMARY KEY,
	nome VARCHAR(70),
	locacao INT REFERENCES farmacia(id_farmacia),
	telefone VARCHAR(16),
	tipo_func tipos_funcionario;

);

CREATE TABLE medicamentos(
	nome VARCHAR(70),
	id_medicamento INTEGER PRIMARY KEY,
	preco NUMERIC,
	tipo_venda VARCHAR(17)
);

CREATE TABLE venda(
	id_venda INTEGER PRIMARY KEY,
	vendedor CHAR(11) REFERENCES funcionario(cpf),


);

CREATE TABLE cliente(
	cpf CHAR(11) PRIMARY KEY,
	nome VARCHAR(70),
	telefone VARCHAR(16),

);

CREATE TABLE entrega(
	
);