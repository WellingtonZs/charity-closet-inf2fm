USE MASTER IF EXISTS(
SELECT * FROM SYS.databases 
WHERE NAME = 'bd_CharityCloset_INF2FM')

DROP DATABASE bd_CharityCloset_INF2FM
GO
CREATE DATABASE bd_CharityCloset_INF2FM
GO
USE bd_CharityCloset_INF2FM

CREATE TABLE Usuario
(
	id				INT				IDENTITY,
	nome			VARCHAR(100)	NOT NULL,
	sobrenome		VARCHAR(100)	NOT NULL,
	email			VARCHAR(100)	NOT NULL,
	senha			VARCHAR(100)	NOT NULL,
	telefone		VARCHAR(20)		NOT NULL,
	cpf				VARCHAR(11)		NOT NULL,
	data_nasc		DATE(8)			NOT NULL,
	cep				CHAR(7)			NOT NULL,
	uf				CHAR(2)			NOT NULL,
	data_cadastro	DATE(8)			NOT NULL,
	genero			VARCHAR(10)		NOT NULL,
	biografia		VARCHAR(200)	NOT NULL,
	statusUsuario	VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id)
)
INSERT Usuario (nome, sobrenome, email, senha, telefone, cpf, data_nasc, cep, uf, data_cadastro, genero, biografia) 
		VALUES ('')

CREATE TABLE ONG
(
	id				INT				IDENTITY,
	nome			VARCHAR(100)	NOT NULL,
	email			VARCHAR(100)	NOT NULL,
	senha			VARCHAR(100)	NOT NULL,
	telefone		VARCHAR(20)		NOT NULL,
	cep				CHAR(7)			NOT NULL,
	data_cadastro	DATE(8)			NOT NULL,
	sobre_nos		VARCHAR(200)	NOT NULL,
	uf				CHAR(2)			NOT NULL,
	cnpj			VARCHAR(14)		NOT NULL,
	statusONG		VARCHAR(20)		NOT NULL,
	
	PRIMARY KEY (id)
)
INSERT ONG (nome, email, senha, telefone, cep, data_cadastro, sobre_nos, uf, cnpj, statusONG) 
		VALUES ('')

CREATE TABLE Categoria_Roupas
(
	id				INT				IDENTITY,
	genero			VARCHAR(10)		NOT NULL,
	tamanho			VARCHAR(5)		NOT NULL,
	statusCategoria	VARCHAR(20)		NOT NULL,
	PRIMARY KEY (id)
)
INSERT Categoria_Roupas (genero, tamanho, statusCategoria) 
		VALUES ('')

CREATE TABLE Administrador
(
	id				INT				IDENTITY,
	cpf				VARCHAR(11)		NOT NULL,
	email			VARCHAR(100)	NOT NULL,
	nome			VARCHAR(100)	NOT NULL,
	sobrenome		VARCHAR(100)	NOT NULL,
	senha			VARCHAR(100)	NOT NULL,
	uf				CHAR(2)			NOT NULL,
	data_nasc		DATE(8)			NOT NULL,
	cep				CHAR(7)			NOT NULL,
	data_cadastro	DATE(8)			NOT NULL,
	telefone		VARCHAR(20)		NOT NULL,
	statusAdmin		VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id)
)
INSERT Administrador (cpf, email, nome, sobrenome, senha, uf, data_nasc, cep, data_cadastro, telefone, statusAdmin) 
		VALUES ('')

CREATE TABLE Contato_Suporte
(
	id				INT				IDENTITY,
	assunto			VARCHAR(50)		NOT NULL,
	mensagem		VARCHAR(200)	NOT NULL,
	data_contato	DATE(8)			NOT NULL,
	statusContato	VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id)
)
INSERT Contato_Suporte (assunto, mensagem, data_contato, statusContato)
		VALUES('')

CREATE TABLE Aprovacao_ONG
(
	id				INT				IDENTITY,
	data_aprovacao	DATE(8)			NOT NULL,
	statusAprovacao	VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id)
)
INSERT Aprovacao_ONG (data_aprovacao, statusAprovacao)
		VALUES('')

CREATE TABLE Reprovacao_ONG
(
	id				 INT				IDENTITY,
	data_reprovacao	 DATE(8)			NOT NULL,
	statusReprovacao VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id)
)
INSERT Reprovacao_ONG (data_reprovacao, statusReprovacao)
		VALUES('')

CREATE TABLE Avaliacao
(
	id				INT				IDENTITY,
	comentario		VARCHAR(100)	NOT NULL,
	nota			INT(10)			NOT NULL,
	statusAvaliacao VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id)
)
INSERT Avaliacao (comentario, nota, statusAvaliacao)
		VALUES('')

CREATE TABLE Configuracoes_Gerais
(
	id						INT				IDENTITY,
	politicas_privacidade	VARCHAR(200)	NOT NULL,
	termos_uso				VARCHAR(200)	NOT NULL,
	outras_configuracoes	VARCHAR(200)	NOT NULL,
	statusConfiguracoes		VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id)
)
INSERT Configuracoes_Gerais (politicas_privacidade, termos_uso, outras_configuracoes, statusConfiguracoes)
		VALUES('')


--Protótipo SQL Charity Closet by ZsTech^
--https://github.com/WellingtonZs

--__________       ___________           .__       /\  
--\____    /  _____\__    ___/___   ____ |  |__   /  \ 
--  /     /  /  ___/ |    |_/ __ \_/ ___\|  |  \  \/\/ 
-- /     /_  \___ \  |    |\  ___/\  \___|   Y  \      
--/_______ \/____  > |____| \___  >\___  >___|  /      
--        \/     \/             \/     \/     \/       