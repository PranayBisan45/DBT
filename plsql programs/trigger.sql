drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
	call display("hello world");
end $
delimiter ;



drop procedure if exists display;
delimiter $
create procedure display(msg varchar(200))
begin
	select msg  r1;
end $
delimiter ;