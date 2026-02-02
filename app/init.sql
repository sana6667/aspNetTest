CREATE DATABASE IF NOT EXISTS aspnetdb;
USE aspnetdb;

CREATE TABLE IF NOT EXISTS Users (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL
);

INSERT INTO Users (Username, PasswordHash)
VALUES ('admin', 'secret123');
