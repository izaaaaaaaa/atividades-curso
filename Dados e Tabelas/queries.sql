-- 09/03/2026
-- create
CREATE TABLE EMPREGADO(
  emp_ID INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  dept VARCHAR(50) NOT NULL,
  cotr_date DATE NULL
);

-- insert
INSERT INTO EMPREGADO VALUES (1, 'Clark', 'Vendas', '2008-06-27');
INSERT INTO EMPREGADO VALUES (2, 'Dave', 'Financeiro', NULL);
INSERT INTO EMPREGADO VALUES (3, 'Ava', 'Vendas', NULL);
INSERT INTO EMPREGADO VALUES (4, 'Luis Felipe', 'Financeiro', NULL);
INSERT INTO EMPREGADO VALUES (5, 'Maria Eduarda', 'Vendas', NULL);
INSERT INTO EMPREGADO VALUES (6, 'Maria Laura', 'Financeiro', NULL);
INSERT INTO EMPREGADO VALUES (7, 'Miguel', 'Vendas', NULL);
INSERT INTO EMPREGADO VALUES (8, 'Cleomir', 'Financeiro', NULL);
INSERT INTO EMPREGADO VALUES (9, 'Ana Paula', 'Vendas', NULL);
INSERT INTO EMPREGADO VALUES (10, 'Iza', 'Financeiro', NULL);
INSERT INTO EMPREGADO VALUES (11, 'Lauander', 'Vendas', NULL);
INSERT INTO EMPREGADO VALUES (12, 'Lara', 'Financeiro', NULL);
INSERT INTO EMPREGADO VALUES (13, 'Ana Clara', 'Vendas', NULL);

-- fetch 
-- SELECT * FROM EMPREGADO WHERE dept = 'Sales';
-- SELECT * FROM EMPREGADO ;

CREATE TABLE cliente (
  clie_ID INT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cidade VARCHAR(50) NULL,
  cep VARCHAR(10) 
);

-- insert
INSERT INTO CLIENTE VALUES (0001, 'Natália', 'Uberlândia', '38.025-387');
INSERT INTO CLIENTE VALUES (0002, 'Carol', 'MG', '30.130-010');
INSERT INTO CLIENTE VALUES (0003, 'Victória', 'São Paulo', '01.001-000');
INSERT INTO CLIENTE VALUES (0004, 'Flávia', 'RG', '01.001-000');
INSERT INTO CLIENTE VALUES (0005, 'Débora', 'João Pessoa', '01.001-000');
INSERT INTO CLIENTE VALUES (0006, 'Thaís', 'Maceió', '01.001-000');
INSERT INTO CLIENTE VALUES (0007, 'Sabrina', 'Curitiba', '01.001-000');
INSERT INTO CLIENTE VALUES (0008, 'Sophia', 'Uberaba', '01.001-000');
INSERT INTO CLIENTE VALUES (0009, 'Rodrigo', 'Uberlândia', '01.001-000');
INSERT INTO CLIENTE VALUES (0010, 'Rose', 'Maranhão', '01.001-000');
INSERT INTO CLIENTE VALUES (0011, 'Rubéns', 'Gramado', '01.001-000');
INSERT INTO CLIENTE VALUES (0012, 'Nayana', 'Acre', '01.001-000');
INSERT INTO CLIENTE VALUES (0013, 'Kauã', 'Amazonas', '01.001-000');

-- fetch
-- SELECT * FROM cliente WHERE dept = 'Sales';
-- SELECT * FROM cliente;

CREATE TABLE vendas(
vendas_ID INT PRIMARY KEY,
produto VARCHAR(50) NOT NULL,
ID_vendedor INT NOT NULL,

CONSTRAINT FK_empregado -- nome da regra que define a FK
FOREIGN KEY(ID_vendedor) -- define qual a coluna estará vinculada a FK
REFERENCES EMPREGADO(emp_ID) -- define a referência, qual a tabela e campo da FK
);

INSERT INTO vendas VALUES (1, 'pasta de dente', 1);
INSERT INTO vendas VALUES (2, 'Escova de dentes', 1);

-- fetch
-- SELECT * FROM cliente WHERE dept = 'Sales';
-- SELECT * FROM vendas;

-- 11/03/2026
-- CREATE DATABASE nome_do_banco; -- cria um novo banco de dados
-- SHOW DATABASES;                -- lista todos os bancos disponíveis no servidor
-- SELECT DATABASE();             -- permite saber o banco de dados que estou
-- USE information_schema;        -- seleciona o banco de dados para uso nas operações seguintes
-- DROP DATABASE nome_do_banco;   -- exclui permanentemente o banco de dados

-- SHOW TABLES;                   -- lista todas as tabelas do banco selecionado
-- DESCRIBE cliente;              -- mostra a estrutura da tabela "cliente"
-- DESCRIBE empregado             -- mostra a estrutura da tabela "empregado"


CREATE TABLE produto(
produto_ID INT PRIMARY KEY NOT NULL,
descricao VARCHAR(200) NOT NULL,
preco DECIMAL(5,2) NOT NULL,
fornecedor VARCHAR(100) NOT NULL
);

CREATE TABLE teste(
teste_ID INT PRIMARY KEY
);

RENAME TABLE teste TO testes; -- renomeia a tabela "teste" para "testes"
DROP TABLE testes; -- exclui a tabela "testes" (todos os dados serão perdidos)
ALTER TABLE cliente ADD telefone VARCHAR(15);  -- adiciona uma nova coluna "telefone" na tabela cliente

CREATE TABLE teste( -- cria a tabela teste
teste_ID INT PRIMARY KEY,
nome VARCHAR(30)
);

ALTER TABLE teste ADD telefone VARCHAR(30); -- permite adicionar mais uma coluna, ficando mais a direita
ALTER TABLE teste DROP telefone; -- permite excluir uma determinada coluna
ALTER TABLE teste ADD telefone VARCHAR(30); -- ta adicionando o telefone de novo
ALTER TABLE teste MODIFY telefone VARCHAR(12) NOT NULL; -- permite alterar o tipo de dado da coluna
ALTER TABLE teste MODIFY nome VARCHAR(150) NOT NULL;
ALTER TABLE teste CHANGE telefone tel VARCHAR(11) NOT NULL;  -- permite alterar o nome e o tipo de uma coluna 
ALTER TABLE teste ADD teste_fk INT NOT NULL;

-- alterar uma coluna que era compara FK
ALTER TABLE teste ADD
CONSTRAINT FK_teste
FOREIGN KEY (teste_fk)
REFERENCES cliente(clie_ID);

CREATE TABLE fornecedores (
fornecedor_id INT PRIMARY KEY
);

