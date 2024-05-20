-- tabela de Clientes
CREATE TABLE Clientes (
    cpf VARCHAR(14) PRIMARY KEY,
    cliente VARCHAR(100) NOT NULL,
    nascimento DATE NOT NULL
);

-- tabela de Veículos
CREATE TABLE Veiculos (
    placa VARCHAR(10) PRIMARY KEY,
    veiculo VARCHAR(50) NOT NULL,
    cor VARCHAR(20) NOT NULL
);

-- tabela de Locações
CREATE TABLE Locacoes (
    cod_locacao INT PRIMARY KEY,
    placa VARCHAR(10),
    diaria DECIMAL(10, 2) NOT NULL,
    dias INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    cpf VARCHAR(14),
    FOREIGN KEY (placa) REFERENCES Veiculos(placa),
    FOREIGN KEY (cpf) REFERENCES Clientes(cpf)
);

-- inserir dados clientes
INSERT INTO Clientes (cpf, cliente, nascimento) VALUES
('123.456.789-01', 'Ariano Suassuna', '1022-05-21'),
('543.765.987-23', 'Grace Hopper', '2002-04-29'),
('987.654.231-90', 'Richard Feynman', '2001-10-12'),
('432.765.678-67', 'Edgar Poe', '1998-12-14'),
('927.384.284-44', 'Gordon Freeman', '1984-11-26');

-- inserir dados veiculos
INSERT INTO Veiculos (placa, veiculo, cor) VALUES
('WER-3456', 'Fusca', 'Preto'),
('FDS-8384', 'Variante', 'Rosa'),
('CVB-9933', 'Comodoro', 'Preto'),
('FGH-2256', 'Deloriam', 'Azul'),
('DDI-3948', 'Brasilia', 'Amarela');

-- inserir dados Locações
INSERT INTO Locacoes (cod_locacao, placa, diaria, dias, total, cpf) VALUES
(101, 'WER-3456', 30.00, 3, 90.00, '123.456.789-01'),
(102, 'FDS-8384', 60.00, 1, 60.00, '543.765.987-23'),
(103, 'CVB-9933', 20.00, 3, 60.00, '987.654.231-90'),
(104, 'FGH-2256', 80.00, 1, 80.00, '432.765.678-67'),
(105, 'DDI-3948', 45.00, 3, 135.00, '927.384.284-44');

CREATE VIEW View_Locacoes_Completas AS
SELECT 
    l.cod_locacao AS "Código de Locação",
    l.placa AS "Placa do Veículo",
    v.veiculo AS "Veículo",
    v.cor AS "Cor",
    l.diaria AS "Diária",
    l.dias AS "Dias",
    l.total AS "Total",
    c.cpf AS "CPF do Cliente",
    c.cliente AS "Cliente",
    c.nascimento AS "Data de Nascimento"
FROM 
    Locacoes l
JOIN 
    Veiculos v ON l.placa = v.placa
JOIN 
    Clientes c ON l.cpf = c.cpf;


