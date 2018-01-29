
delimiter |
CREATE    TRIGGER Patient_BU BEFORE UPDATE  ON Patient 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Patient_audit set Patient_ID = old.Patient_ID,
        Patient_SSN=old.Patient_SSN,
        P_First_Name=old.P_First_Name,
        P_Last_Name=old.P_Last_Name,
        P_Gender =old.P_Gender,
        Date_Of_Birth=old.Date_Of_Birth,
		Phone_Number=old.Phone_Number,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='U';
		if new.is_Active='N' then 
		 set new.end_Date=now();
		end if;
END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Patient_BD BEFORE delete  ON Patient 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Patient_audit set Patient_ID = old.Patient_ID,
        Patient_SSN=old.Patient_SSN,
        P_First_Name=old.P_First_Name,
        P_Last_Name=old.P_Last_Name,
        P_Gender =old.P_Gender,
        Date_Of_Birth=old.Date_Of_Birth,
		Phone_Number=old.Phone_Number,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='D';
		END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Patient_BI BEFORE insert  ON Patient 
    FOR EACH ROW 
    BEGIN	  
    set new.createdby=SESSION_USER();
		END;
        |

delimiter ;



===================

delimiter |
CREATE    TRIGGER Patient_Address_BU BEFORE UPDATE  ON Patient_Address 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Patient_Address_audit set Patient_Address_audit.Address_Id = old.Address_Id,
        Patient_ID=old.Patient_ID,
        Address=old.Address,
        City=old.City,
        Zipcode =old.Zipcode,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='U';
		if new.is_Active='N' then 
		 set new.end_Date=now();
		end if;
END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Patient_Address_BD BEFORE delete  ON Patient_Address 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Patient_Address_audit set Patient_Address_audit.Address_Id = old.Address_Id,
        Patient_ID=old.Patient_ID,
        Address=old.Address,
        City=old.City,
        Zipcode =old.Zipcode,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='D';
		END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Patient_Address_BI BEFORE insert  ON Patient_Address 
    FOR EACH ROW 
    BEGIN	  
    set new.createdby=SESSION_USER();
		END;
        |

delimiter ;

=====================

delimiter |
CREATE    TRIGGER Doctor_BU BEFORE UPDATE  ON Doctor 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Doctor_audit set Doctor_audit.Doctor_ID = old.Doctor_ID,
        D_First_Name=old.D_First_Name,
        D_Last_Name=old.D_Last_Name,
        D_Gender =old.D_Gender,
        Phone_Number=old.Phone_Number,
		Speciality=old.Speciality,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='U';
		if new.is_Active='N' then 
		 set new.end_Date=now();
		end if;
END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Doctor_BD BEFORE delete  ON Doctor 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Doctor_audit set Doctor_audit.Doctor_ID = old.Doctor_ID,
        D_First_Name=old.D_First_Name,
        D_Last_Name=old.D_Last_Name,
        D_Gender =old.D_Gender,
        Phone_Number=old.Phone_Number,
		Speciality=old.Speciality,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='D';
		END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Doctor_BI BEFORE insert  ON Doctor 
    FOR EACH ROW 
    BEGIN	  
    set new.createdby=SESSION_USER();
		END;
        |

delimiter ;



===================

delimiter |
CREATE    TRIGGER Insurance_BU BEFORE UPDATE  ON Insurance 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Insurance_audit set Insurance_audit.I_Company_ID = old.I_Company_ID,
        I_Company_Name=old.I_Company_Name,
        I_Company_Address=old.I_Company_Address,
        I_Company_City =old.I_Company_City,
        I_Company_Zipcode=old.I_Company_Zipcode,
		I_Phone_Number=old.I_Phone_Number,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='U';
		if new.is_Active='N' then 
		 set new.end_Date=now();
		end if;
END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Insurance_BD BEFORE delete  ON Insurance 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Insurance_audit set Insurance_audit.I_Company_ID = old.I_Company_ID,
        I_Company_Name=old.I_Company_Name,
        I_Company_Address=old.I_Company_Address,
        I_Company_City =old.I_Company_City,
        I_Company_Zipcode=old.I_Company_Zipcode,
		I_Phone_Number=old.I_Phone_Number,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='D';
		END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Insurance_BI BEFORE insert  ON Insurance 
    FOR EACH ROW 
    BEGIN	  
    set new.createdby=SESSION_USER();
		END;
        |

delimiter ;



===================

