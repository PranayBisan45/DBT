
drop procedure if exists prol1;
delimiter $
create procedure prol1()
BEGIN
select "Hello world";
end $
delimiter ;
