
-- -----------------------------------------------------
-- Table    `departamento`
-- -----------------------------------------------------
CREATE TABLE  `departamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  `dh_registro` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table    `marca`
-- -----------------------------------------------------
CREATE TABLE  `marca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `dh_registro` DATETIME NOT NULL,
  PRIMARY KEY (`id`, `dh_registro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table    `calcado_pai`
-- -----------------------------------------------------
CREATE TABLE  `calcado_pai` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  `referencia` VARCHAR(45) NULL,
  `dh_registro` VARCHAR(45) NULL,
  `departamento_id` INT NOT NULL,
  `marca_id` INT NOT NULL,
  `marca_dh_registro` DATETIME NOT NULL,
  `ativo` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_calcado_pai_departamento_idx` (`departamento_id` ASC)    ,
  INDEX `fk_calcado_pai_marca1_idx` (`marca_id` ASC, `marca_dh_registro` ASC)    ,
  CONSTRAINT `fk_calcado_pai_departamento`
    FOREIGN KEY (`departamento_id`)
    REFERENCES    `departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_calcado_pai_marca1`
    FOREIGN KEY (`marca_id` , `marca_dh_registro`)
    REFERENCES    `marca` (`id` , `dh_registro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table    `calcado_filho`
-- -----------------------------------------------------
CREATE TABLE  `calcado_filho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  `codigo_barras` VARCHAR(45) NOT NULL,
  `dh_atualizacao` DATETIME NOT NULL,
  
  `calcado_pai_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_calcado_filho_calcado_pai1_idx` (`calcado_pai_id` ASC)    ,
  CONSTRAINT `fk_calcado_filho_calcado_pai1`
    FOREIGN KEY (`calcado_pai_id`)
    REFERENCES    `calcado_pai` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table    `grupo`
-- -----------------------------------------------------
CREATE TABLE  `grupo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `dh_registro` DATETIME NOT NULL,
  `departamento_id` INT NOT NULL,
  `calcado_pai_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_grupo_departamento1_idx` (`departamento_id` ASC)    ,
  INDEX `fk_grupo_calcado_pai1_idx` (`calcado_pai_id` ASC)    ,
  CONSTRAINT `fk_grupo_departamento1`
    FOREIGN KEY (`departamento_id`)
    REFERENCES    `departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_calcado_pai1`
    FOREIGN KEY (`calcado_pai_id`)
    REFERENCES    `calcado_pai` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table    `cor`
-- -----------------------------------------------------
CREATE TABLE  `cor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `dh_registro` DATETIME NULL,
  PRIMARY KEY (`idcor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table    `cor_produto`
-- -----------------------------------------------------
CREATE TABLE  `cor_produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `dh_registro` DATETIME NOT NULL,
  `cor_idcor` INT NOT NULL,
  `calcado_filho_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cor_produto_cor1_idx` (`cor_idcor` ASC)    ,
  INDEX `fk_cor_produto_calcado_filho1_idx` (`calcado_filho_id` ASC)    ,
  CONSTRAINT `fk_cor_produto_cor1`
    FOREIGN KEY (`cor_idcor`)
    REFERENCES    `cor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cor_produto_calcado_filho1`
    FOREIGN KEY (`calcado_filho_id`)
    REFERENCES    `calcado_filho` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table    `loja`
-- -----------------------------------------------------
CREATE TABLE  `loja` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `nome_filial` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table    `armazem`
-- -----------------------------------------------------
CREATE TABLE  `armazem` (
  `id` INT NOT NULL AUTO_INCREMENT,,
  `dh_registro` DATETIME NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `loja_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_armazem_loja1_idx` (`loja_id` ASC)    ,
  CONSTRAINT `fk_armazem_loja1`
    FOREIGN KEY (`loja_id`)
    REFERENCES    `loja` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table    `produto armazem`
-- -----------------------------------------------------
CREATE TABLE  `produto_armazem` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `saldo` INT NOT NULL,
  `dh_atualizacao` DATETIME NOT NULL,
  `calcado_filho_id` INT NOT NULL,
  `armazem_id` INT NOT NULL,
  INDEX `fk_produto armazem_calcado_filho1_idx` (`calcado_filho_id` ASC)    ,
  INDEX `fk_produto armazem_armazem1_idx` (`armazem_id` ASC)    ,
  CONSTRAINT `fk_produto armazem_calcado_filho1`
    FOREIGN KEY (`calcado_filho_id`)
    REFERENCES    `calcado_filho` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto armazem_armazem1`
    FOREIGN KEY (`armazem_id`)
    REFERENCES    `armazem` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table    `preco`
-- -----------------------------------------------------
CREATE TABLE  `preco` (
  `id` INT NOT NULL AUTO_INCREMENT,,
  `preco_item` DOUBLE NULL,
  `promacao` TINYINT NOT NULL,
  `dh_atualizacao` DATETIME NOT NULL,
  `calcado_filho_id` INT NOT NULL,
  `calcado_pai_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_preco_calcado_filho1_idx` (`calcado_filho_id` ASC)    ,
  INDEX `fk_preco_calcado_pai1_idx` (`calcado_pai_id` ASC)    ,
  CONSTRAINT `fk_preco_calcado_filho1`
    FOREIGN KEY (`calcado_filho_id`)
    REFERENCES    `calcado_filho` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_preco_calcado_pai1`
    FOREIGN KEY (`calcado_pai_id`)
    REFERENCES    `calcado_pai` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table    `informacoes`
-- -----------------------------------------------------
CREATE TABLE  .`informacoes` (
  `id` INT NOT NULL AUTO_INCREMENT,,
  `info` VARCHAR(45) NOT NULL,
  `ativo` TINYINT NULL,
  `calcado_pai_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_informacoes_calcado_pai1_idx` (`calcado_pai_id` ASC)    ,
  CONSTRAINT `fk_informacoes_calcado_pai1`
    FOREIGN KEY (`calcado_pai_id`)
    REFERENCES    `calcado_pai` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
