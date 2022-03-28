
CREATE TABLE IF NOT EXISTS `PlaneModelData` (
  `model` VARCHAR(20) NOT NULL,
  `length` FLOAT(4,2) UNSIGNED NOT NULL,
  `span` FLOAT(4,2) UNSIGNED NOT NULL,
  `capacity` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`model`));

CREATE TABLE IF NOT EXISTS `Plane` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `model` VARCHAR(20) NOT NULL,
  `manufacturing_date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_plane_model`
    FOREIGN KEY (`model`)
    REFERENCES `PlaneModelData` (`model`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

CREATE TABLE IF NOT EXISTS `Route` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `time_out` TIME NOT NULL,
  `time_in` TIME NOT NULL,
  `city_out` VARCHAR(20) NOT NULL,
  `city_in` VARCHAR(20) NOT NULL,
  `plane_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_plane`
    FOREIGN KEY (`plane_id`)
    REFERENCES `Plane` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

CREATE TABLE IF NOT EXISTS `Flight` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `route_id` INT UNSIGNED NOT NULL,
  `departure_date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_route`
    FOREIGN KEY (`route_id`)
    REFERENCES `Route` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

CREATE TABLE IF NOT EXISTS `Passenger` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `sex` ENUM('M', 'F') NOT NULL,
  `birthday` DATE NOT NULL,
  `passport` CHAR(11) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `Ticket` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `flight_id` INT UNSIGNED NOT NULL,
  `passenger_id` INT UNSIGNED NOT NULL,
  `class` ENUM('economy', 'business') NOT NULL,
  `place` VARCHAR(3) NOT NULL,
  `luggage` ENUM('yes', 'no') NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_passenger`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `Passenger` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_flight`
    FOREIGN KEY (`flight_id`)
    REFERENCES `Flight` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

CREATE TABLE IF NOT EXISTS `Employee` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `route_id` INT UNSIGNED NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `position` VARCHAR(20) NOT NULL,
  `start_date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_route_1`
    FOREIGN KEY (`route_id`)
    REFERENCES `Route` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);


INSERT INTO `PlaneModelData` (`model`, `length`, `span`, `capacity`) VALUES ('Airbus A320', 37.57, 35.8, 140);
INSERT INTO `PlaneModelData` (`model`, `length`, `span`, `capacity`) VALUES ('Airbus A321', 44.51, 35.8, 170);

INSERT INTO `Plane` (`id`, `model`, `manufacturing_date`) VALUES (null, 'Airbus A320', '2015-04-05');
INSERT INTO `Plane` (`id`, `model`, `manufacturing_date`) VALUES (null, 'Airbus A321', '2018-12-23');

INSERT INTO `Route` (`id`, `time_out`, `time_in`, `city_out`, `city_in`, `plane_id`) VALUES (null, '12:00:00', '14:00:00', 'Moscow', 'Krasnodar', 1);
INSERT INTO `Route` (`id`, `time_out`, `time_in`, `city_out`, `city_in`, `plane_id`) VALUES (null, '23:00:00', '24:30:00', 'Moscow', 'Rostov', 2);

INSERT INTO `Flight` (`id`, `route_id`, `departure_date`) VALUES (null, 2, '2022-03-23');
INSERT INTO `Flight` (`id`, `route_id`, `departure_date`) VALUES (null, 1, '2022-03-24');
INSERT INTO `Flight` (`id`, `route_id`, `departure_date`) VALUES (null, 2, '2022-03-25');

INSERT INTO `Passenger` (`id`, `first_name`, `last_name`, `sex`, `birthday`, `passport`) VALUES (null, 'Ivan', 'Sidorov', 'M', '1989-02-02', '1234 567890');
INSERT INTO `Passenger` (`id`, `first_name`, `last_name`, `sex`, `birthday`, `passport`) VALUES (null, 'Islam', 'Mahmudov', 'M', '2000-04-23', '2345 938278');
INSERT INTO `Passenger` (`id`, `first_name`, `last_name`, `sex`, `birthday`, `passport`) VALUES (null, 'Nikita', 'Agapov', 'M', '2008-12-22', '7294 639577');
INSERT INTO `Passenger` (`id`, `first_name`, `last_name`, `sex`, `birthday`, `passport`) VALUES (null, 'Anton', 'Ageev', 'M', '1994-03-31', '2304 249802');
INSERT INTO `Passenger` (`id`, `first_name`, `last_name`, `sex`, `birthday`, `passport`) VALUES (null, 'Vladimir', 'Pahomov', 'M', '1974-08-08', '7304 284102');
INSERT INTO `Passenger` (`id`, `first_name`, `last_name`, `sex`, `birthday`, `passport`) VALUES (null, 'Anna', 'Andreeva', 'F', '1999-11-15', '2222 333333');

INSERT INTO `Ticket` (`id`, `flight_id`, `passenger_id`, `class`, `place`, `luggage`) VALUES (null, 1, 3, 'economy', '5d', 'yes');
INSERT INTO `Ticket` (`id`, `flight_id`, `passenger_id`, `class`, `place`, `luggage`) VALUES (null, 1, 4, 'business', '3a', 'yes');
INSERT INTO `Ticket` (`id`, `flight_id`, `passenger_id`, `class`, `place`, `luggage`) VALUES (null, 2, 5, 'economy', '4b', 'no');
INSERT INTO `Ticket` (`id`, `flight_id`, `passenger_id`, `class`, `place`, `luggage`) VALUES (null, 3, 2, 'economy', '4c', 'yes');

INSERT INTO `Employee` (`id`, `route_id`, `first_name`, `last_name`, `position`, `start_date`) VALUES (null, 1, 'Sergey', 'Melnikov', 'pilot', '2002-02-23');
INSERT INTO `Employee` (`id`, `route_id`, `first_name`, `last_name`, `position`, `start_date`) VALUES (null, 1, 'Yulia', 'Lovyagina', 'steward', '2015-04-18');
INSERT INTO `Employee` (`id`, `route_id`, `first_name`, `last_name`, `position`, `start_date`) VALUES (null, 1, 'Maria', 'Tolstova', 'steward', '2018-05-06');
INSERT INTO `Employee` (`id`, `route_id`, `first_name`, `last_name`, `position`, `start_date`) VALUES (null, 2, 'Dmitry', 'Yudakov', 'pilot', '2021-07-14');
INSERT INTO `Employee` (`id`, `route_id`, `first_name`, `last_name`, `position`, `start_date`) VALUES (null, 2, 'Anastasia', 'Ivanova', 'steward', '1997-05-08');
INSERT INTO `Employee` (`id`, `route_id`, `first_name`, `last_name`, `position`, `start_date`) VALUES (null, 2, 'Andrey', 'Petrov', 'steward', '2010-04-09');

