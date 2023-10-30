drop procedure if exists pro6; 
delimiter $
create procedure pro6(p int, q varchar(20), r varchar(20))
begin
	declare exit handler for 1062 select 'Data present' as 'error window';
	if r = 'nashik' THEN
		insert into plsql values(p,q,r);
		select 'record inserted successfully';
	else 
		select 'creating new table for new record' R1;
		create table e1(empno int primary key,ename varchar(20),city varchar(20));
		insert into e1 values(p,q,r);
	end if;
	
end $
delimiter ;