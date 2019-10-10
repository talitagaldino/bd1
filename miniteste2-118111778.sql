CREATE TABLE usuario(
	nickname VARCHAR(15) NOT NULL PRIMARY KEY,
	data_nascimento DATE NOT NULL,
	perfil INT REFERENCES perfil_usuario(id_perfil) UNIQUE
);

CREATE TABLE musica(
	titulo VARCHAR(50) NOT NULL PRIMARY KEY,
	estilo CHAR(1) NOT NULL,
	nota INT REFERENCES avaliacoes(nota) ON DELETE RESTRICT
);

ALTER TABLE musica ADD CONSTRAINT estilos_musicais CHECK (estilo = 'R' OR estilo = 'P' OR estilo = 'E' OR estilo = 'S' OR estilo = 'A' OR estilo = 'C');

CREATE TABLE avaliacoes(
	nota INT NOT NULL,
	data_avaliacao date,
	musica_avaliada VARCHAR(50) FOREIGN KEY REFERENCES musica(titulo);

);

ALTER TABLE avaliacoes ADD CONSTRAINT notas_musica CHECK (nota >= 0 AND nota <= 5);

CREATE TABLE perfil_usuario(
	id_perfil INT NOT NULL PRIMARY KEY UNIQUE ON DELETE CASCADE,
	descr_perfil VARCHAR(10) NOT NULL,
	cadastra_usuario BOOLEAN NOT NULL,
	cadastra_musica BOOLEAN NOT NULL, 
	faz_avaliacao BOOLEAN NOT NULL
);

INSERT INTO perfil_usuario (id, descr_perfil, cadastra_usuario, cadastra_musica, faz_avaliacao) VALUES (1, 'admin', true, true, true);
INSERT INTO perfil_usuario (id, descr_perfil, cadastra_usuario, cadastra_musica, faz_avaliacao) VALUES (2, 'cliente', false, false, true);
//legal
