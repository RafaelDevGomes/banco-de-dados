create table Paciente (
Paciente_ID int primary key IDENTITY(1,1),
Nome varchar (30),
CPF varchar (11),
DataNasc date,
Email varchar (100)
)

select * from Paciente

INSERT INTO Paciente (Nome, CPF, DataNasc, Email)
VALUES ('João Silva', '12345678901', '2005-08-15', 'joao@email.com');

INSERT INTO Paciente (Paciente_ID, Nome, CPF, DataNasc, Email)
VALUES ('Rafael Gomes', '12345678902', '2007-04-16', 'rafael@email.com');

INSERT INTO Paciente (Paciente_ID, Nome, CPF, DataNasc, Email)
VALUES ('João Silv', '12345678201', '2005-08-15', 'silva@email.com');

create table Medico (
Medico_ID int IDENTITY(1,1) primary key, 
Nome varchar(100) not null,
CRM varchar(11) not null unique,
Especialidade varchar(50) default 'clínica geral',
)

select * from Medico

INSERT INTO Medico (Nome, CRM, Especialidade)
VALUES ('Rafael Gomes', '12345678910','Pediatra')

INSERT INTO Medico (Nome, CRM, Especialidade)
VALUES ('Enzo ET', '12345678911','')

CREATE TABLE Consulta(
Consulta_id int IDENTITY(1,1) primary key,
DataHora DATETIME2 not null,
ValorConsulta decimal(10,2) not null CHECK (ValorConsulta > 0),
StatusConsulta varchar(15) CHECK (StatusConsulta IN ('agendada', 'realizada', 'cancelada'))
DEFAULT 'agendada',
Paciente_ID int foreign key references Paciente(Paciente_ID),
Medico_ID int foreign key references Medico(Medico_ID)
)

SELECT * FROM Consulta

insert into Consulta(DataHora, ValorConsulta, StatusConsulta, Paciente_ID,Medico_ID)
VALUES ('2026-09-22', 120, 'agendada', 2, 2)

insert into Consulta(DataHora, ValorConsulta, StatusConsulta, Paciente_ID,Medico_ID)
VALUES ('2026-09-23', 120, default, 3, 1)

create table Procedimento(
Procedimento_ID int IDENTITY(1,1) primary key,
Descricao varchar(150) not null unique,
ValorBase DECIMAL(10,2) not null CHECK (ValorBase > 0),
)

select * from Procedimento

insert into Procedimento (Descricao, ValorBase)
values ('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 150)

insert into Procedimento (Descricao, ValorBase)
values ('Lorem ipsum amet, consectetur adipiscing.', 167)

create table Consulta_Procedimento (
Consulta_ID int foreign key REFERENCES Consulta(Consulta_ID),
Procedimento_ID int foreign key REFERENCES Procedimento(Procedimento_ID),
Quantidade int not null default 100 CHECK (Quantidade > 0),
ValorPraticado decimal(10,2) not null CHECK(ValorPraticado >= 0)
)

SELECT * FROM Consulta_Procedimento 

INSERT INTO Consulta_Procedimento (Consulta_ID,Procedimento_ID,Quantidade, ValorPraticado)
values ('1','1','212', '53')

create table Exame (
Exame_ID int IDENTITY(1,1) primary key,
NomeExame varchar(100) not null unique,
IntrucoesPreparo varchar(max)
)

select * from Exame

insert into Exame (NomeExame,IntrucoesPreparo)
VALUES('Reconstrução capilar', 'lorem ipsum...')

insert into Exame (NomeExame,IntrucoesPreparo)
VALUES('Reconstrução celular', 'lorem ipsum...')

CREATE TABLE Paciente_Exame (
Paciente_ID int foreign key references Paciente(Paciente_ID),
Exame_ID int foreign key references Exame(Exame_ID),
DataRealizacao datetime2 primary key default(getdate()),
ResultadoTextual varchar(max)
)

select * from Paciente_Exame

INSERT INTO Paciente_Exame (Paciente_ID, Exame_ID, ResultadoTextual)
VALUES (2, 1, 'Concluído');

INSERT INTO Paciente_Exame (Paciente_ID, Exame_ID, ResultadoTextual)
VALUES (1, 3, 'Concluído');

INSERT INTO Paciente_Exame (Paciente_ID, Exame_ID, ResultadoTextual)
VALUES (1, 2, 'Concluído');
