--Questão 1 (Comandos 1)

CREATE TABLE tarefas (
	id_tarefa bigint,
	descricao text,
	funcionario_responsavel char(11),
	prioriade integer,
	status_tarefa char(1)
);

INSERT INTO tarefas VALUES(2147483646, 'limpar chão do corredor central', '98765432111', 0, 'F');
INSERT INTO tarefas VALUES(2147483647, 'limpar janelas da sala 203', '98765432122', 1, 'F');
INSERT INTO tarefas VALUES(null,null,null,null,null);

CREATE TABLE funcionario(
	cpf char(11),
	data_nasc date,
	nome varchar(70),
	funcao varchar(11),
	nivel char(1),
	superior_cpf char(11)
);

INSERT INTO tarefas VALUES(2147483644, 'limpar chão do corredor superior', '987654323211', 0, 'F');
INSERT INTO tarefas VALUES(2147483643, 'limpar chão do corredor superior', '98765432321', 0, 'FF');

--select * from nometabela;

--Questão 2 (Comandos 2)

INSERT INTO tarefas VALUES(2147483648, 'limpar portas do térreo', '32323232955', 4, 'A');

--Questão 3 (Comandos 3 e 4)

ALTER TABLE tarefas ALTER COLUMN prioriade TYPE SMALLINT;

INSERT INTO tarefas VALUES(2147483649, 'limpar portas da entrada principal', '32322525199', 32768, 'A');
INSERT INTO tarefas VALUES(2147483650, 'limpar janelas da entrada principal', '32333233288', 32769, 'A');

INSERT INTO tarefas VALUES(2147483651, 'limpar portas do 1o andar', '32323232911', 32767, 'A');
INSERT INTO tarefas VALUES(2147483652, 'limpar portas do 1o andar', '32323232911', 32766, 'A');

--Questão 4

DELETE FROM tarefas WHERE id_tarefa IS NULL;

ALTER TABLE tarefas ALTER COLUMN id_tarefa SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN descricao SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN funcionario_responsavel SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN prioriade SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN status_tarefa SET NOT NULL;

ALTER TABLE tarefas RENAME COLUMN id_tarefa TO id;
ALTER TABLE tarefas RENAME COLUMN funcionario_responsavel TO func_resp_cpf;
ALTER TABLE tarefas RENAME COLUMN status_tarefa TO status;

--Questão 5 (Comandos 5)

ALTER TABLE tarefas ADD UNIQUE (id);

INSERT INTO tarefas VALUES(2147483653, 'limpar portas do 1o andar', '32323232911', 2, 'A');
INSERT INTO tarefas VALUES(2147483653, 'aparar grama da area frontal ', '32323232911', 3, 'A');

--Questão 6

UPDATE tarefas SET status = 'P' WHERE status = 'A';
UPDATE tarefas SET status = 'R' WHERE status = 'E';
UPDATE tarefas SET status = 'C' WHERE status = 'F';

ALTER TABLE tarefas ADD CONSTRAINT possiveis_status CHECK (status = 'P' OR status = 'E' OR status = 'C');

--Questão 7

UPDATE tarefas SET prioriade = 3 WHERE prioriade = 32767;
UPDATE tarefas SET prioriade = 2 WHERE prioriade = 32766;
ALTER TABLE tarefas ADD CONSTRAINT possiveis_prioridades CHECK (prioriade = 0 OR prioriade = 1 OR prioriade = 2 OR prioriade = 3 OR prioriade = 4 OR prioriade = 5);

--Questão 8 (Comandos 6)

ALTER TABLE funcionario ADD PRIMARY KEY (cpf);
ALTER TABLE funcionario ADD CONSTRAINT funcionario_supervisor FOREIGN KEY (superior_cpf) REFERENCES funcionario(cpf);
ALTER TABLE funcionario ADD CONSTRAINT verificacao_funcao CHECK (funcao = 'LIMPEZA' AND superior_cpf IS NOT NULL OR funcao = 'SUP_LIMPEZA' AND superior_cpf IS NULL);
ALTER TABLE funcionario ADD CONSTRAINT possiveis_niveis CHECK (nivel = 'J' OR nivel = 'P' OR nivel = 'S'); 
ALTER TABLE funcionario ALTER COLUMN data_nasc SET NOT NULL;
ALTER TABLE funcionario ALTER COLUMN nome SET NOT NULL;
ALTER TABLE funcionario ALTER COLUMN funcao SET NOT NULL;
ALTER TABLE funcionario ALTER COLUMN cpf SET NOT NULL;
ALTER TABLE funcionario ALTER COLUMN nivel SET NOT NULL;

INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678911', '1980-05-07', 'Pedro da Silva', 'SUP_LIMPEZA', 'S', null);
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678912', '1980-03-08', 'Jose da Silva', 'LIMPEZA', 'J', '12345678911');
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678913', '1980-04-09', 'joao da silva', 'LIMPEZA', 'J', null);

--Questão 9

--CADASTRADOS
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678913', '1980-05-07', 'Joao da Silva', 'LIMPEZA', 'S', '12345678918');
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678914', '2000-07-11', 'Marcio da Silva', 'LIMPEZA', 'J', '12345678919');
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678915', '1990-08-10', 'Maria da Silva', 'LIMPEZA', 'P', '12345678920');
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678916', '1992-01-07', 'Joana da Silva', 'LIMPEZA', 'P', '12345678921');
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678917', '1997-09-03', 'Antonio da Silva', 'LIMPEZA', 'J', '12345678922');
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678918', '1997-08-25', 'Mario da Silva', 'SUP_LIMPEZA', 'S', null);
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678919', '1992-04-31', 'Zé da Silva', 'SUP_LIMPEZA', 'P', null);
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678920', '1989-03-07', 'Bento da Silva', 'SUP_LIMPEZA', 'S', null);
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678921', '1998-06-14', 'Valeria da Silva', 'SUP_LIMPEZA', 'J', null);
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678922', '1993-05-07', 'Mariana da Silva', 'SUP_LIMPEZA', 'J', null);

--NÃO CADASTRADOS
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678923', '1980-05-07', 'Joao da Silva', 'LIMPEZA', 'A', '12345678918');
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678924', '2000-07-17', 'Marcio da Silva', 'LIMPEZA', 'J', null);
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678925', '1990-08-12', 'Maria da Silva', 'SUP_LIMPEZA', 'P', '12345678920');
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678926', '1992-01-08', null, 'LIMPEZA', 'P', '12345678921');
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES (null, null, null, null, null);
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES (null, '1997-08-19', 'Mario da Silva', 'SUP_LIMPEZA', 'S', "12345678913");
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678929', null, 'Zé da Silva', 'LIMPEZA', 'P', null);
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678930', '1989-03-17', null, 'SUP_LIMPEZA', 'L', null);
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678931', '1998-06-04', 'Valeria da Silva', 'SUP_LIMPEZA', 'D', null);
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678932', '1993-05-18', 'Mariana da Silva', null, 'J', null);

--Questão 10

INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('32323232955', '1993-05-07', 'Josefa Silva', 'SUP_LIMPEZA', 'J', null);
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('32323232911', '1993-05-07', 'Joao Bento Silva', 'LIMPEZA', 'S', '32323232955');
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('98765432122', '1993-05-07', 'Maria Joana Silva', 'SUP_LIMPEZA', 'J', null);
INSERT INTO funcionario(cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('98765432111', '1993-05-07', 'Marcela souza', 'SUP_LIMPEZA', 'J', null);
ALTER TABLE tarefas ADD CONSTRAINT fk_funcionario_tarefa FOREIGN KEY (func_resp_cpf) REFERENCES funcionario(cpf) ON DELETE CASCADE;

DELETE FROM tarefas WHERE func_resp_cpf = '98765432111';

--Questão 11

ALTER TABLE tarefas ADD COLUMN func_resp_id integer;

--NÃO CONSEGUI ADICIONAR ESSA CONSTRAINT =(
ALTER TABLE tarefas ADD CONSTRAINT func_resp_id_null CHECK (func_resp_id IS NOT NULL AND status = 'E');
// uau!
