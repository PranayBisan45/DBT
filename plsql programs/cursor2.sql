drop procedure if exists pro7;
delimiter $
create procedure pro7()

BEGIN
declare _deptno int;
declare _dname,_loc varchar(30);
declare c1 cursor for select deptno,dname,loc from dept;
declare exit handler for 1329 select "End of File";
open c1;
	lbl:LOOP
		fetch c1 into _deptno,_dname,_loc;
		select _deptno,_dname;
	end loop lbl;
close c1;
	
end $
delimiter ;