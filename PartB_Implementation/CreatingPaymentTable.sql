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