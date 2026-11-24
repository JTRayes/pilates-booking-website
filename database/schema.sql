-- Pilates Studio booking database
-- Creates the four tables the website uses, with sample services and an admin account.
-- Rebuilt from the queries in the C# code, because the original database file
-- held test accounts and is not included in this repository.

CREATE TABLE Users (
    UserID    INT IDENTITY(1,1) PRIMARY KEY,
    Name      NVARCHAR(100) NOT NULL,
    Email     NVARCHAR(100) NOT NULL UNIQUE,
    Password  NVARCHAR(100) NOT NULL,
    Phone     NVARCHAR(20)  NULL,
    Role      NVARCHAR(10)  NOT NULL   -- 'client' or 'admin'
);

CREATE TABLE Services (
    ServiceID    INT IDENTITY(1,1) PRIMARY KEY,
    ServiceName  NVARCHAR(100) NOT NULL,
    Duration     NVARCHAR(50)  NULL,
    Price        DECIMAL(10,2) NULL
);

CREATE TABLE Availability (
    AvailabilityID  INT IDENTITY(1,1) PRIMARY KEY,
    ServiceID       INT NOT NULL REFERENCES Services(ServiceID),
    AvailableDate   NVARCHAR(50) NOT NULL,
    AvailableTime   NVARCHAR(50) NOT NULL
);

CREATE TABLE Appointments (
    AppointmentID    INT IDENTITY(1,1) PRIMARY KEY,
    UserID           INT NOT NULL REFERENCES Users(UserID),
    ServiceID        INT NOT NULL REFERENCES Services(ServiceID),
    AppointmentDate  NVARCHAR(50) NOT NULL,
    AppointmentTime  NVARCHAR(50) NOT NULL
);

-- The booking page expects these three services with IDs 1, 2 and 3.
INSERT INTO Services (ServiceName, Duration, Price) VALUES
    ('Reformer Pilates', '60 min', 150),
    ('Beginner Class',   '45 min', 100),
    ('Private Session',  '60 min', 250);

-- Demo admin account for local testing only. Change the password before any real use.
INSERT INTO Users (Name, Email, Password, Phone, Role) VALUES
    ('Admin', 'admin@pilates.com', 'ChangeMe123', NULL, 'admin');
