CREATE TABLE Patient (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL CHECK (Gender IN ('Male','Female','Other')),
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100) UNIQUE NULL,
    AddressLine VARCHAR(255) NOT NULL,
    Eircode VARCHAR(10) NOT NULL
);