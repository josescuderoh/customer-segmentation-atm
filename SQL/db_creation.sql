# Create database
create database grocery_db;

# Create the tables
use grocery_db;

create table Customers (
	cust_id varchar(20),
	cust_price_sensitivity varchar(2),
	cust_lifestage varchar(2),
    PRIMARY KEY (cust_id)
);

create table Timestamps(
	time_id int,
	shop_week varchar(6),
    date_from varchar(8),
    date_to varchar(8),
    shop_date varchar(8),
    shop_hour int,
    PRIMARY KEY (time_id)
);

create table Products(
	prod_id varchar(20),
    prod_code_10 varchar(10),
	prod_code_20 varchar(10),
	prod_code_30 varchar(10),
	prod_code_40 varchar(10),
    PRIMARY KEY (prod_id)
);

create table Baskets(
	basket_id int8,
	basket_size varchar(2),
	basket_price_sensitivity varchar(2),
	basket_type varchar(15),
	basket_dominant_mission varchar(15),
    PRIMARY KEY (basket_id)
);

create table Stores(
	store_id varchar(15),
	store_format varchar(3),
	store_region varchar(3),
    PRIMARY KEY (store_id)
);

create table Transactions(
	trans_id int auto_increment,
	time_id int,
    quantity int,
    spend decimal(10,2),
    prod_id varchar(20),
    cust_id varchar(20),
    basket_id int8,
    store_id varchar(15),
    PRIMARY KEY (trans_id),
    FOREIGN KEY (time_id) REFERENCES Timestamps(time_id),
    FOREIGN KEY (prod_id) REFERENCES Products(prod_id),
    FOREIGN KEY (cust_id) REFERENCES Customers(cust_id),
    FOREIGN KEY (basket_id) REFERENCES Baskets(basket_id),
    FOREIGN KEY (store_id) REFERENCES Stores(store_id)
);



	