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