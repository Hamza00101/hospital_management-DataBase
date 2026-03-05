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