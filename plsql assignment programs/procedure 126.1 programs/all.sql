/*drop procedure if exists Print1;
delimiter $
CREATE  PROCEDURE Print1(in p_input_string  VARCHAR(20)) 


BEGIN
								
    declare v_length int;
    declare v_char  varchar(1);
	declare i int;
	set v_length := LENGTH(p_input_string);
    set i := 1;
 l1: loop
  if i <= v_length then
    set v_char := SUBSTR(p_input_string, i, 1);
    select v_char as output;
	set i := i + 1;
  else 
	leave l1;
  end if;
  end loop l1;
  
  
END $
delimiter ;





--------------pro 2
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
	if i <= v_length then
		SET @output := CONCAT(@output, v_char,","); 
	else 
		SET @output := CONCAT(@output, v_char); 
	end if;
  else 
	leave l1;
  end if;
  end loop l1;
  
  select @output as output;
END $
delimiter ;



-----------pro3

drop procedure if exists Print1;
delimiter $
CREATE  PROCEDURE Print1(in p_input_string  VARCHAR(20)) 


BEGIN
								
    declare v_length int;
    declare v_char  varchar(1);
	declare i int;
	set v_length := LENGTH(p_input_string);
    set i := 1;
	SET @outputNum := ''; 
	SET @outputStr := ''; 
 l1: loop
  if i <= v_length then
    set v_char := SUBSTR(p_input_string, i, 1);
	if ascii(v_char) >= 49 and ascii(v_char) <=57 then
		
		SET @outputNum := CONCAT(@outputNum, v_char); 
	else
		
		SET @outputStr := CONCAT(@outputStr, v_char); 
	end if;
	set i := i + 1;
  else 
	leave l1;
  end if;
  end loop l1;
  
  select @outputNum as Number;
  select @outputStr as string;
END $
delimiter ;




----------------pro4

drop procedure if exists Print1;
delimiter $
CREATE  PROCEDURE Print1() 


BEGIN
								
	select concat(left(ename,1),"(",substr(ename,2,length(ename)),")"," is " ,job)as output from emp ;
  
END $
delimiter ;



------------pro5


drop procedure if exists Print1;
delimiter $
CREATE  PROCEDURE Print1(in str1 varchar(30)) 


BEGIN
								
	declare i int;
	declare str_len int;
	declare ch varchar(1);
	
	set i := 1;
	set str_len := length(str1);
	set @uppcase := '';
	set @lowcase := '';
	
	
	l1:LOOP
	
	if i <= str_len THEN
		set ch := substr(str1,i,1);
	
		if ascii(ch) >=97 and ascii(ch) <= 122 THEN
			set @lowcase:=concat(@lowcase,ch);
			set i := i+1;
			
		
		else 
			set @uppcase:=concat(@uppcase,ch);
			set i := i+1;
		end if;
	else
		leave l1;
	end if;
	
	end loop l1;
	select @uppcase as "upper case";
	select @lowcase as "lower case";

  
END $
delimiter ;




-------------------pro6



drop procedure if exists Print1;
delimiter $
CREATE  PROCEDURE Print1(in str1 varchar(30)) 


BEGIN
								
	declare i int;
	declare str_len int;
	declare ch varchar(1);
	
	set i := 1;
	set str_len := length(str1);
	set @digits := '';
	set @vowels := '';
	set @blanksp := '';
	
	l1:LOOP
	
	if i <= str_len THEN
	
		set ch := substr(str1,i,1);
		
	
		if ch in ('a','e','i','o','u') then
			set @vowels:=concat(@vowels,ch);
			
		end if;
			
		if ascii(ch)>=48 and ascii(ch)<=57 then
			set @digits:=concat(@digits,ch);
			
		end if;
			
		if ch = ' ' then
			set @blanksp:=concat(@blanksp,ch);
			
		
		end if;
		set i := i+1;
	else
		leave l1;
	end if;
	
	end loop l1;
	select @digits as "digits", length(@digits) as "count";
	select @vowels as "Vowels",length(@vowels) as "count";
	select @blanksp as "blanksp",length(@blanksp) as "count";

  
END $
delimiter ;

--------------pro7
*/

drop procedure if exists Print1;
delimiter $
CREATE  PROCEDURE Print1(in str1 varchar(30)) 


BEGIN
								
	declare i int;
	declare str_len int;
	declare ch varchar(1);
	
	set i := 1;
	set str_len := length(str1);
	set @result := '';
	
	
	
	l1:LOOP
	
	if i <= str_len THEN
		set ch := substr(str1,i,1);
	
		if (ascii(ch) >= 97 and ascii(ch) <= 122) or (ascii(ch)>=65 and ascii(ch)<=90) THEN
			set @result:=concat(@result,ch);
			
		else 
		
			set i := i+1;
		end if;
	else
		leave l1;
	end if;
	
	end loop l1;
	select @result as "result";
	

  
END $
delimiter ;
