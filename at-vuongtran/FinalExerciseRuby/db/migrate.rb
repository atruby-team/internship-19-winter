require 'mysql2'

connect = Mysql2::Client.new(host: 'localhost', username: 'minhvuong', password: 'qwertyuiop')

create_db = 'CREATE DATABASE IF NOT EXISTS MANAGER_EMPLOYEE'
create_team = 'CREATE TABLE IF NOT EXISTS `MANAGER_EMPLOYEE`.`team` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(45) NOT NULL,
	`team_lead` INT NULL,
	`total_members` INT NOT NULL,
	PRIMARY KEY (`id`));'
create_employee = 'CREATE TABLE IF NOT EXISTS `MANAGER_EMPLOYEE`.`employee` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(45) NOT NULL,
	`team_id` INT NOT NULL,
	`role` TINYINT NOT NULL,
	`username` VARCHAR(45) NOT NULL,
	`password` TEXT NOT NULL,
	`leave_balance` INT NOT NULL,
	PRIMARY KEY (`id`));'
create_notification = 'CREATE TABLE IF NOT EXISTS `MANAGER_EMPLOYEE`.`notification` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(45) NOT NULL,
	`content` VARCHAR(255) NOT NULL,
	`public_date` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`));'
create_leave = 'CREATE TABLE IF NOT EXISTS `MANAGER_EMPLOYEE`.`leave` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_user` INT NOT NULL,
	`reason` TEXT NOT NULL,
	`total_day_off` INT NOT NULL,
	`status` VARCHAR(45) NULL,
	`publish_date` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`));'

add_colum = <<-SQL
		ALTER TABLE `MANAGER_EMPLOYEE`.`notification`
		ADD COLUMN `team_id` INT NOT NULL;
	SQL

	connect.query(create_db)
	connect.select_db('MANAGER_EMPLOYEE')
	connect.query(create_team)
	connect.query(create_employee)
	connect.query(create_notification)
	connect.query(create_leave)
	connect.query(add_colum)
	connect.close
