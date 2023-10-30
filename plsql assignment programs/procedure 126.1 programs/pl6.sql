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
