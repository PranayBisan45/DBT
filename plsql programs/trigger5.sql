


drop procedure if exists tr1;
delimiter $
create procedure tr1()
begin
    declare z int;
	select max(sal) into z from emp ;
	
	create  table temp234(max_sal int);
	insert into temp234 values(z);
	
end $
delimiter ;






