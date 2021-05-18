CREATE SCHEMA IF NOT EXISTS Festivals;

DROP VIEW IF EXISTS Artist_Without_Age;
DROP VIEW IF EXISTS Performer_Without_City;

DROP TABLE IF EXISTS Festivals.Artist_X_Performer CASCADE;
DROP TABLE IF EXISTS Festivals.Listener_X_Performer CASCADE;
DROP TABLE IF EXISTS Festivals.Stage_X_Fest CASCADE;
DROP TABLE IF EXISTS Festivals.Fest_X_Performer CASCADE;
DROP TABLE IF EXISTS Festivals.Ticket CASCADE;
DROP TABLE IF EXISTS Festivals.TicketShop CASCADE;
DROP TABLE IF EXISTS Festivals.Fest_X_Organizer CASCADE;
DROP TABLE IF EXISTS Festivals.Organizer CASCADE;
DROP TABLE IF EXISTS Festivals.Fest CASCADE;
DROP TABLE IF EXISTS Festivals.Performer CASCADE;
DROP TABLE IF EXISTS Festivals.Artist CASCADE;
DROP TABLE IF EXISTS Festivals.Listener CASCADE;
DROP TABLE IF EXISTS Festivals.Stage CASCADE;

CREATE TABLE Festivals.Artist (
    artist_id   SERIAL PRIMARY KEY,
    artist_nm   VARCHAR(255),
    age_value   INTEGER,
    role_value  VARCHAR(255)
);

CREATE TABLE Festivals.Performer (
    performer_id    SERIAL PRIMARY KEY,
    performer_nm    VARCHAR(255),
    genre_value     VARCHAR(255),
    city_value      VARCHAR(255)
);

CREATE TABLE Festivals.Listener (
    listener_id     SERIAL PRIMARY KEY,
    listener_nm     VARCHAR(255),
    age_value       INTEGER
);

CREATE TABLE Festivals.Stage (
    stage_id    SERIAL PRIMARY KEY,
    stage_nm    VARCHAR(255),
    type_value  VARCHAR(255)
);

CREATE TABLE Festivals.TicketShop (
    ticketshop_id   SERIAL PRIMARY KEY,
    ticketshop_nm   VARCHAR(255),
    metro_value     VARCHAR(255)
);

CREATE TABLE Festivals.Fest (
    fest_id     SERIAL PRIMARY KEY,
    fest_nm     VARCHAR(255),
    start_dt    DATE,
    end_dt      DATE
);

CREATE TABLE Festivals.Ticket (
    ticket_id       SERIAL PRIMARY KEY,
    listener_id     INTEGER REFERENCES Festivals.Listener(listener_id),
    ticketshop_id   INTEGER REFERENCES Festivals.TicketShop(ticketshop_id),
    fest_id         INTEGER REFERENCES Festivals.Fest(fest_id),
    price_value     INTEGER
);

CREATE TABLE Festivals.Organizer (
    organizer_id    SERIAL PRIMARY KEY,
    organizer_nm    VARCHAR(255),
    company_nm      VARCHAR(255)
);

CREATE TABLE Festivals.Artist_X_Performer (
    artist_id       INTEGER REFERENCES Festivals.Artist(artist_id),
    performer_id    INTEGER REFERENCES Festivals.Performer(performer_id)
);

CREATE TABLE Festivals.Listener_X_Performer (
    listener_id     INTEGER REFERENCES Festivals.Listener(listener_id),
    performer_id    INTEGER REFERENCES Festivals.Performer(performer_id)
);

CREATE TABLE Festivals.Stage_X_Fest (
    stage_id    INTEGER REFERENCES Festivals.Stage(stage_id),
    fest_id     INTEGER REFERENCES Festivals.Fest(fest_id)
);

CREATE TABLE Festivals.Fest_X_Performer (
    fest_id         INTEGER REFERENCES Festivals.Fest(fest_id),
    performer_id    INTEGER REFERENCES Festivals.Performer(performer_id)
);

CREATE TABLE Festivals.Fest_X_Organizer (
    fest_id         INTEGER REFERENCES Festivals.Fest(fest_id),
    organizer_id    INTEGER REFERENCES Festivals.Organizer(organizer_id)
);

ALTER TABLE Festivals.Artist_X_Performer
ADD CONSTRAINT PK_Artist_X_Performer PRIMARY KEY (artist_id, performer_id);

