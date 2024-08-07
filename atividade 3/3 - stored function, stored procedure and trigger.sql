DELIMITER //
CREATE FUNCTION quantidade_tarefas(nome_Usuario VARCHAR(45)) -- lembrando que nesta função usamos o nome_usuario, e não o nome!
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE resultado INT;
    SET resultado = (
        SELECT COUNT(*) 
        FROM tarefas t
        JOIN dados d ON t.id_dados = d.id
        JOIN usuarios u ON d.id_usuario = u.id
        WHERE u.nome_usuario = nome_Usuario
    );
    RETURN resultado;
END //
DELIMITER ;

-- modificação nescessaria para o funcionamento correto do sistema
ALTER TABLE tarefas
ADD CONSTRAINT fkDados_tarefas FOREIGN KEY (id_dados) REFERENCES dados (id) ON DELETE CASCADE;

DELIMITER //
CREATE PROCEDURE exclusao_tarefas(id_tarefa INT) -- esse comando é pensando numa maneira automatica de exclusão, que é chamada automaticamente quando o usuario precione um bortão (botão de excluir como em apps ja existentes), por isso usei o id para melhor precisão.
BEGIN
    DELETE FROM historico h
    WHERE id_tarefa = h.id_dados;

    DELETE FROM dados d
    WHERE id_tarefa = d.id;
END //
DELIMITER ;
-- o trigger foi criado na atividade anterior, para segurança da senha dos usuarios

