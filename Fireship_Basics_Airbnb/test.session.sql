-- Youtube tutorial SQL
--@block
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR (255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);
--@block
INSERT INTO Users(email, bio, country)
VALUES (
    'hello@world.com',
    'i love strangers!',
    'US'
);
--@block
SELECT * FROM Users;

--@block
INSERT INTO Users(email, bio, country)
VALUES 
    ('hi@world.com','foo','US'),
    ('hola@mundo.com','bar','MX'),
    ('bonjour@monde.com','baz','FR');

--@block
DROP TABLE Users

--@block
SELECT * FROM Users;

--@block
SELECT email, id FROM Users;

--@block
SELECT email, id FROM Users

WHERE country = 'US'
AND id > 1

ORDER BY id DESC
LIMIT 2;

--@block
SELECT email, id FROM Users

WHERE country = 'US'
OR id > 1

ORDER BY id DESC
LIMIT 2;

--@block
SELECT email, id FROM Users

WHERE country = 'US'
AND email LIKE 'hello%'

ORDER BY id DESC
LIMIT 2;

--@block
CREATE INDEX email_index ON Users(email);

--@block
CREATE TABLE Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id)
);

--@block
INSERT INTO Rooms(owner_id, street)
VALUES 
    (1, 'san diego sailboar'),
    (1, 'nantucket cottage'),
    (1, 'vail cabin'),
    (1, 'sf, cardboard box');

--@block
SELECT  
    Users.id AS user_id,
    Rooms.id AS room_id,
--    email,
    street
FROM Users
INNER JOIN Rooms
ON Rooms.owner_id = Users.id;

--@block
SELECT * FROM Users
LEFT JOIN Rooms
ON Rooms.owner_id = Users.id;

--@block
SELECT * FROM Rooms
RIGHT JOIN Users
ON Rooms.owner_id = Users.id;

--@block
SELECT * FROM Users
OUTER JOIN Rooms
ON Rooms.owner_id = Users.id;

--@block
CREATE TABLE Bookings(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES Users(id),
    FOREIGN KEY (room_id) REFERENCES Rooms (id)
);

--@block
INSERT INTO Bookings(guest_id, room_id, check_in)
VALUES 
	(2, 1, "20230125 15:00:00"),
	(3, 2, "20230126 16:00:00");

--@block Join for Rooms a user has booked
SELECT
	guest_id,
	street,
	check_in
FROM Bookings
INNER JOIN Rooms ON Rooms.owner_id =guest_id
WHERE guest_id = 1;

--@block JOIN Guest who stayed in a room
SELECT
	room_id,
	guest_id,
	email,
	bio
FROM Bookings
INNER JOIN Users ON Users.id = guest_id
WHERE room_id = 2;

--@block
SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION';
SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';

select @@GLOBAL.sql_mode; -- and
select @@SESSION.sql_mode;

SET SESSION sql_mode = 'ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