ALTER TABLE Festivals.Artist_X_Performer
ADD CONSTRAINT FK_Artist_X_Performer FOREIGN KEY (artist_id)
REFERENCES Festivals.Artist(artist_id);

ALTER TABLE Festivals.Artist_X_Performer
ADD CONSTRAINT FK_Performer_X_Artist FOREIGN KEY (performer_id)
REFERENCES Festivals.Performer(performer_id);


ALTER TABLE Festivals.Listener_X_Performer
ADD CONSTRAINT PK_Listener_X_Performer PRIMARY KEY (listener_id, performer_id);

ALTER TABLE Festivals.Listener_X_Performer
ADD CONSTRAINT FK_Listener_X_Performer FOREIGN KEY (listener_id)
REFERENCES Festivals.Listener(listener_id);

ALTER TABLE Festivals.Listener_X_Performer
ADD CONSTRAINT FK_Performer_X_Listener FOREIGN KEY (performer_id)
REFERENCES Festivals.Performer(performer_id);


ALTER TABLE Festivals.Stage_X_Fest
ADD CONSTRAINT PK_Stage_X_Fest PRIMARY KEY (stage_id ,fest_id);

ALTER TABLE Festivals.Stage_X_Fest
ADD CONSTRAINT FK_Stage_X_Fest FOREIGN KEY (stage_id)
REFERENCES Festivals.Stage(stage_id);

ALTER TABLE Festivals.Stage_X_Fest
ADD CONSTRAINT FK_Fest_X_Stage FOREIGN KEY (fest_id)
REFERENCES Festivals.Fest(fest_id);


ALTER TABLE Festivals.Fest_X_Performer
ADD CONSTRAINT PK_Fest_X_Performer PRIMARY KEY (fest_id, performer_id);

ALTER TABLE Festivals.Fest_X_Performer
ADD CONSTRAINT  FK_Fest_X_Performer FOREIGN KEY (fest_id)
REFERENCES Festivals.Fest(fest_id);

ALTER TABLE Festivals.Fest_X_Performer
ADD CONSTRAINT FK_Performer_X_Fest FOREIGN KEY (performer_id)
REFERENCES Festivals.Performer(performer_id);


ALTER TABLE Festivals.Fest_X_Organizer
ADD CONSTRAINT PK_Fest_X_Organizer PRIMARY KEY (fest_id, organizer_id);

ALTER TABLE Festivals.Fest_X_Organizer
ADD CONSTRAINT FK_Fest_X_Organizer FOREIGN KEY (fest_id)
REFERENCES Festivals.Fest(fest_id);

ALTER TABLE Festivals.Fest_X_Organizer
ADD CONSTRAINT FK_Organizer_X_Fest FOREIGN KEY (organizer_id)
REFERENCES Festivals.Organizer(organizer_id);


INSERT INTO Festivals.Artist
VALUES (DEFAULT, 'Дима', 31, 'guitar');
INSERT INTO Festivals.Artist
VALUES (DEFAULT, 'Катя', 24, 'bass');
INSERT INTO Festivals.Artist
VALUES (DEFAULT, 'Леша', 20, NULL);
INSERT INTO Festivals.Artist
VALUES (DEFAULT, 'Вася', 18, 'singer');
INSERT INTO Festivals.Artist
VALUES (DEFAULT, 'Ержан', 5, 'singer');
INSERT INTO Festivals.Artist
VALUES (DEFAULT, 'Далия', 40, 'bass');
INSERT INTO Festivals.Artist
VALUES (DEFAULT, 'Иван', 73, 'drummer');
INSERT INTO Festivals.Artist
VALUES (DEFAULT, 'Елисей', 28, 'singer');
INSERT INTO Festivals.Artist
VALUES (DEFAULT, 'Саня', 29, NULL);
INSERT INTO Festivals.Artist
VALUES (DEFAULT, 'Абдулла', 58, 'keyboardist');
INSERT INTO Festivals.Artist
VALUES (DEFAULT, 'Вика', 43, 'guitar');
INSERT INTO Festivals.Artist
VALUES (DEFAULT, 'Вероника', 12, NULL);