ALTER TABLE fornecedores ADD nome VARCHAR(100), ADD CEP char(11); 

ALTER TABLE produto MODIFY fornecedor INT NOT NULL;
ALTER TABLE produto ADD 
CONSTRAINT FK_fornecedor
FOREIGN KEY (fornecedor)
REFERENCES fornecedores(fornecedor_id);

-- DESCRIBE fornecedores;
-- DESCRIBE produto;

-- INSERIR DADOS com registros individuais
INSERT INTO fornecedores VALUES (1, NULL, NULL);
INSERT INTO fornecedores (fornecedor_id, nome, cep) VALUES(2, "NOME_", NULL);
INSERT INTO fornecedores (fornecedor_id, nome) VALUES(3, "sadia");
INSERT INTO fornecedores (fornecedor_id) VALUES(4);

-- inserir dados em bloco
INSERT INTO fornecedores (fornecedor_id, nome, cep) VALUES
(5, "copel", "78.123-123"),
(6, "empresa", "33.456-890"),
(7, "outra", "12.345-345"),
(8, NULL, NULL);

-- SELECT * FROM fornecedores;

-- 12/03/2026
-- apagamos todas as tabelas anteriores, etá nesta ordem pq alguns deles estavam como chave etrangeira, 
-- então tem que excluir primeiro as tabelas que contem essas chaves estrangeiras
DROP TABLE teste, cliente, vendas, EMPREGADO, produto, fornecedores;

-- aqui criamos uma nova tabela, tem uma nova ferramenta a UNIQUE que significa ÚNICO, 
-- no caso do CPF era pra ser uma situação única por isso a nova ferramenta foi colocada
-- NOT NULL Significa que este campo é obrigatório. O banco de dados não aceitará o cadastro de um produto 
-- se não disser qual é a quantidade dele. Não pode deixar esse campo "vazio".
CREATE TABLE clientes(
id_cliente INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
CPF VARCHAR(14) UNIQUE NOT NULL,
email VARCHAR(254) NOT NULL,
telefone VARCHAR (20) NULL,
data_nascimento DATE NOT NULL
);


CREATE TABLE fornecedores(
id_fornecedor INT PRIMARY KEY,
nome_social VARCHAR(100) NOT NULL,
cnpj VARCHAR(18) UNIQUE NOT NULL,
telefone VARCHAR(18) NULL,
endereço INT NOT NULL
);

CREATE TABLE categorias(
id_categoria INT PRIMARY KEY,
nome_categoria VARCHAR(100) NOT NULL
);

-- aqui nós utilazamos a FOREIGN KEY, esta foi a forma mais fácil de entender, 
-- primeiro colocamos os IDs que deveriam estar nesta nova tabela e depois acrescentamos a 
-- chave estrangeira e logo depois referenciamos(REFERENCES) elas
CREATE TABLE produtos(
id_produtos INT PRIMARY KEY,
nome_produto VARCHAR(100) NOT NULL,
descricao TINYTEXT,
preco DECIMAL(10,2) NOT NULL,
id_categoria INT NOT NULL,
id_fornecedor INT NOT NULL,
FOREIGN KEY (id_categoria) REFERENCES categorias(ID_categoria),
FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(ID_fornecedor)
);

CREATE TABLE estoque(
id_estoque INT PRIMARY KEY,
id_produtos INT NOT NULL,
FOREIGN KEY (id_produtos) REFERENCES produtos(id_produtos),
quantidade_disponivel SMALLINT NOT NULL
);

-- nesta nós utilizamos o dado ENUM que define que este campo só aceita um desses quatro 
-- valores ('Pendente', 'Pago', 'Entregue', 'Cancelado' e 'Pendente') também tem o termo DEFAULT que esta no 
-- lado do 'Pendente'esta é a "escolha automática". Se você cadastrar um novo pedido e esquecer de dizer qual 
-- é o status, o banco de dados vai escrever 'Pendente' sozinho para você.
CREATE TABLE pedidos(
id_pedido INT PRIMARY KEY,
id_cliente INT NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
data_pedido DATE NOT NULL,
status_pedido ENUM('Pendente', 'Pago', 'Enviado', 'Entregue', 'Cancelado') NOT NULL DEFAULT 'Pendente',
valor_total DECIMAL(10,2)
);

-- PRIMARY KEY(id_pedido,id_produtos) chave primaria aqui dave ser combinação de id_pedido e id_produtos
-- SMALLINT é um número inteiro porém menor o que o INT, na quantidade ele significa que garante que o número
-- seja inteiro e obrigatório
CREATE TABLE itens_pedido(
id_pedido INT NOT NULL,
id_produtos INT NOT NULL,

PRIMARY KEY(id_pedido,id_produtos),

FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
FOREIGN KEY (id_produtos) REFERENCES produtos(id_produtos),
quantidade SMALLINT NOT NULL,
preco_unitario DECIMAL(10,2) NOT NULL
);


ALTER TABLE clientes ADD security_key CHAR(100);
ALTER TABLE categorias ADD security_key CHAR(100);
ALTER TABLE estoque ADD security_key CHAR(100);
ALTER TABLE fornecedores ADD security_key CHAR(100);
ALTER TABLE itens_pedido ADD security_key CHAR(100);
ALTER TABLE pedidos ADD security_key CHAR(100);
ALTER TABLE produtos ADD security_key CHAR(100);

-- 16/03/2026
CREATE TABLE enderecos(
id_enderecos INT AUTO_INCREMENT PRIMARY KEY,
logradouro VARCHAR(255) NOT NULL,
numero VARCHAR(10) NOT NULL,
complemento VARCHAR(100) NULL,
bairro VARCHAR(100) NOT NULL,
cidade VARCHAR(100) NOT NULL,
estado CHAR(2) NOT NULL,
cep CHAR(8) NOT NULL,
pais VARCHAR(50) DEFAULT 'Brasil' NOT NULL,
principal BOOLEAN DEFAULT 0
);

-- deletamos a coluna endereço da tabela fornecedores
ALTER TABLE fornecedores DROP endereço;
-- DESCRIBE fornecedores;

CREATE TABLE clientes_enderecos(
id_cliente INT NOT NULL,
id_enderecos INT NOT NULL,

PRIMARY KEY (id_cliente, id_enderecos),

CONSTRAINT id_cliente_clientesenderecos_clientes
FOREIGN KEY (id_cliente)
REFERENCES clientes(id_cliente),

CONSTRAINT idenderecos_clientesenderecos_enderecos
FOREIGN KEY (id_enderecos)
REFERENCES enderecos(id_enderecos)
);

