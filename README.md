# Sistema de Gestão de Reservas de Hotel

Este sistema é um modelo de banco de dados para gerenciar as reservas de quartos de um hotel. Ele permite registrar informações sobre clientes, quartos disponíveis, reservas feitas pelos clientes e os detalhes de quais quartos foram reservados durante um período específico.

## Estrutura do Banco de Dados

O banco de dados é composto por 4 tabelas principais:

### 1. **Tabela de Clientes (`clientes`)**
Armazena as informações dos clientes que fazem as reservas no hotel.

- **id_cliente**: Identificador único do cliente (chave primária).
- **nome_cliente**: Nome completo do cliente.
- **telefone**: Número de telefone de contato do cliente.
- **email**: Endereço de e-mail do cliente.
- **endereco**: Endereço residencial do cliente.

### 2. **Tabela de Reservas (`reservas`)**
Armazena as informações sobre as reservas feitas pelos clientes no hotel, como as datas de início e fim da estadia.

- **id_reserva**: Identificador único da reserva (chave primária).
- **id_cliente**: Relacionamento com o cliente que fez a reserva (chave estrangeira referenciando a tabela `clientes`).
- **data_inicio**: Data de início da reserva.
- **data_fim**: Data de término da reserva.

### 3. **Tabela de Quartos (`quartos`)**
Armazena informações sobre os quartos disponíveis no hotel, como a descrição, capacidade de hóspedes e o preço da diária.

- **id_quarto**: Identificador único do quarto (chave primária).
- **descricao**: Descrição do quarto (ex.: "Quarto simples com cama de casal").
- **capacidade**: Quantidade máxima de pessoas que o quarto pode acomodar.
- **diaria**: Preço da diária do quarto.

### 4. **Tabela de Reservas de Quartos (`reservas_quartos`)**
Tabela intermediária que gerencia o relacionamento entre reservas e quartos. Ela especifica quais quartos foram reservados para uma determinada reserva e o período de entrada e saída dos quartos.

- **id_reserva**: Relacionamento com a reserva (chave estrangeira referenciando a tabela `reservas`).
- **id_quarto**: Relacionamento com o quarto reservado (chave estrangeira referenciando a tabela `quartos`).
- **data_entrada**: Data de entrada no quarto.
- **data_saida**: Data de saída do quarto.

## Funcionalidades

### 1. **Cadastro de Clientes**
O sistema permite cadastrar clientes com informações como nome, telefone, e-mail e endereço. Esses dados são essenciais para vincular as reservas aos clientes.

### 2. **Cadastro de Quartos**
O sistema registra informações sobre os quartos do hotel, como a descrição (ex.: "Quarto simples com cama de solteiro"), a capacidade (quantas pessoas o quarto pode acomodar) e o preço da diária.

### 3. **Cadastro de Reservas**
Os clientes podem fazer reservas de quartos para períodos específicos. O sistema armazena a data de início e fim da reserva, além de vincular a reserva a um cliente específico.

### 4. **Associação de Reservas e Quartos**
Cada reserva pode incluir um ou mais quartos. A tabela `reservas_quartos` gerencia essa relação e especifica as datas de entrada e saída de cada quarto reservado.

### 5. **Consulta e Acompanhamento das Reservas**
O sistema permite consultar as reservas realizadas pelos clientes, verificar os quartos reservados, as datas e o status de cada reserva.

## Exemplo de Uso

### Inserindo Clientes

```sql
INSERT INTO clientes (id_cliente, nome_cliente, telefone, email, endereco)
VALUES (1, 'João Silva', '(11) 5555-5555', 'joao.silva@gmail.com', 'Rua A, 123 - São Paulo'),
       (2, 'Maria Santos', '(21) 5555-5555', 'maria.santos@hotmail.com', 'Rua B, 456 - Rio de Janeiro'),
       (3, 'Pedro Souza', '(31) 5555-5555', 'pedro.souza@yahoo.com.br', 'Rua C, 789 - Belo Horizonte');
```

### Inserindo Quartos

```sql
INSERT INTO quartos (id_quarto, descricao, capacidade, diaria)
VALUES (1, 'Quarto simples com cama de solteiro', 1, 100.00),
       (2, 'Quarto simples com cama de casal', 2, 150.00),
       (3, 'Quarto de luxo com cama de casal', 2, 250.00);
```

### Inserindo Reservas

```sql
INSERT INTO reservas (id_reserva, id_cliente, data_inicio, data_fim)
VALUES (1, 1, '2023-04-10', '2023-04-15'),
       (2, 2, '2023-05-01', '2023-05-05'),
       (3, 3, '2023-06-20', '2023-06-25');
```

### Inserindo Reservas de Quartos

```sql
INSERT INTO reservas_quartos (id_reserva, id_quarto, data_entrada, data_saida)
VALUES (1, 1, '2023-04-10', '2023-04-15'),
       (2, 2, '2023-05-01', '2023-05-05'),
       (3, 3, '2023-06-20', '2023-06-25'),
       (3, 2, '2023-06-20', '2023-06-25');
```

## Como Funciona

### 1. **Cadastro de Clientes**
Quando um cliente decide se hospedar no hotel, suas informações pessoais (nome, telefone, e-mail e endereço) são cadastradas na tabela `clientes`. Isso permite associar uma reserva a um cliente específico.

### 2. **Cadastro de Quartos**
O hotel tem vários quartos com características diferentes, como tipo de cama, capacidade e preço. Cada quarto é registrado na tabela `quartos`, e o preço da diária é informado para que o hotel possa calcular o custo da estadia.

### 3. **Fazendo Reservas**
Os clientes podem fazer reservas especificando as datas de início e fim da sua estadia. A reserva é registrada na tabela `reservas`, e cada reserva é associada a um cliente (utilizando a chave estrangeira `id_cliente`).

### 4. **Atribuindo Quartos às Reservas**
Para cada reserva, o sistema permite associar um ou mais quartos. A tabela `reservas_quartos` é responsável por armazenar os quartos associados a cada reserva, juntamente com as datas de entrada e saída de cada quarto.

### 5. **Consulta de Reservas e Quartos**
Com esse sistema, é possível consultar todas as reservas feitas, visualizar os detalhes dos quartos reservados e verificar as datas de entrada e saída. Isso facilita o gerenciamento da disponibilidade dos quartos e o planejamento da estadia dos clientes.

## Conclusão

Este sistema de banco de dados para gestão de reservas de hotel oferece uma estrutura eficiente para gerenciar clientes, quartos e as reservas feitas. Ele permite registrar e consultar informações sobre as reservas, os quartos disponíveis e os clientes que realizam as estadias. Além disso, é possível associar facilmente os quartos às reservas e manter o controle sobre o período de ocupação de cada quarto.
