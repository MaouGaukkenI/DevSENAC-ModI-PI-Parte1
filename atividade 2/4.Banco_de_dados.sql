CREATE DATABASE Atividade_anual;

USE Atividade_anual;

CREATE TABLE Usuario (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `nome_usuario` VARCHAR(45) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE dados (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `prioridade` INT NOT NULL,
  `descricao` LONGTEXT NOT NULL,
  `status` BIT NOT NULL,
  `data_inicio` DATETIME NOT NULL,
  `data_vencimento` DATETIME NOT NULL,
  `id_usuario` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fkUsuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fkUsuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `Atividade_anual`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE tarefas (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `id_dados` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fkDados_tarefas_idx` (`id_dados` ASC) VISIBLE,
  CONSTRAINT `fkDados_tarefas`
    FOREIGN KEY (`id_dados`)
    REFERENCES `Atividade_anual`.`dados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE historico (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `id_dados` BIGINT NOT NULL,
  `data_fim` DATETIME NOT NULL,
  `tempo_duracao` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fkDados_historico_idx` (`id_dados` ASC) VISIBLE,
  CONSTRAINT `fkDados_historico`
    FOREIGN KEY (`id_dados`)
    REFERENCES `Atividade_anual`.`dados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
