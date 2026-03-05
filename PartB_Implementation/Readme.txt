
1. Database Creation

The first step was creating the main database for the system.

CREATE DATABASE HospitalDB;
USE HospitalDB;

This database stores all tables and relationships for the Hospital Management System.

2. Creating Core Tables

Seven tables were created to represent the main entities of the hospital system:

Department – stores hospital departments.

Patient – stores patient personal information.

Doctor – stores doctor details and department association.

Appointment – stores patient appointment scheduling.

Admission – records patient hospital admissions.

Prescription – records medications issued during admissions.

Payment – stores billing and payment information.

Each table included a Primary Key (PK) to uniquely identify records.

3. Establishing Relationships

Relationships between tables were implemented using Foreign Keys (FK).

Examples:

Doctor.DepartmentID → Department.DepartmentID

Admission.PatientID → Patient.PatientID

Admission.DoctorID → Doctor.DoctorID

Prescription.AdmissionID → Admission.AdmissionID

Payment.AdmissionID → Admission.AdmissionID

These relationships enforce referential integrity.

4. Adding Constraints

Several constraints were added to maintain data accuracy and enforce business rules.

Types of constraints used:

PRIMARY KEY – unique identifier for each table.

FOREIGN KEY – maintains relationships between tables.

UNIQUE – prevents duplicate values (e.g., email, department name).

CHECK – restricts valid values (e.g., gender, payment status).

NOT NULL – ensures required data fields are not empty.

Example rule:

CHECK (DischargeDate >= AdmissionDate)
5. Inserting Sample Data

Sample records were inserted into tables to test the database functionality and validate constraints.

This allowed testing of:

relationships

appointment scheduling

patient admissions

payments and prescriptions

6. Implementing Business Logic Using Triggers

A trigger was created to enforce a complex business rule:

A patient cannot have overlapping hospital admissions.

Since this rule requires comparing rows in the same table, it was implemented using a trigger instead of a simple constraint.

Trigger:

TRG_PreventOverlappingAdmissions

The trigger executes AFTER INSERT or UPDATE on the Admission table and checks whether the new admission dates overlap with existing admissions for the same patient. If an overlap is detected, the transaction is rolled back and an error message is returned.

7. Testing the Trigger

The trigger was tested by:

Inserting a valid admission (successful).

Attempting to insert another admission with overlapping dates.

The trigger blocked the operation and returned an error.

This confirmed the rule was correctly enforced.

Final Outcome

The hospital database now includes:

7 tables

Primary keys and foreign keys

Multiple constraints

A trigger enforcing complex business logic

These steps ensured that the database structure is normalized, maintains data integrity, and follows the defined business rules of the hospital system.
