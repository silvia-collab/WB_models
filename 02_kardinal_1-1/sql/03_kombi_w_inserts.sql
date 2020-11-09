DROP DATABASE IF EXISTS mydb;
CREATE DATABASE mydb;
USE mydb;

CREATE TABLE IF NOT EXISTS `mydb`.`cats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (DEFAULT, 'Grizabella', 'white');
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (DEFAULT, 'Alonzo', 'grey');
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (DEFAULT, 'Mausi', 'striped');

SELECT * FROM cats;

-- verbundene Tabelle (1:1)
CREATE TABLE IF NOT EXISTS `mydb`.`servants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `srv_name` VARCHAR(45) NOT NULL,
  `yrs_served` INT NOT NULL,
  `cats_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_servants_cats_idx` (`cats_id` ASC),
  CONSTRAINT `fk_servants_cats`
    FOREIGN KEY (`cats_id`)
    REFERENCES `mydb`.`cats` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `mydb`.`servants` (`id`, `srv_name`, `yrs_served`, `cats_id`) VALUES (DEFAULT, 'Peter', 5, 2);
INSERT INTO `mydb`.`servants` (`id`, `srv_name`, `yrs_served`, `cats_id`) VALUES (DEFAULT, 'Imran', 12, 1);
INSERT INTO `mydb`.`servants` (`id`, `srv_name`, `yrs_served`, `cats_id`) VALUES (DEFAULT, 'Joe', 20, 3);

SELECT * FROM servants;


