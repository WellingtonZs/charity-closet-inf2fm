USE MASTER IF EXISTS(
SELECT * FROM SYS.databases 
WHERE NAME = 'bd_CharityCloset_INF2FM')

DROP DATABASE bd_CharityCloset_INF2FM
GO
CREATE DATABASE bd_CharityCloset_INF2FM
GO

USE bd_CharityCloset_INF2FM



--Criação das tabelas:


--ConfiguracoesGerais:
CREATE TABLE ConfiguracoesGerais
(
	id						BIGINT				IDENTITY,
	politicasPrivacidade	VARCHAR(200)	NOT NULL,
	termosUso				VARCHAR(200)	NOT NULL,
	outrasConfiguracoes		VARCHAR(200)	NOT NULL,
	statusConfiguracoes		VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id)
)

--Avalicao:
CREATE TABLE Avaliacao
(
	id				BIGINT				IDENTITY,
	comentario		VARCHAR(100)	NOT NULL,
	nota			INT				NOT NULL,
	statusAvaliacao VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id)
)

--Usuario:
CREATE TABLE Usuario
(
	id				BIGINT			IDENTITY,
	nome			VARCHAR(100)	NOT NULL,
	sobrenome		VARCHAR(100)	NOT NULL,
	email			VARCHAR(100)	UNIQUE		NOT NULL,
	senha			VARCHAR(100)	NOT NULL,
	telefone		VARCHAR(20)		NOT NULL,
	nivelAcesso		VARCHAR(10)		NULL, --ADMIN ou USER
	foto			VARBINARY(MAX)	NULL,
	cpf				VARCHAR(11)		NOT NULL,
	dataNasc		DATE			NOT NULL,
	cep				CHAR(7)			NOT NULL,
	uf				CHAR(2)			NOT NULL,
	dataCadastro	DATE			NOT NULL,
	genero			VARCHAR(10)		NOT NULL,
	biografia		VARCHAR(200)	NOT NULL,
	statusUsuario	VARCHAR(20)		NOT NULL,
	config_id		BIGINT			NOT NULL,
	avaliacao_id	BIGINT			NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (config_id) REFERENCES ConfiguracoesGerais(id),
	FOREIGN KEY	(avaliacao_id) REFERENCES Avaliacao(id)
)

--ONG:
CREATE TABLE ONG
(
	id				BIGINT				IDENTITY,
	nome			VARCHAR(100)	NOT NULL,
	email			VARCHAR(100)	UNIQUE		NOT NULL,
	senha			VARCHAR(100)	NOT NULL,
	telefone		VARCHAR(20)		NOT NULL,
	nivelAcesso		VARCHAR(10)		NULL, --ADMIN ou USER
	foto			VARBINARY(MAX)	NULL,
	cep				CHAR(7)			NOT NULL,
	dataCadastro	DATE			NOT NULL,
	sobreNos		VARCHAR(200)	NOT NULL,
	uf				CHAR(2)			NOT NULL,
	cnpj			VARCHAR(14)		NOT NULL,
	statusONG		VARCHAR(20)		NOT NULL,
	config_id		BIGINT			NOT NULL,
	avaliacao_id	BIGINT			NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (config_id) REFERENCES ConfiguracoesGerais(id),
	FOREIGN KEY	(avaliacao_id) REFERENCES Avaliacao(id)
)

--Administrador:
CREATE TABLE Administrador
(
	id				BIGINT			IDENTITY,
	cpf				VARCHAR(11)		NOT NULL,
	email			VARCHAR(100)	UNIQUE		NOT NULL,
	nome			VARCHAR(100)	NOT NULL,
	sobrenome		VARCHAR(100)	NOT NULL,
	senha			VARCHAR(100)	NOT NULL,
	uf				CHAR(2)			NOT NULL,
	dataNasc		DATE			NOT NULL,
	cep				CHAR(7)			NOT NULL,
	dataCadastro	DATE			NOT NULL,
	telefone		VARCHAR(20)		NOT NULL,
	nivelAcesso		VARCHAR(10)		NULL, --ADMIN ou USER
	foto			VARBINARY(MAX)	NULL,
	statusAdmin		VARCHAR(20)		NOT NULL,
	config_id		BIGINT			NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (config_id) REFERENCES ConfiguracoesGerais(id)
)

