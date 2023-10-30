drop procedure if exists Print1;
delimiter $
CREATE  PROCEDURE Print1(in p_input_string  VARCHAR(20)) 


BEGIN
								
    declare v_length int;
    declare v_char  varchar(1);
	declare i int;
	set v_length := LENGTH(p_input_string);
    set i := 1;
	SET @output := ''; 
 
  
  select @output as output;
END $
delimiter ;


