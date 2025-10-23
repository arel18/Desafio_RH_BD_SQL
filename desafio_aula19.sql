CREATE DATABASE EmpresaRH;

use EmpresaRH;

create table Departamentos (
id_departamento int primary key identity(1,1),
nome_departamento varchar(50) not null

);

INSERT INTO Departamentos (nome_departamento) VALUES

('Recursos Humanos'),
('Financeiro'),
('TI'),
('Inovação'),  -- sem funcionários
('Vendas');

create table Funcionarios (
id_funcionario int primary key identity(1,1),
nome_funcionario varchar(100) not null,
id_departamento int,
foreign key (id_departamento) references Departamentos(id_departamento)

);

INSERT INTO Funcionarios (nome_funcionario, id_departamento) VALUES
('Ana Paula', 1),
('Carlos Mendes', 2),
('Fernanda Lima', 3),
('Raquel Rocha', 1),
('João Silva', 5);




create table Salarios (
id_salario int primary key identity(1,1),
salario decimal (10,2),
id_funcionario int,
foreign key (id_funcionario) references Funcionarios(id_funcionario)

);



insert into Salarios (salario, id_funcionario)

values 

(4.500, 1),
(3.500, 2),
(6.000, 3),
(4.500, 1),
(2.500, 5);

CREATE TABLE Nivel_Salarial (
    id_nivel INT PRIMARY KEY IDENTITY(1,1),
    nivel VARCHAR(20),
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2)
);

INSERT INTO Nivel_Salarial (nivel, salario_min, salario_max)
VALUES
('Junior', 0, 3999.99),
('Pleno', 4000, 5499.99),
('Senior', 5500, 9999.99);



-- Desafio 1 

select d.nome_departamento as Departamentos, 
f.nome_funcionario as Funcionários
from Departamentos as d
left join Funcionarios as f
on d.id_departamento = f.id_departamento;

-- Desafio 2 

SELECT 
    F.nome_funcionario,
    S.salario,
    N.nivel AS nivel_classificado
FROM 
    Funcionarios F
JOIN 
    Salarios as S
    ON F.id_funcionario = S.id_funcionario
JOIN 
    Nivel_Salarial N
    ON S.salario BETWEEN N.salario_min AND N.salario_max
ORDER BY 
    S.salario DESC;

-- Desafio 3
select 
f.nome_funcionario as Funcionários, 
n.nivel as Nível,
d.nome_departamento as Departamento
from Funcionarios as f
join Departamentos as d
on f.id_departamento = d.id_departamento
Join Nivel_Salarial as n 
on n.nivel= 'Pleno'
Where d.nome_departamento  = 'Vendas';



