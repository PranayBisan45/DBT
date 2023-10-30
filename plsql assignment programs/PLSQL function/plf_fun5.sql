drop function if exists f5;
delimiter $
create function f5() returns int
deterministic 
begin 
	
	declare otp int;
	set otp = floor(rand() * 900000) + 100000;
	return otp;	
end $
delimiter ;