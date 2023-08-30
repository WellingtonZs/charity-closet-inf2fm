IF NOT EXISTS(SELECT * FROM sysobjects WHERE name='teste' and xtype='U')
CREATE TABLE teste
(
	id				BIGINT			IDENTITY(1,1) PRIMARY KEY,
	teste			VARCHAR(100)	NOT NULL,
);