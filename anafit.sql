--criando o banco de dados
CREATE DATABASE anafit;

--criando a primeira tabela 
--o programa aceita tanto quando float e decimal. a diferença deles é que decimal pode limitar o numero de casas de numeros
CREATE TABLE cliente(
    cpf bigint PRIMARY KEY,
    primeironome varchar(50) not null,
    sobrenome varchar(50) not null,
    datanascimento date ,
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
insert into cliente (cpf,primeironome,sobrenome,datanascimento,peso,altura, telefone,email,rua,numero,complemento,cep )
VALUES
(12345678900, 'Clark', 'Kent', '1980-06-18', 95.0, 1.88, '5511987654321', 'superman@metropolis.com', 'Rua da Liberdade', '123', 'Apto 301', '0123-4567'),
(98765432100, 'Bruce', 'Wayne', '1975-02-19', 88.0, 1.92, '5521912345678', 'batman@gotham.com', 'Avenida Wayne', '456', 'Mansão Wayne', '0456-7890'),
(45678912300, 'Peter', 'Parker', '1995-08-10', 75.0, 1.75, '5531998765432', 'spiderman@webmail.com', 'Rua do Parque', '789', 'Apto 10', '0234-5678'),
(32165498700, 'Diana', 'Prince', '1984-07-12', 70.0, 1.83, '5541934567890', 'wonderwoman@themyscira.com', 'Avenida das Amazonas', '321', 'Casa 5','0345-6789');


INSERT INTO treino (diadasemana, horario, cpf, tipo)
VALUES 
('2025-03-12', '09:00:00', 12345678900, 'Corrida'),
('2025-03-13', '14:30:00', 98765432100, 'Yoga'),
('2025-03-14', '18:00:00', 45678912300, 'Pilates')
('2025-03-15', '07:30:00', 32165498700, 'Natação');

--fim do inserir dados--------------------------------------------------------------------------------------------------------------------------------------------------------
--delete from-----------------------------------------------------------------------------------------------------------------------------------------------------------------
delete from treino where tipo = 'corrida';
--deletar tabelas-------------------------------------------------------------------------------------------------------------------------------------------------------------
 DROP TABLE treino;

 DROP TABLE cliente;

--deletar o banco de dados

drop database anafit;