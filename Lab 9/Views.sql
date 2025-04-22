-- Create the country table
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT, 
    country_name VARCHAR(255) NOT NULL
);

-- Create the city table
CREATE TABLE city (
    city_id INT PRIMARY KEY AUTO_INCREMENT, 
    city_name VARCHAR(255) NOT NULL,
    country_id INT, 
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Create the address table
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city_id INT,
    postal_code VARCHAR(20),
    phone VARCHAR(50),
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- Create the customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

-- Insert some sample data into the country table
INSERT INTO country (country_name) VALUES
('USA'),
('Canada'),
('UK');

-- Insert some sample data into the city table
INSERT INTO city (city_name, country_id) VALUES
('New York', 1),
('Toronto', 2),
('London', 3);

-- Insert some sample data into the address table
INSERT INTO address (address_line1, address_line2, city_id, postal_code, phone) VALUES
('123 Main St', 'Apt 4B', 1, '10001', '555-1234'),
('456 Elm St', '', 2, 'M5A 1A1', '555-5678'),
('789 Oak St', 'Suite 301', 3, 'EC1A 1BB', '555-9876');

-- Insert some sample data into the customer table
INSERT INTO customer (first_name, last_name, email, address_id) VALUES
('John', 'Doe', 'johndoe@email.com', 1),
('Jane', 'Smith', 'janesmith@email.com', 2),
('Paul', 'Jones', 'pauljones@email.com', 3);