drop procedure if exists pro1;
delimiter $
create procedure pro1(in x int, in y int)
BEGIN
	
	select x+y;
end $
	delimiter ;