DROP DATABASE IF EXISTS demo;

CREATE DATABASE demo;
USE demo;
CREATE TABLE products (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_code VARCHAR(50),
	product_name VARCHAR(50),
	product_price DOUBLE,
	product_amount INT,
	product_description VARCHAR(50),
	product_status VARCHAR(50)
);

INSERT INTO products (product_code,product_name,product_price,product_amount,product_description,product_status)
VALUES ('X', 'xoài', 6000, 2, 'màu vàng', 'còn hàng'),
		('T', 'táo', 7000, 3, 'màu đỏ', 'hết hàng'),
        ('C', 'Cam', 8000, 4, 'màu cam', 'còn hàng'),
        ('O', 'Ổi', 9000, 5, 'màu xanh', 'còn hàng');