CREATE TABLE fornecedores_enderecos(
id_fornecedor INT NOT NULL,
id_enderecos INT NOT NULL,

PRIMARY KEY (id_fornecedor, id_enderecos),

CONSTRAINT idfornecedor_fornecedoresenderecos_fornecedores
FOREIGN KEY (id_fornecedor)
REFERENCES fornecedores(id_fornecedor),

CONSTRAINT id_enderecos_fornecedoresenderecos_enderecos
FOREIGN KEY (id_enderecos)
REFERENCES enderecos(id_enderecos)
);

INSERT INTO categorias
(id_categoria, nome_categoria) VALUES
(1, 'Eletrônicos'),
(2, 'Eletrodomésticos'),
(3, 'Móveis'),
(4, 'Informática'),
(5, 'Cozinha'),
(6, 'Banheiro'),
(7, 'Jardim'),
(8, 'Esportes'),
(9, 'Brinquedos'),
(10, 'Livros'),
(11, 'Papelaria'),
(12, 'Automotivo'),
(13, 'Pet Shop'),
(14, 'Beleza'),
(15, 'Moda');
-- SELECT * FROM categorias;

INSERT INTO enderecos
(id_enderecos, logradouro, numero, complemento, bairro, cidade, estado, cep, principal) VALUES
(1, 'Rua das Flores', '123', 'Apto 10', 'Centro', 'São Paulo', 'SP', '01001000', 1),
(2, 'Av. Brasil', '500', NULL, 'Bela Vista', 'Rio de Janeiro', 'RJ', '20001000', 1),
(3, 'Rua Amazonas', '45', 'Casa', 'Indaiá', 'Belo Horizonte', 'MG', '30110000', 1),
(4, 'Travessa da Paz', '12', NULL, 'Alegria', 'Porto Alegre', 'RS', '90010000', 1),
(5, 'Alameda Santos', '1000', '15º andar', 'Cerqueira César', 'São Paulo', 'SP', '01419001', 0),
(6, 'Rua Bahia', '88', NULL, 'Gonzaga', 'Santos', 'SP', '11060000', 1),
(7, 'Av. Getúlio Vargas', '1500', 'Sala 2', 'Savassi', 'Belo Horizonte', 'MG', '30112020', 1),
(8, 'Rua do Sol', '77', NULL, 'Farol', 'Maceió', 'AL', '57050000', 1),
(9, 'Rua da Guia', '10', 'Fundos', 'Recife Antigo', 'Recife', 'PE', '50030000', 1),
(10, 'Av. Sete de Setembro', '200', NULL, 'Batel', 'Curitiba', 'PR', '80230000', 1),
(11, 'Rua das Palmeiras', '333', 'Bloco B', 'Ponta Negra', 'Manaus', 'AM', '69037000', 1),
(12, 'Rua Oscar Freire', '99', 'Loja', 'Jardins', 'São Paulo', 'SP', '01426001', 1),
(13, 'Rua Goitacazes', '44', NULL, 'Centro', 'São Caetano', 'SP', '09510000', 1),
(14, 'Av. Atlântica', '2500', 'Cobertura', 'Copacabana', 'Rio de Janeiro', 'RJ', '22041001', 1),
(15, 'Rua Chile', '5', 'Antigo Hotel', 'Centro', 'Salvador', 'BA', '40020000', 1);
-- SELECT * FROM enderecos;


INSERT INTO clientes
(id_cliente, nome, cpf, email, telefone, data_nascimento) VALUES
(1, 'João Silva', '11122233344', 'joao@email.com', '11988887777', '1985-05-10'),
(2, 'Maria Oliveira', '22233344455', 'maria@email.com', '21977776666', '1990-08-20'),
(3, 'Pedro Santos', '33344455566', 'pedro@email.com', '31966665555', '1982-12-01'),
(4, 'Ana Costa', '44455566677', 'ana@email.com', '51955554444', '1995-03-15'),
(5, 'Lucas José', '55566677788', 'lucas@email.com', '11944443333', '1988-11-25'),
(6, 'Carla Dias', '66677788899', 'carla@email.com', '13933332222', '2000-01-30'),
(7, 'Marcos Rocha', '77788899900', 'marcos@email.com', '31922221111', '1975-07-14'),
(8, 'Fernanda Mello', '88899900011', 'nanda@email.com', '82911110000', '1992-06-18'),
(9, 'Roberto Carlos', '99900011122', 'roberto@email.com', '81900009999', '1941-04-19'),
(10, 'Juliana Moreira', '10120230344', 'ju@email.com', '41999998888', '1979-03-26'),
(11, 'Bruno Gagliasso', '12132343455', 'bruno@email.com', '92988887777', '1982-04-13'),
(12, 'Marina Ruy', '13143454566', 'marina@email.com', '11977776666', '1995-06-30'),
(13, 'Filipe Cordeiro', '14154565677', 'filipe@email.com', '21966665555', '1988-01-21'),
(14, 'Gustavo Costa', '15165676788', 'guto@email.com', '86955554444', '1995-01-05'),
(15, 'Larissa Pereira', '16176787899', 'lari@email.com', '21944443333', '1993-03-30');
-- SELECT * FROM clientes;

INSERT INTO fornecedores
(id_fornecedor, nome_social, cnpj, telefone) VALUES
(1, 'Samsung Brasil LTDA', '12345678000190', '1130030001'),
(2, 'Ambev S.A.', '23456789000180', '1140040002'),
(3, 'Móveis Bartira', '34567890000170', '1150050003'),
(4, 'Dell Computadores', '45678901000160', '0800701000'),
(5, 'Nestlé Brasil', '56789012000150', '1160060005'),
(6, 'Deca Metais', '67890123000140', '1170070006'),
(7, 'Tramontina S.A.', '78901234000130', '5434331212'),
(8, 'Nike do Brasil', '89012345000120', '1180080008'),
(9, 'Mattel Brinquedos', '90123456000110', '1190090009'),
(10, 'Editora Saraiva', '01234567000100', '1120020010'),
(11, 'Faber Castell', '12312312000199', '1130031111'),
(12, 'Pirelli Pneus', '23423423000188', '1140042222'),
(13, 'Cobasi Pet', '34534534000177', '1150053333'),
(14, 'Loreal Paris', '45645645000166', '1160064444'),
(15, 'Hering Têxtil', '56756756000155', '4733213122');
-- SELECT * FROM fornecedores;

INSERT INTO clientes_enderecos
(id_cliente, id_enderecos) VALUES
(1,1), 
(2,2), 
(3,3), 
(4,4), 
(5,5), 
(6,6), 
(7,7), 
(8,8), 
(9,9), 
(10,10), 
(11,11), 
(12,12), 
(13,13), 
(14,14), 
(15,15);
-- SELECT * FROM clientes_enderecos;

