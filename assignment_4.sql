/* 1 */
CREATE TABLE IF NOT EXISTS  `Customer` (
  `customer_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `street` VARCHAR(30) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `zipcode` CHAR(10) NOT NULL,
  `phone` VARCHAR(12) NOT NULL,
  `email` VARCHAR(30) NULL
);

CREATE TABLE IF NOT EXISTS `Item` (
  `item_id` INT NOT NULL PRIMARY KEY,
  `item_description` TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS `Complaint` (
  `complaint_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `complaint_date` DATE NOT NULL,
  `details` TEXT NOT NULL,
  `customer_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  CONSTRAINT `complaint_fk1` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `complaint_fk2`FOREIGN KEY (`item_id`) REFERENCES `Item`(`item_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Employee` (
  `employee_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `street` VARCHAR(30) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `zipcode` CHAR(10) NOT NULL,
  `hire_date` DATE NOT NULL,
  `phone` VARCHAR(12) NULL,
  `email` VARCHAR(30) NULL,
  `manager_id` INT NULL,
  CONSTRAINT `employee_fk` FOREIGN KEY (`manager_id`) REFERENCES `Employee`(`employee_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Invoice` (
  `invoice_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `date_in` DATE NOT NULL,
  `date_out` DATE NULL,
  `customer_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  CONSTRAINT `invoice_fk` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Invoice_item` (
  `item_id` INT NOT NULL,
  `invoice_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`item_id`, `invoice_id`),
  CONSTRAINT `invoice_item_fk1` FOREIGN KEY (`item_id`) REFERENCES `Item`(`item_id`),
  CONSTRAINT `invoice_item_fk2` FOREIGN KEY (`invoice_id`) REFERENCES `Invoice`(`invoice_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE
);

/* 2 */

CREATE TABLE IF NOT EXISTS  `Customer` (
  `customer_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `street` VARCHAR(30) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `zipcode` CHAR(10) NOT NULL,
  `phone` VARCHAR(12) NOT NULL,
  `email` VARCHAR(30) NULL
);

CREATE TABLE IF NOT EXISTS `Item` (
  `item_id` INT NOT NULL PRIMARY KEY,
  `description` TEXT NOT NULL,
  `price` DOUBLE NOT NULL
);

CREATE TABLE IF NOT EXISTS `Complaint` (
  `complaint_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `complaint_date` DATE NOT NULL,
  `details` TEXT NOT NULL,
  `customer_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  CONSTRAINT `complaint_fk` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`item_id`) REFERENCES `Item`(`item_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Employee` (
  `employee_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `street` VARCHAR(30) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `zipcode` CHAR(10) NOT NULL,
  `hire_date` DATE NOT NULL,
  `phone` VARCHAR(12) NULL,
  `email` VARCHAR(30) NULL,
  `manager_id` INT NULL,
  CONSTRAINT `employee_fk` FOREIGN KEY (`manager_id`) REFERENCES `Employee`(`employee_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Invoice` (
  `invoice_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `date_in` DATE NOT NULL,
  `date_out` DATE NULL,
  `customer_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  CONSTRAINT `invoice_fk1` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invoice_fk2` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Invoice_item` (
  `item_id` INT NOT NULL,
  `invoice_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`item_id`, `invoice_id`),
  CONSTRAINT `invoice_item_fk1` FOREIGN KEY (`item_id`) REFERENCES `Item`(`item_id`),
  CONSTRAINT `invoice_item_fk2` FOREIGN KEY (`invoice_id`) REFERENCES `Invoice`(`invoice_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE
);

/*ALTER TABLE IF EXISTS `Invoice` 
	  DROP FOREIGN KEY `invoice_fk1`; 
	  
	  I could'nt figure out how to get the alter table to work*/
	  
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `complaint`, `employee`;
SET FOREIGN_KEY_CHECKS=1;

