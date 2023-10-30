
drop function if exists sumSalary;
delimiter $
create function sumSalary(_deptno int) returns int
deterministic 
begin
	declare sum_sal int;
	
	select sum(sal) into sum_sal from emp where _deptno=deptno;

	return sum_sal;
end $
delimiter ;