INSERT INTO fornecedores_enderecos 
(id_fornecedor, id_enderecos) VALUES
(1,1), 
(2,2), 
(3,3), 
(4,4), 
(5,5), 
(6,6), 
(7,7), 
(8,8), 
(9,9), 
(10,10), 
(11,11), 
(12,12), 
(13,13), 
(14,14), 
(15,15);
-- SELECT * FROM fornecedores_enderecos;

INSERT INTO produtos
(id_produtos, nome_produto, descricao, preco, id_categoria, id_fornecedor) VALUES
(1, 'Smartphone S23', 'Celular Samsung', 4500.00, 1, 1),
(2, 'Cerveja Skol', 'Lata 350ml', 4.50, 5, 2),
(3, 'Guarda-Roupa', '6 portas', 1200.00, 3, 3),
(4, 'Notebook Dell', 'i7 16GB RAM', 5500.00, 4, 4),
(5, 'Leite Ninho', 'Lata 400g', 18.00, 5, 5),
(6, 'Torneira Deca', 'Cromada', 250.00, 6, 6),
(7, 'Jogo de Panelas', 'Antiaderente', 350.00, 5, 7),
(8, 'Tênis Air Max', 'Corrida', 890.00, 8, 8),
(9, 'Barbie Sereia', 'Brinquedo', 120.00, 9, 9),
(10, 'Livro de SQL', 'Domine BD', 90.00, 10, 10),
(11, 'Lápis de Cor', '60 cores', 150.00, 11, 11),
(12, 'Pneu Aro 15', 'Carro passeio', 400.00, 12, 12),
(13, 'Ração Royal', 'Cães adultos', 200.00, 13, 13),
(14, 'Shampoo Loreal', '500ml', 60.00, 14, 14),
(15, 'Camiseta Básica', 'Algodão', 40.00, 15, 15);
-- SELECT * FROM produtos;

INSERT INTO estoque
(id_estoque, id_produtos, quantidade_disponivel) VALUES
(1, 1, 50), 
(2, 2, 1000), 
(3, 3, 20), 
(4, 4, 15), 
(5, 5, 200),
(6, 6, 40), 
(7, 7, 30), 
(8, 8, 25), 
(9, 9, 60), 
(10, 10, 100),
(11, 11, 150), 
(12, 12, 80), 
(13, 13, 45), 
(14, 14, 75), 
(15, 15, 300);
-- SELECT * FROM estoque;

INSERT INTO pedidos 
(id_pedido, id_cliente, data_pedido, status_pedido, valor_total) VALUES
(1, 1, '2024-03-01', 'Pago', 4500.00), 
(2, 2, '2024-03-02', 'Enviado', 9.00),
(3, 3, '2024-03-03', 'Pendente', 1200.00), 
(4, 4, '2024-03-04', 'Entregue', 5500.00),
(5, 5, '2024-03-05', 'Cancelado', 18.00), 
(6, 6, '2024-03-06', 'Pago', 250.00),
(7, 7, '2024-03-07', 'Pago', 350.00), 
(8, 8, '2024-03-08', 'Enviado', 890.00),
(9, 9, '2024-03-09', 'Entregue', 120.00), 
(10, 10, '2024-03-10', 'Pendente', 90.00),
(11, 11, '2024-03-11', 'Pago', 150.00), 
(12, 12, '2024-03-12', 'Enviado', 400.00),
(13, 13, '2024-03-13', 'Entregue', 200.00), 
(14, 14, '2024-03-14', 'Cancelado', 60.00),
(15, 15, '2024-03-15', 'Pendente', 40.00);
-- SELECT * FROM pedidos;

INSERT INTO itens_pedido (id_pedido, id_produtos, quantidade, preco_unitario) VALUES
(1, 1, 1, 4500.00), 
(2, 2, 2, 4.50), 
(3, 3, 1, 1200.00), 
(4, 4, 1, 5500.00), 
(5, 5, 1, 18.00),
(6, 6, 1, 250.00), 
(7, 7, 1, 350.00), 
(8, 8, 1, 890.00), 
(9, 9, 1, 120.00), 
(10, 10, 1, 90.00),
(11, 11, 1, 150.00), 
(12, 12, 1, 400.00), 
(13, 13, 1, 200.00), 
(14, 14, 1, 60.00), 
(15, 15, 1, 40.00);
-- SELECT * FROM itens_pedido;

-- mostra somente a coluna id_cliente da tabela clientes;
-- SELECT id_cliente FROM clientes;

-- utilizamos o WHERE no SELECT * FROM pra podermos achar coisas mais específicas 
-- dentro das colunas;
-- SELECT * FROM enderecos WHERE estado = 'RJ';

-- outros exemplos de como consultar o WHERE;
-- SELECT * FROM enderecos WHERE numero > 45 AND cidade = 'São Paulo';
-- SELECT * FROM enderecos WHERE numero > 1000 OR numero < 500;
-- SELECT nome, id_cliente FROM clientes WHERE id_cliente > 10 AND id_cliente <= 14;

-- Aqui vai ordernar ORDER BY de forma de decrescente DESC;
-- SELECT * FROM estoque WHERE quantidade_disponivel > 100 ORDER BY quantidade_disponivel DESC;

-- 17/03/2026

-- TIMESTAMPDIFF ------------------------------------------------------------------------------------------------

-- O código usa a função TIMESTAMPDIFF(unidade, data_inicio, data_fim) para calcular intervalos:
-- Idade: Calcula a diferença em anos (YEAR) entre a data de nascimento e a data atual (CURDATE()).
-- Contagem Regressiva do Curso: Calcula quantos meses faltam para o dia 21/08/2026. 
-- Dias Passados: Conta quantos dias se passaram desde o início de 2026 até hoje.
-- Dias Restantes: Conta quantos dias faltam para o fim de 2026.

-- SHOW TABLES;
-- esta ordem aqui nós é quem definimos a partir do SELECT até FROM clientes;
-- CURDATE é a dada final ou seja a data atual;
-- AS é o "como"

-- SELECT 
-- nome,
-- data_nascimento,
-- TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade,
-- TIMESTAMPDIFF(MONTH, CURDATE(), '2026-08-21') AS 'O CURSO TERMINA EM (DIAS)'
-- TIMESTAMPDIFF(DAY, '2026-01-01', CURDATE()) AS 'Dias passados',
-- TIMESTAMPDIFF(DAY, CURDATE(), '2026-12-31') AS 'Dias por vir'
-- FROM clientes;

