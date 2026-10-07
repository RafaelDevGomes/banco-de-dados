create table Tecnico (
id_tecnico VARCHAR PRIMARY KEY NOT NULL,
nome_tecnico VARCHAR(50) NOT NULL,
licenca_cbf VARCHAR(20)
)

create table Estadio (
id_estadio INT PRIMARY KEY NOT NULL,
nome_estadio VARCHAR(50) NOT NULL UNIQUE,
cidade VARCHAR(50),
capacidade INT CHECK (capacidade >= 1000)
)

create table Jogador (
id_jogador INT PRIMARY KEY NOT NULL,
nome_jogador varchar(50) NOT NULL,
posicao varchar(30) NOT NULL,
salario FLOAT CHECK (salario >= 1500.00),
id_time INT CONSTRAINT fk_jogador_times REFERENCES Times(id_time),
observacoes varchar(100)
)

create table Times (
id_time INT PRIMARY KEY NOT NULL,
nome_time VARCHAR(50) NOT NULL
)

ALTER TABLE Jogador ADD nacionalidade VARCHAR(30)

ALTER TABLE Jogador DROP COLUMN observacoes

select * from Times
select * from Jogador
select * from Tecnico
select * from Estadio

--tecnico
INSERT INTO Tecnico (id_tecnico,nome_tecnico, licenca_cbf)
VALUES ('1','Tite','´PRO')

INSERT INTO Tecnico (id_tecnico,nome_tecnico, licenca_cbf)
VALUES ('2','Abel Ferreira','´PRO')
 
--estadio
INSERT INTO Estadio (id_estadio,cidade,capacidade)
VALUES ('1','Rio de Janeiro','78838')

INSERT INTO Estadio (id_estadio,cidade,capacidade)
VALUES ('2','Allianz Parque','43713')

INSERT INTO Estadio (id_estadio,cidade,capacidade)
VALUES ('3','Estadio das Laranjeiras','8000')

--jogador
INSERT INTO Jogador(id_jogador,nome_jogador, posicao, salario, id_time)
VALUES('101','Giorgian De Arrascaeta','Meia','500000.00','1')

INSERT INTO Jogador(id_jogador,nome_jogador, posicao, salario, id_time)
VALUES('102','Endrick','Meia','1000.00','2','Brasileiro')

INSERT INTO Jogador(id_jogador,nome_jogador, posicao, salario, id_time)
VALUES('103','Neymar Jr','Atacante','8000000.00','99','Brasileiro')

--Análise: pois existem alguns ids de times onde não foram criados ou feitos e algumas chaves conflitam pois foram citadas anteriormente.

--Time 
INSERT INTO Times(id_time,nome_time)
VALUES ('1','Flamengo')

INSERT INTO Times(id_time,nome_time)
VALUES ('2','Vasco')

DELETE FROM Estadio WHERE nome_estadio = 'Estádio das Laranjeiras';

UPDATE Jogador SET salario = 550000.00 WHERE nome_jogador = 'Giorgian De Arrascaeta';


