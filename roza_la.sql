CREATE TABLE IF NOT EXISTS  `Customer` (
  `customer_id` INT NOT NULL PRIMARY KEY,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `phone` VARCHAR(12) NULL,
  `email` VARCHAR(30) NULL
);

CREATE TABLE IF NOT EXISTS `Product` (
  `line_item_id` INT NOT NULL PRIMARY KEY,
  `design_id` VARCHAR(10) NOT NULL,
  `product_size` VARCHAR(5) NULL,
  `product_color` VARCHAR(10) NOT NULL,
  `product_type` VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Order` (
  `order_number` INT NOT NULL PRIMARY KEY,
  `line_item_id` INT NOT NULL,
  CONSTRAINT `order_fk1` FOREIGN KEY (`line_item_id`) REFERENCES `Product`(`line_item_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_fk2` FOREIGN KEY (`customer_id`) REFERENCES `Product`(`line_item_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE IF NOT EXISTS`Shopify` (
  `order_number` INT NOT NULL PRIMARY KEY,
  `shipping_address_street` VARCHAR(20) NOT NULL,
  `shipping_address_city` VARCHAR(10) NOT NULL,
  `shipping_address_zipcode` CHAR (10) NOT NULL,
  `shipping_address_state` CHAR(2) NOT NULL,
  `billing_info` VARCHAR(30) NOT NULL,
  `payment_method` VARCHAR(15) NOT NULL,
  `shipping_method` VARCHAR(20) NOT NULL,
  `discount_code` VARCHAR(5) NULL,
  CONSTRAINT `shopify_fk` FOREIGN KEY (`order_number`) REFERENCES `Order`(`order_number`)
  	ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE IF NOT EXISTS `Employee` (
  `employee_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `street` VARCHAR(30) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `zipcode` CHAR(10) NOT NULL,
  `hire_date` DATE NULL,
  `phone` VARCHAR(12) NULL,
  `email` VARCHAR(30) NULL
);

CREATE TABLE IF NOT EXISTS `Order_Creation` (
  `send_date_manufacture` DATE NOT NULL,
  `recieve_date_manufacture` DATE NULL,
  `send_date_printing` DATE NULL,
  `recieve_date_printing` DATE NULL,
  `details` TEXT NOT NULL,
  `order_number` INT NOT NULL,
  CONSTRAINT `order_creation_fk` FOREIGN KEY (`order_number`) REFERENCES `Order`(`order_number`)
  	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Printing_place` (
  `shop_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `shop_name` VARCHAR(10) NOT NULL,
  `location` VARCHAR(20) NOT NULL,
  `design_id` VARCHAR(5) NOT NULL,
  `date_out` DATE NULL,
  `customer_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  CONSTRAINT `invoice_fk` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`)
  	ON DELETE CASCADE ON UPDATE CASCADE
);
