-- BADC5, IFSP-PRC, 2024 (1sem), ModeloV1

CREATE DATABASE projeto;
\c projeto
-- Instrucoes basicas:
-- Nomear o script como TemaProntuario.sql (onde 'Tema' e' o tema do grupo e o 'Prontuario' pertence a quem fez o envio no Moodle)
-- Seguir rigorosamente a sintaxe do PostgreSQL
-- Este script precisa ser escrito de modo que possa ser executado completamente sem apresentar erros
-- Apagar as linhas comentadas somente quando 


-- [0] USUARIOS
-- Resumir aqui quais serao os usuarios, visto que o superusuario sera' utilizado apenas em casos excepcionais. 

-- adm_financeiro
-- analista_financeiro
-- cliente_financeiro

-- ----------------------------
-- [1] ESQUEMAS
-- Criacao de pelo menos 1 esquema
-- Nesse(s) esquema(s) serao criados: tabelas, visoes, funcoes, procedimentos, gatilhos, sequencias etc (vide secoes seguintes)
CREATE SCHEMA financeiro;


-- ----------------------------
-- [2] TABELAS
-- Criacao das tabelas e de suas restricoes (chaves primarias, unicidades, valores padrao, checagem e nao nulos)
-- Pelo menos 1 UNIQUE, 1 DEFAULT, 1 CHECK
-- Definicao das chaves estrangeiras das tabelas com acoes referenciais engatilhadas
-- As restricoes criadas com ALTER TABLE devem aparecer logo apos a tabela correspondente

CREATE TABLE financeiro.projeto(
    p_numero SERIAL PRIMARY KEY,
    p_datainicio DATE NOT NULL,
    p_datatermino DATE NOT NULL CHECK (p_datatermino > p_datainicio),
    p_custo DECIMAL(15, 2) NOT NULL CHECK (p_custo > 0),
    p_descricao TEXT,
    UNIQUE(p_numero, p_datainicio)
);

CREATE TABLE financeiro.investidor(
    i_cpf CHAR(14) PRIMARY KEY,
    i_nome VARCHAR(100) NOT NULL,
    i_datanascimento DATE NOT NULL,
    i_id SERIAL UNIQUE
);

CREATE TABLE financeiro.financiamento(
    f_id SERIAL PRIMARY KEY,
    f_investidor CHAR(14) NOT NULL,
    f_projeto INT NOT NULL,
    f_valor DECIMAL(15, 2) NOT NULL CHECK (f_valor > 0),
    FOREIGN KEY (f_investidor) REFERENCES financeiro.investidor(i_cpf) ON DELETE CASCADE,
    FOREIGN KEY (f_projeto) REFERENCES financeiro.projeto(p_numero) ON DELETE CASCADE
);
-- tabela criada para testar o statment
CREATE TABLE financeiro.log (
    log_id SERIAL PRIMARY KEY,
    operation VARCHAR(50) NOT NULL,
    row_count INT NOT NULL,
    operation_time TIMESTAMP NOT NULL
);
-- ----------------------------
-- [3] CARGA DE DADOS
-- Consultar o script do tema do grupo e colocar aqui os comandos 
-- Identificar quem redigiu os comandos INSERT e UPDATE
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('555.444.333-66', 'Boris Lukic', '1980-02-15');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('454.545.676-76', 'Trintan Monteiro', '1991-10-10');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('646.656.666-67', 'Salvatore', '1987-07-16');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('747.757.767-77', 'Gregorio Igorovich', '1977-03-11');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('242.252.262-27', 'Juarez Pontes', '1987-04-14');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('750.123.458-98', 'Mr. William Crothers', '1997-05-06');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('350.183.458-98', 'Mr. Tannous', '1997-05-06');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('550.183.478-22', 'Mr. Ivan', '1997-05-06');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('150.183.458-98', 'Mr. Herbert', '1997-05-06');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('950.183.451-00', 'Mr. Joseph Charles', '1997-05-06');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('780.123.458-98', 'Mr. Samuel', '1997-05-06');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('987.183.120-98', 'Mrs. John Murray ', '1997-05-06');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('100.183.458-10', 'Mrs. Edvard Bengtsson', '1997-05-06');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('750.123.458-97', 'Mrs. Washington', '1997-05-06');
INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento) VALUES ('112.183.458-30', 'Mrs. Lucien Philip', '1997-05-06');



