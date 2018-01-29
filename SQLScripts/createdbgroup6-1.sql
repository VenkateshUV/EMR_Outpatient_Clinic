create table IF NOT EXISTS Patient (
Patient_ID Int primary key AUTO_INCREMENT,
Patient_SSN INT,
P_First_Name VARCHAR(50),
P_Last_Name VARCHAR (50),
P_Gender VARCHAR (10),
Date_Of_Birth DATE,
Phone_Number VARCHAR (15),
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Is_active VARCHAR(1) NOT NULL DEFAULT 'Y',
end_date DATETIME,
Createdby VARCHAR (50),
INDEX (P_First_Name,p_Last_Name)
);


create table IF NOT EXISTS Patient_Address (
Address_Id Int primary key AUTO_INCREMENT,
Patient_ID INT NOT NULL ,
Address VARCHAR(150),
City VARCHAR (50),
Zipcode VARCHAR (20),
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Is_active VARCHAR(1) NOT NULL DEFAULT 'Y',
end_date DATETIME,
Createdby VARCHAR (50),
INDEX fk_patient_id (Patient_ID),
    FOREIGN KEY (Patient_ID)
    REFERENCES  Patient(Patient_ID) on delete cascade) ENGINE=INNODB;
	
create table IF NOT EXISTS Doctor (
Doctor_ID Int primary key AUTO_INCREMENT,
D_First_Name VARCHAR(50),
D_Last_Name VARCHAR (50),
D_Gender VARCHAR (10),
Phone_Number VARCHAR (15),
Speciality VARCHAR (50),
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Is_active VARCHAR(1) NOT NULL DEFAULT 'Y',
end_date DATETIME,
Createdby VARCHAR (50),
INDEX (D_First_Name,D_Last_Name));	

create table IF NOT EXISTS Insurance (
I_Company_ID Int primary key AUTO_INCREMENT,
I_Company_Name VARCHAR(50) NOT NULL,
I_Company_Address VARCHAR (150),
I_Company_City VARCHAR (50),
I_Company_Zipcode VARCHAR (20),
I_Phone_Number VARCHAR (15),
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Is_active VARCHAR(1) NOT NULL DEFAULT 'Y',
end_date DATETIME,
Createdby VARCHAR (50),
INDEX (I_Company_Name));


create table IF NOT EXISTS Hospital_Location (
Hospital_ID Int primary key AUTO_INCREMENT,
H_Address VARCHAR (150) NOT NULL,
H_City VARCHAR (50),
H_Zipcode VARCHAR (20),
H_Name VARCHAR (50),
H_Phone_Number VARCHAR (15),
H_Visiting_Hours VARCHAR (30) NOT NULL,
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Is_active VARCHAR(1) NOT NULL DEFAULT 'Y',
end_date DATETIME,
Createdby VARCHAR (50),
INDEX (H_Name));

create table IF NOT EXISTS Insurance_Policy (
Policy_No Int primary key AUTO_INCREMENT,
Patient_ID INT NOT NULL ,
I_Company_ID INT NOT NULL,
policy_start_date DATE NOT NULL,
policy_end_date DATE,
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Is_active VARCHAR(1) NOT NULL DEFAULT 'Y',
end_date DATETIME,
Createdby VARCHAR (50),
Index Fk_In_patient_id(Patient_ID),
Index Fk_In_I_Company_id (I_Company_ID),
    FOREIGN KEY (Patient_ID)
    REFERENCES  Patient(Patient_ID) ON DELETE cascade,
    FOREIGN KEY (I_Company_ID)
    REFERENCES  Insurance(I_Company_ID) ON DELETE cascade) ENGINE=INNODB;
	
create table IF NOT EXISTS Medicine (
MInventory_Id Int primary key AUTO_INCREMENT,
Medicine_name VARCHAR (150) NOT NULL ,
Manufacturer VARCHAR (150),
Price VARCHAR (50) NOT NULL,
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Is_active VARCHAR(1) NOT NULL DEFAULT 'Y',
end_date DATETIME,
Createdby VARCHAR (50),
INDEX (Medicine_name,Manufacturer));