INSERT INTO Festivals.Performer
VALUES (DEFAULT, 'Lesha Marlow', 'rap', 'Сызрань');
INSERT INTO Festivals.Performer
VALUES (DEFAULT, 'Morgensanya', 'jazz', 'Бобруйск');
INSERT INTO Festivals.Performer
VALUES (DEFAULT, '4ika Veronika', 'rap', NULL);
INSERT INTO Festivals.Performer
VALUES (DEFAULT, 'Кабаньчики', 'pop-punk', 'Реутов');
INSERT INTO Festivals.Performer
VALUES (DEFAULT, 'Бравл Старсеры', 'blues', 'Тутаев');
INSERT INTO Festivals.Performer
VALUES (DEFAULT, 'Мошлая Полли', 'jazz', 'Москва');

INSERT INTO Festivals.Artist_X_Performer
VALUES (3, 1);
INSERT INTO Festivals.Artist_X_Performer
VALUES (9, 2);
INSERT INTO Festivals.Artist_X_Performer
VALUES (12, 3);
INSERT INTO Festivals.Artist_X_Performer
VALUES (1, 4);
INSERT INTO Festivals.Artist_X_Performer
VALUES (2, 4);
INSERT INTO Festivals.Artist_X_Performer
VALUES (4, 4);
INSERT INTO Festivals.Artist_X_Performer
VALUES (5, 5);
INSERT INTO Festivals.Artist_X_Performer
VALUES (7, 5);
INSERT INTO Festivals.Artist_X_Performer
VALUES (8, 6);
INSERT INTO Festivals.Artist_X_Performer
VALUES (10, 6);
INSERT INTO Festivals.Artist_X_Performer
VALUES (11, 6);
INSERT INTO Festivals.Artist_X_Performer
VALUES (6, 6);
INSERT INTO Festivals.Artist_X_Performer
VALUES (3, 5);
INSERT INTO Festivals.Artist_X_Performer
VALUES (8, 4);


INSERT INTO Festivals.Listener
VALUES(DEFAULT, 'Димас', 12);
INSERT INTO Festivals.Listener
VALUES(DEFAULT, 'Вован', 13);
INSERT INTO Festivals.Listener
VALUES(DEFAULT, 'Леха', 14);
INSERT INTO Festivals.Listener
VALUES(DEFAULT, 'Катюха', 12);
INSERT INTO Festivals.Listener
VALUES(DEFAULT, 'Владос', 16);
INSERT INTO Festivals.Listener
VALUES(DEFAULT, 'Темыч', 20);
INSERT INTO Festivals.Listener
VALUES(DEFAULT, 'Андрюха', 13);
INSERT INTO Festivals.Listener
VALUES(DEFAULT, 'Кирюха', 10);
INSERT INTO Festivals.Listener
VALUES(DEFAULT, 'Настюха', 33);
INSERT INTO Festivals.Listener
VALUES(DEFAULT, 'Васян', 7);
INSERT INTO Festivals.Listener
VALUES(DEFAULT, 'Никитос', 15);
INSERT INTO Festivals.Listener
VALUES(DEFAULT, 'Ксюха', 15);

INSERT INTO Festivals.Listener_X_Performer
VALUES (1, 4);
INSERT INTO Festivals.Listener_X_Performer
VALUES (2, 2);
INSERT INTO Festivals.Listener_X_Performer
VALUES (3, 5);
INSERT INTO Festivals.Listener_X_Performer
VALUES (4, 1);
INSERT INTO Festivals.Listener_X_Performer
VALUES (5, 2);
INSERT INTO Festivals.Listener_X_Performer
VALUES (6, 3);
INSERT INTO Festivals.Listener_X_Performer
VALUES (7, 4);
INSERT INTO Festivals.Listener_X_Performer
VALUES (8, 1);
INSERT INTO Festivals.Listener_X_Performer
VALUES (9, 6);
INSERT INTO Festivals.Listener_X_Performer
VALUES (10, 4);
INSERT INTO Festivals.Listener_X_Performer
VALUES (11, 2);
INSERT INTO Festivals.Listener_X_Performer
VALUES (12, 6);
INSERT INTO Festivals.Listener_X_Performer
VALUES (3, 3);
INSERT INTO Festivals.Listener_X_Performer
VALUES (5, 5);
INSERT INTO Festivals.Listener_X_Performer
VALUES (6, 1);
INSERT INTO Festivals.Listener_X_Performer
VALUES (9, 4);
INSERT INTO Festivals.Listener_X_Performer
VALUES (9, 2);

