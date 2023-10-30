drop procedure if exists pro7;
delimiter $
create procedure pro7(_deptno int)
BEGIN
declare flag bool ;

set flag := true;
select flag;

/*select true into flag from dept where deptno=_deptno;*/

if flag THEN
	select * from dept where deptno=_deptno;
ELSE	
	select 'record not found!---->creating new table for it'R1;
	
end if;
end $
delimiter ;