SELECT PatientID, FirstName, LastName, Phone, Email
FROM Patient;

Select * From Patient

/*List the doctors with departments*/
SELECT 
    D.FirstName,
    D.LastName,
    D.Specialization,
    Dept.DepartmentName
FROM Doctor D
JOIN Department Dept
ON D.DepartmentID = Dept.DepartmentID;

/*Show all appointments with Patients*/
SELECT 
    A.AppointmentDateTime,
    A.Status,
    P.FirstName + ' ' + P.LastName AS PatientName,
    D.FirstName + ' ' + D.LastName AS DoctorName
FROM Appointment A
JOIN Patient P ON A.PatientID = P.PatientID
JOIN Doctor D ON A.DoctorID = D.DoctorID;

-- Shows perscription with patient and doctor

SELECT 
    Pr.MedicationName,
    Pr.Dosage,
    Pr.Frequency,
    P.FirstName + ' ' + P.LastName AS PatientName,
    D.FirstName + ' ' + D.LastName AS DoctorName
FROM Prescription Pr
JOIN Admission A ON Pr.AdmissionID = A.AdmissionID
JOIN Patient P ON A.PatientID = P.PatientID
JOIN Doctor D ON Pr.DoctorID = D.DoctorID;

-- Count total Docotrs

SELECT 
    Dept.DepartmentName,
    COUNT(D.DoctorID) AS TotalDoctors
FROM Department Dept
LEFT JOIN Doctor D 
ON Dept.DepartmentID = D.DepartmentID
GROUP BY Dept.DepartmentName;

-- Total Appointments

SELECT 
    D.FirstName + ' ' + D.LastName AS DoctorName,
    COUNT(A.AppointmentID) AS TotalAppointments
FROM Doctor D
LEFT JOIN Appointment A
ON D.DoctorID = A.DoctorID
GROUP BY D.FirstName, D.LastName;

-- Patients with Active admission
SELECT 
    P.FirstName,
    P.LastName,
    A.AdmissionDate,
    A.RoomNumber
FROM Admission A
JOIN Patient P
ON A.PatientID = P.PatientID
WHERE A.DischargeDate IS NULL;

-- Total Payment per Admisiion
SELECT 
    AdmissionID,
    SUM(Amount) AS TotalPayment
FROM Payment
GROUP BY AdmissionID;

-- Using DISTINCT

SELECT DISTINCT
    D.FirstName,
    D.LastName
FROM Prescription Pr
JOIN Doctor D
ON Pr.DoctorID = D.DoctorID;

