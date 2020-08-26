CREATE DATABASE CETRUS;
USE CETRUS;

CREATE TABLE ALUNO(
CODIGO INT auto_increment NOT NULL,
NOME VARCHAR(80) NOT NULL,
CPF VARCHAR(14) NOT NULL,
RG VARCHAR(9) NULL,
SEXO CHAR(1) NULL,
ENDERECO VARCHAR(80) NULL,
NUMERO INT NULL,
TELEFONE VARCHAR(10) NULL,
CELULAR VARCHAR(10) NULL,
EMAIL VARCHAR(30) NULL,
CEP VARCHAR(9) NULL,
BAIRRO VARCHAR(40) NULL,
CIDADE VARCHAR(40) NULL,
PAIS VARCHAR(30) NULL,
OBSERVACAO VARCHAR(255) NULL,

CONSTRAINT PK_ALUNO PRIMARY KEY(CODIGO)
);

CREATE TABLE PROFESSOR(
CODIGO INT auto_increment NOT NULL,
PROFESSOR VARCHAR(30) NULL,

CONSTRAINT PK_PROFESSOR PRIMARY KEY(CODIGO)
);

CREATE TABLE TURMA(
CODIGO INT AUTO_INCREMENT NOT NULL,
DATA DATE,
TURMA VARCHAR(30) NOT NULL,
DURACAO VARCHAR(30) NULL,
CODIGO_PROFESSOR INT NOT NULL,
CODIGO_ALUNO INT NOT NULL,

CONSTRAINT PK_TURMA PRIMARY KEY(CODIGO),
CONSTRAINT FK_ALUNO FOREIGN KEY(CODIGO_ALUNO) REFERENCES ALUNO(CODIGO),
CONSTRAINT FK_PROFESSOR FOREIGN KEY(CODIGO_PROFESSOR) REFERENCES PROFESSOR(CODIGO)
);

CREATE VIEW ALUNOS_CURSADOS
AS
SELECT A.CODIGO,A.NOME,T.TURMA,T.DATA,T.DURACAO FROM ALUNO AS A
INNER JOIN TURMA AS T ON (A.CODIGO=T.CODIGO_ALUNO);

CREATE TABLE HIST_ALT_ALUNO(
CODIGO INT,
DT_ALTERACAO DATE,
ALUNO_ANTIGO VARCHAR(80),
SEXO_ANTIGO CHAR(1),
EMAIL_ANTIGO VARCHAR(255),
OBSERVACAO_ANTIGO VARCHAR(255) 
);