USE MASTER IF EXISTS(
SELECT * FROM SYS.databases 
WHERE NAME = 'bd_CharityCloset_INF2FM')

DROP DATABASE bd_CharityCloset_INF2FM
GO
CREATE DATABASE bd_CharityCloset_INF2FM
GO

USE bd_CharityCloset_INF2FM

--Criação das tabelas:

--Usuario:
CREATE TABLE Usuario
(
	id				BIGINT			NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nome			VARCHAR(100)	NOT NULL,
	sobrenome		VARCHAR(100)	NOT NULL,
	email			VARCHAR(100)	UNIQUE	NOT NULL,
	senha			VARCHAR(100)	NOT NULL,
	telefone		VARCHAR(20)		NOT NULL,
	nivelAcesso		VARCHAR(10)		NULL, --ADMIN ou USER
	foto			VARBINARY(MAX)	NULL,
	cpf				VARCHAR(11)		NOT NULL,
	dataNasc		DATETIME		NOT NULL,
	cep				CHAR(7)			NOT NULL,
	uf				CHAR(2)			NOT NULL,
	dataCadastro	DATETIME		NOT NULL,
	genero			VARCHAR(10)		NOT NULL,
	biografia		VARCHAR(200)	NOT NULL,
)

--ONG:
CREATE TABLE ONG
(
	id				BIGINT			NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nome			VARCHAR(100)	NOT NULL,
	nomerep			VARCHAR(100)	NOT NULL,
	email			VARCHAR(100)	UNIQUE	NOT NULL,
	senha			VARCHAR(100)	NOT NULL,
	telefone		VARCHAR(20)		NOT NULL,
	nivelAcesso		VARCHAR(10)		NULL, --ADMIN ou USER
	foto			VARBINARY(MAX)	NULL,
	cep				CHAR(7)			NOT NULL,
	dataCadastro	DATETIME		NOT NULL,
	sobreNos		VARCHAR(200)	NOT NULL,
	descAtuacao		VARCHAR(200)	NOT NULL,
	uf				CHAR(2)			NOT NULL,
	cnpj			VARCHAR(14)		NOT NULL,
)

--Administrador:
CREATE TABLE Administrador
(
	id				BIGINT			NOT NULL IDENTITY(1,1) PRIMARY KEY,
	cpf				VARCHAR(11)		NOT NULL,
	email			VARCHAR(100)	UNIQUE	 NOT NULL,
	nome			VARCHAR(100)	NOT NULL,
	sobrenome		VARCHAR(100)	NOT NULL,
	senha			VARCHAR(100)	NOT NULL,
	uf				CHAR(2)			NOT NULL,
	dataNasc		DATETIME		NOT NULL,
	cep				CHAR(7)			NOT NULL,
	dataCadastro	DATETIME		NOT NULL,
	telefone		VARCHAR(20)		NOT NULL,
	nivelAcesso		VARCHAR(10)		NULL, --ADMIN ou USER
)

--ConfiguracoesGerais:
CREATE TABLE ConfiguracoesGerais
(
	id						BIGINT			NOT NULL IDENTITY(1,1) PRIMARY KEY,
	politicasPrivacidade	VARCHAR(200)	NOT NULL,
	termosUso				VARCHAR(200)	NOT NULL,
	outrasConfiguracoes		VARCHAR(200)	NOT NULL,
	administrador_id		BIGINT			NOT	NULL,
	usuario_id				BIGINT			NOT NULL,
	ong_id					BIGINT			NOT NULL,			

	FOREIGN KEY	(administrador_id)	REFERENCES Administrador(id),
	FOREIGN KEY	(usuario_id)		REFERENCES Usuario(id),
	FOREIGN KEY (ong_id)			REFERENCES ONG(id)
)

--Avalicao:
CREATE TABLE Avaliacao
(
	id				BIGINT			NOT NULL IDENTITY(1,1) PRIMARY KEY,
	comentario		VARCHAR(100)	NOT NULL,
	nota			INT				NOT NULL,
	usuario_id		BIGINT			NOT NULL,
	
	FOREIGN KEY	(usuario_id) REFERENCES Usuario(id)
)

--CategoriaRoupas:
CREATE TABLE CategoriaRoupas
(
	id				BIGINT			NOT NULL IDENTITY(1,1) PRIMARY KEY,
	genero			VARCHAR(10)		NOT NULL,
	tamanho			VARCHAR(5)		NOT NULL,
)

--ContatoSuporte:
CREATE TABLE ContatoSuporte
(
	id				BIGINT			NOT NULL IDENTITY(1,1) PRIMARY KEY,
	assunto			VARCHAR(50)		NOT NULL,
	mensagem		VARCHAR(200)	NOT NULL,
	dataContato		DATETIME		NOT NULL,
	usuario_id		BIGINT			NOT NULL,

	FOREIGN KEY (usuario_id)	REFERENCES Usuario (id)
)

