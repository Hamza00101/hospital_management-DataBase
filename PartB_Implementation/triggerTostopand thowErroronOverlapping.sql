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