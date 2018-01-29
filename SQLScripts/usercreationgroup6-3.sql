

create user 'hospitaladmin' identified by 'hospitaladmin';
GRANT ALL PRIVILEGES ON p5medical.* to hospitaladmin with grant option;


create user 'dataoperator' identified by 'dataoperator';

GRANT SELECT,INSERT,UPDATE on appointments to dataoperator;
GRANT SELECT,INSERT,UPDATE on archivecontrol to dataoperator;
GRANT SELECT,INSERT,UPDATE on billing to dataoperator;
GRANT SELECT,INSERT,UPDATE on doctor to dataoperator;
GRANT SELECT,INSERT,UPDATE on hospital_location to dataoperator;
GRANT SELECT,INSERT,UPDATE on insurance to dataoperator;
GRANT SELECT,INSERT,UPDATE on insurance_policy to dataoperator;
GRANT SELECT,INSERT,UPDATE on medicine to dataoperator;
GRANT SELECT,INSERT,UPDATE on patient to dataoperator;
GRANT SELECT,INSERT,UPDATE on patient_address to dataoperator;
GRANT SELECT,INSERT,UPDATE on payment to dataoperator;
GRANT SELECT,INSERT,UPDATE on prescription to dataoperator;
GRANT SELECT,INSERT,UPDATE on visit to dataoperator;


GRANT SELECT on appointments_archival to dataoperator;
GRANT SELECT on billing_archival to dataoperator;
GRANT SELECT on payment_archival to dataoperator;
GRANT SELECT on prescription_archival to dataoperator;
GRANT SELECT on visit_archival to dataoperator;

GRANT SELECT on appointments_audit to dataoperator;
GRANT SELECT on billing_audit to dataoperator;
GRANT SELECT on doctor_audit to dataoperator;
GRANT SELECT on insurance_audit to dataoperator;
GRANT SELECT on insurance_policy_audit to dataoperator;
GRANT SELECT on medicine_audit to dataoperator;
GRANT SELECT on patient_audit to dataoperator;
GRANT SELECT on patient_address_audit to dataoperator;
GRANT SELECT on payment_audit to dataoperator;
GRANT SELECT on prescription_audit to dataoperator;
GRANT SELECT on visit_audit to dataoperator;

create user 'physician' identified by 'physician';
GRANT SELECT,INSERT,UPDATE on appointments to physician;
GRANT SELECT,INSERT,UPDATE on doctor to physician;
GRANT SELECT on hospital_location to physician;
GRANT SELECT,INSERT,UPDATE on medicine to physician;
GRANT SELECT,INSERT,UPDATE on prescription to physician;
GRANT SELECT,INSERT,UPDATE on visit to physician;
GRANT SELECT on patient to physician;
GRANT SELECT on patient_address to physician;

create user 'cashier' identified by 'cashier';
GRANT SELECT on appointments to cashier;
GRANT SELECT,INSERT,UPDATE on billing to cashier;
GRANT SELECT,INSERT,UPDATE on insurance to cashier;
GRANT SELECT,INSERT,UPDATE on insurance_policy to cashier;
GRANT SELECT on patient to cashier;
GRANT SELECT on patient_address to cashier;
GRANT SELECT,INSERT,UPDATE on payment to cashier;
GRANT SELECT on visit to cashier;

create user 'frontdesk' identified by 'frontdesk';
GRANT SELECT,INSERT,UPDATE on appointments to frontdesk;
GRANT SELECT on billing to frontdesk;
GRANT SELECT,INSERT,UPDATE on doctor to frontdesk;
GRANT SELECT,INSERT,UPDATE on hospital_location to frontdesk;
GRANT SELECT,INSERT,UPDATE on insurance to frontdesk;
GRANT SELECT,INSERT,UPDATE on insurance_policy to frontdesk;
GRANT SELECT,INSERT,UPDATE on patient to frontdesk;
GRANT SELECT,INSERT,UPDATE on patient_address to frontdesk;
GRANT SELECT on payment to frontdesk;
GRANT SELECT,INSERT,UPDATE on visit to frontdesk;




GRANT EXECUTE ON procedure ins_appointments to hospitaladmin;
GRANT EXECUTE ON procedure ins_billing to hospitaladmin;
GRANT EXECUTE ON procedure ins_doctor to hospitaladmin;
GRANT EXECUTE ON procedure ins_hospital_location to hospitaladmin;
GRANT EXECUTE ON procedure ins_insurance to hospitaladmin;
GRANT EXECUTE ON procedure ins_insurance_policy to hospitaladmin;
GRANT EXECUTE ON procedure ins_medicine to hospitaladmin;
GRANT EXECUTE ON procedure ins_patient to hospitaladmin;
GRANT EXECUTE ON procedure ins_patient_address to hospitaladmin;
GRANT EXECUTE ON procedure ins_payment to hospitaladmin;
GRANT EXECUTE ON procedure ins_prescription to hospitaladmin;
GRANT EXECUTE ON procedure ins_visit to hospitaladmin;

GRANT EXECUTE ON procedure ins_appointments to dataoperator;
GRANT EXECUTE ON procedure ins_billing to dataoperator;
GRANT EXECUTE ON procedure ins_doctor to dataoperator;
GRANT EXECUTE ON procedure ins_hospital_location to dataoperator;
GRANT EXECUTE ON procedure ins_insurance to dataoperator;
GRANT EXECUTE ON procedure ins_insurance_policy to dataoperator;
GRANT EXECUTE ON procedure ins_medicine to dataoperator;
GRANT EXECUTE ON procedure ins_patient to dataoperator;
GRANT EXECUTE ON procedure ins_patient_address to dataoperator;
GRANT EXECUTE ON procedure ins_payment to dataoperator;
GRANT EXECUTE ON procedure ins_prescription to dataoperator;
GRANT EXECUTE ON procedure ins_visit to dataoperator;

GRANT EXECUTE ON procedure ins_appointments to physician;
GRANT EXECUTE ON procedure ins_doctor to physician;
GRANT EXECUTE ON procedure ins_medicine to physician;
GRANT EXECUTE ON procedure ins_prescription to physician;
GRANT EXECUTE ON procedure ins_visit to physician;

GRANT EXECUTE ON procedure ins_billing to cashier;
GRANT EXECUTE ON procedure ins_insurance to cashier;
GRANT EXECUTE ON procedure ins_insurance_policy to cashier;
GRANT EXECUTE ON procedure ins_payment to cashier;

GRANT EXECUTE ON procedure ins_patient to frontdesk;
GRANT EXECUTE ON procedure ins_appointments to frontdesk;
GRANT EXECUTE ON procedure ins_doctor to frontdesk;
GRANT EXECUTE ON procedure ins_hospital_location to frontdesk;
GRANT EXECUTE ON procedure ins_insurance to frontdesk;
GRANT EXECUTE ON procedure ins_insurance_policy to frontdesk;
GRANT EXECUTE ON procedure ins_visit to frontdesk;
GRANT EXECUTE ON procedure ins_patient_address to frontdesk;


