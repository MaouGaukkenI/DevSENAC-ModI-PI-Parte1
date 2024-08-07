USE atividade_anual;

ALTER TABLE `atividade_anual`.`usuario` 
RENAME TO  `atividade_anual`.`usuarios`;

CREATE USER 'Leitor'@'localhost' IDENTIFIED BY 'SistenDefault';
GRANT SELECT ON atividade_anual.* TO 'Leitor'@'localhost';
FLUSH PRIVILEGES;
CREATE USER 'Criador'@'localhost' IDENTIFIED BY 'SistenDefault';
GRANT SELECT ON atividade_anual.* TO 'Criador'@'localhost';
GRANT INSERT ON atividade_anual.dados TO 'Criador'@'localhost';
GRANT INSERT ON atividade_anual.usuarios TO 'Criador'@'localhost';
FLUSH PRIVILEGES;
CREATE USER 'Editor'@'localhost' IDENTIFIED BY 'SistenDefault';
GRANT SELECT ON atividade_anual.* TO 'Editor'@'localhost';
GRANT UPDATE ON atividade_anual.dados TO 'Editor'@'localhost';
GRANT DELETE ON atividade_anual.historico TO 'Editor'@'localhost';
FLUSH PRIVILEGES;

DELIMITER //
CREATE TRIGGER senha_md5
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
    SET NEW.senha = MD5(NEW.senha);
END //
DELIMITER ;