-- permite criar uma coluna virtual que rodará automaticamente reduzindo o tempo de consulta 
-- ALTER TABLE clientes
-- ADD idade SMALLINT AS (TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) VIRTUAL;

-- calculei a idade e defini critérios, como por exemplo eu pedi idades maiores que 45 anos
-- utilizando o WHERE, Esta é a parte crucial: WHERE ... > 45. O banco de dados olha para o cálculo da idade e descarta qualquer 
-- pessoa que tenha 45 anos ou menos. Apenas os registros que atendem à condição de "maior que 45" passam para o resultado final.
-- SELECT
-- nome,
-- TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
-- FROM clientes
-- WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) > 45
-- ORDER BY idade DESC;

-- HAVING -------------------------------------------------------------------------------------------------------

-- utilizando o HAVING
-- SELECT
-- nome,
-- TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
-- FROM clientes
-- HAVING idade > 30
-- ORDER BY idade DESC;

-- CALCULAR O TEMPO EM DIAS DA TABELA PEDIDOS
-- SELECT 
-- id_pedido,
-- data_pedido,
-- status_pedido,
-- TIMESTAMPDIFF(DAY, data_pedido, CURDATE()) AS 'Tempo decorrido'
-- FROM pedidos;

-- LIKE, BINARY --------------------------------------------------------------------------------------------------

-- essa porcentagem q vem antes do número significa que não importa o caracteres que veio antes, oque vale é o último termo %8
-- na segunda situação qualquer CPF que aparecer no número 8 vai aparecer na tabela %8%
-- % é o caractere coringa
-- SELECT
-- nome, cpf
-- FROM clientes
-- WHERE cpf LIKE '%8%';

-- SELECT nome FROM clientes WHERE nome LIKE '%costa'; -- busca todos os nomes que terminam com costa
-- SELECT nome FROM clientes WHERE nome LIKE 'costa%'; -- busca todos os nomes que começam com costa
-- SELECT nome FROM clientes WHERE nome LIKE '%costa%'; -- busca todo os nomes que contenham costa

-- -- no BINARY aceita somente com as letras maiúsculas
-- SELECT
-- nome
-- FROM clientes
-- WHERE BINARY nome LIKE '%Costa%';

-- SELECT 
-- nome_produto AS 'nome do produto'
-- FROM produtos
-- WHERE BINARY nome_produto LIKE '%C%';

-- LOCATE -------------------------------------------------------------------------------------------------------

-- LOCATE serve para encontrar a "posição" de um caractere ou palavra dentro de uma frase. Lógica: O LOCATE('Cromada', descricao) > 0 funciona como um filtro de busca. 
-- Se a palavra for encontrada, a função retorna a posição dela (ex: 5, 10, 12). Se for maior que 0, o produto entra no resultado.

-- SELECT nome_produto, descricao
-- FROM produtos
-- WHERE LOCATE('Cromada', descricao) > 0
-- ORDER BY nome_produto DESC;

-- SELECT preco, nome_produto
-- FROM produtos
-- WHERE LOCATE('Barbie Sereia', nome_produto)
-- ORDER BY preco DESC;

-- SELECT logradouro, LOCATE('e', logradouro) AS 'Posição E' FROM enderecos;

-- SELECT email, LOCATE('@', email) AS 'Posição @' FROM clientes;

-- REGEXP -----------------------------------------------------------------------------------------------

-- O que faz: Seleciona o nome de todos os clientes que tenham "costa", "santos" OU "silva" no nome.
-- O símbolo | (Pipe): Funciona como o operador lógico OU.

-- pode colocar somente uma letra também, REGEXP 'a';
-- SELECT
-- nome
-- FROM clientes
-- WHERE nome REGEXP 'costa|santos|silva'
-- ORDER BY nome;

-- SELECT nome_produto, descricao
-- FROM produtos
-- WHERE nome_produto REGEXP 'de'
-- ORDER BY nome_produto;

-- SUBSTRING_INDEX -----------------------------------------------------------------------------

-- Extraindo o Primeiro Nome
-- SUBSTRING_INDEX(nome, ' ', 1):
-- O código procura pelo espaço em branco (' ').
-- O número 1 diz: "Pegue tudo o que estiver à esquerda do primeiro espaço encontrado".
-- Resultado: Se o nome for "João Carlos Silva", ele retorna "João".
-- 2. Extraindo o Sobrenome
-- SUBSTRING_INDEX(nome, ' ', -1):
-- Aqui está o "pulo do gato": o número -1 (negativo) diz ao SQL para começar a procurar do final para o começo.
-- Ele pega tudo o que estiver à direita do último espaço encontrado.
-- Resultado: Se o nome for "João Carlos Silva", ele retorna "Silva".

-- SELECT
-- SUBSTRING_INDEX(nome, ' ', 1) AS 'Primeiro nome',
-- SUBSTRING_INDEX(nome, ' ', -1) AS 'Sobrenome'
-- FROM clientes
-- ORDER BY 'Primeiro nome';

-- SUBSTR --------------------------------------------------------------------------------------

-- Ele está tentando adicionar o cliente João Silva Pereira Costa ao banco de dados.
-- O Bloco de Extração de Nomes (SELECT)
-- Este é o "cérebro" do script. Ele usa três funções diferentes para tratar o nome completo:
-- SUBSTRING_INDEX(nome, ' ', 1) (Primeiro nome):
-- Corta no primeiro espaço encontrado e pega o que vem antes.
-- Resultado: João.
-- SUBSTR(nome, LOCATE(' ', nome) + 1) (Sobrenome completo):
-- Aqui o código usa o LOCATE para achar a posição do primeiro espaço e soma +1. 
-- Depois, o SUBSTR corta tudo o que vem desse ponto até o final da frase.
-- Resultado: Silva Pereira Costa.
-- SUBSTRING_INDEX(nome, ' ', -1) (Último nome):
-- O valor negativo -1 faz o SQL olhar de trás para frente e pegar apenas a última palavra após o último espaço.
-- Resultado: Costa.

-- INSERT INTO clientes
-- (id_cliente, nome, cpf, email, telefone, data_nascimento) VALUES
-- (16, 'João Silva Pereira Costa', '11122233346', 'joao@email.com', '11988887777', '1985-05-10');

-- SELECT
-- SUBSTRING_INDEX(nome, ' ', 1) AS 'Primeiro nome',
-- SUBSTR(nome, LOCATE(' ', nome) + 1) AS 'Sobrenome completo',
-- SUBSTRING_INDEX(nome, ' ', -1) AS 'Último nome'
-- FROM clientes
-- ORDER BY nome;

-- MIN -----------------------------------------------------------------------------------------------------------------------

