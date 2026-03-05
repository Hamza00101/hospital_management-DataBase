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