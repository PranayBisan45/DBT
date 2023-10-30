drop procedure if exists pro7;
delimiter $
create procedure pro7(_deptno int)
BEGIN
declare x bool ;
select x;
set x := true;
select x;

/*select true into flag from dept where deptno=_deptno;*/

if x THEN
	select * from dept  where deptno=_deptno;
ELSE	
	select 'record not found!'R1;
end if;
	
end $
delimiter ;