delimiter |
CREATE    TRIGGER Hospital_Location_BU BEFORE UPDATE  ON Hospital_Location 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Hospital_Location_audit set Hospital_ID = old.Hospital_ID,
        H_Address=old.H_Address,
        H_City =old.H_City ,
        H_Zipcode=old.H_Zipcode,
        H_Name =old.H_Name,
        H_Phone_Number=old.H_Phone_Number,
		H_Visiting_Hours=old.H_Visiting_Hours,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='U';
		if new.is_Active='N' then 
		 set new.end_Date=now();
		end if;
END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Hospital_Location_BD BEFORE delete  ON Hospital_Location 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Hospital_Location_audit set Hospital_ID = old.Hospital_ID,
        H_Address=old.H_Address,
        H_City =old.H_City ,
        H_Zipcode=old.H_Zipcode,
        H_Name =old.H_Name,
        H_Phone_Number=old.H_Phone_Number,
		H_Visiting_Hours=old.H_Visiting_Hours,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='D';
		END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Hospital_Location_BI BEFORE insert  ON Hospital_Location 
    FOR EACH ROW 
    BEGIN	  
    set new.createdby=SESSION_USER();
		END;
        |

delimiter ;



===================

delimiter |
CREATE    TRIGGER Insurance_Policy_BU BEFORE UPDATE  ON Insurance_Policy 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Insurance_Policy_audit set Policy_No = old.Policy_No,
        Patient_ID=old.Patient_ID,
        I_Company_ID=old.I_Company_ID,
        policy_start_date=old.policy_start_date,
        policy_end_date =old.policy_end_date,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='U';
		if new.is_Active='N' then 
		 set new.end_Date=now();
		end if;
END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Insurance_Policy_BD BEFORE delete  ON Insurance_Policy 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Insurance_Policy_audit set Policy_No = old.Policy_No,
        Patient_ID=old.Patient_ID,
        I_Company_ID=old.I_Company_ID,
        policy_start_date=old.policy_start_date,
        policy_end_date =old.policy_end_date,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='D';
		END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Insurance_Policy_BI BEFORE insert  ON Insurance_Policy 
    FOR EACH ROW 
    BEGIN	  
    set new.createdby=SESSION_USER();
		END;
        |

delimiter ;



===================

delimiter |
CREATE    TRIGGER Medicine_BU BEFORE UPDATE  ON Medicine 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Medicine_audit set MInventory_Id = old.MInventory_Id,
        Medicine_name =old.Medicine_name,
        Manufacturer=old.Manufacturer,
		Price=old.Price,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='U';
		if new.is_Active='N' then 
		 set new.end_Date=now();
		end if;
END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Medicine_BD BEFORE delete  ON Medicine 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Medicine_audit set MInventory_Id = old.MInventory_Id,
        Medicine_name =old.Medicine_name,
        Manufacturer=old.Manufacturer,
		Price=old.Price,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='D';
		END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Medicine_BI BEFORE insert  ON Medicine 
    FOR EACH ROW 
    BEGIN	  
    set new.createdby=SESSION_USER();
		END;
        |

delimiter ;



===================

delimiter |
CREATE    TRIGGER Appointments_BU BEFORE UPDATE  ON Appointments 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Appointments_audit set Appointment_ID = old.Appointment_ID,
        Appointment_Req_Date=old.Appointment_Req_Date,
        Visit_Date=old.Visit_Date,
        Patient_ID =old.Patient_ID,
        Doctor_ID=old.Doctor_ID,
		Hospital_ID=old.Hospital_ID,
        Date_Created=old.Date_Created,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='U';
	
END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Appointments_BD BEFORE delete  ON Appointments 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Appointments_audit set Appointment_ID = old.Appointment_ID,
        Appointment_Req_Date=old.Appointment_Req_Date,
        Visit_Date=old.Visit_Date,
        Patient_ID =old.Patient_ID,
        Doctor_ID=old.Doctor_ID,
		Hospital_ID=old.Hospital_ID,
        Date_Created=old.Date_Created,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='D';
		END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Appointments_BI BEFORE insert  ON Appointments 
    FOR EACH ROW 
    BEGIN	  
    set new.createdby=SESSION_USER();
		END;
        |

delimiter ;



===================
delimiter |
CREATE    TRIGGER Visit_BU BEFORE UPDATE  ON Visit 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Visit_audit set Visit_ID = old.Visit_ID,
        Appointment_ID=old.Appointment_ID,
        Complaint=old.Complaint,
        Diagnosis =old.Diagnosis,
        Revisit_Y_N=old.Revisit_Y_N,
		Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='U';
		if new.is_Active='N' then 
		 set new.end_Date=now();
		end if;
