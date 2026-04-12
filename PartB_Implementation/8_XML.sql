-- if previously not available
IF COL_LENGTH('Patient', 'MedicalHistory') IS NULL
BEGIN
    ALTER TABLE Patient ADD MedicalHistory XML;
END;

-- generate xml
CREATE PROCEDURE GetAllPatientsXML
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        PatientID,
        FirstName,
        LastName
    FROM Patient
    FOR XML PATH('Patient'), ROOT('Patients');
END;

--search xml 
CREATE PROCEDURE SearchPatientByCondition
    @Condition VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        PatientID,
        FirstName + ' ' + LastName AS PatientName,
        MedicalHistory.value('(/History/Condition)[1]', 'VARCHAR(100)') AS Condition
    FROM Patient
    WHERE MedicalHistory IS NOT NULL
      AND MedicalHistory.exist('/History[Condition=sql:variable("@Condition")]') = 1;
END;

--update xml 
CREATE PROCEDURE UpdatePatientXML
    @PatientID INT,
    @NewCondition VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Initialize XML if NULL
    UPDATE Patient
    SET MedicalHistory = '<History><Condition>None</Condition></History>'
    WHERE PatientID = @PatientID
      AND MedicalHistory IS NULL;

    -- Step 2: Update existing condition safely
    UPDATE Patient
    SET MedicalHistory.modify(
        'replace value of (/History/Condition/text())[1] 
         with sql:variable("@NewCondition")'
    )
    WHERE PatientID = @PatientID
      AND MedicalHistory.exist('/History/Condition') = 1;
END;


-- Generate XML
EXEC GetAllPatientsXML;

-- Search patients with condition
EXEC SearchPatientByCondition 'Diabetes';

-- Update patient condition
EXEC UpdatePatientXML 1, 'Asthma';

-- Verify result
SELECT * FROM Patient;