CREATE DATABASE hotel_db;
USE hotel_db;

CREATE TABLE guests (
    guest_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE
);

CREATE TABLE rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT,
    room_id INT,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);
INSERT INTO guests (first_name, last_name, email, phone) VALUES
('Бат', 'Эрдэнэ', 'bat@example.com', '99110001'),
('Болд', 'Тулга', 'bold@example.com', '88110002'),
('Сараа', 'Гэрэл', 'saraa@example.com', '95110003');

INSERT INTO rooms (room_number, room_type, price_per_night) VALUES
('101', 'Standard', 80000),
('102', 'Deluxe', 150000),
('201', 'Suite', 250000);

INSERT INTO bookings (guest_id, room_id, check_in_date, check_out_date) VALUES
(1, 1, '2024-03-01', '2024-03-03'),
(1, 2, '2024-03-10', '2024-03-12'),
(2, 1, '2024-03-05', '2024-03-06'),
(3, 3, '2024-03-15', '2024-03-20');

INSERT INTO payments (booking_id, amount) VALUES
(1, 160000),
(2, 300000),
(3, 80000),
(4, 1250000);