-- SELECT MIN(TIMESTAMPDIFF(...)): Este primeiro comando apenas retorna um número (ex: 18).
-- não pode pedir o nome e o MIN(idade) no mesmo SELECT comum, porque o SQL se perderia sobre qual nome mostrar.
-- solução: O código faz uma pergunta em duas etapas:
-- Subquery: "Qual é a menor idade da tabela?" (Ex: 18).
-- Query Principal: "Agora, me mostre o nome de quem tem exatamente 18 anos."

-- SELECT MIN(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) AS idade FROM clientes;

-- SELECT nome, TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
-- FROM clientes
-- WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) = (SELECT MIN(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) FROM clientes);

-- SIMPLIFICADO
-- SELECT nome, TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
-- FROM clientes
-- HAVING IDADE = (SELECT MIN(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) FROM clientes);

-- SELECT nome_produto, preco
-- FROM produtos
-- WHERE preco = (SELECT MIN(preco) FROM produtos);

-- SELECT 
-- id_pedido, id_cliente, status_pedido, valor_total
-- FROM pedidos
-- WHERE valor_total = (SELECT MIN(valor_total) FROM pedidos WHERE status_pedido = 'Pago');

-- 18/03/2026

-- MAX -----------------------------------------------------------------------------------------------------

-- SELECT MAX(TIMESTAMPDIFF(...)):Este comacomancomando calcula a idade de todo mundomundoe o resultado é a idade da pessoa mais velha da base.
-- WHERE preco = (SELECT MAX(preco) FROM produtos): Localiza o item de maior valor no estoque.

-- SELECT MAX(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) AS idade FROM clientes;

-- SELECT nome, TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
-- FROM clientes
-- WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) = (SELECT MAX(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) FROM clientes);

-- -- SIMPLIFICADO
-- SELECT nome, TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
-- FROM clientes
-- HAVING IDADE = (SELECT MAX(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) FROM clientes);

-- SELECT nome_produto, preco
-- FROM produtos
-- WHERE preco = (SELECT MAX(preco) FROM produtos);

-- SELECT 
-- id_pedido, id_cliente, status_pedido, valor_total
-- FROM pedidos
-- WHERE valor_total = (SELECT MAX(valor_total) FROM pedidos WHERE status_pedido = 'Pago');

-- AVG (MÉDIA) ------------------------------------------------------------------------------------------------------------

-- SELECT AVG(...): Calcula a média de idade de todos os clientes ou a média de preço de todos os produtos.

-- SELECT AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) AS idade FROM clientes;

-- o que nós tentamos fazer
-- SELECT AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) = (SELECT MAX(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()))) = (SELECT MIN(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()))) AS idade FROM clientes;

-- como descobrir a idade média +/- 25% entre o maior valor e o menor valor de todos os clientes
-- SELECT
-- nome, 
-- TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
-- FROM clientes
-- HAVING idade > (
-- SELECT AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) FROM clientes) - (SELECT AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) FROM clientes) * 0.25
-- AND
--        idade < (
-- SELECT AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) FROM clientes) - (SELECT AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) FROM clientes) * 0.25
-- ORDER BY idade;

-- como descobrir a idade média +/- 25% entre o maior valor e o menor valor de todos os clientes mais resumido
-- SELECT
-- nome,
-- TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
-- FROM clientes
-- HAVING idade > (SELECT AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) FROM clientes) * 0.75
-- AND
--        idade < (SELECT AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) FROM clientes) * 1.25
-- ORDER BY idade;

-- como descobrir a média de 10% dos preços
-- o pq do 0.9 e 1.1, 100% - 10% = 90% ou seja, 0.9, 100% + 10% = 110% ou seja, 1.1
-- SELECT AVG(preco) FROM produtos;

-- SELECT 
-- nome_produto,
-- preco
-- FROM produtos
-- WHERE preco > (SELECT AVG(preco) FROM produtos) * 0.9 AND preco < (SELECT AVG(preco) FROM produtos) * 1.1
-- ORDER BY preco;

-- BETWEEN -----------------------------------------------------------------------------------------------------------------------------------------

-- Seleciona clientes que não são nem "muito jovens" nem "muito idosos" em relação ao seu banco de dados.
-- A Lógica: * Ele calcula a média de idade e define um limite inferior de 75% da média e um limite superior de 125% da média.
-- Se a média de idade da sua loja for 40 anos, o BETWEEN vai buscar quem tem entre 30 e 50 anos.
-- Busca produtos que estão na "faixa de preço comum" da loja, ignorando itens extremamente baratos (centavos) ou artigos de luxo (muito caros).
-- A Lógica:
-- O BETWEEN aqui usa uma margem maior: 0.5 (50%) até 1.5 (150%) da média de preço.
-- Se o preço médio da loja é R$ 100,00, ele vai mostrar tudo que custa entre R$ 50,00 e R$ 150,00.

-- SELECT
-- nome,
-- TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
-- FROM clientes
-- HAVING idade BETWEEN (SELECT AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) FROM clientes) * 0.75 AND
--                     (SELECT AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) FROM clientes) * 1.25
-- ORDER BY idade;

-- SELECT
-- nome_produto,
-- preco
-- FROM produtos
-- WHERE preco BETWEEN (SELECT AVG(preco) FROM produtos) * 0.5 AND (SELECT AVG(preco) FROM produtos) * 1.5
-- ORDER BY preco;

-- GROUP BY ----------------------------------------------------------------------------------------

-- GROUP BY (Agrupar por) o SQL cria "pastas" separadas para cada categoria ou status.
-- COUNT: Quantos pedidos existem naquele status.
-- SUM: Quanto dinheiro total aquele status representa.
-- AVG: Qual o valor médio gasto pelos clientes nesses pedidos.
-- MAX / MIN: O pedido mais caro e o mais barato de cada categoria.

-- SELECT
-- status_pedido AS 'Status',
-- COUNT(valor_total) AS 'Número de pedidos',
-- SUM(valor_total) AS 'Soma',
-- AVG(valor_total) AS 'Média', -- AGRUPOU A MÉDIA DOS VALORES TOTAIS DA COLUNA DO PEDIDO
-- MAX(valor_total) AS 'Máximo',
-- MIN(valor_total) AS 'Mínimo'

-- FROM pedidos
-- GROUP BY status_pedido
-- ORDER BY status_pedido;

-- SELECT
-- id_categoria AS 'Categoria',
-- COUNT(id_categoria) AS 'Contagem', 
-- SUM(preco) AS 'Soma',
-- AVG(preco) AS 'Média',
-- MAX(preco) AS 'Máximo',
-- MIN(preco) AS 'Mínimo'
-- FROM produtos
-- GROUP BY id_categoria
-- ORDER BY id_categoria;

