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
 l1: loop
  if i <= v_length then
    set v_char := SUBSTR(p_input_string, i, 1);
	set i := i + 1;
	SET @output := CONCAT(@output, v_char,","); 
  else 
	leave l1;
  end if;
  end loop l1;
  
  select @output as output;
END $
delimiter ;