INSERT INTO financeiro.projeto (p_datainicio, p_datatermino, p_custo, p_descricao) VALUES (now(), '2026-12-12', 292188.55, 'Cavar um buraco ate o Nucleo da Terra');
INSERT INTO financeiro.projeto (p_datainicio, p_datatermino, p_custo, p_descricao) VALUES (now(), '2026-12-31', 252544.33, 'Pular de paraquedas na lua');
INSERT INTO financeiro.projeto (p_datainicio, p_datatermino, p_custo, p_descricao) VALUES (now(), '2026-08-30', 222966.77, 'Carro movido a carbono');
INSERT INTO financeiro.projeto (p_datainicio, p_datatermino, p_custo)              VALUES (now(), '2026-06-30', 272211.00);
INSERT INTO financeiro.projeto (p_datainicio, p_datatermino, p_custo, p_descricao) VALUES (now(), '2026-06-30', 292455.66, 'Computador Quantico Pessoal');
INSERT INTO financeiro.projeto (p_datainicio, p_datatermino, p_custo, p_descricao) VALUES (now(), '2025-12-12', 103321.00, 'Construir uma escada ate a Lua');
INSERT INTO financeiro.projeto (p_datainicio, p_datatermino, p_custo)              VALUES (now(), '2025-06-30', 4101112.13);
INSERT INTO financeiro.projeto (p_datainicio, p_datatermino, p_custo, p_descricao) VALUES (now(), '2026-06-30', 172407.21, 'Desenvolver cristal magico que cura');
INSERT INTO financeiro.projeto (p_datainicio, p_datatermino, p_custo, p_descricao) VALUES (now(), '2028-04-29', 241830.12, 'Restaurar o coliseu');
INSERT INTO financeiro.projeto (p_datainicio, p_datatermino, p_custo, p_descricao) VALUES (now(), '2024-09-14', 221925.28, 'Criar algo nao criado');



