INSERT INTO Department (DepartmentName, Phone, Location) VALUES
('Cardiology', '014567890', 'Block A'),
('Neurology', '014567891', 'Block B'),
('Orthopedics', '014567892', 'Block C'),
('Pediatrics', '014567893', 'Block D'),
('Oncology', '014567894', 'Block E'),
('Dermatology', '014567895', 'Block F'),
('Emergency', '014567896', 'Ground Floor'),
('Radiology', '014567897', 'Block G');

Select * from Department

INSERT INTO Patient (FirstName, LastName, DateOfBirth, Gender, Phone, Email, AddressLine, Eircode) VALUES
('Ahmad', 'Ali', '1995-06-15', 'Male', '0871234567', 'ahmad.ali@email.com', '12 Camden Street', 'D02X285'),
('Sara', 'Khan', '1998-09-21', 'Female', '0872345678', 'sara.khan@email.com', '45 Abbey Road', 'D01AB12'),
('John', 'Murphy', '1985-02-10', 'Male', '0873456789', 'john.murphy@email.com', '78 OConnell Street', 'D01CD34'),
('Emma', 'Smith', '2000-12-05', 'Female', '0874567890', 'emma.smith@email.com', '22 Grafton Street', 'D02EF56'),
('Ali', 'Hassan', '1992-07-18', 'Male', '0875678901', 'ali.hassan@email.com', '10 Dawson Street', 'D02GH78'),
('Fatima', 'Noor', '1997-03-25', 'Female', '0876789012', 'fatima.noor@email.com', '5 Henry Street', 'D01IJ90'),
('David', 'Brown', '1988-11-30', 'Male', '0877890123', 'david.brown@email.com', '33 Talbot Street', 'D01KL12'),
('Sophia', 'Wilson', '1999-05-14', 'Female', '0878901234', 'sophia.wilson@email.com', '60 Pearse Street', 'D02MN34');

Select * from Patient

INSERT INTO Doctor (FirstName, LastName, Specialization, Phone, Email, DepartmentID) VALUES
('Michael', 'Ryan', 'Cardiologist', '0851111111', 'm.ryan@hospital.com', 1),
('Laura', 'OBrien', 'Neurologist', '0852222222', 'l.obrien@hospital.com', 2),
('James', 'Kelly', 'Orthopedic Surgeon', '0853333333', 'j.kelly@hospital.com', 3),
('Anna', 'Doyle', 'Pediatrician', '0854444444', 'a.doyle@hospital.com', 4),
('Robert', 'Smith', 'Oncologist', '0855555555', 'r.smith@hospital.com', 5),
('Niamh', 'Walsh', 'Dermatologist', '0856666666', 'n.walsh@hospital.com', 6),
('Patrick', 'Byrne', 'Emergency Specialist', '0857777777', 'p.byrne@hospital.com', 7),
('Eoin', 'Farrell', 'Radiologist', '0858888888', 'e.farrell@hospital.com', 8);

Select * from Doctor

INSERT INTO Admission (AdmissionDate, DischargeDate, Diagnosis, RoomNumber, PatientID, DoctorID) VALUES
('2026-04-01 10:00', '2026-04-05 12:00', 'Heart Disease', 'A101', 1, 1),
('2026-04-02 09:30', NULL, 'Migraine', 'B202', 2, 2),
('2026-04-03 14:00', '2026-04-06 10:00', 'Fracture', 'C303', 3, 3),
('2026-04-04 11:15', NULL, 'Flu', 'D404', 4, 4),
('2026-04-05 16:45', NULL, 'Cancer Treatment', 'E505', 5, 5),
('2026-04-06 08:20', '2026-04-07 09:00', 'Skin Allergy', 'F606', 6, 6),
('2026-04-07 13:10', NULL, 'Accident Injury', 'G707', 7, 7),
('2026-04-08 15:30', NULL, 'X-Ray Scan', 'H808', 8, 8);

Select * from Admission

INSERT INTO Appointment (AppointmentDateTime, Status, PatientID, DoctorID) VALUES
('2026-04-12 10:00', 'Scheduled', 1, 1),
('2026-04-12 11:00', 'Completed', 2, 2),
('2026-04-12 12:00', 'Cancelled', 3, 3),
('2026-04-13 09:00', 'Scheduled', 4, 4),
('2026-04-13 10:30', 'Completed', 5, 5),
('2026-04-13 11:30', 'Scheduled', 6, 6),
('2026-04-14 14:00', 'Scheduled', 7, 7),
('2026-04-14 15:30', 'Scheduled', 8, 8);

Select * from Appointment

INSERT INTO Prescription (PrescriptionDate, MedicationName, Dosage, Frequency, DurationDays, Notes, AdmissionID, DoctorID) VALUES
('2026-04-01', 'Aspirin', '75mg', 'Once daily', 5, NULL, 1, 1),
('2026-04-02', 'Ibuprofen', '200mg', 'Twice daily', 3, 'After meals', 2, 2),
('2026-04-03', 'Paracetamol', '500mg', 'Three times daily', 4, NULL, 3, 3),
('2026-04-04', 'Amoxicillin', '250mg', 'Twice daily', 7, NULL, 4, 4),
('2026-04-05', 'Chemotherapy Drug', 'Varies', 'Weekly', 30, 'Under supervision', 5, 5),
('2026-04-06', 'Antihistamine', '10mg', 'Once daily', 5, NULL, 6, 6),
('2026-04-07', 'Painkiller', '50mg', 'Twice daily', 6, NULL, 7, 7),
('2026-04-08', 'Vitamin D', '1000IU', 'Once daily', 10, NULL, 8, 8);

Select * from Prescription


INSERT INTO Payment (Amount, PaymentDate, PaymentMethod, PaymentStatus, AdmissionID) VALUES
(500.00, '2026-04-05', 'Card', 'Completed', 1),
(150.00, '2026-04-02', 'Cash', 'Completed', 2),
(300.00, '2026-04-06', 'Insurance', 'Pending', 3),
(100.00, '2026-04-04', 'Online', 'Completed', 4),
(2000.00, '2026-04-05', 'Insurance', 'Pending', 5),
(120.00, '2026-04-07', 'Card', 'Completed', 6),
(450.00, '2026-04-07', 'Cash', 'Failed', 7),
(250.00, '2026-04-08', 'Online', 'Completed', 8);

Select * from Payment
