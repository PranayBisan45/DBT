
drop procedure if exists Print1;
delimiter $
CREATE  PROCEDURE Print1(date1 date,day_name varchar(20)) 
BEGIN
	
	declare count int;
	set count := 0;
	
	l1:loop
		if date_format(date1,'%a')!= 'Sat' THEN
			
			set date1:=date1 + interval 1 day;
		ELSE
			select date1;
			leave l1;
		end if;
	end loop l1;
	
	
END $
delimiter ;


