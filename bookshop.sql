CREATE Database Bookstore;

USE Bookstore;









-- Faith
CREATE TABLE order_line (
    line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    status_id INT NOT NULL,
    status_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);



-- Insert common shipping methods
INSERT INTO shipping_method (method_name, cost) VALUES 
('Standard Shipping', 5.99),
('Express Shipping', 12.99),
('In-Store Pickup', 0.00);

CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    status_id INT NOT NULL,
    status_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    CONSTRAINT fk_history_order FOREIGN KEY (order_id) REFERENCES cust_order(order_id) ON DELETE CASCADE,
    CONSTRAINT fk_history_status FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- First check your table structure
DESCRIBE order_status;

-- If the column is named differently (like 'status_name'), modify your INSERT:
INSERT INTO order_status (status_name, description) VALUES 
('Pending', 'Order received but not yet processed'),
('Processing', 'Order is being prepared for shipment'),
('Shipped', 'Order has been shipped to customer'),
('Delivered', 'Order has been delivered to customer'),
('Cancelled', 'Order was cancelled'),
('Returned', 'Order was returned by customer');