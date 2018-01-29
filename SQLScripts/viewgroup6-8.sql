create view v_patient_detail as select t1.Patient_ID,t1.Patient_SSN,t1.P_First_Name,t1.P_Gender,t1.Date_Of_Birth,t1.Phone_Number,
t2.Address,t2.City,t2.Zipcode ,t3.Policy_No,t3.policy_start_date,t3.policy_end_date,t4.I_Company_Name,t4.I_Phone_Number,t4.I_Company_Address,I_Company_City,I_Company_Zipcode
from patient t1 inner join patient_address t2
on t1.Patient_ID=t2.Patient_ID and t1.Is_active='Y' and t2.Is_active='Y' left join insurance_policy t3 on t1.patient_id=t3.patient_id and t3.is_active='Y'
left join insurance t4 on
t3.I_Company_ID=t4.I_Company_ID and t4.Is_active='Y'
    ;
	
	
create view v_doctor_appointment_dtl as select t1.Doctor_ID,t1.D_First_Name,t1.D_Last_Name,
t1.Phone_Number,t1.Speciality ,t2.visit_Date,
t3.p_first_name,t3.p_last_name,t3.p_Gender,t3.Phone_Number as p_ph_number,
t4.H_Name,t4.H_Address,t4.H_City,t4.H_Zipcode,t4.H_Phone_Number,t4.H_Visiting_Hours
from doctor t1 
left join appointments t2 
on t1.Doctor_ID=t2.Doctor_ID 
left join
patient t3 on t2.Patient_ID=t3.patient_id and t3.is_active='Y'
left join
hospital_location t4
on t2.Hospital_ID=t4.Hospital_ID and t4.Is_active='Y'
where t1.Is_active='Y';

create or replace view v_patient_appointment_history as 
select t1.P_First_Name,t1.P_Last_Name,t1.P_Gender,t1.Phone_Number,t2.Appointment_Req_Date,t2.Visit_Date ,t3.D_First_Name,
t3.D_Last_Name,t3.Speciality,t4.H_Name,t4.H_Phone_Number,t4.H_City,
case when t5.visit_id ='' then 'Upcoming' else 'Past' end  is_scheduled_appointment, t5.Diagnosis
from patient t1  
left join (select Appointment_ID,patient_id,Doctor_ID,Hospital_ID,Appointment_Req_Date,Visit_Date from appointments
union select Appointment_ID,patient_id,Doctor_ID,Hospital_ID,Appointment_Req_Date,Visit_Date from appointments_archival) t2 
on t1.patient_id=t2.patient_id
left join doctor t3 
on t2.Doctor_ID=t3.Doctor_ID and t3.Is_active='Y'
left join hospital_location t4
on (t2.Hospital_ID=t4.Hospital_ID and t4.Is_active='Y')
left join (select Appointment_ID,visit_id,Diagnosis,Is_active from visit
union
select Appointment_ID,visit_id,Diagnosis,Is_active from visit_archival) t5
on (t2.Appointment_ID=t5.Appointment_ID and t5.Is_active='Y')
where t1.Is_active='Y' order by t2.Visit_Date;

create view v_billing_history as
select t5.P_First_Name,t5.P_Last_Name,t5.Phone_Number,t1.Bill_Date,
t4.Visit_date,t1.Due_Date,t1.Bill_Number,t1.Amount,t1.IS_PAID,t2.PayTrans_Number,t2.Pay_Method,t2.Pay_Status,t2.Paid_Date 
from (select Bill_Date,Due_Date,Bill_Number,Visit_ID,Amount,IS_PAID from billing
union
select Bill_Date,Due_Date,Bill_Number,Visit_ID,Amount,IS_PAID from billing_archival) t1 
left join (select PayTrans_Number,Pay_Method,Pay_Status,Paid_Date,Bill_Number from payment
union
select PayTrans_Number,Pay_Method,Pay_Status,Paid_Date,Bill_Number from payment_archival) t2
on (t1.Bill_Number=t2.Bill_Number)
left join (select Visit_ID,Appointment_ID from visit
union
select Visit_ID,Appointment_ID from visit_archival) t3
on (t1.Visit_ID=t3.Visit_ID)
left join (select Visit_date,Appointment_ID,Patient_ID from appointments
union
select Visit_date,Appointment_ID,Patient_ID from appointments_archival) t4
on (t3.Appointment_ID=t4.Appointment_ID)
left join patient t5
on (t4.Patient_ID=t5.Patient_ID) order by t5.P_First_Name,t5.P_Last_Name,t1.Due_Date;