create table IF NOT EXISTS Appointments (
Appointment_ID Int primary key AUTO_INCREMENT,
Appointment_Req_Date DATE NOT NULL ,
Visit_Date DATE NOT NULL,
Patient_ID INT NOT NULL DEFAULT '-1',
Doctor_ID INT DEFAULT '-1',
Hospital_ID INT DEFAULT '-1',
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Createdby VARCHAR (50),
INDEX (Visit_Date),
INDEX FK_AP_patient_id (Patient_ID),
INDEX Fk_AP_Doctor_ID (Doctor_ID),
INDEX Fk_AP_Hospital_ID (Hospital_ID),
    FOREIGN KEY (Patient_ID)
    REFERENCES  Patient(Patient_ID) ON DELETE cascade,        
    FOREIGN KEY (Doctor_ID)
    REFERENCES  Doctor(Doctor_ID) ON DELETE cascade,    
    FOREIGN KEY (Hospital_ID)
    REFERENCES  hospital_location(Hospital_ID) ON DELETE cascade) ENGINE=INNODB;
    
    

create table IF NOT EXISTS Visit (
Visit_ID Int primary key AUTO_INCREMENT,
Appointment_ID INT NOT NULL,
Complaint VARCHAR (1500),
Diagnosis VARCHAR (1500),
Revisit_Y_N VARCHAR(1) NOT NULL DEFAULT 'N',
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Is_active VARCHAR(1) NOT NULL DEFAULT 'Y',
end_date DATETIME,
Createdby VARCHAR (50),
INDEX FK_vi_Appointment_id(Appointment_ID),
    FOREIGN KEY (Appointment_ID)
    REFERENCES  Appointments(Appointment_ID) ON DELETE cascade
	) ENGINE=INNODB;
	
create table IF NOT EXISTS Prescription (
Prescription_ID Int primary key AUTO_INCREMENT,
Visit_ID INT,
MInventory_Id INT NOT NULL ,
Medicine_Quantity INT NOT NULL,
Intake_description VARCHAR (200),
Prescription_start_date DATE,
Prescription_end_date DATE,
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Is_active VARCHAR(1) NOT NULL DEFAULT 'Y',
end_date DATETIME,
Createdby VARCHAR (50),
INDEX FK_pr_Visit_id (Visit_ID),
    FOREIGN KEY (Visit_ID)
    REFERENCES  Visit(Visit_ID) ON DELETE cascade,
INDEX FK_pr_MInventory_Id(MInventory_Id),
    FOREIGN KEY (MInventory_Id)
    REFERENCES  Medicine(MInventory_Id) ON DELETE cascade)ENGINE=INNODB;

create table IF NOT EXISTS Billing (
Bill_Number Int primary key AUTO_INCREMENT,
Visit_ID INT,
Amount Varchar(20) NOT NULL ,
Bill_Date DATE,
Due_Date DATE,
IS_PAID VARCHAR(1) NOT NULL DEFAULT 'N',
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Createdby VARCHAR (50),
INDEX (Due_Date),
INDEX (Bill_Date),
INDEX FK_bl_Visit_id(Visit_ID),
    FOREIGN KEY (Visit_ID)
    REFERENCES  Visit(Visit_ID) ON DELETE cascade) ENGINE=INNODB;
	
create table IF NOT EXISTS Payment (
PayTrans_Number Int primary key AUTO_INCREMENT,
Bill_Number INT,
Pay_Method Varchar(50) NOT NULL ,
Pay_Status Varchar(20),
Paid_Date DATE,
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Createdby VARCHAR (50),
INDEX (Pay_Status),
INDEX FK_pm_Bill_Number(Bill_Number),
    FOREIGN KEY (Bill_Number)
    REFERENCES  Billing(Bill_Number) ON DELETE cascade) ENGINE=INNODB;
	

create table IF NOT EXISTS Patient_audit (
Patient_ID Int,
Patient_SSN INT,
P_First_Name VARCHAR(50),
P_Last_Name VARCHAR (50),
P_Gender VARCHAR (10),
Date_Of_Birth DATE,
Phone_Number VARCHAR (15),
Date_Created DATETIME,
Is_active VARCHAR(1),
end_date DATETIME,
Createdby VARCHAR (50),
Changeby VARCHAR (50),
Changedate DATETIME NOT NULL DEFAULT NOW(),
Changetype VARCHAR(1) NOT NULL,
INDEX (P_First_Name,p_Last_Name));


create table IF NOT EXISTS Patient_Address_audit (
Address_Id Int,
Patient_ID INT NOT NULL ,
Address VARCHAR(150),
City VARCHAR (50),
Zipcode VARCHAR (20),
Date_Created DATETIME,
Is_active VARCHAR(1),
end_date DATETIME,
Createdby VARCHAR (50),
Changeby VARCHAR (50),
Changedate DATETIME NOT NULL DEFAULT NOW(),
Changetype VARCHAR(1) NOT NULL);
	
