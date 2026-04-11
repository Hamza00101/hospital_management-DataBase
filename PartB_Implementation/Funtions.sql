

--It calculates the total amount paid for a specific hospital admission

CREATE FUNCTION fn_TotalPayment (@AdmissionID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2)

    SELECT @Total = SUM(Amount)
    FROM Payment
    WHERE AdmissionID = @AdmissionID

    RETURN ISNULL(@Total, 0)
END

--SELECT 
--    AdmissionID,
--    dbo.fn_TotalPayment(AdmissionID) AS TotalPaid
--FROM Admission


--uses your function to return payment info for a specific admission.

CREATE PROCEDURE GetAdmissionPayment
    @AdmissionID INT
AS
BEGIN
    SELECT 
        @AdmissionID AS AdmissionID,
        dbo.fn_TotalPayment(@AdmissionID) AS TotalPayment
END



--EXEC GetAdmissionPayment @AdmissionID = 1