DROP DATABASE IF EXISTS Car_Dealership;

CREATE DATABASE IF NOT EXISTS Car_Dealership;

USE Car_Dealership;


CREATE TABLE dealerships(
dealership_id INTEGER AUTO_INCREMENT PRIMARY KEY,
Name varchar(50),
Address varchar(50),
Phone varchar(12)
);


CREATE TABLE vehicles(
VIN VARCHAR(17) PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    SOLD BOOLEAN);


CREATE TABLE inventory(
dealership_id INT,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN));


CREATE TABLE sales_contracts(
id INT PRIMARY KEY AUTO_INCREMENT,
    VIN VARCHAR(17),
    contract_date DATE,
    buyer_name VARCHAR(100),
    sale_amount DECIMAL(10, 2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN));
    
#----------------------------Values--------------------------------#
    
INSERT INTO dealerships (Name, Address, Phone)
VALUES
    ('Nissan', '9123 towelbean rd', '704-432-9374'),
    ('Honda', '7456 DesiRorie rd', '704-837-0274'),
    ('BMW', '1028 JoshuaRam st', '704-219-3937');


INSERT INTO vehicles (VIN, Make, Model, Year, SOLD)
VALUES
    ('JGH17378H83473GH2', 'Nissan', '370z', 2013, TRUE),
    ('LMN12345DEF678901', 'Honda', 'Accord', 2020, FALSE),
    ('XYZ98765MNO123456', 'BMW', 'M3', 2018, TRUE);


INSERT INTO inventory (dealership_id, VIN)
VALUES
    (1, 'JGH17378H83473GH2'),
    (2, 'LMN12345DEF678901'),
    (3, 'XYZ98765MNO123456');


INSERT INTO sales_contracts (VIN, contract_date, buyer_name, sale_amount)
VALUES
    ('JGH17378H83473GH2', '2020-05-01', 'John Doe', 25000.00),
    ('LMN12345DEF678901', '2023-02-15', 'Jane Smith', 20000.00),
    ('XYZ98765MNO123456', '2019-07-20', 'Bob Johnson', 30000.00);