END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Visit_BD BEFORE delete  ON Visit 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Visit_audit set Visit_ID = old.Visit_ID,
        Appointment_ID=old.Appointment_ID,
        Complaint=old.Complaint,
        Diagnosis =old.Diagnosis,
        Revisit_Y_N=old.Revisit_Y_N,
		Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='D';
		END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Visit_BI BEFORE insert  ON Visit 
    FOR EACH ROW 
    BEGIN	  
    set new.createdby=SESSION_USER();
		END;
        |

delimiter ;

=====================

delimiter |
CREATE    TRIGGER Prescription_BU BEFORE UPDATE  ON Prescription 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Prescription_audit set Prescription_ID = old.Prescription_ID,
        Visit_ID=old.Visit_ID,
        MInventory_Id=old.MInventory_Id,
        Medicine_Quantity=old.Medicine_Quantity,
        Intake_description =old.Intake_description,
        Prescription_start_date=old.Prescription_start_date,
		Prescription_end_date=old.Prescription_end_date,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='U';
		if new.is_Active='N' then 
		 set new.end_Date=now();
		end if;
END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Prescription_BD BEFORE delete  ON Prescription 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Prescription_audit set Prescription_ID = old.Prescription_ID,
        Visit_ID=old.Visit_ID,
        MInventory_Id=old.MInventory_Id,
        Medicine_Quantity=old.Medicine_Quantity,
        Intake_description =old.Intake_description,
        Prescription_start_date=old.Prescription_start_date,
		Prescription_end_date=old.Prescription_end_date,
        Date_Created=old.Date_Created,
        Is_active =old.Is_active,
        end_date =old.end_date,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='D';
		END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Prescription_BI BEFORE insert  ON Prescription 
    FOR EACH ROW 
    BEGIN	  
    set new.createdby=SESSION_USER();
		END;
        |

delimiter ;



===================

delimiter |
CREATE    TRIGGER Billing_BU BEFORE UPDATE  ON Billing 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Billing_audit set Bill_Number = old.Bill_Number,
        Visit_ID=old.Visit_ID,
        Amount =old.Amount,
        Bill_Date=old.Bill_Date,
		Due_Date=old.Due_Date,
		IS_PAID=old.IS_PAID,
        Date_Created=old.Date_Created,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='U';
		
END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Billing_BD BEFORE delete  ON Billing 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Billing_audit set Bill_Number = old.Bill_Number,
        Visit_ID=old.Visit_ID,
        Amount =old.Amount,
        Bill_Date=old.Bill_Date,
		Due_Date=old.Due_Date,
        Date_Created=old.Date_Created,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='D';
		END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Billing_BI BEFORE insert  ON Billing
    FOR EACH ROW 
    BEGIN	  
    set new.createdby=SESSION_USER();
		END;
        |

delimiter ;

=================

delimiter |
CREATE    TRIGGER Payment_BU BEFORE UPDATE  ON Payment 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Payment_audit set PayTrans_Number = old.PayTrans_Number,
        Bill_Number =old.Bill_Number,
        Pay_Method=old.Pay_Method,
		Pay_Status=old.Pay_Status,
        Paid_Date=old.Paid_Date,
		Date_Created=old.Date_Created,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='U';
		
END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Payment_BD BEFORE delete  ON Payment 
    FOR EACH ROW 
    BEGIN	    
		INSERT INTO Payment_audit set PayTrans_Number = old.PayTrans_Number,
        Bill_Number =old.Bill_Number,
        Pay_Method=old.Pay_Method,
		Pay_Status=old.Pay_Status,
        Paid_Date=old.Paid_Date,
		Date_Created=old.Date_Created,
        Createdby =old.Createdby,
        Changeby =SESSION_USER(),
       
        Changetype='D';
		END;
        |

delimiter ;

delimiter |
CREATE    TRIGGER Payment_BI BEFORE insert  ON Payment
    FOR EACH ROW 
    BEGIN	  
    set new.createdby=SESSION_USER();
		    
		update billing t1 set t1.is_paid='Y' where t1.Bill_Number=new.Bill_Number;

		END;
        |

delimiter ;

=================

delimiter |
CREATE    TRIGGER Archivecontrol_BU BEFORE UPDATE  ON Archivecontrol 
    FOR EACH ROW 
    BEGIN	    
		
		if new.is_Active='N' then 
		 set new.end_Date=now();
		end if;
END;
        |
delimiter |
CREATE    TRIGGER Archivecontrol_BI BEFORE insert  ON Archivecontrol
    FOR EACH ROW 
    BEGIN	  
    set new.createdby=SESSION_USER();
		END;
        |

delimiter ;