INSERT INTO Festivals.Stage
VALUES (DEFAULT, 'Северная сцена', 'open-air');
INSERT INTO Festivals.Stage
VALUES (DEFAULT, 'Южная сцена', 'open-air');
INSERT INTO Festivals.Stage
VALUES (DEFAULT, 'Синяя сцена', 'closed');
INSERT INTO Festivals.Stage
VALUES (DEFAULT, 'Красная сцена', 'closed');
INSERT INTO Festivals.Stage
VALUES (DEFAULT, 'Розовая сцена', 'closed');
INSERT INTO Festivals.Stage
VALUES (DEFAULT, 'Деревянная сцена', 'open-air');

INSERT INTO Festivals.Fest
VALUES (DEFAULT, 'Пикник у Миши', '2021-07-21', '2021-07-22');
INSERT INTO Festivals.Fest
VALUES (DEFAULT, 'Beat-Meat', '2021-06-01', '2021-06-01');
INSERT INTO Festivals.Fest
VALUES (DEFAULT, 'Park Die', '2021-08-08', '2021-08-11');
INSERT INTO Festivals.Fest
VALUES (DEFAULT, 'Faces&Faces', '2021-07-13', '2021-07-15');

INSERT INTO Festivals.Stage_X_Fest
VALUES (3, 2);
INSERT INTO Festivals.Stage_X_Fest
VALUES (2, 3);
INSERT INTO Festivals.Stage_X_Fest
VALUES (4, 1);
INSERT INTO Festivals.Stage_X_Fest
VALUES (5, 4);
INSERT INTO Festivals.Stage_X_Fest
VALUES (1, 1);
INSERT INTO Festivals.Stage_X_Fest
VALUES (6, 1);
INSERT INTO Festivals.Stage_X_Fest
VALUES (2, 2);
INSERT INTO Festivals.Stage_X_Fest
VALUES (4, 2);
INSERT INTO Festivals.Stage_X_Fest
VALUES (3, 4);
INSERT INTO Festivals.Stage_X_Fest
VALUES (5, 2);

INSERT INTO Festivals.Fest_X_Performer
VALUES (3, 6);
INSERT INTO Festivals.Fest_X_Performer
VALUES (2, 2);
INSERT INTO Festivals.Fest_X_Performer
VALUES (4, 4);
INSERT INTO Festivals.Fest_X_Performer
VALUES (2, 3);
INSERT INTO Festivals.Fest_X_Performer
VALUES (1, 2);
INSERT INTO Festivals.Fest_X_Performer
VALUES (3, 5);
INSERT INTO Festivals.Fest_X_Performer
VALUES (2, 4);
INSERT INTO Festivals.Fest_X_Performer
VALUES (4, 1);
INSERT INTO Festivals.Fest_X_Performer
VALUES (1, 3);
INSERT INTO Festivals.Fest_X_Performer
VALUES (1, 5);

INSERT INTO Festivals.Organizer
VALUES (DEFAULT, 'Михаил Павлович', 'Алмаз-Антей');
INSERT INTO Festivals.Organizer
VALUES (DEFAULT, 'Петр Юрьевич', 'Яндекс');
INSERT INTO Festivals.Organizer
VALUES (DEFAULT, 'Дмитрий Витальевич', 'X5 Retail Group');
INSERT INTO Festivals.Organizer
VALUES (DEFAULT, 'Василий Петрович', NULL);
INSERT INTO Festivals.Organizer
VALUES (DEFAULT, 'Ксения Дмитриевна', 'ВАЗ');
INSERT INTO Festivals.Organizer
VALUES (DEFAULT, 'Антон Артемович', 'Apple');

INSERT INTO Festivals.Fest_X_Organizer
VALUES (2, 5);
INSERT INTO Festivals.Fest_X_Organizer
VALUES (3, 2);
INSERT INTO Festivals.Fest_X_Organizer
VALUES (1, 3);
INSERT INTO Festivals.Fest_X_Organizer
VALUES (2, 6);
INSERT INTO Festivals.Fest_X_Organizer
VALUES (4, 4);
INSERT INTO Festivals.Fest_X_Organizer
VALUES (1, 1);
INSERT INTO Festivals.Fest_X_Organizer
VALUES (2, 3);
INSERT INTO Festivals.Fest_X_Organizer
VALUES (3, 3);
INSERT INTO Festivals.Fest_X_Organizer
VALUES (1, 4);
INSERT INTO Festivals.Fest_X_Organizer
VALUES (4, 3);

