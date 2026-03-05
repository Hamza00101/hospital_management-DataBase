INSERT INTO Department (DepartmentName, Phone, Location)
VALUES ('Cardiology', '0123456789', 'Block A');

INSERT INTO Doctor (FirstName, LastName, Specialization, Phone, Email, DepartmentID)
VALUES ('John', 'Smith', 'Cardiologist', '0871234567', 'john.smith@hospital.ie', 1);

INSERT INTO Patient 
(FirstName, LastName, DateOfBirth, Gender, Phone, Email, AddressLine, Eircode)
VALUES 
('Alice', 'Brown', '1990-05-10', 'Female', '0899876543', 'alice.brown@email.com', '12 Main Street', 'D02XY12');

INSERT INTO Admission 
(AdmissionDate, DischargeDate, Diagnosis, RoomNumber, PatientID, DoctorID)
VALUES 
('2026-03-01', '2026-03-10', 'Heart Condition', '101A', 1, 1);

INSERT INTO Admission 
(AdmissionDate, DischargeDate, Diagnosis, RoomNumber, PatientID, DoctorID)
VALUES 
('2026-03-15', '2026-03-20', 'Check-up', '103C', 1, 1);

SELECT * FROM Admission;