create table IF NOT EXISTS Doctor_audit (
Doctor_ID Int,
D_First_Name VARCHAR(50),
D_Last_Name VARCHAR (50),
D_Gender VARCHAR (10),
Phone_Number VARCHAR (15),
Speciality VARCHAR (50),
Date_Created DATETIME,
Is_active VARCHAR(1),
end_date DATETIME,
Createdby VARCHAR (50),
Changeby VARCHAR (50),
Changedate DATETIME NOT NULL DEFAULT NOW(),
Changetype VARCHAR(1) NOT NULL,
INDEX (D_First_Name,D_Last_Name));	

create table IF NOT EXISTS Insurance_audit (
I_Company_ID Int,
I_Company_Name VARCHAR(50) NOT NULL,
I_Company_Address VARCHAR (150),
I_Company_City VARCHAR (50),
I_Company_Zipcode VARCHAR (20),
I_Phone_Number VARCHAR (15),
Date_Created DATETIME ,
Is_active VARCHAR(1),
end_date DATETIME,
Createdby VARCHAR (50),
Changeby VARCHAR (50),
Changedate DATETIME NOT NULL DEFAULT NOW(),
Changetype VARCHAR(1) NOT NULL,
INDEX (I_Company_Name));


create table IF NOT EXISTS Hospital_Location_audit (
Hospital_ID Int,
H_Address VARCHAR (150) NOT NULL,
H_City VARCHAR (50),
H_Zipcode VARCHAR (20),
H_Name VARCHAR (50),
H_Phone_Number VARCHAR (15),
H_Visiting_Hours VARCHAR (30) NOT NULL,
Date_Created DATETIME,
Is_active VARCHAR(1),
end_date DATETIME,
Createdby VARCHAR (50),
Changeby VARCHAR (50),
Changedate DATETIME NOT NULL DEFAULT NOW(),
Changetype VARCHAR(1) NOT NULL,
INDEX (H_Name));

create table IF NOT EXISTS Insurance_Policy_audit (
Policy_No Int,
Patient_ID INT NOT NULL ,
I_Company_ID INT NOT NULL,
policy_start_date DATE NOT NULL,
policy_end_date DATE,
Date_Created DATETIME,
Is_active VARCHAR(1),
end_date DATETIME,
Createdby VARCHAR (50),
Changeby VARCHAR (50),
Changedate DATETIME NOT NULL DEFAULT NOW(),
Changetype VARCHAR(1) NOT NULL);
	
create table IF NOT EXISTS Medicine_audit (
MInventory_Id Int,
Medicine_name VARCHAR (150) NOT NULL ,
Manufacturer VARCHAR (150),
Price VARCHAR (50) NOT NULL,
Date_Created DATETIME,
Is_active VARCHAR(1),
end_date DATETIME,
Createdby VARCHAR (50),
Changeby VARCHAR (50),
Changedate DATETIME NOT NULL DEFAULT NOW(),
Changetype VARCHAR(1) NOT NULL,
INDEX (Medicine_name,Manufacturer));

create table IF NOT EXISTS Appointments_audit (
Appointment_ID Int,
Appointment_Req_Date DATE NOT NULL ,
Visit_Date DATE NOT NULL,
Patient_ID INT NOT NULL,
Doctor_ID INT,
Hospital_ID INT,
Date_Created DATETIME,
Createdby VARCHAR (50),
Changeby VARCHAR (50),
Changedate DATETIME NOT NULL DEFAULT NOW(),
Changetype VARCHAR(1) NOT NULL,
INDEX (Visit_Date),
INDEX (Doctor_ID),
INDEX (Hospital_ID)
);

create table IF NOT EXISTS Visit_audit (
Visit_ID Int primary key AUTO_INCREMENT,
Appointment_ID INT NOT NULL,
Complaint VARCHAR (1500),
Diagnosis VARCHAR (1500),
Revisit_Y_N VARCHAR(1) ,
Date_Created DATETIME,
Is_active VARCHAR(1),
end_date DATETIME,
Createdby VARCHAR (50),
Changeby VARCHAR (50),
Changedate DATETIME NOT NULL DEFAULT NOW(),
Changetype VARCHAR(1) NOT NULL);
	
create table IF NOT EXISTS Prescription_audit (
Prescription_ID Int ,
Visit_ID INT,
MInventory_Id INT NOT NULL ,
Medicine_Quantity INT NOT NULL,
Intake_description VARCHAR (200),
Prescription_start_date DATE,
Prescription_end_date DATE,
Date_Created DATETIME,
Is_active VARCHAR(1) ,
end_date DATETIME,
Createdby VARCHAR (50),
Changeby VARCHAR (50),
Changedate DATETIME NOT NULL DEFAULT NOW(),
Changetype VARCHAR(1) NOT NULL);

