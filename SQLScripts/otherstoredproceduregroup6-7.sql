DELIMITER //
CREATE PROCEDURE sp_doctor_appt_dt_dtl_View
(IN in_D_First_Name VARCHAR(50), IN in_D_Last_Name VARCHAR(50),IN in_visit_Date date)
BEGIN
if  in_D_First_Name<>'' and in_D_Last_Name <>''  then

SELECT * from v_doctor_appointment_dtl where visit_Date=in_visit_Date and D_First_Name=in_D_First_Name and D_Last_Name=in_D_Last_Name;
elseif  in_D_First_Name <>'' and in_D_Last_Name ='' then

SELECT * from v_doctor_appointment_dtl where visit_Date=in_visit_Date and D_First_Name=in_D_First_Name ;
elseif  in_D_First_Name ='' and in_D_Last_Name <>'' then

SELECT * from v_doctor_appointment_dtl where visit_Date=in_visit_Date and D_Last_Name=in_D_Last_Name ;
elseif  in_D_First_Name ='' and in_D_Last_Name =''  then

SELECT * from v_doctor_appointment_dtl where visit_Date=in_visit_Date ;

elseif   in_visit_Date is null then

SELECT "Please input VisitDate to view results" from dual ;

end if;
  END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_doctor_future_appt_View
(IN in_D_First_Name VARCHAR(50), IN in_D_Last_Name VARCHAR(50))
BEGIN
if  in_D_First_Name<>'' and in_D_Last_Name <>''  then

SELECT * from v_doctor_appointment_dtl where  D_First_Name=in_D_First_Name and D_Last_Name=in_D_Last_Name and visit_Date>=sysdate();
elseif  in_D_First_Name <>'' and in_D_Last_Name ='' then

SELECT * from v_doctor_appointment_dtl where  D_First_Name=in_D_First_Name  and visit_Date>=sysdate();
elseif  in_D_First_Name ='' and in_D_Last_Name <>'' then

SELECT * from v_doctor_appointment_dtl where  D_Last_Name=in_D_Last_Name  and visit_Date>=sysdate();
elseif  in_D_First_Name ='' and in_D_Last_Name =''  then

SELECT "Please input Doctor First or Last Name or both to view results" from dual ;

end if;
  END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_patient_appt_hist_view
(IN in_P_First_Name VARCHAR(50), IN in_P_Last_Name VARCHAR(50), in_is_scheduled_appointment varchar(10))
BEGIN
if  in_P_First_Name<>'' and in_P_Last_Name <>''  and in_is_scheduled_appointment<>'' then

SELECT * from v_patient_appointment_history where  P_First_Name=in_P_First_Name and P_Last_Name=in_P_Last_Name and 
is_scheduled_appointment=in_is_scheduled_appointment;
elseif  in_P_First_Name<>'' and in_P_Last_Name <>''  and in_is_scheduled_appointment='' then

SELECT * from v_patient_appointment_history where  P_First_Name=in_P_First_Name and P_Last_Name=in_P_Last_Name ;
elseif  in_P_First_Name<>'' and in_P_Last_Name =''  and in_is_scheduled_appointment<>'' then

SELECT * from v_patient_appointment_history where  P_First_Name=in_P_First_Name  and 
is_scheduled_appointment=in_is_scheduled_appointment;

elseif  in_P_First_Name='' and in_P_Last_Name <>''  and in_is_scheduled_appointment<>'' then

SELECT * from v_patient_appointment_history where   P_Last_Name=in_P_Last_Name and 
is_scheduled_appointment=in_is_scheduled_appointment;
elseif  in_P_First_Name<>'' and in_P_Last_Name =''  and in_is_scheduled_appointment='' then

SELECT * from v_patient_appointment_history where  P_First_Name=in_P_First_Name ;
elseif  in_P_First_Name='' and in_P_Last_Name <>''  and in_is_scheduled_appointment='' then

SELECT * from v_patient_appointment_history where   P_Last_Name=in_P_Last_Name ;
elseif  in_P_First_Name='' and in_P_Last_Name =''  and in_is_scheduled_appointment<>'' then

SELECT * from v_patient_appointment_history where  P_First_Name=in_P_First_Name and P_Last_Name=in_P_Last_Name and 
is_scheduled_appointment=in_is_scheduled_appointment;

elseif  in_P_First_Name ='' and in_P_Last_Name ='' and in_is_scheduled_appointment='' then 

SELECT "Please input Patient First or Last Name or (Upcoming/Past) or all to view results" from dual ;

end if;
  END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_doctor_appt_View
(IN in_D_First_Name VARCHAR(50), IN in_D_Last_Name VARCHAR(50))
BEGIN
if  in_D_First_Name<>'' and in_D_Last_Name <>''  then

SELECT * from v_doctor_appointment_dtl where  D_First_Name=in_D_First_Name and D_Last_Name=in_D_Last_Name and visit_Date>= 2017-01-01;
elseif  in_D_First_Name <>'' and in_D_Last_Name ='' then

SELECT * from v_doctor_appointment_dtl where  D_First_Name=in_D_First_Name  and visit_Date>=2017-01-01;
elseif  in_D_First_Name ='' and in_D_Last_Name <>'' then

SELECT * from v_doctor_appointment_dtl where  D_Last_Name=in_D_Last_Name  and visit_Date>=2017-01-01;
elseif  in_D_First_Name ='' and in_D_Last_Name =''  then

SELECT "Please input Doctor First or Last Name or both to view results" from dual ;

end if;
  END //
DELIMITER ;