-- 23/03/2026


-- SELECT pedidos.id_pedido, clientes.nome
-- FROM pedidos
-- INNER JOIN clientes 
-- ON pedidos.id_cliente = clientes.id_cliente;

-- SELECT * FROM categorias; 

-- 24/03/2026

-- INNER JOIN
-- 1)
-- SELECT p.nome_produto, c.nome_categoria
-- FROM produtos AS p
-- INNER JOIN categorias AS c ON p.id_categoria = c.id_categoria;

-- não deu certo
-- 02) Exiba o ID do pedido, a data do pedido, o nome do produto e a quantidade vendida.
-- SELECT ip.id_pedido, p.data_pedido, pr.nome_produto, ip.quantidade
-- FROM pedidos p
-- INNER JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
-- INNER JOIN produtos pr ON ip.id_produto = pr.id_produto;

-- 3) esta não deu certo
-- SHOW TABLES;
-- SELECT* FROM enderecos;
-- SELECT * from clientes_enderecos;
-- SELECT
--     c.nome,
--     c.email,
--     e.logradouro,
--     e.numero,
--     e.cidade
-- FROM clientes AS c
-- INNER JOIN clientes_enderecos AS ce ON c.id_cliente = ce.id_cliente
-- INNER JOIN enderecos AS e ON ce.id_endereco = e.id_endereco
-- WHERE e.estado = 'SP';

-- 4) este deu certo 
-- SELECT
-- f.nome_social,
-- ROUND(AVG(p.preco), 2) AS media_preco
-- FROM fornecedores f
-- INNER JOIN produtos p ON f.id_fornecedor = p.id_fornecedor
-- GROUP BY f.nome_social
-- HAVING media_preco > 50.00
-- ORDER BY media_preco DESC;

-- 5) deu certo
-- SELECT c.nome_categoria, 
-- MIN(p.preco) AS menor_preco
-- FROM categorias c
-- INNER JOIN produtos p ON c.ID_categoria = p.ID_categoria
-- GROUP BY c.nome_categoria
-- HAVING MIN(p.preco) < 50.00
-- ORDER BY menor_preco ASC;


-- 6) este deu certo
-- SELECT c.nome, c.email, SUM(p.valor_total) AS total_pedidos
-- FROM clientes c
-- LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
-- GROUP BY 
-- c.nome, c.email;

-- 7) este deu certo
-- SELECT nome_categoria, nome_produto
-- FROM categorias c
-- LEFT JOIN produtos p ON c.id_categoria = p.id_categoria
-- WHERE p.nome_produto IS NULL;

-- desafio 8 não fizemos
-- desfio 9 não fizemos

-- 25/03/2026
-- DESAFIOS FEITO PELO PROFESSOR -----------------------------------------------------------

-- INNER JOIN ----------------------------------------------------------------------

-- INSERT INTO itens_pedido
-- (id_pedido, id_produto, quantidade, preco_unitario) VALUES
-- (16, 6, 2, 250.00);

-- INSERT INTO produtos
-- (id_produto, nome_produto, descricao, preco, id_categoria, id_fornecedor) VALUES
-- (16, 'Caneta BIC', 'Caneta que escreve rs', 1.00, 11, 11);


-- ALTER TABLE produtos MODIFY ID_fornecedor INT NULL;
-- SELECT * FROM produtos;

-- INSERT INTO produtos
-- (id_produto, nome_produto, descricao, preco, id_categoria) VALUES
-- (17, 'Controle remoto', 'Modelo YR-W06', 30.00, 1);

INSERT INTO fornecedores
(id_fornecedor, nome_social, cnpj, telefone) VALUES
(16, 'LG Brasil LTDA', '12345678000191', '1130030001');

-- 1) (OS DOIS TIPOS DEU CERTO) Escreva uma Query que exiba o nome do produto e o nome da categoria
-- SELECT produtos.nome_produto,
--       -- produtos.id_categoria,
--       -- categorias.id_categoria,
--       categorias.nome_categoria
-- FROM produtos
-- INNER JOIN categorias ON produtos.id_categoria = categorias.id_categoria;

-- SELECT * FROM produtos;

-- -- outra forma de fazer
-- SELECT p.nome_produto AS Produto,
--        c.nome_categoria AS categoria
-- FROM produtos p
-- INNER JOIN categorias c ON p.id_categoria = c.id_categoria;

-- 2) (DEU CERTO) Exiba o ID do pedido e a data do pedido, o nome do produto e a quantidade vendido

INSERT INTO pedidos
(id_pedido, id_cliente, data_pedido, status_pedido, valor_total) VALUES
(16, 1, '2024-03-01', 'Pago', 500.00);

-- SELECT p.id_pedido AS 'ID',
--       P.data_pedido AS 'Data pedido',
--       pr.nome_produto AS 'Produto',
--       ip.quantidade AS 'Quantidade'
-- FROM pedidos p
-- INNER JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
-- INNER JOIN produtos pr ON ip.id_produtos = pr.id_produtos;

-- 3) (DEU CERTO) Liste o nome do cliente, o e-mail, o logradouro, o número e a cidade, 
-- mas apenas para clientes que moram no estado de 'SP'.

-- DESCRIBE clientes_enderecos;
-- SELECT * FROM clientes_enderecos;
-- SELECT * FROM clientes;
-- SELECT * FROM enderecos;

-- SELECT c.nome AS 'Nome',
--        c.email AS 'e-mail',
--        e.logradouro AS 'Logradouro',
--        e.numero AS 'Número',
--        e.cidade AS 'Cidade'
-- FROM clientes c
-- INNER JOIN clientes_enderecos ce on c.id_cliente = ce.id_cliente
-- INNER JOIN enderecos e ON ce.id_enderecos = e.id_enderecos
-- WHERE e.estado = 'SP'
-- ORDER BY c.nome;

-- 4) (DEU CERTO) Escreva uma query que retorne: 
-- O nome social do fornecedor. 
-- A média de preço dos produtos que ele fornece (arredondada para 2 casas decimais) ROUND(AVG(), 2).
-- O resultado deve ser ordenado da maior média para a menor. 
-- Bônus: Filtre para exibir apenas fornecedores cuja média de produtos seja superior a R$50,00.
-- SELECT 
-- f.nome_social,
-- ROUND(AVG(p.preco), 2) AS 'Média de preços'
-- FROM fornecedores f
-- INNER JOIN produtos p ON f.id_fornecedor = p.id_fornecedor
-- GROUP BY f.nome_social
-- HAVING AVG(p.preco) > 50.00
-- ORDER BY AVG(p.preco) DESC;


