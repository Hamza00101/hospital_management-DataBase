INSERT INTO Department (DepartmentName, Phone, Location)
VALUES
('Urology', '0123456789', 'Block A'),
('Neurology', '0123456790', 'Block B'),
('Orthopedics', '0123456791', 'Block C'),
('Cardiology', '0123456792', 'Block D'),
('Dermatology', '0123456793', 'Block E'),
('Oncology', '0123456794', 'Block F'),
('Radiology', '0123456795', 'Block G'),
('Pediatrics', '0123456796', 'Block H'),
('Psychiatry', '0123456797', 'Block I'),
('Emergency', '0123456798', 'Block J');

Select * from Department


INSERT INTO Doctor (FirstName, LastName, Specialization, Phone, Email, DepartmentID)
VALUES
('BinLaden', 'Usama', 'Cardiologist', '0871234567', 'john.smithCIA@hospital.ie', 1),
('Sarah', 'Johnson', 'Neurologist', '0871234568', 'sarah.johnson@hospital.ie', 2),
('David', 'Lee', 'Orthopedic Surgeon', '0871234569', 'david.lee@hospital.ie', 3);
INSERT INTO Doctor (FirstName, LastName, Specialization, Phone, Email, DepartmentID)
VALUES
('Awe','Christopher','Dermatologist','0814754290','awechis@gmail.com',5),
('Kukoyi','Temiloluwa','Oncologist', '0825563789', 'kukoyitemi@gmail.com',6);


Select * from Doctor


INSERT INTO Patient 
(FirstName, LastName, DateOfBirth, Gender, Phone, Email, AddressLine, Eircode)
VALUES
('Alicea', 'Browny', '1990-05-10', 'Female', '0899076543', 'alice1@email.com', '12 Main Street', 'D02XY12'),
('Michael', 'Clark', '1985-08-20', 'Male', '0899876544', 'michael@email.com', '45 Oak Avenue', 'D04AB34'),
('Emma', 'Wilson', '1995-02-15', 'Female', '0899876545', 'emma@email.com', '78 Pine Road', 'D06CD56'),
('John', 'Doe', '1992-07-22', 'Male', '0894593465', 'atmaaggeorge@gmail.com', '3 Shackelton Street', 'D14EF78');
INSERT INTO Patient 
(FirstName, LastName, DateOfBirth, Gender, Phone, Email, AddressLine, Eircode)
VALUES
('Jane', 'Smith', '1998-11-30', 'Female', '0897536254', 'agstwvbsh@gmil.com', '56 Elm Street','D16GH90');

Select * from Patient

INSERT INTO Appointment (AppointmentDateTime, Status, PatientID, DoctorID)
VALUES
('2026-04-01 10:00', 'Scheduled', 1, 13),
('2026-04-01 11:00', 'Scheduled', 2, 15),
('2026-04-02 09:30', 'Completed', 3, 19),
('2026-04-02 12:00', 'Cancelled', 4, 14),
('2026-05-04 14:00', 'Scheduled', 6 ,20);

Select * from Appointment

INSERT INTO Admission 
(AdmissionDate, DischargeDate, Diagnosis, RoomNumber, PatientID, DoctorID)
VALUES
('2026-04-05', '2026-04-10', 'Heart Condition', '101A', 1, 13),
('2026-04-06', '2026-04-09', 'Migraine Observation', '102B', 2, 15),
('2026-04-07', '2026-04-12', 'Fractured Arm', '103C', 3, 20);
INSERT INTO Admission 
(AdmissionDate, DischargeDate, Diagnosis, RoomNumber, PatientID, DoctorID)
VALUES
('2025-05-01', '2026-05-10', 'Skin Rash', '104D', 4, 19),
('2026-08-09', '2026-08-15', 'Cancer Treatment', '105E', 6, 20);

Select * from Admission

INSERT INTO Prescription 
(PrescriptionDate, MedicationName, Dosage, Frequency, DurationDays, Notes, AdmissionID, DoctorID)
VALUES
('2026-04-05', 'Aspirin', '100mg', 'Twice daily', 5, 'After meals', 1, 20),
('2026-04-06', 'Ibuprofen', '200mg', 'Three times daily', 7, 'Pain relief', 3, 19),
('2026-04-07', 'Paracetamol', '500mg', 'Twice daily', 3, 'Fever control', 2, 13);

Select * from Prescription

INSERT INTO Payment 
(Amount, PaymentDate, PaymentMethod, PaymentStatus, AdmissionID)
VALUES
(1200.50, '2026-04-10', 'Card', 'Completed', 1),
(800.00, '2026-04-09', 'Cash', 'Completed', 2),
(1500.75, '2026-04-12', 'Insurance', 'Pending', 3);
INSERT INTO Payment 
(Amount, PaymentDate, PaymentMethod, PaymentStatus, AdmissionID)
VALUES
(2500.00, '2026-05-09', 'Card', 'Completed', 4),
(3000.00, '2026-08-07', 'Insurance', 'Pending', 5);

Select * from Payment

SELECT * FROM Department;
SELECT * FROM Doctor;
SELECT * FROM Patient;
SELECT * FROM Appointment;
SELECT * FROM Admission;
SELECT * FROM Prescription;
SELECT * FROM Payment;