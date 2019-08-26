CREATE TABLE automovel(
	modelo_automovel varchar(20),
	placa_automovel varchar(8),
	ano_automovel varchar(4),
	ident_proprietario varchar(11),
	marca_automovel varchar(20)
);

CREATE TABLE segurado(
	nome_proprietario varchar(20),
	cpf_proprietario varchar(20),
	endereco_proprietario varchar(30),
	nascimento_segurado date,
	telefone_segurado varchar(20)
);

CREATE TABLE perito(
	cpf_perito varchar(11),
	nome_perito varchar(70),
	endereco_perito varchar(20),
	nascimento_perito date,
	telefone_perito varchar(20),
	id_perito serial
	
);

CREATE TABLE oficina(
	endereco_oficina text,
	telefone_oficina varchar(15),
	nome_oficina varchar(50),
	id_oficina serial
);

CREATE TABLE seguro(
	id_seguro serial,
	nome_proprietario varchar(70),
	cpf_proprietario varchar(11),
	inicio_seguro date,
	fim_seguro date
);

CREATE TABLE sinistro(
	local_acidente text,
	dano_carro text, 
	nome_proprietario varchar(70),
	cpf_proprietario varchar(11),
	placa_automovel varchar(8),
	horario_acidente timestamp,
	id_sinistro serial
);

CREATE TABLE pericia(
	status_pericia boolean,
	id_perito integer,
	ident_proprietario varchar(11),
	placa_automovel varchar(8),
	id_sinistro integer,
	id_pericia serial
);

CREATE TABLE reparo(
	id_reparo serial, 
	id_sinistro integer,
	status_reparo boolean,
	id_oficina integer,
	data_inicio_reparo date,
	data_fim_reparo date,
	placa_automovel varchar(8),
	id_seguro integer
);

--ADICIONANDO AS CHAVES PRIMARIAS
ALTER TABLE automovel ADD PRIMARY KEY (placa_automovel);
ALTER TABLE segurado ADD PRIMARY KEY (cpf_proprietario);
ALTER TABLE perito ADD PRIMARY KEY (id_perito);
ALTER TABLE oficina ADD PRIMARY KEY (id_oficina);
ALTER TABLE seguro ADD PRIMARY KEY (id_seguro);
ALTER TABLE sinistro ADD PRIMARY KEY (id_sinistro);
ALTER TABLE pericia ADD PRIMARY KEY (id_pericia);
ALTER TABLE reparo ADD PRIMARY KEY (id_reparo);

--ADICIONANDO AS CHAVES ESTRANGEIRAS
ALTER TABLE automovel ADD CONSTRAINT automovel_e_proprietario FOREIGN KEY cpf_proprietario REFERENCES segurado(ident_proprietario);
ALTER TABLE seguro ADD CONSTRAINT seguro_e_proprietarui FOREIGN KEY cpf_proprietario REFERENCES segurado(ident_proprietario);
ALTER TABLE sinistro ADD CONSTRAINT sinistro_e_pericia FOREIGN KEY id_sinistro REFERENCES pericia(id_sinistro);
ALTER TABLE perito ADD CONSTRAINT perito_e_pericia FOREIGN KEY id_perito REFERENCES pericia(id_perito);