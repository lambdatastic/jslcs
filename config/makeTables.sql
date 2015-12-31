-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Teams'
-- Table of teams, has abbreviations and full names
-- ---

DROP TABLE IF EXISTS `Teams`;
		
CREATE TABLE `Teams` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `shortName` VARCHAR(10) NOT NULL DEFAULT 'NULL',
  `fullName` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `id_Leagues` INTEGER NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Table of teams, has abbreviations and full names';

-- ---
-- Table 'Matches'
-- Table of matches, belongs to schedules and has 2 teams
-- ---

DROP TABLE IF EXISTS `Matches`;
		
CREATE TABLE `Matches` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `team1` INTEGER NULL DEFAULT NULL,
  `team2` INTEGER NULL DEFAULT NULL,
  `score1` TINYINT NULL DEFAULT NULL,
  `score2` TINYINT NULL DEFAULT NULL,
  `id_Schedules` INTEGER NULL DEFAULT NULL,
  `startTime` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Table of matches, belongs to schedules and has 2 teams';

-- ---
-- Table 'Leagues'
-- Table of leagues across the world
-- ---

DROP TABLE IF EXISTS `Leagues`;
		
CREATE TABLE `Leagues` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `shortName` VARCHAR(10) NOT NULL DEFAULT 'NULL',
  `fullName` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`id`)
) COMMENT 'Table of leagues across the world';

-- ---
-- Table 'Schedules'
-- Table of schedules for each league, each entry should correspond to a split or tournament
-- ---

DROP TABLE IF EXISTS `Schedules`;
		
CREATE TABLE `Schedules` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `id_Leagues` INTEGER NULL DEFAULT NULL,
  `startDate` DATE NULL DEFAULT NULL,
  `endDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Table of schedules for each league, each entry should corres';

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Teams` ADD FOREIGN KEY (id_Leagues) REFERENCES `Leagues` (`id`);
ALTER TABLE `Matches` ADD FOREIGN KEY (team1) REFERENCES `Teams` (`id`);
ALTER TABLE `Matches` ADD FOREIGN KEY (team2) REFERENCES `Teams` (`id`);
ALTER TABLE `Matches` ADD FOREIGN KEY (id_Schedules) REFERENCES `Schedules` (`id`);
ALTER TABLE `Schedules` ADD FOREIGN KEY (id_Leagues) REFERENCES `Leagues` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Teams` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Matches` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Leagues` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Schedules` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Teams` (`id`,`shortName`,`fullName`,`id_Leagues`) VALUES
-- ('','','','');
-- INSERT INTO `Matches` (`id`,`team1`,`team2`,`score1`,`score2`,`id_Schedules`,`startTime`) VALUES
-- ('','','','','','','');
-- INSERT INTO `Leagues` (`id`,`shortName`,`fullName`) VALUES
-- ('','','');
-- INSERT INTO `Schedules` (`id`,`id_Leagues`,`startDate`,`endDate`) VALUES
-- ('','','','');
