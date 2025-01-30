use role ice_cream_writer;  

use warehouse dev_wh;
use schema ice_cream_db.public;

drop table customers;  -- 报错： 因为 writer 没有权限删表， 所以换角色 sysadmin.
use role sysadmin;
drop table customers; 
drop table transactions; 
drop table flavors; 

select current_role();  -- 查看现在角色
use role ice_cream_writer;  

CREATE TABLE flavors (
    flavor_id INT AUTOINCREMENT,
    flavor_name STRING,
    price DECIMAL(5, 2),
    PRIMARY KEY (flavor_id)
);

CREATE TABLE customers (
    customer_id INT AUTOINCREMENT,
    customer_name STRING,
    email STRING,
    PRIMARY KEY (customer_id)
);

CREATE TABLE transactions (
    transaction_id INT AUTOINCREMENT,
    customer_id INT,
    flavor_id INT,
    quantity INT,
    transaction_date TIMESTAMP,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (flavor_id) REFERENCES flavors (flavor_id)
);

-- Step 5: Insert sample data
INSERT INTO flavors (flavor_name, price) VALUES
('Vanilla', 2.50),
('Chocolate', 2.75),
('Strawberry', 2.50),
('Mint Chocolate Chip', 3.00),
('Cookie Dough', 3.25);

INSERT INTO customers (customer_name, email) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Alice Johnson', 'alice.johnson@example.com');

INSERT INTO transactions (
    customer_id, flavor_id, quantity, transaction_date
) VALUES
(1, 1, 2, CURRENT_TIMESTAMP),
(2, 2, 1, CURRENT_TIMESTAMP),
(3, 3, 3, CURRENT_TIMESTAMP),
(1, 4, 1, CURRENT_TIMESTAMP),
(2, 5, 2, CURRENT_TIMESTAMP);

select * from flavors;
select * from customers;

-- change to ice_cream_reader and select data 
use role ice_cream_reader;
select * from transactions;
select * from customers;

-- insufficient privilege for ice_Cream_reader to insert data
-- 会报错， reader 没有 insert 权限
INSERT INTO customers (customer_name, email) VALUES
('John Doe2', 'john.doe@example.com');







































