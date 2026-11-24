-- Airline Analysis
CREATE DATABASE airline_analysis;
USE airline_analysis;

-- Passenger Table
CREATE TABLE passengers(passenger_id INT PRIMARY KEY,passenger_name VARCHAR(100),age INT,gender VARCHAR(10),city VARCHAR(50),country VARCHAR(50));

-- Airports Table
CREATE TABLE airports (airport_id INT PRIMARY KEY,airport_code VARCHAR(10),airport_name VARCHAR(100),city VARCHAR(50),country VARCHAR(50));

-- Flights Table
CREATE TABLE flights (flight_id INT PRIMARY KEY,flight_number VARCHAR(20),airline VARCHAR(50),departure_airport_id INT,arrival_airport_id INT,departure_date DATE,departure_time 
TIME,arrival_time TIME,flight_status VARCHAR(20),FOREIGN KEY (departure_airport_id) REFERENCES airports(airport_id), FOREIGN KEY (arrival_airport_id) REFERENCES airports(airport_id));

-- Bookings Table
CREATE TABLE bookings ( booking_id INT AUTO_INCREMENT PRIMARY KEY,passenger_id INT,flight_id INT,booking_date DATE,seat_class VARCHAR(20),ticket_fare DECIMAL(10,2),
booking_status VARCHAR(20), FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id), FOREIGN KEY (flight_id) REFERENCES flights(flight_id));

-- Payments Table
CREATE TABLE payments( payment_id INT AUTO_INCREMENT PRIMARY KEY,booking_id INT,payment_date DATE, payment_method VARCHAR(20),payment_amount DECIMAL(10,2),payment_status VARCHAR(20),
FOREIGN KEY (booking_id) REFERENCES bookings(booking_id));

SHOW TABLES;

-- Inserting Values

INSERT INTO passengers(passenger_id,passenger_name,age,gender,city,country) 
VALUES (1,'Arjun Menon',28,'Male','Kochi','India'),
(2,'Ananya Sharma',34,'Female','Delhi','India'),
(3,'Rahul Nair',41,'Male','Bengaluru','India'),
(4,'Meera Thomas',26,'Female','Mumbai','India'),
(5,'Vivek Rao',52,'Male','Hyderabad','India'),
(6,'Sara Khan',31,'Female','Dubai','UAE'),
(7,'Daniel George',45,'Male','London','UK'),
(8,'Priya Das',23,'Female','Kolkata','India'),
(9,'Adam Wilson',38,'Male','New York','USA'),
(10,'Neha Joseph',29,'Female','Chennai','India');

INSERT INTO passengers(passenger_id, passenger_name, age, gender, city, country)
VALUES(11, 'Nisha Varma', 27, 'Female', 'Pune', 'India');

SELECT * from passengers;

INSERT INTO airports(airport_id,airport_code,airport_name,city,country) VALUES 
(1,'COK','Cochin International Airport','Kochi','India'),
(2,'DEL','Indira Gandhi International Airport','Delhi','India'),
(3,'BLR','Kempegowda International Airport','Bengaluru','India'),
(4,'BOM','Chhatrapati Shivaji Maharaj International Airport','Mumbai','India'),
(5,'DXB','Dubai International Airport','Dubai','UAE'),
(6,'LHR','Heathrow Airport','London','UK'),
(7,'JFK','John F. Kennedy International Airport','New York','USA'),
(8,'CCU','Netaji Subhas Chandra Bose International Airport','Kolkata','India');

select * from airports;

INSERT INTO flights
(flight_id, flight_number, airline, departure_airport_id, arrival_airport_id,
 departure_date, departure_time, arrival_time, flight_status)
VALUES
(101, 'AI101', 'Air India', 1, 2, '2026-09-01', '06:30:00', '09:45:00', 'Completed'),
(102, '6E202', 'IndiGo', 2, 3, '2026-09-02', '10:15:00', '12:30:00', 'Completed'),
(103, 'EK303', 'Emirates', 5, 1, '2026-09-03', '14:00:00', '19:30:00', 'Completed'),
(104, 'AI404', 'Air India', 1, 5, '2026-09-04', '21:00:00', '23:45:00', 'Delayed'),
(105, '6E505', 'IndiGo', 3, 4, '2026-09-05', '08:00:00', '10:15:00', 'Completed'),
(106, 'EK606', 'Emirates', 5, 6, '2026-09-06', '09:30:00', '14:00:00', 'Completed'),
(107, 'BA707', 'British Airways', 6, 7, '2026-09-07', '11:00:00', '14:30:00', 'Completed'),
(108, 'AI808', 'Air India', 2, 8, '2026-09-08', '07:45:00', '10:15:00', 'Cancelled'),
(109, '6E909', 'IndiGo', 8, 1, '2026-09-09', '16:00:00', '18:45:00', 'Completed'),
(110, 'EK110', 'Emirates', 5, 7, '2026-09-10', '02:00:00', '07:30:00', 'Completed'),
(111, 'AI111', 'Air India', 4, 1, '2026-09-11', '13:30:00', '15:15:00', 'Scheduled'),
(112, '6E212', 'IndiGo', 1, 3, '2026-09-12', '17:00:00', '19:15:00', 'Scheduled');

