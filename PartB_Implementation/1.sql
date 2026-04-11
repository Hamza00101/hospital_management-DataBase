CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL,
    Location VARCHAR(100) NOT NULL
);


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


CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    DepartmentID INT NOT NULL,
    CONSTRAINT FK_Doctor_Department
    FOREIGN KEY (DepartmentID)
    REFERENCES Department(DepartmentID)
);

CREATE TABLE Admission (
    AdmissionID INT PRIMARY KEY IDENTITY(1,1),
    AdmissionDate DATETIME2 NOT NULL,
    DischargeDate DATETIME2 NULL,
    Diagnosis VARCHAR(255) NOT NULL,
    RoomNumber VARCHAR(10) NOT NULL,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    CONSTRAINT FK_Admission_Patient
    FOREIGN KEY (PatientID)
    REFERENCES Patient(PatientID),
    CONSTRAINT FK_Admission_Doctor
    FOREIGN KEY (DoctorID)
    REFERENCES Doctor(DoctorID),
    CONSTRAINT CHK_DischargeDate
    CHECK (DischargeDate IS NULL OR DischargeDate >= AdmissionDate)
);

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    AppointmentDateTime DATETIME2 NOT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Scheduled','Completed','Cancelled')),
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    CONSTRAINT FK_Appointment_Patient
    FOREIGN KEY (PatientID)
    REFERENCES Patient(PatientID),
    CONSTRAINT FK_Appointment_Doctor
    FOREIGN KEY (DoctorID)
    REFERENCES Doctor(DoctorID),
    CONSTRAINT UQ_Doctor_Time
    UNIQUE (DoctorID, AppointmentDateTime)
);
CREATE TABLE Prescription (
    PrescriptionID INT PRIMARY KEY IDENTITY(1,1),
    PrescriptionDate DATETIME2 NOT NULL,
    MedicationName VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50) NOT NULL,
    Frequency VARCHAR(50) NOT NULL,
    DurationDays INT NOT NULL,
    Notes VARCHAR(255) NULL,
    AdmissionID INT NOT NULL,
    DoctorID INT NOT NULL,
    CONSTRAINT FK_Prescription_Admission
    FOREIGN KEY (AdmissionID)
    REFERENCES Admission(AdmissionID),
    CONSTRAINT FK_Prescription_Doctor
    FOREIGN KEY (DoctorID)
    REFERENCES Doctor(DoctorID)
);
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    Amount DECIMAL(10,2) NOT NULL,
    PaymentDate DATETIME2 NOT NULL,
    PaymentMethod VARCHAR(20) NOT NULL CHECK (PaymentMethod IN ('Cash','Card','Insurance','Online')),
    PaymentStatus VARCHAR(20) NOT NULL CHECK (PaymentStatus IN ('Pending','Completed','Failed')),
    AdmissionID INT NOT NULL,
    CONSTRAINT FK_Payment_Admission
    FOREIGN KEY (AdmissionID)
    REFERENCES Admission(AdmissionID)
);

select * from Patient