create table IF NOT EXISTS Billing_audit (
Bill_Number Int primary key AUTO_INCREMENT,
Visit_ID INT,
Amount Varchar(20) NOT NULL ,
Bill_Date DATE,
Due_Date DATE,
IS_PAID VARCHAR(1),
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Createdby VARCHAR (50),
Changeby VARCHAR (50),
Changedate DATETIME NOT NULL DEFAULT NOW(),
Changetype VARCHAR(1) NOT NULL,
INDEX (Due_Date),
INDEX (Bill_Date));
	
create table IF NOT EXISTS Payment_audit (
PayTrans_Number Int primary key AUTO_INCREMENT,
Bill_Number INT,
Pay_Method Varchar(50) NOT NULL ,
Pay_Status Varchar(20),
Paid_Date DATE,
Date_Created DATETIME NOT NULL DEFAULT NOW(),
Createdby VARCHAR (50),
Changeby VARCHAR (50),
Changedate DATETIME NOT NULL DEFAULT NOW(),
Changetype VARCHAR(1) NOT NULL,
INDEX (Bill_Number),
INDEX (Pay_Status));


-------- archival tables --------



create table IF NOT EXISTS Appointments_Archival (
Archival_ID Int primary key AUTO_INCREMENT,
Archival_Date_Created DATETIME NOT NULL DEFAULT NOW(),
Appointment_ID Int,
Appointment_Req_Date DATE NOT NULL ,
Visit_Date DATE NOT NULL,
Patient_ID INT NOT NULL,
Doctor_ID INT,
Hospital_ID INT,
Date_Created DATETIME,
Createdby VARCHAR (50),
INDEX (Visit_Date),
INDEX (Doctor_ID),
INDEX (Hospital_ID));

create table IF NOT EXISTS Visit_Archival (
Archival_ID Int primary key AUTO_INCREMENT,
Archival_Date_Created DATETIME NOT NULL DEFAULT NOW(),
Visit_ID Int ,
Appointment_ID INT NOT NULL,
Complaint VARCHAR (1500),
Diagnosis VARCHAR (1500),
Revisit_Y_N VARCHAR(1),
Date_Created DATETIME,
Is_active VARCHAR(1) ,
end_date DATETIME,
Createdby VARCHAR (50));
	
create table IF NOT EXISTS Prescription_Archival (
Archival_ID Int primary key AUTO_INCREMENT,
Archival_Date_Created DATETIME NOT NULL DEFAULT NOW(),
Prescription_ID Int,
Visit_ID INT,
MInventory_Id INT NOT NULL ,
Medicine_Quantity INT NOT NULL,
Intake_description VARCHAR (200),
Prescription_start_date DATE,
Prescription_end_date DATE,
Date_Created DATETIME,
Is_active VARCHAR(1) ,
end_date DATETIME,
Createdby VARCHAR (50));

create table IF NOT EXISTS Billing_Archival (
Archival_ID Int primary key AUTO_INCREMENT,
Archival_Date_Created DATETIME NOT NULL DEFAULT NOW(),
Bill_Number Int,
Visit_ID INT,
Amount Varchar(20) NOT NULL ,
Bill_Date DATE,
Due_Date DATE,
IS_PAID VARCHAR(1) NOT NULL,
Date_Created DATETIME,
Createdby VARCHAR (50),
INDEX (Due_Date),
INDEX (Bill_Date));
	
create table IF NOT EXISTS Payment_Archival (
Archival_ID Int primary key AUTO_INCREMENT,
Archival_Date_Created DATETIME NOT NULL DEFAULT NOW(),
PayTrans_Number Int,
Bill_Number INT,
Pay_Method Varchar(50) NOT NULL ,
Pay_Status Varchar(20),
Paid_Date DATE,
Date_Created DATETIME ,
Createdby VARCHAR (50),
INDEX (Bill_Number),
INDEX (Pay_Status));


	create table IF NOT EXISTS ArchiveControl (
	ArchiveControlID Int primary key AUTO_INCREMENT,
	SourceTable VARCHAR(50),
	ArchiveTable VARCHAR(50),
	Frequency VARCHAR(50),
	timekeyColumn VARCHAR (50),
	columnlist varchar(1000),
	Date_Created DATETIME NOT NULL DEFAULT NOW(),
	Is_active VARCHAR(1) NOT NULL DEFAULT 'Y',
	last_archive_date DATETIME,
	end_date DATETIME,
	Createdby VARCHAR (50),
	INDEX (SourceTable)
	);