


drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on d2 for each ROW
begin
	if dayname(now()) = 'sunday' then 
		signal sqlstate '42000' set message_text = 'Invalid day';
	end if;
	
end $
delimiter ;





