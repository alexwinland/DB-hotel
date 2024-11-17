CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY,
  nome_cliente VARCHAR(50) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL,
  endereco VARCHAR(100) NOT NULL
);

CREATE TABLE reservas (
  id_reserva INT PRIMARY KEY,
  id_cliente INT NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
CREATE TABLE quartos (
  id_quarto INT PRIMARY KEY,
  descricao VARCHAR(100) NOT NULL,
  capacidade INT NOT NULL,
  diaria DECIMAL(8, 2) NOT NULL
);
CREATE TABLE reservas_quartos (
  id_reserva INT NOT NULL,
  id_quarto INT NOT NULL,
  data_entrada DATE NOT NULL,
  data_saida DATE NOT NULL,
  PRIMARY KEY (id_reserva, id_quarto),
  FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva),
  FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);
INSERT INTO clientes (id_cliente, nome_cliente, telefone, email, endereco)
VALUES (1, 'João Silva', '(11) 5555-5555', 'joao.silva@gmail.com', 'Rua A, 123 - São Paulo'),
       (2, 'Maria Santos', '(21) 5555-5555', 'maria.santos@hotmail.com', 'Rua B, 456 - Rio de Janeiro'),
       (3, 'Pedro Souza', '(31) 5555-5555', 'pedro.souza@yahoo.com.br', 'Rua C, 789 - Belo Horizonte');
INSERT INTO quartos (id_quarto, descricao, capacidade, diaria)
VALUES (1, 'Quarto simples com cama de solteiro', 1, 100.00),
       (2, 'Quarto simples com cama de casal', 2, 150.00),
       (3, 'Quarto de luxo com cama de casal', 2, 250.00);

INSERT INTO reservas (id_reserva, id_cliente, data_inicio, data_fim)
VALUES (1, 1, '2023-04-10', '2023-04-15'),
       (2, 2, '2023-05-01', '2023-05-05'),
       (3, 3, '2023-06-20', '2023-06-25');

INSERT INTO reservas_quartos (id_reserva, id_quarto, data_entrada, data_saida)
VALUES (1, 1, '2023-04-10', '2023-04-15'),
       (2, 2, '2023-05-01', '2023-05-05'),
       (3, 3, '2023-06-20', '2023-06-25'),
       (3, 2, '2023-06-20', '2023-06-25');