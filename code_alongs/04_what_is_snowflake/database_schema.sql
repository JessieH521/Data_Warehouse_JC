show warehouses;

use warehouse COMPUTE_WH;

show databases;

create database if not exists demo_db;

use database demo_db;

show schemas;

create schema if not exists demo_db.staging;

show schemas in demo_db;

create table if not exists customer(
    customer_id integer primary key,
    age integer,
    email varchar(50)
);

show tables;

select * from staging.customer;

insert into customer(customer_id, age, email)
values
    (1, 32, 'abc@gmail.com'),
    (2, 23, 'cdc@gmail.com'); 

select * from customer;

drop database demo_db;

show databases;






