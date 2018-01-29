DELIMITER //
CREATE PROCEDURE sp_archive
(IN in_SourceTable VARCHAR(50))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE v_ArchiveControlID Int;
DECLARE v_SourceTable VARCHAR(50);
DECLARE v_ArchiveTable VARCHAR(50);
DECLARE v_Frequency VARCHAR(50);
DECLARE v_timekeyColumn VARCHAR(50);
DECLARE v_columnlist varchar(1000);
DECLARE v_time_filter VARCHAR(50);
DECLARE table_list CURSOR FOR select ArchiveControlID,SourceTable,ArchiveTable,Frequency,timekeyColumn,columnlist from ArchiveControl where is_active='Y';
DECLARE table_sub_list CURSOR FOR select ArchiveControlID,SourceTable,ArchiveTable,Frequency,timekeyColumn,columnlist from ArchiveControl where is_active='Y' and SourceTable=in_SourceTable;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


if in_SourceTable='' then 
open table_list;
read_loop:LOOP
fetch table_list into v_ArchiveControlID,v_SourceTable,v_ArchiveTable,v_Frequency,v_timekeyColumn,v_columnlist;
IF done THEN
      LEAVE read_loop;
    END IF;
	if v_Frequency='6 Months' then 
set @v_time_filter='<= NOW() - INTERVAL 6 Month';
elseif v_Frequency='12 Months' then
set @v_time_filter='<= NOW() - INTERVAL 12 Month';
elseif v_Frequency='1 Month' then
set @v_time_filter='<= NOW() - INTERVAL 1 Month';
end if;

     SET @s = CONCAT('INSERT INTO ',v_ArchiveTable,' (',v_columnlist,') ','SELECT ',v_columnlist,' FROM ',v_SourceTable,' where ',v_timekeyColumn,'<= NOW() - INTERVAL 6 Month');
     
 
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
	
	SET @s = CONCAT('DELETE FROM ',v_SourceTable,' where ',v_timekeyColumn,'<= NOW() - INTERVAL 6 Month');
     
 
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
  END LOOP;
  
  CLOSE table_list;
  else 
  open table_sub_list;
  read_loop:LOOP
  fetch table_sub_list into v_ArchiveControlID,v_SourceTable,v_ArchiveTable,v_Frequency,v_timekeyColumn,v_columnlist;
IF done THEN
      LEAVE read_loop;
    END IF;
	if v_Frequency='6 Months' then 
set @v_time_filter='<= NOW() - INTERVAL 6 Month';
elseif v_Frequency='12 Months' then
set @v_time_filter='<= NOW() - INTERVAL 12 Month';
elseif v_Frequency='1 Month' then
set @v_time_filter='<= NOW() - INTERVAL 1 Month';
end if;


     SET @s = CONCAT('INSERT INTO ',v_ArchiveTable,' (',v_columnlist,') ','SELECT ',v_columnlist,' FROM ',v_SourceTable,' where ',v_timekeyColumn,'<= NOW() - INTERVAL 6 Month');
  
    PREPARE stmt FROM @s;

    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
	SET @s = CONCAT('DELETE FROM ',v_SourceTable,' where ',v_timekeyColumn,'<= NOW() - INTERVAL 6 Month');
     
 
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
   END LOOP;
  CLOSE table_sub_list;
  END IF;
  
  END //
DELIMITER ;