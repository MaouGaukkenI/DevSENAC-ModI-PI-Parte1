USE Atividade_anual;

INSERT INTO usuario (id, nome, nome_usuario, data_nascimento, email, senha) VALUES
(1, 'Carlos', 'Carlin123', '2006-04-15', 'Carlosgamer@gmail.com', 'Carlota3030'),
(2, 'Helena', 'leninha2020', '2003-06-28', 'leninha2020@gmail.com', '20030608'),
(3, 'Maicon', 'Mike', '2002-07-15', 'trashplay12@gmail.com', '9080mike'),
(4, 'Sophia', 'sophy', '1980-10-19', 'sophisinha1111@gmail.com', 'mangas1289'),
(5, 'Bruna', 'brubru123', '2006-09-30', 'Carlosgamer@gmail.com', 'Carlota3030'),
(6, 'Milena', 'Mileninha', '1960-04-03', 'Carlosgamer@gmail.com', 'Carlota3030'),
(7, 'Diogo', 'Gaukken__', '1970-12-15', 'Carlosgamer@gmail.com', 'Carlota3030'),
(8, 'Kristili', 'Kris3030', '1990-07-15', 'Carlosgamer@gmail.com', 'Carlota3030'),
(9, 'Isane', 'IsaPlay123', '1990-04-30', 'Carlosgamer@gmail.com', 'Carlota3030'),
(10, 'João', 'jão_sedutor', '1991-04-25', 'Carlosgamer@gmail.com', 'Carlota3030');

-- Nesta parte eu tive um problema de limitação a 100 diferentes dados, por conta disso utilizei o ChatGPT para corrigir o problema por que não encontri nenhum tutorial que tratasse desse problema
-- Obviamen, estudei essa extrutura que ele criou para entender como foi feita, e puz a explicação de cada etapa conforme ele explicou.

-- Crie uma tabela temporária com um número suficiente de registros

ALTER TABLE dados AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS sequencia;
CREATE TEMPORARY TABLE sequencia AS
  SELECT a.num + (b.num * 10) + (c.num * 100) + (d.num * 1000) + (e.num * 10000) + (f.num * 100000) AS num
  FROM
    (SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS a,
    (SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS b,
    (SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS c,
    (SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS d,
    (SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS e,
    (SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS f;
-- para expandir o limite maximo de registros basta: 
-- SELECT a.num + (b.num * 10) + (c.num * 100) + (d.num * 1000) + (e.num * 10000) + (f.num * 100000) + (g.num * 1000000) +...  AS num (cada expansão se trata de adicionar mais um 0 no multiplicador) e depois:
-- 		(SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS a,
-- 		(SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS b,
-- 		(SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS c,
-- 		(SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS d,
-- 		(SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS e,
-- 		(SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS f;
-- 		(SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS g;
-- 		...

-- Obtenha o último ID da tabela dados
SET @ultimo_id = (SELECT MAX(id) FROM dados);

-- Gere os dados usando a tabela sequencia
INSERT INTO dados (id, titulo, prioridade, descricao, status, data_inicio, data_vencimento, id_usuario)
SELECT
  (@ultimo_id := @ultimo_id + 1) AS id,
  CONCAT('Tarefa ', s.num) AS titulo,
  FLOOR(RAND() * 3) + 1 AS prioridade,
  CONCAT('Descrição da tarefa ', s.num) AS descricao,
  FLOOR(RAND() + 0.5) AS status,
  DATE_ADD('2023-06-01', INTERVAL FLOOR(RAND() * 20) DAY) AS data_inicio,
  DATE_ADD(DATE_ADD('2023-06-01', INTERVAL FLOOR(RAND() * (DATEDIFF('2023-06-30', '2023-06-01') - 1)) + 1 DAY), INTERVAL FLOOR(RAND() * (DATEDIFF('2023-06-30', '2023-06-01')) + 1) DAY) AS data_vencimento,
  FLOOR(RAND() * 10) + 1 AS id_usuario
FROM sequencia s
LIMIT 100; -- Altere esse valor para o número desejado de dados OBS: o numero maximo que eu defini é; 1.000.000 favor não olocar valor maior, risco do sistema travar.

-- Obtenha o novo valor inicial do AUTO_INCREMENT
SET @novo_auto_increment = (SELECT MAX(id) + 1 FROM dados);

-- Crie uma variável para armazenar o comando ALTER TABLE
SET @alter_table_cmd = CONCAT('ALTER TABLE dados AUTO_INCREMENT = ', @novo_auto_increment);

-- Execute o comando ALTER TABLE
PREPARE stmt FROM @alter_table_cmd;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Limpeza: exclua a tabela temporária
DROP TABLE IF EXISTS sequencia;

-- Aqui estamos conciderando que o dia atual é '2023-07-01'

INSERT INTO tarefas SELECT
	id,
	id AS id_dados
FROM dados
WHERE status = 0 AND data_vencimento >= '2023-07-01';

INSERT INTO historico SELECT
	id,
	id AS id_dados,
    CASE
        WHEN data_vencimento <= '2023-06-30' THEN data_vencimento
        WHEN data_vencimento > '2023-06-30' AND status = 1 THEN '2023-06-30'
        ELSE NULL
    END AS data_fim,   
    DATEDIFF(
        CASE
            WHEN data_vencimento <= '2023-06-30' THEN data_vencimento
            WHEN data_vencimento > '2023-06-30' AND status = 1 THEN '2023-06-30'
            ELSE NULL
        END,
        data_inicio
    ) AS tempo_duracao
FROM dados
WHERE status = 1 OR data_vencimento < '2023-07-01';