INSERT INTO Festivals.TicketShop
VALUES (DEFAULT, 'Билеты номер 1', 'Курская');
INSERT INTO Festivals.TicketShop
VALUES (DEFAULT, 'Rok Zhiv', 'Бабушкинская');
INSERT INTO Festivals.TicketShop
VALUES (DEFAULT, 'У Василия', 'Китай-Город');
INSERT INTO Festivals.TicketShop
VALUES (DEFAULT, 'Afisha', 'Солнцево');
INSERT INTO Festivals.TicketShop
VALUES (DEFAULT, 'Пятерочка', 'Тимирязевская');

INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 11, 3, 2, 2400);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 7, 1, 4, 3000);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 3, 5, 1, 5000);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 12, 4, 2, 2800);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 4, 5, 4, 3000);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 6, 5, 1, 5000);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 10, 5, 2, 2400);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 1, 2, 3, 3200);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 9, 1, 1, 4000);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 6, 3, 2, 2800);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 4, 2, 4, 2500);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 2, 5, 3, 4100);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 12, 4, 2, 2000);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 7, 5, 4, 2500);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 8, 3, 1, 10000);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 6, 1, 2, 2300);
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 3, 2, 4, 2700);

-- Выводит исполнителей и участников группы/артиста под данным псевдонимом
-- Исполнители в алфавитном порядке
WITH Linked_Artist AS (
    SELECT * FROM Festivals.Artist artist
    INNER JOIN Festivals.Artist_X_Performer link
    ON artist.artist_id = link.artist_id
)
SELECT DISTINCT performer_nm, artist_nm, role_value
FROM Linked_Artist artist
FULL JOIN Festivals.Performer performer
ON artist.performer_id = performer.performer_id
ORDER BY performer_nm;

-- Выводит количество проданных билетов для каждого магазина
SELECT ticketshop_nm as name, COUNT(ticket_id) as tickets
FROM Festivals.TicketShop shop
FULL JOIN Festivals.Ticket ticket
ON ticket.ticketshop_id = shop.ticketshop_id
GROUP BY shop.ticketshop_nm
ORDER BY COUNT(ticket_id) DESC;

SELECT * FROM Festivals.Listener;

-- Выводит топ жанров по прослушиваниям
WITH Linked_Listeners AS (
    SELECT listener.listener_id, age_value, performer_id
    FROM Festivals.Listener listener
    INNER JOIN Festivals.Listener_X_Performer link
    ON listener.listener_id = link.listener_id
)
SELECT genre_value, COUNT(listeners.listener_id)
FROM Linked_Listeners listeners
FULL JOIN Festivals.Performer performers
ON listeners.performer_id = performers.performer_id
GROUP BY genre_value
ORDER BY COUNT(genre_value) DESC;

-- Для каждого слушателя найти фестивали, на которые он купил билеты
WITH Fest_Ticket AS (
    SELECT fest_nm, ticket_id, listener_id
    FROM Festivals.Ticket t
    INNER JOIN Festivals.Fest f
    ON t.fest_id = f.fest_id
)
SELECT DISTINCT listener_nm as name, fest_nm as festival
FROM Fest_Ticket ticket
LEFT JOIN Festivals.listener listener
ON ticket.listener_id = listener.listener_id
ORDER BY name;

-- Для каждого исполнителя найти среднюю цену билета на фестиваль с его участием
SELECT performer_nm as performer, CAST (AVG(price_value) AS DECIMAL(10, 2)) as average_price
FROM Festivals.Performer perf
INNER JOIN Festivals.Fest_X_Performer fxp
ON perf.performer_id = fxp.performer_id
INNER JOIN Festivals.Fest fest
ON fxp.fest_id = fest.fest_id
INNER JOIN Festivals.Ticket ticket
ON fest.fest_id = ticket.fest_id
GROUP BY performer_nm
ORDER BY average_price DESC;