-- Redigir abaixo 20 INSERTs de financiamentos
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('555.444.333-66', 1, 10000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('454.545.676-76', 2, 20000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('646.656.666-67', 3, 15000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('747.757.767-77', 4, 25000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('242.252.262-27', 5, 12000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('750.123.458-98', 6, 18000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('350.183.458-98', 7, 30000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('550.183.478-22', 8, 11000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('150.183.458-98', 9, 21000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('950.183.451-00', 10, 5000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('780.123.458-98', 1, 22000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('987.183.120-98', 2, 24000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('100.183.458-10', 3, 26000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('750.123.458-97', 4, 28000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('112.183.458-30', 5, 17000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('555.444.333-66', 6, 19000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('454.545.676-76', 7, 32000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('646.656.666-67', 8, 23000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('747.757.767-77', 9, 25000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('242.252.262-27', 10, 27000.00);


-- Redigir abaixo +20 INSERTs de financiamentos
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('750.123.458-98', 1, 21000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('350.183.458-98', 2, 19000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('550.183.478-22', 3, 23000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('150.183.458-98', 4, 25000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('950.183.451-00', 5, 27000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('780.123.458-98', 6, 19000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('987.183.120-98', 7, 16000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('100.183.458-10', 8, 18000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('750.123.458-97', 9, 20000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('112.183.458-30', 10, 22000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('555.444.333-66', 1, 24000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('454.545.676-76', 2, 26000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('646.656.666-67', 3, 28000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('747.757.767-77', 4, 30000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('242.252.262-27', 5, 22000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('750.123.458-98', 6, 20000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('350.183.458-98', 7, 24000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('550.183.478-22', 8, 26000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('150.183.458-98', 9, 28000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('950.183.451-00', 10, 30000.00);



-- Redigir abaixo +20 INSERTs de financiamentos
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('780.123.458-98', 1, 21000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('987.183.120-98', 2, 19000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('100.183.458-10', 3, 23000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('750.123.458-97', 4, 25000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('112.183.458-30', 5, 27000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('555.444.333-66', 6, 19000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('454.545.676-76', 7, 16000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('646.656.666-67', 8, 18000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('747.757.767-77', 9, 20000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('242.252.262-27', 10, 22000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('750.123.458-98', 1, 24000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('350.183.458-98', 2, 26000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('550.183.478-22', 3, 28000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('150.183.458-98', 4, 30000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('950.183.451-00', 5, 22000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('780.123.458-98', 6, 20000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('987.183.120-98', 7, 24000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('100.183.458-10', 8, 26000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('750.123.458-97', 9, 28000.00);
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('112.183.458-30', 10, 30000.00);



-- -----------------------
-- [4] CONSULTAS
-- Alem do comando SELECT correspondente, fornecer o que se pede

-- [4.1] Listagem
-- Usar juncao(oes) (JOINs), filtro(s) (WHERE), ordenacao (ORDER BY)
-- Enunciado: Listar todos os investidores e o total de valores investidos em seus projetos, ordenando por nome do investidor.
-- Importancia na aplicacao: Fornece uma visão clara dos investidores mais ativos e seus investimentos.
-- Usuario(s) atendido(s): Analista
SELECT i.i_nome, sum(f_valor) AS total_investido
FROM financeiro.investidor i
JOIN financeiro.financiamento f ON i.i_cpf = f.f_investidor
GROUP BY i.i_nome
ORDER BY i.i_nome ASC;



-- [4.2] Relatorio
-- Usar juncao(oes) (JOINs), filtro(s) (WHERE), agrupamento (GROUP BY) e funcao de agregacao (count, sum, avg, etc)
-- Enunciado: Calcular o valor médio dos financiamentos por projeto, mostrando o número do projeto, a descrição do projeto, a média dos valores investidos e o número de investidores. Utilizando junções, filtro, agrupamento e função de agregação.
-- Importancia na aplicacao: Ajuda a identificar projetos com maiores ou menores aportes financeiros e a quantidade de investidores envolvidos.
-- Usuario(s) atendido(s): Analista
SELECT p.p_numero, p.p_descricao, COUNT(f.f_investidor) AS numero_investidores, AVG(f.f_valor) AS media_investida
FROM financeiro.projeto p
JOIN financeiro.financiamento f ON p.p_numero = f.f_projeto
WHERE f.f_valor > 0
GROUP BY p.p_numero, p.p_descricao
ORDER BY p.p_numero;




-- -------------------------
-- [5] VISOES


-- [5.1] Visao
-- A visao deve ter, no minimo, as caracteristicas de 4.1
-- Enunciado: Mostrar o nome de cada pessoa assim como a quantidade de parcelas investidas e o total dessas parcelas
-- Importancia na aplicacao: Com essa view a consulta à quantidade de investimentos de cada investidor é facilitada
-- Usuario(s) atendido(s): Analista


CREATE VIEW info_investidores AS
SELECT i.i_nome AS nome, sum(f_valor) AS total_investido, count(f.f_projeto) AS parcelas
FROM financeiro.investidor i
LEFT JOIN financeiro.financiamento f ON i.i_cpf = f.f_investidor
GROUP BY i.i_nome, i.i_cpf
ORDER BY i.i_nome ASC;


-- [5.2] Consulta na visao
-- Consultar a visao criada em 5.1 realizando filtro(s) (WHERE)
-- Enunciado: Retorna quais os investidores que investiram mais de 90000.00 na empresa para explicitar quais são os investidores mais fortes
-- Importancia na aplicacao: Um analista de dados pode escolher melhores candidados a continuar aplicando dinheiro na empresa para aumentar o capital dela
-- Usuario(s) atendido(s): Analista

SELECT * FROM info_investidores
WHERE total_investido >= 90000
ORDER BY total_investido DESC;

-- [5.3] Visao materializada
-- A visao deve ter, no minimo, as caracteristicas de 4.2
-- Enunciado: Com essa materialized view, é possível ver quais são os investimentos disponíveis e quantos investidores ele possui, assim como a média dos valores investidos e o total desse valor
-- Importancia na aplicacao: Com essa informações, um novo investidor pode tomar uma decisão melhor assistida e direcionada
-- Usuario(s) atendido(s): Cliente


CREATE MATERIALIZED VIEW info_investimento AS
SELECT p.p_numero, p.p_descricao, COUNT(f.f_investidor) AS numero_investidores, AVG(f.f_valor) AS media_investida, sum(f.f_valor) AS total_investido
FROM financeiro.projeto p
JOIN financeiro.financiamento f ON p.p_numero = f.f_projeto
WHERE f.f_valor > 0
GROUP BY p.p_numero, p.p_descricao
ORDER BY p.p_numero;


-- [5.4] Consulta na visao materializada
-- Consultar a visao materializada criada realizando filtro(s) (WHERE)
-- Enunciado: Retorna os investimentos relacionados à lua, seu número, média investida e total investido
-- Importancia na aplicacao: Com essas informações, um investidor entusiasta da Lua pode escolher qual investimento colocar seu dinheiro
-- Usuario(s) atendido(s): Cliente

SELECT * FROM info_investimento
WHERE p_descricao ILIKE '%lua%';


-- [5.5] Atualizacao da visao materializada
-- Comente brevemente sobre a necessidade de atualizacao e qual seria a frequencia/periodicidade
-- Redija o comando REFRESH correspondente

-- Resposta: Como a materialized view cria uma tabela, os seus valores precisam ser atualizandos de tempos em tempos através do comando refresh,
-- sua frequencia de atualização deve ser entre 5 à 30 minutos dependendo da quantidade de dados inseridos, pois o PostgreSQL não a faz de maneira automática

REFRESH MATERIALIZED VIEW info_investimento;

-- ---------------------------------------------
-- [6] DESEMPENHO DO PROCESSAMENTO DAS CONSULTAS
-- Primeiro analise o desempenho das suas consultas 4.1., 4.2, 5.2 e 5.4, verificando custo e tempo das operacoes
-- Depois de analisa-las, comente a necessidade da criacao ou nao de um indice e justifique a escolha pelo tipo de indice.
-- Selecione uma dentre essas consultas (a mais importante delas) e apresente aquilo que se pede abaixo.

-- Consulta 4.1
EXPLAIN ANALYZE
SELECT i.i_nome, sum(f.f_valor) AS total_investido
FROM financeiro.investidor i
JOIN financeiro.financiamento f ON i.i_cpf = f.f_investidor
GROUP BY i.i_nome
ORDER BY i.i_nome ASC;
-- Criar índicies pode melhorar o desempenho pois as tabelas envolvidas são grandes e a consulta realiza uma junção e agregação que podem ser otimizadas com os indices
-- Criar indices nas colunas "financiamento.f_projeto" e "projeto.p_numero" pode acelerar a operação de junção

CREATE INDEX idx_financiamento_projeto ON financeiro.financiamento(f_projeto);
CREATE INDEX idx_projeto_numero ON financeiro.projeto(p_numero);

-- Consulta 4.2
EXPLAIN ANALYZE 
SELECT p.p_numero, p.p_descricao, COUNT(f.f_investidor) AS numero_investidores, AVG(f.f_valor) AS media_investida
FROM financeiro.projeto p
JOIN financeiro.financiamento f ON p.p_numero = f.f_projeto
WHERE f.f_valor > 0
GROUP BY p.p_numero, p.p_descricao
ORDER BY p.p_numero;
-- Não necessita de indices

-- Consulta 5.2
EXPLAIN ANALYZE 
SELECT * FROM info_investidores
WHERE total_investido >= 90000
ORDER BY total_investido DESC;
-- Criar um indice pode melhorar o desempenho, principalmente na filtragem e ordenação dos resultados
-- Criar um índice na coluna total_investido permite que o banco de dados encontre rapidamente os investidores que atendem ao critério de filtro e ordene melhor os resultados 
CREATE INDEX idx_financiamento_valor ON financeiro.financiamento(f_valor);

-- Consulta 5.4
EXPLAIN ANALYZE 
SELECT * FROM info_investimento
WHERE p_descricao ILIKE '%lua%';
-- Criar um índice para busca de texto pode melhorar o desempenho
-- Criar um índice GIN ou GiST com operadores trgm é adequada para buscas de texto que envolvem padrões, como o ILIKE '%lua%'
-- Esses índices são otimizados para operações de texto com correspondência de padrões e são mais eficientes para consultas que envolvem comparação de strings
CREATE EXTENSION IF NOT EXISTS pg_trgm; -- pg_trgm (busca por trigramas)
CREATE INDEX idx_investidor_nome_trgm ON financeiro.investidor USING GIN (i_nome gin_trgm_ops);


-- [6.1] EXPLAIN 
-- Sort  (cost=48.54..49.04 rows=200 width=250)
--   Sort Key: i.i_nome
--   ->  HashAggregate  (cost=38.40..40.90 rows=200 width=250)
--         Group Key: i.i_nome
--         ->  Hash Join  (cost=15.85..34.85 rows=710 width=236)
--               Hash Cond: (f.f_investidor = i.i_cpf)
--               ->  Seq Scan on financiamento f  (cost=0.00..17.10 rows=710 width=78)
--               ->  Hash  (cost=12.60..12.60 rows=260 width=278)
--                     ->  Seq Scan on investidor i  (cost=0.00..12.60 rows=260 width=278)

-- (9 rows)

-- Sort: Ordena os resultados pela coluna i.i_nome (custo estimado: 48.54..49.04).
-- HashAggregate: Realiza a agregação dos resultados agrupados pela coluna i.i_nome (custo estimado: 38.40..40.90).
-- Hash Join: Executa a junção entre as tabelas financiamento e investidor usando uma junção de hash (custo estimado: 15.85..34.85).
-- Seq Scan on financiamento f: Realiza uma varredura sequencial na tabela financiamento (custo estimado: 0.00..17.10).
-- Seq Scan on investidor i: Realiza uma varredura sequencial na tabela investidor (custo estimado: 0.00..12.60).

-- [6.2] EXPLAIN ANALYZE
-- Sort  (cost=48.54..49.04 rows=200 width=250) (actual time=0.079..0.081 rows=15 loops=1)
--    Sort Key: i.i_nome
--    Sort Method: quicksort  Memory: 26kB
 --   ->  HashAggregate  (cost=38.40..40.90 rows=200 width=250) (actual time=0.060..0.065 rows=15 loops=1)
 --         Group Key: i.i_nome
 --         Batches: 1  Memory Usage: 40kB
 --         ->  Hash Join  (cost=15.85..34.85 rows=710 width=236) (actual time=0.020..0.038 rows=60 loops=1)
  --              Hash Cond: (f.f_investidor = i.i_cpf)
 --               ->  Seq Scan on financiamento f  (cost=0.00..17.10 rows=710 width=78) (actual time=0.004..0.008 rows=60 loops=1)
 --               ->  Hash  (cost=12.60..12.60 rows=260 width=278) (actual time=0.009..0.010 rows=15 loops=1)
--                      Buckets: 1024  Batches: 1  Memory Usage: 9kB
 --                     ->  Seq Scan on investidor i  (cost=0.00..12.60 rows=260 width=278) (actual time=0.003..0.005 rows=15 loops=1)
 -- Planning Time: 0.095 ms
 -- Execution Time: 0.111 ms
--  (14 rows)



-- Sort: Ordena os resultados pela coluna i.i_nome (tempo real: 0.079..0.081 ms, 15 linhas processadas).
-- HashAggregate: Realiza a agregação dos resultados agrupados pela coluna i.i_nome (tempo real: 0.060..0.065 ms, 15 linhas processadas).
-- Hash Join: Executa a junção entre as tabelas financiamento e investidor (tempo real: 0.020..0.038 ms, 60 linhas processadas).
-- Seq Scan on financiamento f: Varredura sequencial na tabela financiamento (tempo real: 0.004..0.008 ms, 60 linhas processadas).
-- Seq Scan on investidor i: Varredura sequencial na tabela investidor (tempo real: 0.003..0.005 ms, 15 linhas processadas).
-- Tempo Total de Execução: 0.111 ms


-- [6.3] Comentarios e justificativas para o indice 
-- Considerar custo e tempo das operacoes, por exemplo
-- O plano mostra que a consulta utiliza uma junção de hash entre as tabelas financiamento e investidor.
-- Ambas as tabelas estão sendo lidas sequencialmente (Seq Scan), o que pode ser um ponto de melhoria.
-- A operação de Hash Join é eficiente para junções, mas o custo pode ser reduzido se as tabelas envolvidas tiverem índices adequados.
-- O tempo total de execução da consulta é muito baixo (0.111 ms), indicando que, a consulta é rápida. 

-- [6.4] CREATE INDEX e PARAMETROS (Set)
-- Crie o indice, verifique se o indice ja esta sendo usado no processamento da consulta e, caso nao esteja, ajuste os parametros
-- Criação de índice na tabela financiamento para a coluna f_investidor
CREATE INDEX idx_financiamento_investidor ON financeiro.financiamento(f_investidor);

-- Criação de índice na tabela investidor para a coluna i_cpf
CREATE INDEX idx_investidor_cpf ON financeiro.investidor(i_cpf);

-- Verificando se o indice está realmente sendo usado:
EXPLAIN ANALYZE
SELECT * FROM financeiro.financiamento WHERE f_investidor = '555.444.333-66';

EXPLAIN ANALYZE
SELECT * FROM financeiro.investidor WHERE i_cpf = '555.444.333-66';
-- OBS: Por possuir uma baixa quantidade de dados, o SQL preferiu fazer uma busca sequencial ao inves de usar o Index, sendo assim, utilizamos:
-- SET enable_seqscan = OFF;
-- para forçar o a utilziar o index e depois ativamos novamente.

-- ---------------------------------------------
-- [7] STORED PROCEDURE
-- Vislumbrar a criacao de um procedimento armazenado para o banco de dados.
-- Comentar a utilidade do procedimento na aplicacao.
-- Redigir o comando CREATE OR REPLACE PROCEDURE correspondente usando PL/pgSQL.
-- Redigir um comando SQL que chame o procedimento, explicando o que sua chamada faz.
-- O procedimento devera' ter parametro(s).

-- O procedimento armazenado serve para adicionar um novo financiamento para um investidor em um projeto. 
--Esse procedimento verificará se o valor do financiamento não ultrapassa um limite definido antes de realizar a inserção.
CREATE OR REPLACE PROCEDURE financeiro.add_financiamento(
    IN cpf_investidor CHAR(14),
    IN numero_projeto INT,
    IN valor_financiamento DECIMAL(15, 2),
    IN nome_investidor VARCHAR(100),
    IN data_nascimento DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Verifica se o investidor já existe
    IF NOT EXISTS (SELECT 1 FROM financeiro.investidor WHERE i_cpf = cpf_investidor) THEN
        -- Insere o investidor se não existir
        INSERT INTO financeiro.investidor (i_cpf, i_nome, i_datanascimento)
        VALUES (cpf_investidor, nome_investidor, data_nascimento);
    END IF;

    -- Verifica se o valor do financiamento é menor ou igual a 100.000,00
    IF valor_financiamento > 100000.00 THEN
        RAISE EXCEPTION 'O valor do financiamento não pode ultrapassar 100.000,00';
    END IF;
    
    -- Insere o financiamento na tabela financiamento
    INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor)
    VALUES (cpf_investidor, numero_projeto, valor_financiamento);
    
    -- Confirma a inserção
    RAISE NOTICE 'Financiamento adicionado com sucesso.';
END;
$$;




-- A chamada insere um novo financiamento de R$ 50.000,00 para o investidor com CPF 123.456.789-10 no projeto de número 1. 
-- Se o valor do financiamento ultrapassar R$ 100.000,00, a inserção será abortada e uma exceção será lançada.

CALL financeiro.add_financiamento('123.456.789-10', 1, 50000.00, 'João Silva', '1980-05-20');



-- Realizar a criacao dos itens do procedimento armazenado adequadamente, tais como
-- parametros, variaveis locais, tipo(s) de retorno, linguagem usada, blocos, estruturas de controle (decisao e repeticao)
-- 




-- ---------------------------------------------
-- [8] USER-DEFINED FUNCTION (UDF)
-- Vislumbrar a criacao de uma funcao (UDF) para o banco de dados.
-- Comentar a utilidade da funcao na aplicacao.
-- Redigir o comando CREATE OR REPLACE FUNCTION correspondente usando PL/pgSQL.
-- Redigir um comando SQL que chame a funcao, explicando o que sua chamada faz.
-- A funcao devera' ter parametro(s).


-- Calcular o total investido por um determinado investidor em todos os projetos.
CREATE OR REPLACE FUNCTION financeiro.total_investido_por_investidor(
    cpf_investidor CHAR(14)
)
RETURNS DECIMAL(15, 2)
LANGUAGE plpgsql
AS $$
DECLARE
    total_investido DECIMAL(15, 2);
BEGIN
    -- Calcula o total investido pelo investidor em todos os projetos
    SELECT SUM(f_valor) INTO total_investido
    FROM financeiro.financiamento
    WHERE f_investidor = cpf_investidor;
    
    -- Retorna o valor total investido
    RETURN COALESCE(total_investido, 0);
END;
$$;


-- A chamada abaixo executa a função total_investido_por_investidor, passando o CPF 123.456.789-10 como argumento. 
-- A função retornará o valor total investido por esse investidor em todos os projetos nos quais ele participou. 
-- Se o investidor não tiver feito nenhum investimento, a função retornará 0.
SELECT financeiro.total_investido_por_investidor('123.456.789-10');


-- ---------------------------------------------
-- [9] -- [9]: aguardar as orientacoes futuras
-- ---------------------------------------------

-- [10] TRIGGER
-- Revisar as aplicacoes em potencial para bancos de dados ativos (e gatilhos).
-- Vislumbrar a criacao de um gatilho e de uma funcao engatilhada para o banco de dados.
-- Se necessario redigir logo abaixo outros comandos SQL necessarios (criacao de coluna, atualizacao de tuplas etc):


-- [10.1] ROW
-- Um gatilho em nível de tupla (row-level trigger) é útil para monitorar ou validar mudanças em cada linha de uma tabela. 
-- Por exemplo, pode ser usado para garantir que certas regras sejam seguidas ao inserir ou atualizar dados, como verificar 
-- limites de valores ou ajustar automaticamente dados relacionados.

-- Redigir o comando CREATE OR REPLACE FUNCTION correspondente usando PL/pgSQL
CREATE OR REPLACE FUNCTION financeiro.check_investimento_limite()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    total_investido DECIMAL(15, 2);
BEGIN
    -- Calcula o total já investido pelo investidor no projeto específico
    SELECT SUM(f_valor) INTO total_investido
    FROM financeiro.financiamento
    WHERE f_investidor = NEW.f_investidor AND f_projeto = NEW.f_projeto;
    
    -- Verifica se a soma com o novo valor ultrapassaria o limite
    IF total_investido + NEW.f_valor > 200000.00 THEN
        RAISE EXCEPTION 'O valor total investido no projeto já ultrapassou o limite de 200.000,00';
    END IF;
    
    -- Permite a inserção ou atualização
    RETURN NEW;
END;
$$;

-- Redigir o comando CREATE TRIGGER correspondente ao gatilho em nivel de tupla usando PL/pgSQL
CREATE TRIGGER trg_check_investimento_limite
BEFORE INSERT OR UPDATE ON financeiro.financiamento
FOR EACH ROW
EXECUTE FUNCTION financeiro.check_investimento_limite();



-- Redigir pelo menos 1 comando SQL que dispare o gatilho em nivel de tupla
INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor)
VALUES ('123.456.789-10', 1, 500000.00);
-- Descrever o que acontece no banco de dados quando e' disparado:

-- Quando o comando INSERT acima é executado, o gatilho trg_check_investimento_limite será acionado antes da inserção. 
-- A função associada calculará o total já investido por esse investidor no projeto 1. Se o total, incluindo o novo valor, ultrapassar R$ 200.000,00, 
-- o gatilho impedirá a inserção e lançará uma exceção. Se não ultrapassar, a inserção será permitida.

-- Se necessario para executar os comandos seguintes, remover o gatilho de 10.1 abaixo:
-- DROP TRIGGER trg_check_investimento_limite ON financeiro.financiamento;

-- [10.2] STATEMENT
-- Comentar aqui a utilidade, para a aplicacao, do gatilho em nivel de sentenca e da sua funcao engatilhada.:

-- Um gatilho em nível de sentença (statement-level trigger) é útil para operações que precisam ser realizadas 
-- uma única vez após uma operação DML (como INSERT, UPDATE ou DELETE) em toda a tabela, em vez de para cada linha afetada
CREATE OR REPLACE FUNCTION financeiro.log_update_count()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    -- Registra o número de linhas afetadas no log
    INSERT INTO financeiro.log (operation, row_count, operation_time)
    VALUES ('UPDATE', TG_NARGS, CURRENT_TIMESTAMP);
    
    -- Continua com a operação
    RETURN NULL;
END;
$$;



-- Redigir o comando CREATE TRIGGER correspondente ao gatilho em nivel de sentenca usando PL/pgSQL
CREATE TRIGGER trg_log_update_count
AFTER UPDATE ON financeiro.financiamento
FOR EACH STATEMENT
EXECUTE FUNCTION financeiro.log_update_count();

-- Redigir pelo menos 1 comando SQL que dispare o gatilho em nivel de sentenca
-- Descrever o que acontece no banco de dados quando e' disparado
UPDATE financeiro.financiamento
SET f_valor = f_valor * 1.05;


-- Quando o comando UPDATE acima é executado, o gatilho trg_log_update_count será acionado após a execução da atualização.
-- A função associada inserirá um registro no log, indicando que uma operação de UPDATE foi realizada e quantas linhas foram afetadas. 

-- ---------------------------------------------
-- [11] SEGURANCA




-- [11.1] ACESSO REMOTO (pg_hba.conf)
-- Cole nas linhas abaixo o conteudo do arquivo pg_hba.conf que o servidor deve conter, iniciando cada linha com comentario '--' (para nao impedir a execucao desse script); apague esta linha
-- # TYPE  DATABASE        USER            ADDRESS                 METHOD
-- host    all             all             127.0.0.1/32            scram-sha-256

-- [11.2] PAPEIS (Roles)
-- Criar papeis de usuarios e de grupo(s)
-- Nessa criacao, considerar tanto papeis da equipe (administracao/desenvolvimento) quanto papeis de usuarios da aplicacao
-- Para cada papel criado adicionar um comentario antes explicando qual e' a utilidade dele na aplicacao

-- Papel: Administrador
-- Função: Administrador do banco de dados, responsável por criar e gerenciar objetos no esquema financeiro.
CREATE ROLE adm_financeiro LOGIN PASSWORD 'senha_segura' CREATEDB CREATEROLE;

-- Papel: Analista
-- Função: Analista de dados, responsável por executar consultas e gerar relatórios.
CREATE ROLE analista_financeiro LOGIN PASSWORD 'senha_segura';

-- Papel: Cliente
-- Função: Usuário da aplicação, com acesso restrito para inserção e atualização de dados.
CREATE ROLE cliente_financeiro LOGIN PASSWORD 'senha_segura';


-- [11.3] PRIVILEGIOS DE ACESSO (Grant)

-- [11.3.1]
-- Assegurar os privilegios necessarios para o(s) papel(is) poder(em) criar o(s) esquema(s) da Secao 1
-- Usuario(s) que podem conceder esse acesso alem do superusuario: Administrador
GRANT CREATE ON DATABASE projeto TO adm_financeiro;


-- [11.3.2]
-- Assegurar os privilegios necessarios para o(s) papel(is) poder(em) criar a(s) tabela(s), as sequencias e as restricoes da Secao 2 e as visoes da Secao 5
-- Usuario(s) que podem conceder esse acesso alem do superusuario: Administrador
GRANT CREATE ON SCHEMA financeiro TO analista_financeiro, adm_financeiro;
GRANT USAGE, SELECT ON SEQUENCE financeiro.investidor_i_id_seq TO adm_financeiro;
GRANT USAGE, SELECT ON SEQUENCE financeiro.financiamento_f_id_seq TO adm_financeiro;
GRANT USAGE, SELECT ON SEQUENCE financeiro.projeto_p_numero_seq TO analista_financeiro;
GRANT UPDATE ON SEQUENCE financeiro.investidor_i_id_seq TO adm_financeiro;
GRANT UPDATE ON SEQUENCE financeiro.investidor_i_id_seq TO analista_financeiro;

-- [11.3.3]
-- Assegurar os privilegios necessarios para o(s) papel(is) poder(em) inserir e atualizar tuplas, conforme a Secao 3
-- Usuario(s) que podem conceder esse acesso alem do superusuario: cliente
GRANT INSERT, UPDATE ON ALL TABLES IN SCHEMA financeiro TO cliente_financeiro, adm_financeiro;
GRANT INSERT ON TABLE financeiro.projeto TO analista_financeiro;


-- [11.3.4]
-- Assegurar os privilegios necessarios para o(s) papel(is) poder(em) executar as consultas das Secoes 4 e 5
-- Usuario(s) que podem conceder esse acesso alem do superusuario: Administrador
GRANT SELECT ON ALL TABLES IN SCHEMA financeiro TO analista_financeiro, adm_financeiro;

-- [11.3.5]
-- Assegurar os privilegios necessarios para o(s) papel(is) poder(em) executar os comandos da Secao 7
-- Usuario(s) que podem conceder esse acesso alem do superusuario: Administrador
GRANT EXECUTE ON PROCEDURE financeiro.add_financiamento TO adm_financeiro;
GRANT CREATE, USAGE ON SCHEMA financeiro TO adm_financeiro;


-- [11.3.6] 
-- Assegurar os privilegios necessarios para o(s) papel(is) poder(em) executar o que constara' futuramente nas Secoes 8, 9 e 10
GRANT USAGE ON SCHEMA financeiro TO analista_financeiro, adm_financeiro;





-- [11.4] PRIVILEGIOS DE ACESSO (Revoke)

-- [11.4.1]
-- Revogar o acesso em 11.3.1 de pelo menos 1 papel
-- Usuario(s) que podem revogar esse acesso alem do superusuario: Administrador
REVOKE CREATE ON DATABASE projeto FROM cliente_financeiro;

-- [11.4.2]
-- Revogar o acesso em 11.3.2 de pelo menos 1 papel
-- Usuario(s) que podem revogar esse acesso alem do superusuario: Administrador
REVOKE CREATE ON SCHEMA financeiro FROM analista_financeiro, adm_financeiro;

REVOKE USAGE, SELECT ON SEQUENCE financeiro.investidor_i_id_seq FROM adm_financeiro;

REVOKE USAGE, SELECT ON SEQUENCE financeiro.financiamento_f_id_seq FROM adm_financeiro;

REVOKE USAGE, SELECT ON SEQUENCE financeiro.projeto_p_numero_seq FROM analista_financeiro;

REVOKE UPDATE ON SEQUENCE financeiro.investidor_i_id_seq FROM adm_financeiro;

REVOKE UPDATE ON SEQUENCE financeiro.investidor_i_id_seq FROM analista_financeiro;

-- [11.4.3]
-- Revogar o acesso em 11.3.3 de pelo menos 1 papel
-- Usuario(s) que podem revogar esse acesso alem do superusuario: Administrador
REVOKE INSERT ON ALL TABLES IN SCHEMA financeiro FROM cliente_financeiro;
REVOKE UPDATE ON ALL TABLES IN SCHEMA financeiro FROM cliente_financeiro;

-- [11.4.4]
-- Revogar o acesso em 11.3.4 de pelo menos 1 papel
-- Usuario(s) que podem revogar esse acesso alem do superusuario: Administrador
REVOKE SELECT ON ALL TABLES IN SCHEMA financeiro FROM analista_financeiro;

-- [11.4.5]
-- Revogar o acesso em 11.3.5 de pelo menos 1 papel
-- Usuario(s) que podem revogar esse acesso alem do superusuario: Administrador
REVOKE EXECUTE ON PROCEDURE financeiro.add_financiamento FROM adm_financeiro;
REVOKE CREATE, USAGE ON SCHEMA financeiro FROM adm_financeiro;

-- [11.4.6]
-- Revogar o acesso em 11.3.6 de pelo menos 1 papel
-- Usuario(s) que podem revogar esse acesso alem do superusuario: Administrador
REVOKE USAGE ON SCHEMA financeiro FROM analista_financeiro;


-- Se for necessario para executar os comandos seguintes, assegure novamente os privilegios de acesso revogados acima
-- [11.3.1]

GRANT CREATE ON DATABASE projeto TO adm_financeiro;
-- [11.3.2]
GRANT CREATE ON SCHEMA financeiro TO analista_financeiro, adm_financeiro;
GRANT USAGE, SELECT ON SEQUENCE financeiro.investidor_i_id_seq TO adm_financeiro;
GRANT USAGE, SELECT ON SEQUENCE financeiro.financiamento_f_id_seq TO adm_financeiro;
GRANT USAGE, SELECT ON SEQUENCE financeiro.projeto_p_numero_seq TO analista_financeiro;
GRANT UPDATE ON SEQUENCE financeiro.investidor_i_id_seq TO adm_financeiro;
GRANT UPDATE ON SEQUENCE financeiro.investidor_i_id_seq TO analista_financeiro;
-- [11.3.3]
GRANT INSERT, UPDATE ON ALL TABLES IN SCHEMA financeiro TO cliente_financeiro, adm_financeiro;
GRANT INSERT ON TABLE financeiro.projeto TO analista_financeiro;
-- [11.3.4]
GRANT SELECT ON ALL TABLES IN SCHEMA financeiro TO analista_financeiro, adm_financeiro;
-- [11.3.5]
GRANT EXECUTE ON PROCEDURE financeiro.add_financiamento TO adm_financeiro;
GRANT CREATE, USAGE ON SCHEMA financeiro TO adm_financeiro;
-- [11.3.6] 
GRANT USAGE ON SCHEMA financeiro TO analista_financeiro, adm_financeiro;


-- ---------------------------------------------
-- [12] TRANSACOES
-- Nao incluir aqui
-- Usar/entregar o modelo proprio para esse topico
/*
adm
1 BEGIN TRANSACTION;	

2 INSERT INTO financeiro.investidor VALUES ('122.456.789-10', 'Alice', '1985-07-20');
3 INSERT INTO financeiro.financiamento (f_investidor, f_projeto, f_valor) VALUES ('123.456.789-10', 1, 5000);
4 COMMIT;	

5 SELECT * FROM financeiro.financiamento;	
-----------------------------
analista
1 BEGIN TRANSACTION;	

2 INSERT INTO financeiro.projeto (p_datainicio, p_datatermino, p_custo, p_descricao) VALUES ('2024-01-01', '2024-12-31', 10000, 'Novo Projeto');

3 SELECT * FROM financeiro.projeto;

4 COMMIT;


5 SELECT * FROM financeiro.investidor;
*/
-- Realizar teste de inserção novamente:
/*
DROP DATABASE projeto;
DROP SCHEMA financeiro CASCADE;
DROP ROLE adm_financeiro;
DROP ROLE analista_financeiro;
DROP ROLE cliente_financeiro;
*/