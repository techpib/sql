-- Criação da base anotacoes ebd

-- Tabela: usuario
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `idUsuario` BINARY(16) NOT NULL COMMENT 'UUID único do usuário.',
  `nome` VARCHAR(100) NOT NULL COMMENT 'Nome do usuário cadastrado',
  `email` VARCHAR(256) NOT NULL COMMENT 'E-mail do usuário cadastrado',
  `senha` CHAR(32) NOT NULL COMMENT 'Senha MD5 do usuáio cadastrado',
  `dataHoraUltimaAtualizacao` TIMESTAMP NOT NULL COMMENT 'Data e hora da última atualização do registro.',
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idusuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB

-- Tabela: anotacao
CREATE TABLE IF NOT EXISTS `mydb`.`anotacao` (
  `idUsuario` BINARY(16) NOT NULL COMMENT 'UUID único do usuário.',
  `sequencialAnotacao` INT NOT NULL COMMENT 'Sequencial da anotação',
  `Titulo` VARCHAR(100) NULL COMMENT 'Título da anotação',
  `texto` VARCHAR(5000) NULL COMMENT 'Conteúdo da anotação',
  `idStatus` INT NOT NULL COMMENT 'ID do status da anotação',
  `dataHoraUltimaAtualizacao` TIMESTAMP NOT NULL COMMENT 'Data e hora da última atualização do registro.',
  PRIMARY KEY (`idUsuario`, `sequencialAnotacao`),
  INDEX `fk_anotacao_usuario_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_anotacao_status1_idx` (`idStatus` ASC) VISIBLE,
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  UNIQUE INDEX `sequencialAnotacao_UNIQUE` (`sequencialAnotacao` ASC) INVISIBLE,
  UNIQUE INDEX `idStatus_UNIQUE` (`idStatus` ASC) VISIBLE,
  CONSTRAINT `fk_anotacao_usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_anotacao_status1`
    FOREIGN KEY (`idStatus`)
    REFERENCES `mydb`.`status` (`idStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

-- Tabela: status
CREATE TABLE IF NOT EXISTS `mydb`.`status` (
  `idStatus` INT NOT NULL COMMENT 'ID do status da anotação.\n\nEx: 1 - criada;\n      2 - alterada;\n      3 - excluída;\n      4 - a expurgar;',
  `statusAnotacao` VARCHAR(45) NOT NULL COMMENT 'Status da anotação.\n\nEx: 1 - criada;\n      2 - alterada;\n      3 - excluída;\n      4 - a expurgar;',
  `dataHoraUltimaAtualizacao` TIMESTAMP NOT NULL COMMENT 'Data e hora da última atualização do registro.',
  PRIMARY KEY (`idStatus`),
  UNIQUE INDEX `idStatus_UNIQUE` (`idStatus` ASC) VISIBLE)
ENGINE = InnoDB