use role sysadmin;
create database ice_cream_db;
create warehouse dev_wh
with
warehouse_size = 'xsmall'
auto_suspend = 60 
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = 'Warehouse for development and analysis of databases';

use warehouse dev_wh;

-- Create a table for ice cream flavors
CREATE TABLE flavors (
    flavor_id INT AUTOINCREMENT,
    flavor_name STRING,
    price DECIMAL(5, 2),
    PRIMARY KEY (flavor_id)
);

-- Create a table for customers
CREATE TABLE customers (
    customer_id INT AUTOINCREMENT,
    customer_name STRING,
    email STRING,
    PRIMARY KEY (customer_id)
);

-- Create a table for transactions
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









































