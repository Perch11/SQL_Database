CREATE
DATABASE Plane;

CREATE TABLE Flights
(
    flight_number  VARCHAR(10) PRIMARY KEY,
    origin         VARCHAR(50) NOT NULL ,
    destination    VARCHAR(50) NOT NULL,
    departure_time TIMESTAMP NOT NULL,
    arrival_time   TIMESTAMP NOT NULL
);
INSERT INTO Flights (flight_number, origin, destination, departure_time, arrival_time)
VALUES ('AA100', 'New York', 'Los Angeles', '2023-04-10 10:00:00', '2023-04-10 12:30:00'),
       ('DL200', 'Chicago', 'Miami', '2023-04-11 09:00:00', '2023-04-11 12:00:00'),
       ('UA300', 'San Francisco', 'Denver', '2023-04-12 14:30:00', '2023-04-12 16:00:00'),
       ('WN400', 'Las Vegas', 'Phoenix', '2023-04-13 11:00:00', '2023-04-13 12:30:00'),
       ('ED500', 'Moscow', 'Yerevan', '2023-04-11 10:00:00', '2023-04-11 11:30:00'),
       ('LS600', 'Oslo', 'Tokio', '2023-04-8 12:30:00', '2023-04-8 14:30:00'),
       ('QS700', 'Las Vegas', 'New York', '2023-04-13 15:00:00', '2023-04-13 18:30:00'),
       ('WR800', 'Miami', 'Phoenix', '2023-04-14 11:00:00', '2023-04-14 13:30:00'),
       ('SD900', 'Ortega', 'Ibiúna', '2023-04-21 10:50:00', '2023-04-21 15:25:00');

CREATE TABLE Passengers
(
    passenger_id INT PRIMARY KEY,
    name         VARCHAR(50) NOT NULL,
    email        VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

INSERT INTO Passengers (passenger_id, name, email, phone_number)
VALUES (1, 'John Smith', 'john.smith@email.com', '123-456-7890'),
       (2, 'Jane Doe', 'jane.doe@email.com', '987-654-3210'),
       (3, 'Inna', 'inna.inna@email.com', '374-674-3210'),
       (4, 'John Snow', 'john.snow@email.com', '987-654-32110'),
       (5, 'Artak', 'art.artak@email.com', '987-654-3710'),
       (6, 'Vazgen', 'vzgo.vazgen@email.com', '987-724-3850'),
       (7, 'Nana', 'nana.nana@email.com', '374-654-3210'),
       (8, 'Lala', 'lala.lala@email.com', '374-98-741045'),
       (9, 'Sisi', 'sisi.sisi@email.com', '987-673-32104');

CREATE TABLE Bookings
(
    booking_id    INT PRIMARY KEY,
    flight_number VARCHAR(10)    NOT NULL UNIQUE,
    passenger_id  INT            NOT NULL,
    booking_date  DATE NOT NULL,
    cost          DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (flight_number) REFERENCES Flights (flight_number),
    FOREIGN KEY (passenger_id) REFERENCES Passengers (passenger_id)
);
INSERT INTO Bookings (booking_id, flight_number, passenger_id, booking_date, cost)
VALUES (1, 'AA100', 1, '2023-04-08', 250.00),
       (2, 'DL200', 2, '2023-04-09', 300.00),
       (3, 'WN400', 9, '2023-04-02', 450.00),
       (4, 'LS600', 2, '2023-04-10', 250.00),
       (5, 'SD900', 8, '2023-04-07', 200.00),
       (6, 'WR800', 1, '2023-04-06', 300.00),
       (7, 'QS700', 7, '2023-04-05', 700.00),
       (8, 'UA300', 6, '2023-05-05', 850.00),


//1
    SELECT AVG(cost) as mijin_arjeq
    FROM Bookings;

//2
    SELECT origin, COUNT(*) as Qanak
    FROM Flights
    GROUP BY origin;
//3
    SELECT destination, COUNT(*) as Qanak
    FROM Flights
    GROUP BY destination;
//4
    SELECT Flights.origin, COUNT(Bookings.passenger_id) as num_passengers
    FROM Flights
         JOIN Bookings  ON Flights.flight_number = Bookings.flight_number
    GROUP BY Flights.origin;
//5
    select origin,avg(Bookings.cost) as average_cost
    from Flights
               join Bookings on Flights.flight_number = Bookings.flight_number
    group by origin
//6
    SELECT Flights.origin, COUNT(Bookings.passenger_id) as num_passengers
    FROM Flights
             JOIN Bookings ON Flights.flight_number = Bookings.flight_number
    GROUP BY Flights.origin
    HAVING AVG(B.cost) < 250
//7
    SELECT DATE_TRUNC('month', booking_date) as month, SUM(cost) as total_revenue
    FROM Bookings
    GROUP BY month;
//8
    SELECT Flights.origin, count(CAST(Bookings.passenger_id IS NOT NULL AS INTEGER)) as avg_passengers_per_flight
    FROM Flights
             LEFT JOIN Bookings ON Flights.flight_number = Bookings.flight_number
    GROUP BY Flights.origin
    HAVING COUNT(*) > 1;
//9
    SELECT Flights.destination, COUNT(Bookings.passenger_id) as total_passengers
    FROM Flights
             INNER JOIN Bookings ON Flights.flight_number = Bookings.flight_number
    GROUP BY Flights.destination
    ORDER BY total_passengers DESC
    LIMIT 2;
