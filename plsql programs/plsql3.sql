drop procedure if exists pro6; 
delimiter $
create procedure pro6( p int, q varchar(20), r varchar(20))
begin
	declare exit handler for 1062 select 'Data present' as 'error window';
	if r = 'nashik' THEN
		insert into plsql values(p,q,r);
		select 'record inserted successfully';
	else 
		select 'invalid location' R1;
	end if;
	
end $
delimiter ;