select * from Doctor
select * from Patient
select * from Department
select * from Appointment
select * from Admission
select * from Payment
select * from Prescription

--FAIL (Cardiology already exists)
INSERT INTO Department (DepartmentName, Phone, Location)
VALUES ('Cardiology', '019999999', 'Block Z');

--FAIL (email already used)
INSERT INTO Patient (FirstName, LastName, DateOfBirth, Gender, Phone, Email, AddressLine, Eircode)
VALUES ('Test', 'User', '1990-01-01', 'Male', '0870000000', 'ahmad.ali@email.com', 'Test Address', 'D01TEST');

--FAIL (Cardiogist already exists)
INSERT INTO Doctor (FirstName, LastName, Specialization, Phone, Email, DepartmentID)
VALUES ('Fake', 'Doctor', 'Cardiologist', '0850000000', 'm.ryan@hospital.com', 1);

--FAIL (same doctor & same time already exists)
INSERT INTO Appointment (AppointmentDateTime, Status, PatientID, DoctorID)
VALUES ('2026-04-12 10:00', 'Scheduled', 2, 1);

--FAIL (Invalid Eircode format)
INSERT INTO Patient (FirstName, LastName, DateOfBirth, Gender, Phone, Email, AddressLine, Eircode)
VALUES ('Invalid', 'Gender', '1995-05-05', 'Unknown', '0871111111', 'invalid@email.com', 'Test', 'D01XYZ');

--FAIL (DoctorID 1 already has an appointment at this time)
INSERT INTO Appointment (AppointmentDateTime, Status, PatientID, DoctorID)
VALUES ('2026-04-15 10:00', 'In Progress', 1, 1);

--FAIL (Invalid Payment Method)
INSERT INTO Payment (Amount, PaymentDate, PaymentMethod, PaymentStatus, AdmissionID)
VALUES (100, '2026-04-10', 'Cheque', 'Completed', 1);

--FAIL (Patient ID 1 already has an admission that overlaps these dates)
INSERT INTO Admission (AdmissionDate, DischargeDate, Diagnosis, RoomNumber, PatientID, DoctorID)
VALUES ('2026-04-10', '2026-04-08', 'Test Case', 'Z999', 1, 1);

--FAIL (DepartmentID 999 does not exist)
INSERT INTO Doctor (FirstName, LastName, Specialization, Phone, Email, DepartmentID)
VALUES ('Ghost', 'Doctor', 'Unknown', '0851234567', 'ghost@hospital.com', 999);

--FAIL (PatientID 999 does not exist)
INSERT INTO Admission (AdmissionDate, Diagnosis, RoomNumber, PatientID, DoctorID)
VALUES ('2026-04-10', 'Test', 'X101', 999, 1);

--FAIL (AdmissionID 999 does not exist)
INSERT INTO Payment (Amount, PaymentDate, PaymentMethod, PaymentStatus, AdmissionID)
VALUES (200, '2026-04-10', 'Cash', 'Completed', 999);

--FAIL (FirstName is cannot NULL)
INSERT INTO Patient (FirstName, LastName, DateOfBirth, Gender, Phone, AddressLine, Eircode)
VALUES (NULL, 'Test', '1990-01-01', 'Male', '0870000000', 'Test Address', 'D01ABC');