CREATE TRIGGER TRG_PreventOverlappingAdmissions
ON Admission
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Admission A
        INNER JOIN inserted i
            ON A.PatientID = i.PatientID
            AND A.AdmissionID <> i.AdmissionID
            AND (
                i.AdmissionDate < ISNULL(A.DischargeDate, '9999-12-31')
                AND ISNULL(i.DischargeDate, '9999-12-31') > A.AdmissionDate
            )
    )
    BEGIN
        RAISERROR ('Patient cannot have overlapping admissions.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- Patient 1 already had admission: 1 Apr – 5 Apr

INSERT INTO Admission (AdmissionDate, DischargeDate, Diagnosis, RoomNumber, PatientID, DoctorID)
VALUES ('2026-04-06', '2026-04-08', 'Follow-up', 'A102', 1, 1);

select * from Admission

-- Overlaps with existing (1 Apr – 5 Apr)

INSERT INTO Admission (AdmissionDate, DischargeDate, Diagnosis, RoomNumber, PatientID, DoctorID)
VALUES ('2026-04-04', '2026-04-07', 'Test Overlap', 'A103', 1, 1);

-- Patient 2 has ongoing admission (DischargeDate = NULL)

INSERT INTO Admission (AdmissionDate, DischargeDate, Diagnosis, RoomNumber, PatientID, DoctorID)
VALUES ('2026-04-03', '2026-04-06', 'Conflict Case', 'B203', 2, 2);

-- This should FAIL

UPDATE Admission
SET AdmissionDate = '2026-04-04'
WHERE AdmissionID = 3;


-- Same dates but different patient

INSERT INTO Admission (AdmissionDate, DischargeDate, Diagnosis, RoomNumber, PatientID, DoctorID)
VALUES ('2026-04-04', '2026-04-07', 'Different Patient', 'Z101', 3, 1);

--A doctor cannot have two appointments at the same time.
CREATE TRIGGER TRG_PreventDoctorDoubleBooking
ON Appointment
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Appointment a
        JOIN inserted i
            ON a.DoctorID = i.DoctorID
            AND a.AppointmentDateTime = i.AppointmentDateTime
            AND a.AppointmentID <> i.AppointmentID
    )
    BEGIN
        RAISERROR ('Doctor is already booked at this time.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

--ALTER TABLE Appointment
--ADD CONSTRAINT DF_Appointment_Status
--DEFAULT 'Scheduled' FOR Status;

-- First insert (works)
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDateTime)
VALUES (1, 1, '2026-04-20 10:00')

-- Second insert (should FAIL)
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDateTime)
VALUES (2, 1, '2026-04-20 10:00')