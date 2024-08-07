USE atividade_anual;

CREATE VIEW dados_tarefas AS
SELECT d.titulo, d.descricao,d.prioridade, d.status, d.data_inicio, d.data_vencimento
FROM tarefas t
JOIN dados d
WHERE t.id_dados = d.id;

CREATE VIEW dados_historico AS
SELECT d.titulo, d.descricao,d.prioridade, d.status, d.data_inicio, h.data_fim, h.tempo_duracao
FROM historico h
JOIN dados d
WHERE h.id_dados = d.id;