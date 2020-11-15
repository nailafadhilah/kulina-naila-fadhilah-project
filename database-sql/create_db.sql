# Author : Naila Fadhilah Fithriah
# Date   : 14 November 2020
# Kulina - Data Analyst - Preliminary Test
# DATABASE

# Database Design
CREATE DATABASE db_kulina;

USE db_kulina;
CREATE TABLE ku_user_status (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (id)
    );
    
CREATE TABLE ku_user_location_type (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (id)
    );

CREATE TABLE ku_user_location_status (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (id)
    );

CREATE TABLE ku_user (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(25) NULL,
    password_hash VARCHAR(32) NOT NULL,
    salt VARCHAR(32) NOT NULL,
    photo BLOB NOT NULL,
    status INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (id),
    FOREIGN KEY (status) REFERENCES ku_user_status(id)
    );
    
CREATE TABLE ku_order_status (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (id)
    );

CREATE TABLE ku_product_status (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (id)
    );

CREATE TABLE ku_user_location (
	  id INT NOT NULL AUTO_INCREMENT,
    type INT NOT NULL,
    status INT NOT NULL,
    user_id INT NOT NULL,
    location GEOMETRY NOT NULL,
    address VARCHAR(500) NULL DEFAULT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (id),
    FOREIGN KEY (type) REFERENCES ku_user_location_type(id),
    FOREIGN KEY (status) REFERENCES ku_user_location_status(id),
    FOREIGN KEY (user_id) REFERENCES ku_user(id)
    );

CREATE TABLE ku_order (
	  id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    status INT NOT NULL,
	  created_at TIMESTAMP DEFAULT NOW(),
	  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
	  PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES ku_user(id),
    FOREIGN KEY (status) REFERENCES ku_order_status(id)
    );
    
CREATE TABLE ku_product (
	  id INT NOT NULL AUTO_INCREMENT,
	  name VARCHAR(100) NOT NULL,
    effective_date DATE NOT NULL,
    effective_until DATE NOT NULL,
    photo BLOB NOT NULL,
    price DECIMAL(10,1),
    status INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
	  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
	  PRIMARY KEY (id),
    FOREIGN KEY (status) REFERENCES ku_product_status(id)
    );

CREATE TABLE ku_category (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (id)
    );

CREATE TABLE ku_order_detail_status (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (id)
    );

CREATE TABLE ku_product_category (
    id INT NOT NULL AUTO_INCREMENT,
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES ku_product(id),
    FOREIGN KEY (category_id) REFERENCES ku_category(id)
    );
    
CREATE TABLE ku_order_detail (
	  id INT NOT NULL AUTO_INCREMENT,
    user_location_id INT NOT NULL,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    delivery_date DATE,
    status INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (id),
    FOREIGN KEY (user_location_id) REFERENCES ku_user_location(id),
    FOREIGN KEY (order_id) REFERENCES ku_order(id),
    FOREIGN KEY (product_id) REFERENCES ku_product(id),
    FOREIGN KEY (status) REFERENCES ku_order_detail_status(id)
    );
