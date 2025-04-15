--criando o banco de dados
CREATE DATABASE anafit;

--criando a primeira tabela 
--o programa aceita tanto quando float e decimal. a diferença deles é que decimal pode limitar o numero de casas de numeros
CREATE TABLE cliente(
    cpf bigint PRIMARY KEY,
    primeironome varchar(50) not null,
    sobrenome varchar(50) not null,
    datanascimento date,
    peso DECIMAL(5,2) not null,
    altura DECIMAL(4,2),
    telefone varchar(15) not null,
    email varchar(100) UNIQUE,
    rua varchar(100) not null,
    numero int(6) not null,
    complemento varchar(100),
    cep varchar(8) not null
);
CREATE TABLE treino(
    diadasemana date not null,
    horario time not null,
    cpf int (11) not null,
    tipo varchar(50) not null
);
--fim criar tabela----------------------------------------------------------------------------------------------------------------------------------------------------------
--inserir dados--------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO cliente (cpf, primeironome, sobrenome, datanascimento, peso, altura, telefone, email, rua, numero, complemento, cep)
VALUES
(12345678911, 'João', 'Silva', '1990-05-15', 72.30, 1.80, '+5511998765432', 'joao.silva@email.com', 'Rua das Flores', 120, 'Apt 301', '01234000'),
(12345678912, 'Maria', 'Oliveira', '1985-10-22', 58.00, 1.65, '+5511987654321', 'maria.oliveira@email.com', 'Avenida Paulista', 1000, 'Bloco B', '01310000'),
(12345678913, 'Carlos', 'Pereira', '1995-07-30', 85.50, 1.90, '+5511987432123', 'carlos.pereira@email.com', 'Rua dos Três Corações', 350, "", '01453000'),
(12345678914, 'Beatriz', 'Santos', '2000-02-10', 50.70, 1.70, '+5511976543210', 'beatriz.santos@email.com', 'Rua da Paz', 555, 'Sala 502', '02540000'),
(12345678915, 'Lucas', 'Costa', '1992-11-05', 77.40, 1.78, '+5511998764321', 'lucas.costa@email.com', 'Praça da Liberdade', 300, "", '03120000');


INSERT INTO treino (diadasemana, horario, cpf, tipo)
VALUES 
('2025-03-12', '09:00:00', 12345678900, 'Corrida'),
('2025-03-13', '14:30:00', 98765432100, 'Yoga'),
('2025-03-14', '18:00:00', 45678912300, 'Pilates')
('2025-03-15', '07:30:00', 32165498700, 'Natação');

--fim do inserir dados--------------------------------------------------------------------------------------------------------------------------------------------------------
--inner join (select com chave estrangeira)--------------------------------------------------------------------------------------------------------------------------------------------------------
select
    c.cpf,
    c.primeironome,
    c.sobrenome,
    p.valor,
    p.data_pagamento
from
    cliente c
inner join
    pagamento p on c.cpf = p.cpf
where c.cpf = 12345678911;
--fim inner join (select com chave estrangeira)--------------------------------------------------------------------------------------------------------------------------------------------------------
--delete from-----------------------------------------------------------------------------------------------------------------------------------------------------------------
delete from treino where tipo = 'corrida';
--atualizar-----------------------------------------------------------------------------------------------------------------------------------------------------------------
update  treino
 set diadasemana = "2025-03-14"
 where tipo = "corrida" and diadasemana = "2025-03-12";

 update cliente
 set peso = "66" , datanascimento = "1980-07-18"
 where cpf = 12345678912;

 update  treino
 set horario = "15:00:00"
 where horario in ("08:00:00", "18:00:00")

 update  treino
 set horario = "15:00:00"
 where horario in ("08:00:00", "18:00:00")

--fim atualizar-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--read-----------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from treino; 
--* serve para selecionar todos os dados contidos nessa tabela 

select tipo from treino;

select diadasemana, horario from treino;
--fim read-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Selecionando valores entre dois dados -----------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from cliente
where datanasc between "1992-01-01" and "2000-12-31";

select * from cliente
where peso between 66 and 100;

select * from cliente
where peso = 66 or peso = 100;


-- fim Selecionando valores entre dois dados -----------------------------------------------------------------------------------------------------------------------------------------------------------------
--somar seleção -------------------------------------------------------------------------------------------------------------------------------------------------------------
select sum(peso) as soma_peso from cliente;
--fim somar seleção -------------------------------------------------------------------------------------------------------------------------------------------------------------
--Contar quantos registros tem na tabela -------------------------------------------------------------------------------------------------------------------------------------------------------------
select count(*) as total_registro from cliente;
--fim Contar quantos registros tem na tabela -------------------------------------------------------------------------------------------------------------------------------------------------------------
--selecionar alturas maior que e menor que -------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from cliente
where altura > 1.78;

select * from cliente
where altura < 1.70;

select * from cliente
where altura > 1.78 or altura < 1.70;

--fim somar seleção -------------------------------------------------------------------------------------------------------------------------------------------------------------
--selecionando um dado na tabela que contenha a letra "a"-------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM cliente
WHERE primeironome LIKE "%a%";
--selecionando um dado exato na tabela-------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM cliente
WHERE primeironome LIKE '%Lucas Costa%';
--selecionando duas colunas na tabela que contenha a letra "a" e "s"-------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM cliente
WHERE primeironome LIKE '%a%' and sobrenome LIKE '%s%';
--selecionando duas colunas na tabela com dado exato-------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM cliente
WHERE primeironome LIKE '%Carlos%' and sobrenome LIKE '%Pereira%';
--selecionando um dado que contenha um valor com casa decimal-------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM pagamento
WHERE CAST(valor AS CHAR) LIKE '%150.00%';
--selecionando um dado que contenha um valor com casa decimal-------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM pagamento
WHERE CAST(valor AS CHAR) LIKE '%00';
--criando uma nova tabela-------------------------------------------------------------------------------------------------------------------------------------------------------------
create table pagamento(
    id_pagamento int auto_increment primary key,
    valor decimal (5,2) not null,
    data_pagamento date not null,
    cpf bigint,
    foreign key (cpf) references cliente(cpf)
);
--fim criando uma nova tabela -------------------------------------------------------------------------------------------------------------------------------------------------------------
--inserindo registros para pagamento-------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into pagamento(valor, data_pagamento,cpf)
VALUES
(150.00,"2025-03-01",12345678911),
(200.00,"2025-03-05",12345678912),
(300.00,"2025-03-10",12345678913),
(250.00,"2025-03-02",12345678911),
(100.00,"2025-03-03",12345678915);

 -- fim inserindo registros para pagamento-------------------------------------------------------------------------------------------------------------------------------------------------------------
 
--deletar tabelas-------------------------------------------------------------------------------------------------------------------------------------------------------------
 DROP TABLE treino;

 DROP TABLE cliente;

--deletar o banco de dados

drop database anafit;