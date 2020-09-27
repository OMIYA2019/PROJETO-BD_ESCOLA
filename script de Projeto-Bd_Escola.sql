Create database Projeto_Bd_Escola;

use Projeto_Bd_Escola;

drop database Projeto_Bd_Escola;

create table tb_aluno
(
Id_aluno int primary key ,
nome_aluno varchar(50),
idade_aluno int,
Id_responsavel int,
CONSTRAINT fk_Id_responsavel FOREIGN KEY (Id_responsavel) REFERENCES tb_responsavel(Id_responsavel)
);

insert into tb_aluno(Id_aluno,nome_aluno,idade_aluno, Id_responsavel ) values (1,'Ana Cristiele Barbsa',12,6);
insert into tb_aluno(Id_aluno,nome_aluno,idade_aluno, Id_responsavel ) values (2,'João Januario da Silva',11,3);
insert into tb_aluno(Id_aluno,nome_aluno,idade_aluno, Id_responsavel ) values (3,'William dos Santos',14,5);
insert into tb_aluno(Id_aluno,nome_aluno,idade_aluno, Id_responsavel ) values (4,'Angelina Santos Moneiro',12,4);
insert into tb_aluno(Id_aluno,nome_aluno,idade_aluno, Id_responsavel ) values (5,'Rodolfo Nunes Braga',13,2);
insert into tb_aluno(Id_aluno,nome_aluno,idade_aluno, Id_responsavel ) values (6,'Karine Alves Sales',15,1);

select * from tb_aluno;



create table tb_responsavel
(
Id_responsavel int primary key,
nome_responsavel varchar(50)
);

insert into tb_responsavel(Id_responsavel,nome_responsavel) values (1,'João Sales');
insert into tb_responsavel(Id_responsavel,nome_responsavel) values (2,'Mariana Braga');
insert into tb_responsavel(Id_responsavel,nome_responsavel) values (3,'José Roberto da Sulva');
insert into tb_responsavel(Id_responsavel,nome_responsavel) values (4,'Ana Maria Monteiro');
insert into tb_responsavel(Id_responsavel,nome_responsavel) values (5,'Paulo Roberto dos Santos');
insert into tb_responsavel(Id_responsavel,nome_responsavel) values (6,'Beatriz Barbosa');

select * from tb_responsavel;




DELIMITER @@

Create Procedure ConsultaAluno(in Id_alun int)
BEGIN

select concat('A idade do aluno é ',idade_aluno,' anos') as IdadeAluno
From tb_aluno
where Id_aluno = Id_alun;
END @@

DELIMITER;

drop Procedure ConsultaAluno;

call ConsultaAluno(2);
call ConsultaAluno(5);



DELIMITER $$

Create Procedure ConsultaResponsavel(in v_nome_responsavel varchar(50))

BEGIN
select concat('O responsavel de ',nome_aluno, ' é o Sr(a) ',nome_responsavel) as Responsavel
from tb_aluno

INNER JOIN tb_responsavel
ON tb_aluno.Id_responsavel = tb_responsavel.Id_responsavel
where tb_responsavel.nome_responsavel = v_nome_responsavel;
END $$


drop Procedure ConsultaResponsavel;

CALL ConsultaResponsavel('Beatriz Barbosa');
CALL ConsultaResponsavel('João Sales')


