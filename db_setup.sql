-- ============================================================
--  YazLuxe Shopping Mart — Database Setup Script
--  Run this in MySQL Workbench or MySQL CLI before starting the app
-- ============================================================

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    name     VARCHAR(100) NOT NULL,
    email    VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Products table
CREATE TABLE IF NOT EXISTS products (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    name     VARCHAR(200) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price    DECIMAL(10,2) NOT NULL,
    image    VARCHAR(255)
);

-- Orders table
CREATE TABLE IF NOT EXISTS orders (
    o_id       INT AUTO_INCREMENT PRIMARY KEY,
    p_id       INT NOT NULL,
    u_id       INT NOT NULL,
    o_quantity INT NOT NULL DEFAULT 1,
    o_date     DATE,
    FOREIGN KEY (p_id) REFERENCES products(id),
    FOREIGN KEY (u_id) REFERENCES users(id)
);

-- ============================================================
--  Sample Data — insert a test user and some products
-- ============================================================

INSERT INTO users (name, email, password) VALUES
('Test User',  'test@yazluxe.com', 'test123'),
('Admin User', 'admin@yazluxe.com', 'admin123');

INSERT INTO products (name, category, price, image) VALUES
('Classic White Shirt',    'Men''s Fashion',   799.00,  'shirt.jpg'),
('Floral Summer Dress',    'Women''s Fashion', 1299.00, 'dress.jpg'),
('Leather Handbag',        'Accessories',      2499.00, 'handbag.jpg'),
('Running Sneakers',       'Footwear',         1999.00, 'sneakers.jpg'),
('Silk Evening Gown',      'Women''s Fashion', 3499.00, 'gown.jpg'),
('Denim Jeans',            'Men''s Fashion',   999.00,  'jeans.jpg'),
('Aviator Sunglasses',     'Accessories',      599.00,  'sunglasses.jpg'),
('Casual Canvas Shoes',    'Footwear',         799.00,  'canvas.jpg');

-- ============================================================
-- NOTE: Product images should be placed in:
--   src/main/webapp/product-images/
-- The app will show a placeholder if an image is missing.
-- ============================================================
