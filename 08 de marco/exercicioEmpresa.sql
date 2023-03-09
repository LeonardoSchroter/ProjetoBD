create database exercicio_aula;

use exercicio_aula;

create table FUNCIONARIO(
	Pnome varchar(200),
    Minicial varchar(200),
    Unome varchar(200),
    Cpf int  primary key,
    Endereco varchar(200),
    Sexo varchar(200),
    Salario double,
    Cpf_supervisor int,
    Dnumero int,
    
    constraint pk_cpf FOREIGN KEY(Cpf_supervisor) references FUNCIONARIO(cpf) 
);
drop table FUNCIONARIO;

create table PROJETO(
	Projnome varchar(200),
    Projnumero int primary key,
    Projlocal varchar(200),
    Dnum int

);



create table TRABALHA_EM(
	FK_funcionario int,
    FK_projeto int,
    Horas varchar(50)  ,
    constraint pk_funcionario FOREIGN KEY(FK_funcionario) references FUNCIONARIO(cpf) ,
    constraint pk_projeto FOREIGN KEY(FK_projeto) references PROJETO(Projnumero) ,
    PRIMARY KEY(FK_funcionario,FK_projeto)
    
);

select * from funcionario;
select * from projeto;
select * from trabalha_em;


