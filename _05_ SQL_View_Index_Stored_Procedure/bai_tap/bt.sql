USE demo;

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index
EXPLAIN SELECT *
FROM products
WHERE product_code = 'O';

CREATE UNIQUE INDEX products_idx
ON products (product_code);

CREATE INDEX products_name_price_idx
ON products (product_name, product_price);

EXPLAIN SELECT *
FROM products
WHERE product_code = 'O';

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view

CREATE VIEW product_view 
AS
SELECT product_code, product_name, product_price, product_status
FROM products; 

UPDATE product_view
SET product_price = 10000
WHERE product_name = 'xoài';

SELECT *
FROM product_view;

DROP VIEW product_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- Tạo store procedure thêm một sản phẩm mới
-- Tạo store procedure sửa thông tin sản phẩm theo id
-- Tạo store procedure xoá sản phẩm theo id

delimiter //
CREATE PROCEDURE product_demo1()
BEGIN
	SELECT *
    FROM products;
END;
// delimiter ;

CALL product_demo1(); 

delimiter //
CREATE PROCEDURE product_demo2 ()
BEGIN
	INSERT INTO products (product_code,product_name,product_price,product_amount,product_description,product_status)
    VALUES ('TC', 'trái cây', 15000, 10, 'thập cẩm', 'còn hàng');
END;
// delimiter ;

CALL product_demo2;

SELECT *
FROM products;

delimiter //
CREATE PROCEDURE product_demo3(p_keyword INT)
BEGIN
	UPDATE products
    SET product_status = 'hết hàng', product_amount = 0
    WHERE id = p_keyword;
END;
// delimiter ;

CALL product_demo3(1);

SELECT *
FROM products;

delimiter //
CREATE PROCEDURE product_demo4(p_keyword INT)
BEGIN
	DELETE FROM products
    WHERE id = p_keyword;
END
// delimiter ;

CALL product_demo4(1);