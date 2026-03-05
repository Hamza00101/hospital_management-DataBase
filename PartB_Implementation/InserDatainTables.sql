INSERT INTO Department (DepartmentName, Phone, Location)
VALUES
('Urology', '0123456789', 'Block A'),
('Neurology', '0123456790', 'Block B'),
('Orthopedics', '0123456791', 'Block C');

Select * from Department


INSERT INTO Doctor (FirstName, LastName, Specialization, Phone, Email, DepartmentID)
VALUES
('BinLaden', 'Usama', 'Cardiologist', '0871234567', 'john.smithCIA@hospital.ie', 1),
('Sarah', 'Johnson', 'Neurologist', '0871234568', 'sarah.johnson@hospital.ie', 4),
('David', 'Lee', 'Orthopedic Surgeon', '0871234569', 'david.lee@hospital.ie', 5);

Select * from Doctor


INSERT INTO Patient 
(FirstName, LastName, DateOfBirth, Gender, Phone, Email, AddressLine, Eircode)
VALUES
('Alicea', 'Browny', '1990-05-10', 'Female', '0899076543', 'alice1@email.com', '12 Main Street', 'D02XY12'),
('Michael', 'Clark', '1985-08-20', 'Male', '0899876544', 'michael@email.com', '45 Oak Avenue', 'D04AB34'),
('Emma', 'Wilson', '1995-02-15', 'Female', '0899876545', 'emma@email.com', '78 Pine Road', 'D06CD56');

Select * from Patient

INSERT INTO Appointment (AppointmentDateTime, Status, PatientID, DoctorID)
VALUES
('2026-04-01 10:00', 'Scheduled', 1, 1),
('2026-04-01 11:00', 'Scheduled', 2, 8),
('2026-04-02 09:30', 'Completed', 3, 10);

Select * from Appointment

INSERT INTO Admission 
(AdmissionDate, DischargeDate, Diagnosis, RoomNumber, PatientID, DoctorID)
VALUES
('2026-04-05', '2026-04-10', 'Heart Condition', '101A', 1, 1),
('2026-04-06', '2026-04-09', 'Migraine Observation', '102B', 2, 8),
('2026-04-07', '2026-04-12', 'Fractured Arm', '103C', 3, 10);

Select * from Admission

INSERT INTO Prescription 
(PrescriptionDate, MedicationName, Dosage, Frequency, DurationDays, Notes, AdmissionID, DoctorID)
VALUES
('2026-04-05', 'Aspirin', '100mg', 'Twice daily', 5, 'After meals', 1, 1),
('2026-04-06', 'Ibuprofen', '200mg', 'Three times daily', 7, 'Pain relief', 7, 8),
('2026-04-07', 'Paracetamol', '500mg', 'Twice daily', 3, 'Fever control', 8, 10);

Select * from Prescription

INSERT INTO Payment 
(Amount, PaymentDate, PaymentMethod, PaymentStatus, AdmissionID)
VALUES
(1200.50, '2026-04-10', 'Card', 'Completed', 1),
(800.00, '2026-04-09', 'Cash', 'Completed', 7),
(1500.75, '2026-04-12', 'Insurance', 'Pending', 8);

Select * from Payment

SELECT * FROM Department;
SELECT * FROM Doctor;
SELECT * FROM Patient;
SELECT * FROM Appointment;
SELECT * FROM Admission;
SELECT * FROM Prescription;
SELECT * FROM Payment;