-- 5) (DEU certo) Escreva uma query que retorne:
-- O nome da categoria.
-- O menor preço encontrado para aquela categoria.
-- O resultado deve ser filtrado para exibir apenas categorias que tenham produtos com preço mínimo abaixo de R$50,00.
-- Ordene o resultado do menor preço para o maior.
-- SELECT c.nome_categoria AS 'Categoria',
--       MIN(p.preco)
-- FROM categorias c       
-- INNER JOIN produtos p ON c.id_categoria = p.id_categoria
-- GROUP BY c.nome_categoria
-- HAVING MIN(p.preco) < 50.00
-- ORDER BY MIN(p.preco);

-- LEFT JOIN -------------------------------------------------------------------------------

-- 6) (DEU CERTO) Escreva uma query que retorne:
-- O nome do cliente.
-- O e-mail do cliente.
-- O valor_total dos seus pedidos.
-- O resultado deve incluir todos os clientes da tabela clientes, independentemente de terem pedidos ou não.
-- Dica Extra: Como um cliente pode ter vários pedidos, utilize o SUM() para consolidar o valor total por cliente.

INSERT INTO clientes
(id_cliente, nome, cpf, email, telefone, data_nascimento) VALUES
(16, 'Túlio', '11155233344', 'tulio@email.com', '12988887777', '1995-05-10');

-- SELECT c.nome AS 'Nome',
--       c.email AS 'e-mail',
--       SUM(p.valor_total)
-- FROM clientes c
-- LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
-- GROUP BY c.nome, c.email
-- ORDER BY c.nome;

-- 7) (DEU CERTO) Escreva uma query que retorne:
-- O nome da categoria (da tabela categorias).
-- O nome do produto (da tabela produtos).
-- O resultado deve mostrar todas as categorias, mesmo aquelas que não têm nenhum produto.
-- Filtro Especial: Mostre apenas as categorias que estão "órfãs", ou seja, onde o nome do produto seja NULL.

INSERT INTO categorias 
(id_categoria, nome_categoria) VALUES
(16, 'Saúde e Bem Estar');

-- SELECT c.nome_categoria AS 'Categoria',
--       p.nome_produto AS 'Produto'
-- FROM categorias c
-- LEFT JOIN produtos p ON c.id_categoria = p.id_categoria
-- WHERE p.id_produtos IS NULL;

-- 8) (DEU CERTO) Listar o nome do fornecedor, o nome do produto e o nome da categoria.
-- Regra 1: Só queremos produtos que tenham uma categoria definida.
-- Regra 2: Queremos ver todos os fornecedores, mesmo aqueles que ainda não nos enviaram nenhum produto.
-- SELECT f.nome_social AS 'Nome Social',
--       pr.nome_produto AS 'Produto',
--       c.nome_categoria AS 'Categoria'
-- FROM fornecedores f
-- LEFT JOIN produtos pr ON f.id_fornecedor = pr.id_produtos -- todos os fornecedores
-- INNER JOIN categorias c ON c.id_categoria = pr.id_categoria -- produtos e categorias definidos
 
-- 9) (DEU CERTO) Escreva uma query que retorne as seguintes informações:
-- O nome do cliente.
-- A data em que o pedido foi feito.
-- O nome do produto que está no pedido.
-- O valor total do pedido.
-- SELECT c.nome AS 'Nome',
--       p.data_pedido AS 'Data',
--       pr.nome_produto AS 'Produto',
--       p.valor_total AS 'Valor Total'
-- FROM clientes c
-- INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
-- INNER JOIN itens_pedido ip ON ip.id_pedido = p.id_pedido
-- INNER JOIN produtos pr ON pr.id_produtos = ip.id_produtos
-- WHERE p.status_pedido = 'Pago'
-- ORDER BY p.data_pedido DESC;

-- 26/03/2026 UPDATE, VIEW, RENAME, DELETE -------------------------------------------------

-- UPDATE ----------------------------------------------------------------------------------

-- UPDATE clientes
-- SET email = 'robertoc@gmail.com', telefone = '12345678901'
-- WHERE id_cliente = 9;

-- UPDATE pedidos
-- SET status_pedido = 'Pago'
-- WHERE status_pedido = 'Pendente';

-- UPDATE enderecos
-- SET logradouro = 'Rua Norte', bairro = 'Amazonas', cidade = 'Manaus', estado = 'AM'
-- WHERE id_enderecos = 3;

-- SELECT * FROM clientes;
-- SELECT * FROM pedidos;
-- SELECT * FROM enderecos;

-- VIEW ---------------------------------------------------------------------------------------

-- CREATE VIEW v_pedidos_recentes AS
-- SELECT c.nome AS 'Nome',
--       p.data_pedido AS 'Data',
--       pr.nome_produto AS 'Produto',
--       p.valor_total AS 'Valor Total'
-- FROM clientes c
-- INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
-- INNER JOIN itens_pedido ip ON ip.id_pedido = p.id_pedido
-- INNER JOIN produtos pr ON pr.id_produtos = ip.id_produtos
-- WHERE p.status_pedido = 'Pago'
-- ORDER BY p.data_pedido DESC;

-- SELECT * FROM v_pedidos_recentes;

-- CREATE VIEW v_produto_categoria AS
-- SELECT p.nome_produto AS Produto,
--       c.nome_categoria AS categoria
-- FROM produtos p
-- INNER JOIN categorias c ON p.id_categoria = c.id_categoria;

-- RENAME TABLE v_produto_categoria TO v_prod_categ;

-- DROP VIEW v_prod_categ;
-- -- DROP VIEW v_pedidos_recentes;

-- -- SHOW TABLES;

-- Desafio ----------------------------------------------------------------------------------

-- CREATE VIEW v_media_por_categoria AS
-- SELECT c.nome_categoria,
--        c.id_categoria,
-- ROUND(AVG(p.preco), 2) AS media_preco_por_cat
-- FROM categorias c
-- INNER JOIN produtos p ON p.id_categoria = c.id_categoria
-- GROUP BY c.nome_categoria, c.id_categoria
-- ORDER BY c.nome_categoria;

-- SELECT * FROM v_media_por_categoria;

-- A partir daqui nada funcionou
-- CREATE VIEW v_vendas_por_produto AS
-- SELECT p.ID_produtos,
--       p.nome_produto,
--       p.ID_categoria,
--       SUM(ip.quantidade)
-- FROM produtos
-- INNER JOIN itens_pedido ip ON ip.ID_produtos = p.ID_produtos
-- GROUP BY p.ID_produtos, p.nome_produto;
