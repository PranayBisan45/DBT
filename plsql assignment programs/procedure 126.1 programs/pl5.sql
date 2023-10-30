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
