DELIMITER |
CREATE PROCEDURE ins_patient
(IN Patient_SSN INT, IN P_First_Name VARCHAR(50), IN P_Last_Name VARCHAR(50),IN P_Gender VARCHAR (10), IN Date_Of_Birth DATE, IN Phone_Number VARCHAR (15))
BEGIN
  insert into Patient (Patient_SSN,P_First_Name,P_Last_Name,P_Gender,Date_Of_Birth,Phone_Number) values(Patient_SSN,P_First_Name,P_Last_Name,P_Gender,Date_Of_Birth,Phone_Number);
  
END;
 |
DELIMITER;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE ins_patient_address
(IN Patient_ID  INT, IN Address VARCHAR(150), IN City VARCHAR (50), IN Zipcode VARCHAR (20))
BEGIN
  insert into Patient_Address (Patient_ID,Address,City,Zipcode) values (Patient_ID,Address,City,Zipcode);
END; //


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE ins_doctor
(IN D_First_Name VARCHAR(50), IN D_Last_Name VARCHAR (50), IN D_Gender VARCHAR (10), IN Phone_Number VARCHAR (15), IN Speciality VARCHAR (50))
BEGIN
  insert into Doctor (D_First_Name ,D_Last_Name ,D_Gender ,Phone_Number ,Speciality) values (D_First_Name ,D_Last_Name ,D_Gender ,Phone_Number ,Speciality);
END; //

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE ins_insurance
(IN I_Company_Name VARCHAR(50), IN I_Company_Address VARCHAR (150), IN I_Company_City VARCHAR (50),IN I_Company_Zipcode VARCHAR (20), IN I_Phone_Number VARCHAR (15))
BEGIN	
  insert into Insurance (I_Company_Name ,I_Company_Address ,I_Company_City ,I_Company_Zipcode ,I_Phone_Number) values (I_Company_Name ,I_Company_Address ,I_Company_City ,I_Company_Zipcode ,I_Phone_Number);
END; //

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE ins_hospital_location 
(IN H_Address VARCHAR (150), IN H_City VARCHAR (50), IN H_Zipcode VARCHAR (20),IN H_Name VARCHAR (50), IN H_Phone_Number VARCHAR (15),IN H_Visiting_Hours VARCHAR (30))
BEGIN	
  insert into hospital_location (H_Address ,H_City ,H_Zipcode ,H_Name ,H_Phone_Number,H_Visiting_Hours) values (H_Address ,H_City ,H_Zipcode ,H_Name ,H_Phone_Number,H_Visiting_Hours);
END; //

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE ins_insurance_policy 
(IN Patient_ID INT, IN I_Company_ID INT, IN policy_start_date DATE, IN policy_end_date DATE)
BEGIN	
  insert into insurance_policy (Patient_ID ,I_Company_ID ,policy_start_date ,policy_end_date) values (Patient_ID ,I_Company_ID ,policy_start_date ,policy_end_date);
END; //

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE ins_medicine 
(IN Medicine_name VARCHAR (150), IN Manufacturer VARCHAR (150), IN Price VARCHAR (50))
BEGIN	
  insert into medicine (Medicine_name ,Manufacturer ,Price) values (Medicine_name ,Manufacturer ,Price);
END ; //


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE ins_appointments 
(IN Appointment_Req_Date DATE, IN Visit_Date DATE, IN Patient_ID INT, IN Doctor_ID INT, IN Hospital_ID INT)
BEGIN	
  insert into appointments (Appointment_Req_Date ,Visit_Date ,Patient_ID ,Doctor_ID, Hospital_ID) values (Appointment_Req_Date ,Visit_Date ,Patient_ID ,Doctor_ID, Hospital_ID);
END; //

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE ins_visit 
(IN Appointment_ID INT, IN Complaint VARCHAR (1500), IN Diagnosis VARCHAR (1500))
BEGIN	
  insert into visit (Appointment_ID ,Complaint ,Diagnosis) values (Appointment_ID ,Complaint ,Diagnosis);
END //

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE ins_prescription
(IN Visit_ID INT, IN MInventory_Id INT, IN Medicine_Quantity INT, IN Intake_description VARCHAR (200), IN Prescription_start_date DATE, IN Prescription_end_date DATE)
BEGIN	
  insert into prescription (Visit_ID ,MInventory_Id ,Medicine_Quantity, Intake_description, Prescription_start_date, Prescription_end_date) values (Visit_ID ,MInventory_Id ,Medicine_Quantity, Intake_description, Prescription_start_date, Prescription_end_date);
END; //
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE ins_billing
(IN Visit_ID INT, IN Amount Varchar(20), IN Bill_Date DATE, IN Due_Date DATE)
BEGIN	
  insert into billing (Visit_ID ,Amount ,Bill_Date, Due_Date) values (Visit_ID ,Amount ,Bill_Date, Due_Date);
END ;//
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE ins_payment 
(IN Bill_Number INT, IN Pay_Method Varchar(50), IN Pay_Status Varchar(20), IN Paid_Date DATE)
BEGIN	
  insert into payment (Bill_Number ,Pay_Method ,Pay_Status, Paid_Date) values (Bill_Number ,Pay_Method ,Pay_Status, Paid_Date) ;
END; //
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
