﻿CREATE TABLE `city` (
  `city_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(70) NOT NULL,
  `country_id` SMALLINT UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (city_id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb3,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE `city` 
  ADD INDEX idx_fk_country_id(country_id);

ALTER TABLE `city` 
  ADD INDEX string_soundex((soundex(`country_id`)));

ALTER TABLE `city` 
  ADD CONSTRAINT `fk_city_country` FOREIGN KEY (country_id)
    REFERENCES country(country_id) ON UPDATE CASCADE;