--AprovacaoONG
CREATE TABLE AprovacaoONG
(
	id				BIGINT			NOT NULL IDENTITY(1,1) PRIMARY KEY,
	dataAprovacao	DATETIME		NOT NULL,
	admin_id		BIGINT			NOT NULL,
	ong_id			BIGINT			NOT NULL,

	FOREIGN KEY (admin_id)	REFERENCES Administrador(id),
	FOREIGN KEY (ong_id)	REFERENCES ONG(id)
)

--ReprovacaoONG
CREATE TABLE ReprovacaoONG
(
	id				 BIGINT				NOT NULL IDENTITY(1,1) PRIMARY KEY,
	dataReprovacao	 DATETIME			NOT NULL,
	admin_id		 BIGINT				NOT NULL,
	ong_id			 BIGINT				NOT NULL,

	FOREIGN KEY (admin_id)	REFERENCES Administrador(id),
	FOREIGN KEY (ong_id)	REFERENCES ONG(id)
)



--Inserts das Tabelas:

--Usuario:
INSERT INTO [dbo].[Usuario](nome, sobrenome, email, senha, telefone, nivelAcesso, foto, cpf, dataNasc, cep, uf, dataCadastro, genero, biografia)
VALUES ('zezo', 'lindo', 'zezo@zezo.com', '123', '11952303304', 'ADMIN', null, '12332112323', '2021-01-08T00:00:00', '1231233','SP','2000-10-05T00:00:00','aaaa', 'eu sou o zezo e sou lindo')

--ONG:
INSERT INTO ONG (nome, nomerep, email, senha, telefone, nivelAcesso, foto, cep, dataCadastro, sobreNos, descAtuacao, uf, cnpj) 
VALUES ('zezo', 'dono ong', 'aaa@aaa.com', '111', '11952303304','USER', null, '1231234', '2021-01-08T00:00:00', 'aaaa', 'aaaaab','rj', '11111111111111')

--Administrador:
INSERT INTO Administrador (cpf, email, nome, sobrenome, senha, uf, dataNasc, cep, dataCadastro, telefone, nivelAcesso) 
VALUES ('11111111111', 'AA@AA.COM', 'aaa', 'aaa', '11212', 'pe', '2021-01-08T00:00:00', '1234567', '2021-01-08T00:00:00', '11952303304', 'admin')

--ConfiguraçõesGerais:
INSERT INTO ConfiguracoesGerais (politicasPrivacidade, termosUso, outrasConfiguracoes, ong_id, administrador_id, usuario_id)
VALUES('aaa', 'aaa','aaaa', 1, 1, 1)

--Avaliacao:
INSERT INTO Avaliacao (comentario, nota, usuario_id)
VALUES('comentário legal', '5', 1)

--Aprovacao:
INSERT INTO AprovacaoONG (dataAprovacao, ong_id, admin_id)
VALUES('2021-01-08T00:00:00', 1, 1)

--Reprovacao:
INSERT INTO ReprovacaoONG (dataReprovacao, ong_id, admin_id)
VALUES('2021-01-08T00:00:00', 1, 1)

--ContatoSuporte:
INSERT INTO ContatoSuporte (assunto, mensagem, dataContato, usuario_id)
VALUES('ashasas', 'sdklhjaklsdhj', '2021-01-08T00:00:00', 1)

--CategoriaRoupas:
INSERT INTO CategoriaRoupas (genero, tamanho) 
VALUES ('m', '12')

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

--Drop das tabelas

--ConfiguraçõesGerais:
DROP TABLE ConfiguracoesGerais
--Avaliacao
DROP TABLE Avaliacao
--Usuário
DROP TABLE Usuario
--ONG
DROP TABLE ONG
--Administrador
DROP TABLE Administrador
--CategoriaRoupas
DROP TABLE CategoriaRoupas
--ContatoSuporte
DROP TABLE ContatoSuporte
--AprovaçãoONG
DROP TABLE AprovacaoONG
--ReprovaçãoONG
DROP TABLE ReprovacaoONG



--Protótipo SQL Charity Closet by ZsTech^
--https://github.com/WellingtonZs

--__________       ___________           .__       /\  
--\____    /  _____\__    ___/___   ____ |  |__   /  \ 
--  /     /  /  ___/ |    |_/ __ \_/ ___\|  |  \  \/\/ 
-- /     /_  \___ \  |    |\  ___/\  \___|   Y  \      
--/_______ \/____  > |____| \___  >\___  >___|  /      
--        \/     \/             \/     \/     \/       