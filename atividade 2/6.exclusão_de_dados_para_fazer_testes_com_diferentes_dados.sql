USE Atividade_anual;

DELETE FROM alter_table_cmd;

DELETE FROM historico
WHERE id > 0;

DELETE FROM tarefas
WHERE id > 0;

DELETE FROM dados
WHERE id > 0;

DELETE FROM usuario
WHERE id > 0;