INSERT INTO flights
(flight_id, flight_number, airline, departure_airport_id, arrival_airport_id,
 departure_date, departure_time, arrival_time, flight_status)
VALUES
(113, 'AI113', 'Air India', 1, 4, '2026-09-13', '11:00:00', '13:30:00', 'Scheduled');

select * from flights;

INSERT INTO bookings
(passenger_id,flight_id,booking_date,seat_class,ticket_fare,booking_status)
VALUES
(1,101,'2026-08-20','Economy',4500.00,'Confirmed'),
(2,102,'2026-08-21','Business',8500.00,'Confirmed'),
(3,103,'2026-08-22','Economy',12000.00,'Confirmed'),
(4,104,'2026-08-23','Business',15000.00,'Confirmed'),
(5,105,'2026-08-24','Economy',5500.00,'Confirmed'),
(6,106,'2026-08-25','First Class',32000.00,'Confirmed'),
(7,107,'2026-08-26','Business',28000.00,'Confirmed'),
(8,108,'2026-08-27','Economy',5000.00,'Cancelled'),
(9,109,'2026-08-27','Economy',6000.00,'Confirmed'),
(10,110,'2026-08-27','First Class',35000.00,'Confirmed'),
(1, 112, '2026-08-28', 'Business', 9000.00, 'Confirmed'),
(2, 109, '2026-08-28', 'Economy', 6500.00, 'Confirmed'),
(3, 111, '2026-08-29', 'Economy', 7000.00, 'Pending'),
(4, 112, '2026-08-29', 'Business', 10000.00, 'Confirmed'),
(6, 107, '2026-08-30', 'First Class', 30000.00, 'Confirmed');

select * from bookings;

INSERT INTO payments
(booking_id, payment_date, payment_method, payment_amount, payment_status)
VALUES
(1, '2026-08-20', 'UPI', 4500.00, 'Paid'),
(2, '2026-08-21', 'Credit Card', 8500.00, 'Paid'),
(3, '2026-08-22', 'Debit Card', 12000.00, 'Paid'),
(4, '2026-08-23', 'Credit Card', 15000.00, 'Paid'),
(5, '2026-08-24', 'UPI', 5500.00, 'Paid'),
(6, '2026-08-25', 'Credit Card', 32000.00, 'Paid'),
(7, '2026-08-26', 'Net Banking', 28000.00, 'Paid'),
(8, '2026-08-27', 'UPI', 5000.00, 'Refunded'),
(9, '2026-08-27', 'Debit Card', 6000.00, 'Paid'),
(10, '2026-08-27', 'Credit Card', 35000.00, 'Paid'),
(11, '2026-08-28', 'UPI', 9000.00, 'Paid'),
(12, '2026-08-28', 'UPI', 6500.00, 'Paid'),
(13, '2026-08-29', 'Net Banking', 7000.00, 'Pending'),
(14, '2026-08-29', 'Credit Card', 10000.00, 'Paid'),
(15, '2026-08-30', 'Debit Card', 30000.00, 'Paid');

select * from payments;

-- ANALYSIS

-- Question 1 

-- Display all passenger names along with their city and country.

select passenger_name, city,country from passengers;

-- Question 2 

-- Display the names and ages of passengers who are older than 30 years.

select passenger_name,age from passengers where age > 30;

-- Question 3 — Sorting

-- Display the passenger names and ages of all passengers, sorted from oldest to youngest.

select passenger_name,age from passengers order by age desc;

-- Question 4 — Aggregate Function

-- Find the average age of all passengers.

select avg(age) as average_age from passengers;

-- Question 5 

-- Display the unique countries of passengers who are older than 30 years.

select distinct country from passengers where age > 30;

-- Question 6 

-- Find the number of passengers from each country.

select country,COUNT(passenger_id) as passenger_count from passengers group by country;

-- Question 7 
-- Find the total number of bookings made by passengers from each country.

SELECT p.country,count(b.booking_id) AS total_bookings FROM passengers p INNER JOIN bookings b ON p.passenger_id = b.passenger_id GROUP BY p.country;

-- Question 8
-- Find the total ticket fare collected for each airline.

SELECT f.airline,SUM(b.ticket_fare) AS total_fare
FROM flights f
INNER JOIN bookings b 
ON f.flight_id = b.flight_id
GROUP BY f.airline;

