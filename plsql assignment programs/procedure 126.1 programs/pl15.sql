
drop procedure if exists Print1;
delimiter $
CREATE  PROCEDURE Print1(date1 date,date2 date) 
BEGIN
	
	declare count int;
	set count := 0;
	
	l1:loop
		if date1 <= date2 THEN
			
			if date_format(date1,'%a') = 'Sun' THEN
				
				set count := count +1;
				set date1:=date1 + interval 1 day;
			else
				set date1:=date1 + interval 1 day;
			end if;
			
		else
		leave l1;
		end if;
	end loop l1;
	
	select count as "Count of Sundays";
END $
delimiter ;


