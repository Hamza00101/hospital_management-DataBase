-- This should FAIL (Cardiology already exists)
INSERT INTO Department (DepartmentName, Phone, Location)
VALUES ('Cardiology', '019999999', 'Block Z');

-- This should FAIL (email already used)
INSERT INTO Patient (FirstName, LastName, DateOfBirth, Gender, Phone, Email, AddressLine, Eircode)
VALUES ('Test', 'User', '1990-01-01', 'Male', '0870000000', 'ahmad.ali@email.com', 'Test Address', 'D01TEST');

-- This should FAIL
INSERT INTO Doctor (FirstName, LastName, Specialization, Phone, Email, DepartmentID)
VALUES ('Fake', 'Doctor', 'Cardiologist', '0850000000', 'm.ryan@hospital.com', 1);

-- This should FAIL (same doctor & same time already exists)
INSERT INTO Appointment (AppointmentDateTime, Status, PatientID, DoctorID)
VALUES ('2026-04-12 10:00', 'Scheduled', 2, 1);

-- This should FAIL
INSERT INTO Patient (FirstName, LastName, DateOfBirth, Gender, Phone, Email, AddressLine, Eircode)
VALUES ('Invalid', 'Gender', '1995-05-05', 'Unknown', '0871111111', 'invalid@email.com', 'Test', 'D01XYZ');

-- This should FAIL
INSERT INTO Appointment (AppointmentDateTime, Status, PatientID, DoctorID)
VALUES ('2026-04-15 10:00', 'In Progress', 1, 1);

-- This should FAIL
INSERT INTO Payment (Amount, PaymentDate, PaymentMethod, PaymentStatus, AdmissionID)
VALUES (100, '2026-04-10', 'Cheque', 'Completed', 1);

-- This should FAIL
INSERT INTO Admission (AdmissionDate, DischargeDate, Diagnosis, RoomNumber, PatientID, DoctorID)
VALUES ('2026-04-10', '2026-04-08', 'Test Case', 'Z999', 1, 1);

-- This should FAIL (DepartmentID 999 does not exist)
INSERT INTO Doctor (FirstName, LastName, Specialization, Phone, Email, DepartmentID)
VALUES ('Ghost', 'Doctor', 'Unknown', '0851234567', 'ghost@hospital.com', 999);

-- This should FAIL
INSERT INTO Admission (AdmissionDate, Diagnosis, RoomNumber, PatientID, DoctorID)
VALUES ('2026-04-10', 'Test', 'X101', 999, 1);

-- This should FAIL
INSERT INTO Payment (Amount, PaymentDate, PaymentMethod, PaymentStatus, AdmissionID)
VALUES (200, '2026-04-10', 'Cash', 'Completed', 999);

-- This should FAIL (FirstName is NULL)
INSERT INTO Patient (FirstName, LastName, DateOfBirth, Gender, Phone, AddressLine, Eircode)
VALUES (NULL, 'Test', '1990-01-01', 'Male', '0870000000', 'Test Address', 'D01ABC');