-- Question 9 
-- Find the number of confirmed bookings for each airline.

SELECT f.airline,COUNT(b.booking_status) 
AS confirmed_booking_status_count
FROM flights f
INNER JOIN bookings b 
ON f.flight_id = b.flight_id
WHERE b.booking_status = 'Confirmed' 
GROUP BY f.airline;

-- Question 10

-- Display every passenger along with the number of bookings they have made, including passengers who have made no bookings.

SELECT p.passenger_name,COUNT(b.booking_id) AS booking_count
FROM passengers p
LEFT JOIN bookings b
ON p.passenger_id = b.passenger_id
GROUP BY p.passenger_id, p.passenger_name;

-- Question 11

-- Display all flights and the number of bookings for each flight, including flights that have no bookings.

SELECT f.flight_id,f.flight_number,COUNT(b.booking_id) AS booking_count
FROM bookings b
RIGHT JOIN flights f
ON b.flight_id = f.flight_id
GROUP BY f.flight_id, f.flight_number;

-- Question 12

-- Find passengers who have made no bookings and whose name starts with the letter N.

SELECT p.passenger_name 
FROM passengers p
LEFT JOIN
bookings b
ON p.passenger_id = b.passenger_id
WHERE b.booking_id is NULL 
and p.passenger_name like 'N%';

-- Question 13

-- Find flights that have no bookings and whose flight number starts with AI.

SELECT f.flight_number
FROM bookings b
RIGHT JOIN flights f
ON b.flight_id = f.flight_id
WHERE b.booking_id IS NULL
AND f.flight_number LIKE 'AI%';

-- Question 14

-- Display all airports and their flight numbers, including airports that have no departing flights.

SELECT a.airport_code, f.flight_number
FROM airports a
LEFT JOIN flights f
ON a.airport_id = f.departure_airport_id

UNION

SELECT a.airport_code, f.flight_number
FROM airports a
RIGHT JOIN flights f
ON a.airport_id = f.departure_airport_id;

-- Question 15

-- Find the passengers whose age is greater than the average age of all passengers.

SELECT passenger_name
FROM passengers
WHERE age > (SELECT AVG(age)FROM passengers);

-- Question 16

-- Find each passenger's total payment amount and number of bookings. Display:

-- passenger_name
-- number_of_bookings
-- total_payment

-- Only show passengers whose total payment is greater than 50,000.

SELECT p.passenger_name,COUNT(DISTINCT b.booking_id) AS number_of_bookings,SUM(pay.payment_amount) AS total_payment
FROM passengers p INNER JOIN bookings b 
ON p.passenger_id = b.passenger_id 
INNER JOIN flights f 
ON b.flight_id = f.flight_id
INNER JOIN payments pay
ON b.booking_id = pay.booking_id
GROUP BY p.passenger_id,p.passenger_name
HAVING total_payment > 50000 ;

-- Question 17

-- Find the passengers who have booked flights departing from the airport located in their own city.
-- Display:

-- passenger_name
-- city
-- airport_name
-- flight_number

SELECT p.passenger_name,p.city,a.airport_name,f.flight_number
FROM passengers p 
INNER JOIN bookings b
ON p.passenger_id = b.passenger_id
INNER JOIN flights f 
ON b.flight_id = f.flight_id
INNER JOIN airports a
ON f.departure_airport_id = a.airport_id
WHERE p.city = a.city;

-- Question 18

-- Find the number of bookings for each departure airport.

SELECT a.airport_name,a.city,COUNT(b.booking_id) as number_of_bookings
FROM passengers p 
INNER JOIN bookings b
ON p.passenger_id = b.passenger_id 
INNER JOIN flights f 
ON b.flight_id = f.flight_id
INNER JOIN airports a
ON f.departure_airport_id = a.airport_id
GROUP BY a.airport_name,a.city;

-- Question 19

-- Find each airline's total number of bookings and total ticket fare.
-- Display:

-- airline
-- total_bookings
-- total_ticket_fare

SELECT  f.airline,COUNT(b.booking_id) AS total_bookings,SUM(b.ticket_fare) AS total_ticket_fare
FROM flights f
INNER JOIN bookings b
ON f.flight_id = b.flight_id
GROUP BY f.airline;

-- Question 20

-- Find passengers who have booked flights operated by the airline 'Air India'.
-- Display:

-- passenger_name
-- flight_number
-- booking_date
-- ticket_fare

SELECT p.passenger_name,f.flight_number,b.booking_date,b.ticket_fare
FROM passengers p 
INNER JOIN bookings b
ON p.passenger_id = b.passenger_id 
INNER JOIN flights f
ON b.flight_id = f.flight_id
WHERE f.airline = 'Air India';







