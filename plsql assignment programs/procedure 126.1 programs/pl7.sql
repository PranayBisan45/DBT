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
