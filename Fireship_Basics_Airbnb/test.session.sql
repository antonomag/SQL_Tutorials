Hallo
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
