drop function if exists f1;
delimiter $
create function f1(x int, y int) returns int
deterministic
begin

	declare z int;
	set z := ifnull(x,0)+ifnull(y,0);
	
	return z;
	
end $
delimiter ;