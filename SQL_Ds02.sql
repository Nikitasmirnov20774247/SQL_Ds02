# 1 Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.

DROP DATABASE IF EXISTS sql_ds02;
CREATE DATABASE IF NOT EXISTS sql_ds02;
use sql_ds02;

CREATE TABLE sales (
    id INT NOT NULL AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO sales (order_date, count_product)
VALUES
	("2022-01-01", 156), 
	("2022-01-02", 180), 
	("2022-01-03", 21), 
	("2022-01-04", 124), 
	("2022-01-05", 341);

# 2 Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : меньше 100 - Маленький заказ; От 100 до 300 - Средний заказ; Больше 300 - Большой заказ

SELECT id, order_date, count_product,
CASE TRUE
    WHEN count_product <= 100 THEN 'Маленький заказ'
    WHEN count_product > 100 AND count_product < 300 THEN 'Средний заказ'
    ELSE 'Большой заказ'
END AS order_size_type
FROM sales;

# 3. Создайте таблицу “orders”, заполните ее значениями. Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status: OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»

CREATE TABLE orders (
    orderid INT NOT NULL AUTO_INCREMENT,
    employeeid VARCHAR(10) NOT NULL,
    amount DECIMAL(20, 2) NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    PRIMARY KEY (orderid)
);

INSERT INTO orders (employeeid, amount, order_status)
VALUES
	("e03", 15.00, "OPEN"),
	("e01", 25.50, "OPEN"),
	("e05", 100.70, "CLOSED"),
	("e02", 22.18, "OPEN"),
	("e04", 9.50, "CANCELLED");

SELECT orderid, order_status,
CASE order_status
    WHEN "OPEN" THEN 'Order is in open state.'
    WHEN "CLOSED" THEN 'Order is closed.'
    ELSE 'Order is cancelled.'
END AS full_order_status
FROM orders;