


drop trigger if exists tr1;
delimiter $
create trigger tr1 before  insert on d2 for each ROW
begin
	
	declare z int;
	select max(deptno)+1 into z from d2;
	set new.deptno=z;
	if z>3466 THEN
	signal sqlstate '42000' SET message_text="deptno mumber is more than limit";
	end if;
end $
delimiter ;






