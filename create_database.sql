-- Create the database
CREATE DATABASE IF NOT EXISTS CoffeeShopDB;
USE CoffeeShopDB;

-- Users Table
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Message TEXT,
    SubmissionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Description TEXT,
    Category ENUM('Hot Beverages', 'Cold Beverages', 'Refreshment', 'Special Combos', 'Burger & French Fries', 'Desserts') NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    ImageURL VARCHAR(255)
);

-- Reservations Table
CREATE TABLE IF NOT EXISTS Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    ReservationDate DATE NOT NULL,
    ReservationTime TIME NOT NULL,
    NumberOfGuests INT NOT NULL,
    SpecialRequests TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- GalleryImages Table
CREATE TABLE IF NOT EXISTS GalleryImages (
    ImageID INT AUTO_INCREMENT PRIMARY KEY,
    ImageURL VARCHAR(255) NOT NULL,
    Description TEXT,
    UploadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CustomerReviews Table
CREATE TABLE IF NOT EXISTS CustomerReviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    ReviewText TEXT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);