--CategoriaRoupas:
CREATE TABLE CategoriaRoupas
(
	id				BIGINT			IDENTITY,
	genero			VARCHAR(10)		NOT NULL,
	tamanho			VARCHAR(5)		NOT NULL,
	statusCategoria	VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id)
)

--ContatoSuporte:
CREATE TABLE ContatoSuporte
(
	id				BIGINT			IDENTITY,
	assunto			VARCHAR(50)		NOT NULL,
	mensagem		VARCHAR(200)	NOT NULL,
	dataContato		DATE			NOT NULL,
	statusContato	VARCHAR(20)		NOT NULL,
	usuario_id		BIGINT			NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (usuario_id)	REFERENCES Usuario (id)
)

--AprovacaoONG
CREATE TABLE AprovacaoONG
(
	id				BIGINT			IDENTITY,
	dataAprovacao	DATE			NOT NULL,
	statusAprovacao	VARCHAR(20)		NOT NULL,
	admin_id		BIGINT			NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (admin_id)	REFERENCES Administrador(id)
)

--ReprovacaoONG
CREATE TABLE ReprovacaoONG
(
	id				 BIGINT				IDENTITY,
	dataReprovacao	 DATE				NOT NULL,
	statusReprovacao VARCHAR(20)		NOT NULL,
	admin_id		 BIGINT				NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (admin_id)	REFERENCES Administrador(id)
)



--Inserts das Tabelas:
-- resolver erro: Falha ao converter data e/ou hora da cadeia de caracteres.
--Usuario:
INSERT Usuario(nome, sobrenome, email, senha, telefone, nivelAcesso, foto, cpf, dataNasc, cep, uf, dataCadastro, genero, biografia, statusUsuario) 
VALUES ('zezo', 'lindo','zezo@zezo.com','123', '11952303304', 'ADMIN',null, '12332112323', '2021-01-08', '1231233', 'SP', '10112011', 'aaaa', 'eu sou o zezo e sou lindo', 'ATIVO')

--ONG:
INSERT ONG (nome, email, senha, telefone, cep, dataCadastro, sobreNos, uf, cnpj, statusONG) 
VALUES ('')

--Administrador:
INSERT Administrador (cpf, email, nome, sobrenome, senha, uf, dataNasc, cep, dataCadastro, telefone, statusAdmin) 
VALUES ('')

--ConfiguraçõesGerais:
INSERT ConfiguracoesGerais (politicasPrivacidade, termosUso, outrasConfiguracoes, statusConfiguracoes)
VALUES('')

--Avaliacao:
INSERT Avaliacao (comentario, nota, statusAvaliacao)
VALUES('')

--Aprovacao:
INSERT AprovacaoONG (dataAprovacao, statusAprovacao)
VALUES('')

--Reprovacao:
INSERT ReprovacaoONG (dataReprovacao, statusReprovacao)
VALUES('')

--ContatoSuporte:
INSERT ContatoSuporte (assunto, mensagem, dataContato, statusContato, usuario_id)
VALUES('')

--CategoriaRoupas:
INSERT CategoriaRoupas (genero, tamanho, statusCategoria) 
VALUES ('')

--Selects:

--ConfiguraçõesGerais:
SELECT * FROM ConfiguracoesGerais
--Avaliacao
SELECT * FROM Avaliacao
--Usuário
SELECT * FROM Usuario
--ONG
SELECT * FROM ONG
--Administrador
SELECT * FROM Administrador
--CategoriaRoupas
SELECT * FROM CategoriaRoupas
--ContatoSuporte
SELECT * FROM ContatoSuporte
--AprovaçãoONG
SELECT * FROM AprovacaoONG
--ReprovaçãoONG
SELECT * FROM ReprovacaoONG




--Protótipo SQL Charity Closet by ZsTech^
--https://github.com/WellingtonZs

--__________       ___________           .__       /\  
--\____    /  _____\__    ___/___   ____ |  |__   /  \ 
--  /     /  /  ___/ |    |_/ __ \_/ ___\|  |  \  \/\/ 
-- /     /_  \___ \  |    |\  ___/\  \___|   Y  \      
--/_______ \/____  > |____| \___  >\___  >___|  /      
--        \/     \/             \/     \/     \/       