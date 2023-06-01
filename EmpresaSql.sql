#DROP DATABASE EMPRESA;
#Criação do Esquema
CREATE DATABASE EMPRESA;
Use EMPRESA;
#Criação da tabela FUNCIONARIO
CREATE TABLE EMPRESA.FUNCIONARIO (
	Pnome VARCHAR(15) NOT NULL,
    Minicial CHAR,
    Unome VARCHAR(15) NOT NULL,
    Cpf CHAR(11),
    Datanasc DATE,
    Endereco VARCHAR(255),
    Sexo CHAR,
    Salario DECIMAL(10,2),
    Cpf_supervisor CHAR(11),
    Dnr INT,
    PRIMARY KEY (Cpf),
    FOREIGN KEY (Cpf_supervisor) REFERENCES FUNCIONARIO(Cpf)
);

#Tablea de DEPARTAMENTO
CREATE TABLE EMPRESA.DEPARTAMENTO (
	Dnome VARCHAR(15) NOT NULL,
    Dnumero INT,
    Cpf_gerente CHAR(11),
    Data_inicio_gerente DATE,
    PRIMARY KEY (Dnumero),
    UNIQUE (Dnome),
    FOREIGN KEY (Cpf_gerente) REFERENCES FUNCIONARIO(CPF)
);

#Adiconando restição referencial em FUNCIONARO de DEPARTAMENTO
#Criando uma ALTERAÇÃO de Tabela
ALTER TABLE EMPRESA.FUNCIONARIO
ADD CONSTRAINT Dnr
FOREIGN KEY (Dnr) REFERENCES DEPARTAMENTO (Dnumero);

#Criação da tabela de LOCALIZACAO_DEP
CREATE TABLE EMPRESA.LOCALIZACAO_DEP (
	Dnumero INT NOT NULL,
	Dlocal VARCHAR (15) NOT NULL,
    PRIMARY KEY (Dnumero, Dlocal),
    FOREIGN KEY (Dnumero) REFERENCES DEPARTAMENTO (Dnumero)
);

#Criacao da tabela PROJETO
CREATE TABLE EMPRESA.PROJETO(
	Projnome VARCHAR (15) NOT NULL,
	Projnumero INT NOT NULL,
    Projlocal VARCHAR(15),
    Dnum INT,
    PRIMARY KEY (Projnumero),
    UNIQUE (Projnome),
    FOREIGN KEY (Dnum) REFERENCES DEPARTAMENTO (Dnumero)
);

#Criação da tabela TRABALHA_EM
CREATE TABLE EMPRESA.TRABALHA_EM(
	Fcpf CHAR(11) NOT NULL,
    Pnr INT NOT NULL,
    Horas DECIMAL (3,1) NOT NULL,
    PRIMARy KEY (Fcpf, Pnr),
    FOREIGN KEY (Fcpf) REFERENCES FUNCIONARIO (Cpf),
    FOREIGN KEY (Pnr) REFERENCES PROJETO(Projnumero)
);

#Selecionando o esquema para criação da tabela
USE EMPRESA;
#Criação da tabela DEPENDENTE sem seleção do esquema
CREATE TABLE DEPENDENTE(
	Fcpf CHAR(11) NOT NULL,
    Nome_dependente VARCHAR(15) NOT NULL,
    Sexo CHAR,
    Datanasc DATE,
    Parentesco VARCHAR(8),
    PRIMARY KEY (Fcpf, Nome_dependente),
    FOREIGN KEY (Fcpf) REFERENCES FUNCIONARIO(Cpf)
);

