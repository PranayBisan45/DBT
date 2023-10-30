drop procedure if exists pro2;
delimiter $
create procedure pro2( p int, q varchar(20), r varchar(20),a int, b varchar(20),
c varchar(20))
begin
	declare exit handler for 1062 select 'Data present' as 'error window';
	insert into plsql values(p,q,r),(a,b,c);
		select 'ok';
end $
delimiter ;