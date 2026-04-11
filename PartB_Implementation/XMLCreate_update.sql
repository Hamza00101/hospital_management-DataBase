--XML CREATE + RETRIEVE + SEARCH

--Ensure column exist if not at first
Select * from Patient
ALTER TABLE Patient ADD MedicalHistory XML;
Select * from Patient

CREATE PROCEDURE GetPatientXMLData
    @Condition VARCHAR(100)
AS
BEGIN
    -- CREATE XML
    SELECT 
        PatientID,
        FirstName,
        LastName
    FROM Patient
    FOR XML PATH('Patient'), ROOT('Patients')

    -- RETRIEVE + SEARCH XML
    SELECT 
        PatientID,
        FirstName + ' ' + LastName AS PatientName,
        MedicalHistory.value('(History/Condition)[1]', 'VARCHAR(100)') AS Condition
    FROM Patient
    WHERE MedicalHistory.exist('/History[Condition=sql:variable("@Condition")]') = 1
END
--Execution
EXEC GetPatientXMLData 'Diabetes'
Select * from Patient


CREATE PROCEDURE UpdatePatientXML
    @PatientID INT,
    @NewCondition VARCHAR(100)
AS
BEGIN
    -- Step 1: Initialize XML if NULL
    UPDATE Patient
    SET MedicalHistory = 
        '<History><Condition>None</Condition></History>'
    WHERE PatientID = @PatientID
      AND MedicalHistory IS NULL;

    -- Step 2: Update XML
    UPDATE Patient
    SET MedicalHistory.modify(
        'replace value of (/History/Condition/text())[1] 
         with sql:variable("@NewCondition")'
    )
    WHERE PatientID = @PatientID;
END

--Update xml using execution 
EXEC UpdatePatientXML 1, 'Asthma'
SELECT * from Patient