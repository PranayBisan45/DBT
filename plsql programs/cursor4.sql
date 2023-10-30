drop procedure if exists pro7;
delimiter $
create procedure pro7()

BEGIN
declare _deptno int;
declare _dname,_loc varchar(30);
declare c1 cursor for select * from dept;
open c1;
	fetch c1 into _deptno,_dname;
	select _deptno,_dname;
close c1;
	
end $
delimiter ;