#Inserindo valores no Departamento
INSERT INTO DEPARTAMENTO (Dnome, Dnumero) VALUES('Pesquisa', 5);
INSERT INTO DEPARTAMENTO (Dnome, Dnumero) VALUES('Administração', 4);
INSERT INTO DEPARTAMENTO (Dnome, Dnumero) VALUES('Matriz', 1);
SELECT * FROM DEPARTAMENTO;
#Inserindo funcionarios com cargo de gerencia DATE AAAA-MM-DD
INSERT INTO FUNCIONARIO VALUES ( 'Jorge', 'E', 'Brito', '88866555576', '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000, NULL , 1 );
INSERT INTO FUNCIONARIO VALUES ( 'Jennifer', 'S', 'Souza', '98765432168', '1941-06-20', 'Av Arthur de Lima, 54, Santo André, SP', 'F', 43000, '88866555576' , 4 );
INSERT INTO FUNCIONARIO VALUES ( 'Fernando', 'T', 'Wong', '33344555587', '1955-12-08', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, '88866555576' , 5 );
INSERT INTO FUNCIONARIO VALUES ( 'João', 'B', 'Silva', '12345678966', '1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, '33344555587' , 5 );
INSERT INTO FUNCIONARIO VALUES ( 'Alice', 'J', 'Zelaya', '99988777767', '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, '98765432168' , 4 );
INSERT INTO FUNCIONARIO VALUES ( 'Ronaldo', 'K', 'Lima', '66688444476', '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, '33344555587' , 5 );
INSERT INTO FUNCIONARIO VALUES ( 'Joice', 'A', 'Leite', '45345345376', '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000, '33344555587' , 5 );
INSERT INTO FUNCIONARIO VALUES ( 'André', 'E', 'Brito', '98798798733', '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000, '98765432168' , 4 );

#Corrigindo erro de inserção
UPDATE FUNCIONARIO
SET Endereco = 'Rua Reboucas, 65, Piracicaba, SP'
WHERE Cpf = '66688444476';
#Recupera todas as informações de funcionários
SELECT * FROM FUNCIONARIO;

#Finzalindo o preenchimento da tabela DEPTARTAMENTO
UPDATE DEPARTAMENTO
SET Cpf_gerente = '33344555587', Data_inicio_gerente = '1988-05-22'
WHERE Dnumero = 5;
UPDATE DEPARTAMENTO
SET Cpf_gerente = '98765432168', Data_inicio_gerente = '1995-01-01'
WHERE Dnumero = 4;
UPDATE DEPARTAMENTO
SET Cpf_gerente = '88866555576', Data_inicio_gerente = '1981-06-19'
WHERE Dnumero = 1;
#Recuperar todas as informações de departamento
SELECT * FROM DEPARTAMENTO;

#Prrencher a tabela LOCALIZACAO_DEP
INSERT INTO LOCALIZACAO_DEP VALUES (1, 'São Paulo');
INSERT INTO LOCALIZACAO_DEP VALUES (4, 'Mauá');
INSERT INTO LOCALIZACAO_DEP VALUES (5, 'Santo André');
INSERT INTO LOCALIZACAO_DEP VALUES (5, 'Itu');
INSERT INTO LOCALIZACAO_DEP VALUES (5, 'São Paulo');
#Recuperando informações de LOCALIZACAO_DEP
SELECT * FROM LOCALIZACAO_DEP;

#Preenchendo a table PROJETO
INSERT INTO PROJETO VALUES ('ProdutoX', 1, 'Santo André', 5);
INSERT INTO PROJETO VALUES ('ProdutoY', 2, 'Itu', 5);
INSERT INTO PROJETO VALUES ('ProdutoZ', 3, 'São Paulo', 5);
INSERT INTO PROJETO VALUES ('Informatização', 10, 'Mauá', 4);
INSERT INTO PROJETO VALUES ('Reorganização', 20, 'São Paulo', 1);
INSERT INTO PROJETO VALUES ('Novosbenefícios', 30, 'Mauá', 4);
#Recuperando informações de PROJETO
SELECT * FROM PROJETO;

#Preenchento TRABALHA_EM
INSERT INTO TRABALHA_EM VALUES ('12345678966',1,32.5);
INSERT INTO TRABALHA_EM VALUES ('12345678966',2,7.5);
INSERT INTO TRABALHA_EM VALUES ('66688444476',3,40);
INSERT INTO TRABALHA_EM VALUES ('45345345376',1,20);
INSERT INTO TRABALHA_EM VALUES ('45345345376',2,20);
INSERT INTO TRABALHA_EM VALUES ('33344555587',2,10);
INSERT INTO TRABALHA_EM VALUES ('33344555587',3,10);
INSERT INTO TRABALHA_EM VALUES ('33344555587',10,10);
INSERT INTO TRABALHA_EM VALUES ('33344555587',20,10);
INSERT INTO TRABALHA_EM VALUES ('99988777767',10,10);
INSERT INTO TRABALHA_EM VALUES ('99988777767',30,30);
INSERT INTO TRABALHA_EM VALUES ('98798798733',10,35);
INSERT INTO TRABALHA_EM VALUES ('98798798733',30,5);
INSERT INTO TRABALHA_EM VALUES ('98765432168',30,20);
INSERT INTO TRABALHA_EM VALUES ('98765432168',20,15);

#recupernado informações da tabela TRABALHA_EM
SELECT * FROM TRABALHA_EM ORDER BY Fcpf;
#Removendo registros que estava incorretos
DELETE FROM TRABALHA_EM WHERE Fcpf = '99988777767';
#Alternado a tabela TRABALHA_EM 
ALTER TABLE TRABALHA_EM
MODIFY COLUMN Horas Decimal(3,1);
#Agora conseguimos inseri null no horário
INSERT INTO TRABALHA_EM VALUES ('88866555576',20,NULL);

#Preenchendo a tabela de DEPENDENTES
INSERT INTO DEPENDENTE VALUES ('33344555587', 'Alicia', 'F', '1986-04-05', 'Filha');
INSERT INTO DEPENDENTE VALUES ('33344555587', 'Tiago', 'M', '1983-10-25', 'Filh0');
INSERT INTO DEPENDENTE VALUES ('33344555587', 'Janaina', 'F', '1958-05-03', 'Eposa');
INSERT INTO DEPENDENTE VALUES ('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido');
INSERT INTO DEPENDENTE VALUES ('12345678966', 'Michael', 'M', '1988-01-04', 'Filho');
INSERT INTO DEPENDENTE VALUES ('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha');
INSERT INTO DEPENDENTE VALUES ('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');


#Recuperar a data de nascimento e o endereço do(s) funcionário(s) 
#cujo nome seja ‘João B. Silva’.
SELECT Datanasc , Endereco
FROM FUNCIONARIO 
WHERE Pnome='João' AND Minicial='B' AND Unome='Silva';
#Alterando o nome dos atributos na recuperação
SELECT Datanasc AS 'Data', Endereco AS 'Endereço'
FROM FUNCIONARIO 
WHERE Pnome='João' AND Minicial='B' AND Unome='Silva';

#Recuperar o nome e endereço de todos os funcionários 
#que trabalham para o departamento ‘Pesquisa’.
SELECT Pnome, Unome, Endereco 
FROM FUNCIONARIO, DEPARTAMENTO 
WHERE Dnome='Pesquisa' AND Dnumero=Dnr;

#Para cada projeto localizado em ‘Mauá’, liste o número do projeto, 
#o número do departamento que o controla e o sobrenome, endereço 
#e data de nascimento do gerente do departamento
SELECT Projnumero, Dnum, Unome, Endereco, Datanasc 
FROM PROJETO, DEPARTAMENTO, FUNCIONARIO 
WHERE Dnum=Dnumero AND Cpf_gerente=Cpf AND Projlocal='Mauá';

#Em SQL, o mesmo nome pode ser usado para dois (ou mais) atributos, 
#desde que estes estejam em relações diferentes. 
SELECT F.Pnome, F.Unome, F.Endereco 
FROM FUNCIONARIO F, DEPARTAMENTO D 
WHERE D.DNome='Pesquisa' AND D.Dnumero=F.Dnr;

#Selecionar todos os Cpfs de FUNCIONARIO e 
#todas as combinações de Cpf de FUNCIONARIO
# e Dnome de DEPARTAMENTO no banco de dados
SELECT Cpf FROM FUNCIONARIO;
#produto cartesiano das tabelas
SELECT Cpf, Dnome FROM FUNCIONARIO, DEPARTAMENTO;

SELECT DISTINCT Salario FROM FUNCIONARIO WHERE Salario > 30000  ORDER BY Salario DESC;

SELECT * FROM FUNCIONARIO WHERE Pnome = 'joão';
SELECT * FROM FUNCIONARIO WHERE Sexo = 'm' AND Salario >= 30000;

select * from FUNCIONARIO WHERE Endereco LIKE '%São Paulo%' OR Endereco LIKE '%Curitiba%';

select * from FUNCIONARIO WHERE Endereco NOT LIKE '%São Paulo%' ;
SELECT * FROM FUNCIONARIO ORDER BY Salario DESC;

SELECT * FROM FUNCIONARIO WHERE Cpf_supervisor IS NULL;

SELECT * FROM FUNCIONARIO WHERE Cpf_supervisor IS NOT NULL ORDER BY Pnome ASC, Unome ASC;

SELECT * 
FROM FUNCIONARIO 
ORDER BY Salario DESC limit 3;

SELECT MIN(Salario)
FROM FUNCIONARIO;

SELECT * 
FROM FUNCIONARIO 
WHERE Salario = (Select min(Salario) from FUNCIONARIO);

SELECT * 
FROM FUNCIONARIO 
WHERE Salario = (Select MAX(Salario) from FUNCIONARIO);

SELECT COUNT(cpf) FROM FUNCIONARIO;

SELECT COUNT(cpf) FROM FUNCIONARIO WHERE ENDERECO LIKE '%São Paulo%';

SELECT COUNT(sexo) FROM FUNCIONARIO;

SELECT COUNT(sexo) FROM FUNCIONARIO WHERE SEXO = 'm';

SELECT AVG(SALARIO) FROM FUNCIONARIO;

SELECT AVG(SALARIO) - MIN(Salario) FROM FUNCIONARIO;

SELECT * FROM FUNCIONARIO WHERE Salario =(SELECT AVG(SALARIO) - MIN(Salario) FROM FUNCIONARIO);

SELECT SUM(SALARIO) FROM FUNCIONARIO;

SELECT * FROM FUNCIONARIO WHERE Datanasc LIKE '%__72______%';

SELECT * 
FROM FUNCIONARIO
WHERE SALARIO IN (25000, 30000);

Select * FROM FUNCIONARIO WHERE CPF IN (SELECT DISTINCT Fcpf FROM TRABALHA_EM
WHERE (Pnr,Horas) IN (SELECT Pnr, Horas FROM TRABALHA_EM
WHERE Fcpf = '33344555587'));

SELECT * FROM FUNCIONARIO
WHERE SALARIO BETWEEN 30000 AND 40000 AND Dnr = '5'; 

SELECT CONCAT(Pnome,' ',Unome) AS Nome
from FUNCIONARIO;

SELECT Pnome AS Nome,Unome AS Sobrenome
from FUNCIONARIO;

SELECT F.Pnome,F.Unome,D.Dnumero, D.Dnome 
from FUNCIONARIO AS F,DEPARTAMENTO AS D
WHERE D.Dnumero = F.Dnr AND D.Dnome = 'Pesquisa'; 

SELECT CONCAT(Pnome , " " , Minicial , "" , Unome ) as 'Nome completo',Salario as 'Salario atual',Salario*1.15 as 'salario aumentado' from FUNCIONARIO WHERE CPF IN (SELECT Cpf
FROM FUNCIONARIO 
WHERE Dnr = (SELECT Dnumero from DEPARTAMENTO WHERE Dnome = 'Administração'))
order by Salario;

SELECT  CONCAT(Pnome , " " , Minicial , "" , Unome ) as 'Nome completo',F.Endereco AS 'Endereço'
FROM FUNCIONARIO AS F 
INNER JOIN DEPARTAMENTO AS D
ON F.Dnr = D.Dnumero
WHERE D.Dnome = 'Pesquisa';

 SELECT * 
 FROM TRABALHA_EM AS T
 INNER JOIN FUNCIONARIO AS F
 ON T.Fcpf = F.Cpf
 INNER JOIN PROJETO AS P
 ON T.Pnr = P.Projnumero
 Where P.Projnome = 'ProdutoX';

SELECT * 
FROM FUNCIONARIO AS F, PROJETO AS P, TRABALHA_EM AS T
WHERE F.Cpf = T.Fcpf && T.Pnr = P.Projnumero && P.Projnome = 'ProdutoX'; 

SELECT P.Projnumero, D.Dnumero , F.Unome, F.Datanasc 
FROM DEPARTAMENTO AS D
INNER JOIN PROJETO AS P 
ON P.Dnum = D.Dnumero 
INNER JOIN FUNCIONARIO AS F
ON F.Cpf = D.Cpf_Gerente
WHERE P.projlocal = 'Mauá';  

SELECT F.Unome , FS.Unome as 'Supervisor'
FROM FUNCIONARIO AS F
LEFT JOIN FUNCIONARIO AS FS
ON F.cPF_SUPERVISOR = FS.Cpf; 

SELECT *
from FUNCIONARIO AS f
CROSS JOIN DEPENDENTE AS D
ORDER BY F.Pnome;

SELECT F.Pnome, D.Nome_dependente 
from FUNCIONARIO AS f
LEFT JOIN DEPENDENTE AS D
ON f.CPF = D.Fcpf
ORDER BY F.Pnome;

SELECT COUNT(F.CPF) 
FROM FUNCIONARIO AS F
GROUP BY Endereco like '%São Paulo, SP%';






#Uso da palavra reservada Distinct
SELECT ALL Salario FROM FUNCIONARIO;
SELECT DISTINCT Salario FROM FUNCIONARIO;

#Operação de combinação LIKE 
SELECT Pnome, Unome
FROM FUNCIONARIO
WHERE Endereco LIKE '%São Paulo, SP%';

#Encontrar todos os funcionários que nasceram durante a década de 1950.
SELECT Pnome, Unome 
FROM FUNCIONARIO 
WHERE Datanasc LIKE '__5_______';

#Mostrar os salários resultantes se cada funcionário que trabalha 
#no projeto ‘ProdutoX’ receber um aumento de 10 por cento.
SELECT F.Pnome, F.Unome, 1.1 * F.Salario AS Aumento_salario 
FROM FUNCIONARIO AS F, TRABALHA_EM AS T, PROJETO AS P 
WHERE F.Cpf=T.Fcpf AND T.Pnr=P.Projnumero AND P.Projnome='ProdutoX';

#Recuperar todos os funcionários no departamento 5 
#cujo salário esteja entre R$ 30.000 e R$ 40.000
SELECT * 
FROM FUNCIONARIO 
WHERE (Salario BETWEEN 30000 AND 40000) AND Dnr = 5;

#Recuperar uma lista dos funcionários e dos projetos 
#em que estão trabalhando, ordenada por departamento e,
# dentro de cada departamento, ordenada alfabeticamente 
#pelo sobrenome, depois pelo nome.
SELECT D.Dnome, F.Unome, F.Pnome, P.Projnome 
FROM DEPARTAMENTO D, FUNCIONARIO F, TRABALHA_EM T, PROJETO P 
WHERE D.Dnumero= F.Dnr AND F.Cpf= T.Fcpf AND T.Pnr= P.Projnumero 
ORDER BY D.Dnome, F.Unome, F.Pnome;

#ordem alfabética decrescente de Dnome e ordem crescente de Unome, Pnome, 
#a cláusula ORDER BY da consulta anterior pode ser escrita como:
SELECT D.Dnome, F.Unome, F.Pnome
FROM DEPARTAMENTO D, FUNCIONARIO F, TRABALHA_EM T, PROJETO P 
WHERE D.Dnumero= F.Dnr AND F.Cpf= T.Fcpf AND T.Pnr= P.Projnumero 
ORDER BY D.Dnome DESC, F.Unome ASC, F.Pnome ASC;