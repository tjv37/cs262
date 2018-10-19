﻿--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
-- 
-- modified by Ty Vredeveld and Quentin Barnes

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGameProperty;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	ID integer PRIMARY KEY,
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer,
	location varchar(50)
	);

CREATE TABLE PlayerGameProperty (
	playergameID integer REFERENCES PlayerGame(ID),
	propertyID integer REFERENCES Property(ID),
	numHouses integer,
	numHotels integer
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PlayerGameProperty TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO Property VALUES (1, 'Mediterranean Avenue');
INSERT INTO Property VALUES (2, 'Baltic Avenue');
INSERT INTO Property VALUES (3, 'Oriental Avenue');

INSERT INTO PlayerGame VALUES (1, 1, 1, 0, 0, 'Mediterranean Avenue');
INSERT INTO PlayerGame VALUES (2, 1, 2, 0, 0, 'Baltic Avenue');
INSERT INTO PlayerGame VALUES (3, 1, 3, 2350, 2350, 'Oriental Avenue');
INSERT INTO PlayerGame VALUES (4, 2, 1, 1000, 1000, 'Mediterranean Avenue');
INSERT INTO PlayerGame VALUES (5, 2, 2, 0, 0, 'Baltic Avenue');
INSERT INTO PlayerGame VALUES (6, 2, 3, 500, 500, 'Oriental Avenue');
INSERT INTO PlayerGame VALUES (7, 3, 2, 0, 0, 'Mediterranean Avenue');
INSERT INTO PlayerGame VALUES (8, 3, 3, 5500, 5500, 'Baltic Avenue');

INSERT INTO PlayerGameProperty VALUES (1, 1, 3, 0);
INSERT INTO PlayerGameProperty VALUES (1, 3, 0, 2);
INSERT INTO PlayerGameProperty VALUES (4, 1, 1, 0);
INSERT INTO PlayerGameProperty VALUES (4, 2, 4, 0);
INSERT INTO PlayerGameProperty VALUES (4, 3, 0, 1);
INSERT INTO PlayerGameProperty VALUES (5, 2, 2, 0);
INSERT INTO PlayerGameProperty VALUES (6, 2, 1, 1);
INSERT INTO PlayerGameProperty VALUES (6, 3, 2, 1);
INSERT INTO PlayerGameProperty VALUES (8, 1, 4, 0);