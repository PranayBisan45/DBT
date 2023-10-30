drop procedure if exists Print1;
delimiter $
CREATE  PROCEDURE Print1() 


BEGIN
	declare _ename,_job varchar(30);
	declare _sal,_deptno int;
	declare count1 int;
	declare c1 cursor for select ename,job,sal,deptno from emp order by sal desc limit 5;
    
	set count1 := 0;
	open c1;
		
		l1 : loop
		
		if count1<=5  then 
			fetch c1 into _ename,_job,_sal,_deptno;
			
			select _ename "Name",_job "Job",_sal "Sal",_deptno "deptno";
			
			set count1 := count1 + 1;
		ELSE
			leave l1;
		end if;
		end loop l1;
			
	
	close c1;
END $
delimiter ;