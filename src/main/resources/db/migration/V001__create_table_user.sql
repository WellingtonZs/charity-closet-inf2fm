IF NOT EXISTS(SELECT * FROM sysobjects WHERE name='Usuario' and xtype='U')
CREATE TABLE Usuario
(
	id				BIGINT			IDENTITY(1,1) PRIMARY KEY,
	nome			VARCHAR(100)	NOT NULL,
	sobrenome		VARCHAR(100)	NOT NULL,
	email			VARCHAR(100)	NOT NULL,
	senha			VARCHAR(100)	NOT NULL,
	telefone		VARCHAR(20)		NOT NULL,
	cpf				VARCHAR(11)		NOT NULL,
	data_nasc		DATE			NOT NULL,
	cep				CHAR(7)			NOT NULL,
	uf				CHAR(2)			NOT NULL,
	data_cadastro	DATE			NOT NULL,
	genero			VARCHAR(10)		NOT NULL,
	biografia		VARCHAR(200)	NOT NULL,
	statusUsuario	VARCHAR(20)		NOT NULL,
);