-- CRUD
INSERT INTO Festivals.TicketShop
VALUES (DEFAULT, 'TESTSHOP', 'Окружная');
INSERT INTO Festivals.Ticket
VALUES (DEFAULT, 5, 6, 2, 1000);

SELECT * FROM Festivals.TicketShop;
SELECT * FROM Festivals.Ticket;

UPDATE Festivals.TicketShop
SET ticketshop_nm = 'UWU SHOP'
WHERE ticketshop_nm = 'TESTSHOP';

DELETE FROM Festivals.Ticket
WHERE ticketshop_id = 6;

DELETE FROM Festivals.TicketShop
WHERE ticketshop_nm = 'UWU SHOP';


-- Views


-- Выводит артистов без возраста и id
DROP VIEW IF EXISTS Artist_View;
CREATE VIEW Artist_View AS
SELECT artist_nm as name, role_value
FROM Festivals.Artist;

-- Выводит исполнителей без id
DROP VIEW IF EXISTS Performer_View;
CREATE OR REPLACE VIEW Performer_View AS
SELECT performer_nm as name, genre_value, city_value
FROM Festivals.Performer;

-- Выводит слушателей без id и со скрытым именем
CREATE OR REPLACE VIEW Listener_View AS
SELECT LEFT(listener_nm, 1) || '.' as name, age_value
FROM Festivals.Listener;

-- Выводит сцены без id
DROP VIEW IF EXISTS Stage_View;
CREATE VIEW Stage_View AS
SELECT stage_nm, type_value
FROM Festivals.Stage;

-- Выводит цены на билеты на разные фестивали
DROP VIEW IF EXISTS Ticket_Prices;
CREATE OR REPLACE VIEW Ticket_Prices AS
SELECT fest_nm, price_value
FROM Festivals.Ticket ticket
LEFT JOIN Festivals.Fest fest
ON ticket.fest_id = fest.fest_id
ORDER BY fest_nm, price_value;

-- Выводит магазины билетов без id
DROP VIEW IF EXISTS TicketShop_View;
CREATE VIEW TicketShop_View AS
SELECT ticketshop_nm as name, metro_value
FROM Festivals.TicketShop;

-- Выводит организаторов без id и со скрытым именем
DROP VIEW IF EXISTS Organizer_View;
CREATE VIEW Organizer_view AS
SELECT LEFT(organizer_nm, 1) || '.' as name, company_nm
FROM Festivals.Organizer;

-- Выводит промежуток времени, в который проводится каждый фестиваль
DROP VIEW IF EXISTS Fest_View;
CREATE VIEW Fest_View AS
SELECT fest_nm as name,
       EXTRACT(DAY FROM start_dt) || ' ' ||
       TRIM(TO_CHAR(start_dt, 'Month')) || ' ' ||
       EXTRACT(YEAR FROM start_dt) || ' - ' ||
       EXTRACT(DAY FROM end_dt) || ' ' ||
       TRIM(TO_CHAR(end_dt, 'Month')) || ' ' ||
       EXTRACT(Y FROM end_dt)
       AS dates
FROM Festivals.Fest;

-- Complex views

-- Выводит количество разных ролей музыкантов на фестивалях
DROP VIEW IF EXISTS Role_Types;
CREATE VIEW Role_Types AS
SELECT fest_nm as name, role_value, COUNT(role_value) as count
FROM Festivals.fest fest
INNER JOIN Festivals.Fest_X_Performer fxp
ON fxp.fest_id = fest.fest_id
INNER JOIN Festivals.Performer perf
ON perf.performer_id = fxp.performer_id
INNER JOIN Festivals.Artist_X_Performer axp
ON axp.performer_id = perf.performer_id
INNER JOIN Festivals.Artist art
ON axp.artist_id = art.artist_id
WHERE role_value IS NOT NULL
GROUP BY name, role_value
ORDER BY name;

-- Выводит диапазон возраста слушателей данного исполнителя
DROP VIEW IF EXISTS Listeners_Age;
CREATE VIEW Listeners_Age AS
SELECT performer_nm as name,
       MIN(age_value) || '-' || MAX(age_value) AS age
FROM Festivals.Listener listener
INNER JOIN Festivals.Listener_X_Performer lxp
ON lxp.listener_id = listener.listener_id
INNER JOIN Festivals.Performer perf
ON lxp.performer_id = perf.performer_id
GROUP BY performer_nm;
