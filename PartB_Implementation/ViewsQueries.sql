/*Drop View if already exist*/

DROP view IF EXISTS PatientAdmissionHistory;
GO



/*CREATE VIEW PatientAdmissionHistory AS
SELECT 
    P.FirstName,
    P.LastName,
    A.AdmissionDate,
    A.DischargeDate,
    A.Diagnosis,
    A.RoomNumber
FROM Admission A
JOIN Patient P
ON A.PatientID = P.PatientID;*/

/*SELECT name, type_desc
FROM sys.objects
WHERE name = 'PatientAdmissionHistory';*/

-- to use it 
-- SELECT * FROM PatientAdmissionHistory;

CREATE VIEW DoctorAppointments AS
SELECT 
    D.FirstName + ' ' + D.LastName AS DoctorName,
    A.AppointmentDateTime,
    A.Status
FROM Appointment A
JOIN Doctor D
ON A.DoctorID = D.DoctorID;

-- Execute views separataly 
