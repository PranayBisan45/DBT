drop procedure if exists pro1;
delimiter $ 
create procedure pro1()
begin 
	declare count1 int;
	declare str1 varchar(30);
	set count1:=0;
	set str1 := '';
	sl:loop
		/*
		IF str[x]  then 			
			/*vw = str[i];
			set count1:=count1+1;
		end IF
		*/
		set count1 := count1 + 1;
		if count1 > 10 THEN 
			leave sl;
		end if;	
		/*
		select  count1 as count_vowels;
		*/
		set str1 := concat(str1,' ',count1);
		/*
		select right(left(str1,count1),1) R1;
		*/
	end loop sl;
	select str1;	
	
end $
delimiter ;