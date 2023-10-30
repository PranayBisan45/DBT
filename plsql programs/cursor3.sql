drop procedure if exists pro7;
delimiter $
create procedure pro7()

BEGIN
declare _deptno int;
declare _dname,_loc varchar(30);
declare c1 cursor for select deptno,dname,loc from dept;
open c1;
	fetch c1 into _deptno,_dname,_loc;
		if _deptno = 20 then
			select _deptno,_dname,_loc;
		else 
			select 'Data not found';
		end if;
close c1;
	
end $
delimiter ;