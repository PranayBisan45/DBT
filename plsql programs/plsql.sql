drop procedure if exists pro2;
delimiter $
create procedure pro2()
begin
	declare exit handler for 1062 select 'Data present' as 'error window';
	insert into plsql values(1,2,2),(4,3,3);
		select 'ok';
end $
delimiter ;