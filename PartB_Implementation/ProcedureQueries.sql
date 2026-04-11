-- Add patient through procedure


CREATE PROCEDURE AddPatient
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@DOB DATE,
@Gender VARCHAR(10),
@Phone VARCHAR(15),
@Email VARCHAR(100),
@Address VARCHAR(255),
@Eircode VARCHAR(10)
AS
BEGIN
    INSERT INTO Patient
    (FirstName, LastName, DateOfBirth, Gender, Phone, Email, AddressLine, Eircode)
    VALUES
    (@FirstName, @LastName, @DOB, @Gender, @Phone, @Email, @Address, @Eircode);
END;


/* EXEC AddPatient
'James',
'Connor',
'1988-03-10',
'Male',
'0875551234',
'james@email.com',
'10 River Road',
'D02AB12'; */








---- Create Appointments
--CREATE PROCEDURE CreateAppointment
--@DateTime DATETIME2,
--@Status VARCHAR(20),
--@PatientID INT,
--@DoctorID INT
--AS
--BEGIN
--    INSERT INTO Appointment
--    (AppointmentDateTime, Status, PatientID, DoctorID)
--    VALUES
--    (@DateTime, @Status, @PatientID, @DoctorID);
--END;


--EXEC CreateAppointment 
--    @DateTime = '2026-04-12 10:30:00',
--    @Status = 'Scheduled',
--    @PatientID = 1,
--    @DoctorID = 2;








----create procedure to get appointment in xml format

--CREATE PROCEDURE GetAppointmentsXML
--AS
--BEGIN
--    SELECT 
--        a.AppointmentID,
--        p.FirstName + ' ' + p.LastName AS PatientName,
--        d.FirstName + ' ' + d.LastName AS DoctorName,
--        a.AppointmentDateTime
--    FROM Appointment a
--    JOIN Patient p ON a.PatientID = p.PatientID
--    JOIN Doctor d ON a.DoctorID = d.DoctorID
--    FOR XML PATH('Appointment'), ROOT('Appointments')
--END

--EXEC GetAppointmentsXML