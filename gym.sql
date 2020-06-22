DROP TABLE IF EXISTS equip;
DROP TABLE IF EXISTS progress;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS receps;
DROP TABLE IF EXISTS trainors;

DROP TABLE IF EXISTS plans;

DROP TABLE IF EXISTS info;



CREATE TABLE info(username VARCHAR(200), password VARCHAR(500), name VARCHAR(100), prof INT, street VARCHAR(100), city VARCHAR(50), phone VARCHAR(32), PRIMARY KEY(username));

CREATE TABLE plans(name VARCHAR(100), PRIMARY KEY(name));

CREATE TABLE receps(username VARCHAR(200), PRIMARY KEY(username), FOREIGN KEY(username) references info(username));

CREATE TABLE trainors(username VARCHAR(200), PRIMARY KEY(username), FOREIGN KEY(username) references info(username));

CREATE TABLE members(username VARCHAR(200), plan VARCHAR(100), trainor VARCHAR(200), PRIMARY KEY(username), FOREIGN KEY(username) references info(username), FOREIGN KEY(plan) references plans(name), FOREIGN KEY(trainor) references trainors(username));

ALTER TABLE info ADD time TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

INSERT INTO info(username, password, name, prof, street, city, phone) VALUES('eswar_123', '$5$rounds=535000$ajR8hAzSoSF.NhEs$MaLn1dbnXq9eu2W5Ge3c1ScAS9960yLBFv3aU9zaxc0', 'Parameswar K', 1, 'Adarshnagar', 'Anantapur', 9666585361);

CREATE TABLE progress(username VARCHAR(200), date DATE, daily_result VARCHAR(200), time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY(username, date), FOREIGN KEY(username) references members(username));



CREATE TABLE equip(name VARCHAR(200),count INT);
