drop trigger if exists validateAge;
delimiter $
create trigger validateAge before insert on R for each row
BEGIN
	
	
	if new.age < 18 then
		signal sqlstate '45000'
		set message_text = "Person not eligible for voting";
	end if;
end $
delimiter ;
