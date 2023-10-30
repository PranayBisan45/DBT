drop procedure if exists pro11;
delimiter $
create procedure pro11()
begin
	declare flag1 bool;
    declare flag2 bool;
	declare count1 int;
    declare _deptno int;
    declare _deptno1 int;
    drop table if exists emp_dept1;
	create table emp_dept1 (c1 varchar(1000));
    set _deptno := 1;
    set _deptno1 := 1;
    lbl1:loop
			if _deptno in (select deptno from dept) then
				if _deptno1 in (select deptno from emp) then
					insert into emp_dept1 values(concat(_deptno," -> ",(select group_concat(ename) from emp join dept where emp.deptno=_deptno and dept.deptno=emp.deptno group by emp.deptno)));
					set _deptno := _deptno + 1;
                    set _deptno1 := _deptno1 + 1;
				else
					insert into emp_dept1 values(concat(_deptno," -> ","(No employee work in department 40...)"));
                    set _deptno := _deptno + 1;
                    set _deptno1 := _deptno1 + 1;
				end if;
            elseif _deptno > (select max(deptno) from dept) then
				leave lbl1;
			else
				set _deptno := _deptno + 1;
				set _deptno1 := _deptno1 + 1;
			end if;
	end loop lbl1;
	select * from emp_dept1;
end $
delimiter ;
